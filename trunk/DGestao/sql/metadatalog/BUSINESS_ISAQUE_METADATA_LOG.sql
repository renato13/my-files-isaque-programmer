
SET TERM ^ ;

CREATE OR ALTER procedure SET_CAIXA_CONSOLIDAR (
    ANO_CAIXA smallint,
    NUM_CAIXA integer)
as
declare variable FORMA_PAGTO smallint;
declare variable FORMA_PAGTO_DESC varchar(50);
declare variable TOTAL_CREDITO numeric(18,2);
declare variable TOTAL_DEBITO numeric(18,2);
declare variable SEQUENCIAL integer;
begin
  -- Limpar Tabela
  Delete from TBCAIXA_CONSOLIDACAO c
  where c.Ano    = :Ano_caixa
    and c.Numero = :Num_caixa
    and c.Forma_pagto is not null;

  for
    Select
        m.Forma_pagto
      , f.Descri
      , sum( case when upper(m.Tipo) = 'C' then coalesce(m.Valor, 0) else 0 end )
      , sum( case when upper(m.Tipo) = 'D' then coalesce(m.Valor, 0) else 0 end )
    from TBCAIXA_MOVIMENTO m
      inner join TBFORMPAGTO f on (f.Cod = m.Forma_pagto)
    where m.Caixa_ano = :Ano_caixa
      and m.Caixa_num = :Num_caixa
      and m.Situacao  = 1 -- Confirmado
    Group by
        m.Forma_pagto
      , f.Descri
    into
        Forma_pagto
      , Forma_pagto_desc
      , Total_credito
      , Total_debito
  do
  begin

    Select
      max(c.Seq)
    from TBCAIXA_CONSOLIDACAO c
    where c.Ano    = :Ano_caixa
      and c.Numero = :Num_caixa
    into
      Sequencial;

    Sequencial = coalesce(:Sequencial, 0) + 1;

    Insert Into TBCAIXA_CONSOLIDACAO (
        Ano
      , Numero
      , Seq
      , Forma_pagto
      , Descricao
      , Total_credito
      , Total_debito
    ) values (
        :Ano_caixa
      , :Num_caixa
      , :Sequencial
      , :Forma_pagto
      , :Forma_pagto_desc
      , coalesce(:Total_credito, 0)
      , coalesce(:Total_debito, 0)
    );

  end 
end
^

SET TERM ; ^



SET TERM ^ ;

CREATE OR ALTER Trigger Tg_caixa_consolidacao_seq For Tbcaixa_consolidacao
Active Before Insert Position 0
AS
  declare variable sequencial Smallint;
begin
  if ( coalesce(new.Seq, 0) = 0 ) then
  begin
    Select
      max(c.Seq)
    from TBCAIXA_CONSOLIDACAO c
    where c.Ano = new.Ano
      and c.Numero = new.Numero
    into
      sequencial;

    new.Seq = coalesce(Sequencial, 0) + 1;
  end
end
^

SET TERM ; ^



SET TERM ^ ;

create procedure GET_CAIXA_ABERTO_DETALHE (
    USUARIO_IN varchar(12),
    DATA date,
    FORMA_PAGTO smallint)
returns (
    ANO smallint,
    NUMERO integer,
    USUARIO varchar(12),
    DATA_ABERTURA date,
    CONTA_CORRENTE integer,
    VALOR_TOTAL_CREDITO numeric(15,2),
    VALOR_TOTAL_DEBITO numeric(15,2))
as
begin

  Select
      gc.Ano_caixa
    , gc.Num_caixa
    , gc.Conta_corrente
  from GET_CAIXA_ABERTO(:Usuario_in, :Data, :Forma_pagto) gc
  into
      Ano
    , Numero
    , Conta_corrente;

  Select
      c.Usuario
    , c.Data_abertura
    , sum( Case when upper(cm.Tipo) = 'C' then cm.Valor else 0 end ) as Valor_total_credito
    , sum( Case when upper(cm.Tipo) = 'D' then cm.Valor else 0 end ) as Valor_total_debito
  from TBCAIXA c
    inner join TBCAIXA_MOVIMENTO cm on (cm.Caixa_ano = c.Ano and cm.Caixa_num = c.Numero)
  where c.Ano    = :Ano
    and c.Numero = :Numero
  Group by
      c.Usuario
    , c.Data_abertura
  into
      Usuario
    , Data_abertura
    , Valor_total_credito
    , Valor_total_debito;

  Valor_total_credito = coalesce(:Valor_total_credito, 0);
  Valor_total_credito = coalesce(:Valor_total_credito, 0);

  suspend;
end
^

SET TERM ; ^

GRANT EXECUTE ON PROCEDURE GET_CAIXA_ABERTO_DETALHE TO "PUBLIC";


SET TERM ^ ;

CREATE OR ALTER procedure GET_CAIXA_ABERTO_DETALHE (
    USUARIO_IN varchar(12),
    DATA date,
    FORMA_PAGTO smallint)
returns (
    ANO smallint,
    NUMERO integer,
    USUARIO varchar(12),
    DATA_ABERTURA date,
    CONTA_CORRENTE integer,
    VALOR_TOTAL_CREDITO numeric(15,2),
    VALOR_TOTAL_DEBITO numeric(15,2))
as
begin

  Select
      gc.Ano_caixa
    , gc.Num_caixa
    , gc.Conta_corrente
  from GET_CAIXA_ABERTO(:Usuario_in, :Data, :Forma_pagto) gc
  into
      Ano
    , Numero
    , Conta_corrente;

  Select
      c.Usuario
    , c.Data_abertura
    , sum( Case when upper(cm.Tipo) = 'C' then cm.Valor else 0 end ) as Valor_total_credito
    , sum( Case when upper(cm.Tipo) = 'D' then cm.Valor else 0 end ) as Valor_total_debito
  from TBCAIXA c
    inner join TBCAIXA_MOVIMENTO cm on (cm.Caixa_ano = c.Ano and cm.Caixa_num = c.Numero)
  where c.Ano    = :Ano
    and c.Numero = :Numero
  Group by
      c.Usuario
    , c.Data_abertura
  into
      Usuario
    , Data_abertura
    , Valor_total_credito
    , Valor_total_debito;

  Valor_total_credito = coalesce(:Valor_total_credito, 0);
  Valor_total_debito  = coalesce(:Valor_total_debito,  0);

  suspend;
end
^

SET TERM ; ^



CREATE DOMAIN DMN_COMISSAO AS
DECIMAL(2,2)
DEFAULT 0
NOT NULL;
COMMENT ON DOMAIN DMN_COMISSAO IS 'Percentual de comissao.';


ALTER TABLE TBVENDEDOR
    ADD COMISSAO DMN_COMISSAO;
COMMENT ON COLUMN TBVENDEDOR.COMISSAO IS
'Percentual de comissao.';


UPDATE TBVENDEDOR
SET COMISSAO = 0 WHERE COMISSAO IS NULL;


ALTER TABLE TBCLIENTE
    ADD DTCAD DMN_DATE_NN;

COMMENT ON COLUMN TBVENDAS.VENDA_PRAZO IS
'Venda A Prazo?
0 - Nao
1 - Sim';


COMMENT ON COLUMN TBPRODUTO.ALIQUOTA_TIPO IS
'Tipo Aliquota:
0 - ICMS (Para Produtos)
1 - ISS  (Para Servicos)';


SET TERM ^ ;

CREATE OR ALTER procedure GET_LIMITE_DISPONIVEL_CLIENTE (
    CPF_CNPJ varchar(18))
returns (
    VALOR_LIMITE numeric(15,2),
    VALOR_COMPRAS_ABERTAS numeric(15,2),
    VALOR_LIMITE_DISPONIVEL numeric(15,2))
as
begin
  Select
      coalesce(c.Valor_limite_compra, 0)
    , sum( coalesce(r.Valorrec, 0) - coalesce(r.Valorrectot, 0) )
  from TBCLIENTE c
    left join TBCONTREC r on ( (r.Cnpj = c.Cnpj and r.Baixado = 0) and ((r.Status is null) or (r.Situacao = 1)) )
  where c.Cnpj = :Cpf_cnpj
  Group by 1
  into
      Valor_limite
    , Valor_compras_abertas;

  Valor_limite            = coalesce(:Valor_limite, 0);
  Valor_limite_disponivel = 0;

  if ( coalesce(:Valor_compras_abertas, 0) <= 0 ) then
    Valor_compras_abertas = 0;

  if ( :Valor_limite > 0 ) then
    Valor_limite_disponivel = :Valor_limite - :Valor_compras_abertas;

  suspend;
end
^

SET TERM ; ^



SET TERM ^ ;

CREATE OR ALTER procedure GET_LIMITE_DISPONIVEL_CLIENTE (
    CPF_CNPJ varchar(18))
returns (
    VALOR_LIMITE numeric(15,2),
    VALOR_COMPRAS_ABERTAS numeric(15,2),
    VALOR_LIMITE_DISPONIVEL numeric(15,2))
as
begin
  Select
      coalesce(c.Valor_limite_compra, 0)
    , sum( coalesce(r.Valorrec, 0) - coalesce(r.Valorrectot, 0) )
  from TBCLIENTE c
    left join TBCONTREC r on ( (r.Cnpj = c.Cnpj and r.Baixado = 0 and r.Parcela > 0) and ((r.Status is null) or (r.Situacao = 1)) )
  where c.Cnpj = :Cpf_cnpj
  Group by 1
  into
      Valor_limite
    , Valor_compras_abertas;

  Valor_limite            = coalesce(:Valor_limite, 0);
  Valor_limite_disponivel = 0;

  if ( coalesce(:Valor_compras_abertas, 0) <= 0 ) then
    Valor_compras_abertas = 0;

  if ( :Valor_limite > 0 ) then
    Valor_limite_disponivel = :Valor_limite - :Valor_compras_abertas;

  suspend;
end
^

SET TERM ; ^



SET TERM ^ ;

CREATE OR ALTER Trigger Tg_vendas_cancelar For Tbvendas
Active After Update Position 2
AS
  declare variable produto varchar(10);
  declare variable empresa varchar(18);
  declare variable estoque integer;
  declare variable quantidade integer;
  declare variable valor_produto numeric(15,2);
begin
  if ( (coalesce(old.Status, 0) <> coalesce(new.Status, 0)) and (new.Status = 5)) then
  begin

    -- Retornar produto do Estoque
    for
      Select
          i.Codprod
        , i.Codemp
        , i.Qtde
        , coalesce(p.Qtde, 0)
        , coalesce(p.Preco, 0)
      from TVENDASITENS i
        inner join TBPRODUTO p on (p.Cod = i.Codprod)
      where i.Ano = new.Ano
        and i.Codcontrol = new.Codcontrol
      into
          produto
        , empresa
        , quantidade
        , estoque
        , valor_produto
    do
    begin
      estoque = :Estoque + :Quantidade;

      -- Retornar estoque
      Update TBPRODUTO p Set
        p.Qtde = :Estoque
      where p.Cod    = :Produto
        and p.Codemp = :Empresa;

      -- Gerar histórico
      Insert Into TBPRODHIST (
          Codempresa
        , Codprod
        , Doc
        , Historico
        , Dthist
        , Qtdeatual
        , Qtdenova
        , Qtdefinal
        , Resp
        , Motivo
      ) values (
          :Empresa
        , :Produto
        , new.Ano || '/' || new.Codcontrol
        , 'ENTRADA - VENDA CANCELADA'
        , Current_time
        , :Estoque - :Quantidade
        , :Quantidade
        , :Estoque
        , new.Cancel_usuario
        , 'Venda no valor de R$ ' || :Valor_produto
      );

    end

    -- Cancelar Contas A Receber (Apenas parcelas nao pagas)
    Update TBCONTREC r Set
        r.status   = 'CANCELADA'
      , r.Situacao = 0 -- Cancelado
    where r.anovenda = new.ano
      and r.numvenda = new.codcontrol
      and coalesce(r.Valorrectot, 0) = 0;

    -- Cancelar Movimento Caixa
    Update TBCAIXA_MOVIMENTO m Set
      m.Situacao = 0 -- Cancelado
    where m.Empresa = new.Codemp
      and m.Cliente = new.Codcli
      and m.Venda_ano = new.Ano
      and m.Venda_num = new.Codcontrol;
     
  end 
end
^

SET TERM ; ^



CREATE TABLE TBFABRICANTE (
    COD DMN_INTEGER_NN NOT NULL,
    NOME DMN_VCHAR_50);
alter table TBFABRICANTE
add constraint PK_TBFABRICANTE
primary key (COD);
COMMENT ON COLUMN TBFABRICANTE.COD IS
'Codigo.';
COMMENT ON COLUMN TBFABRICANTE.NOME IS
'Nome.';
GRANT ALL ON TBFABRICANTE TO "PUBLIC";


ALTER TABLE TBPRODUTO
    ADD CODFABRICANTE INTEGER;
COMMENT ON COLUMN TBPRODUTO.CODFABRICANTE IS
'Fabricante.';
alter table TBPRODUTO
alter CODIGO position 1;
alter table TBPRODUTO
alter COD position 2;
alter table TBPRODUTO
alter DESCRI position 3;
alter table TBPRODUTO
alter MODELO position 4;
alter table TBPRODUTO
alter PRECO position 5;
alter table TBPRODUTO
alter PRECO_PROMOCAO position 6;
alter table TBPRODUTO
alter REFERENCIA position 7;
alter table TBPRODUTO
alter SECAO position 8;
alter table TBPRODUTO
alter QTDE position 9;
alter table TBPRODUTO
alter UNIDADE position 10;
alter table TBPRODUTO
alter ESTOQMIN position 11;
alter table TBPRODUTO
alter CODGRUPO position 12;
alter table TBPRODUTO
alter CODFABRICANTE position 13;
alter table TBPRODUTO
alter CUSTOMEDIO position 14;
alter table TBPRODUTO
alter CODEMP position 15;
alter table TBPRODUTO
alter CODSECAO position 16;
alter table TBPRODUTO
alter CODORIGEM position 17;
alter table TBPRODUTO
alter CODTRIBUTACAO position 18;
alter table TBPRODUTO
alter CST position 19;
alter table TBPRODUTO
alter CSOSN position 20;
alter table TBPRODUTO
alter NCM_SH position 21;
alter table TBPRODUTO
alter CODCFOP position 22;
alter table TBPRODUTO
alter CODBARRA_EAN position 23;
alter table TBPRODUTO
alter CODUNIDADE position 24;
alter table TBPRODUTO
alter ALIQUOTA_TIPO position 25;
alter table TBPRODUTO
alter ALIQUOTA position 26;
alter table TBPRODUTO
alter ALIQUOTA_CSOSN position 27;
alter table TBPRODUTO
alter VALOR_IPI position 28;
alter table TBPRODUTO
alter RESERVA position 29;


alter table TBPRODUTO
add constraint FK_TBPRODUTO_FABRICANTE
foreign key (CODFABRICANTE)
references TBFABRICANTE(COD);


COMMENT ON COLUMN TBPRODUTO.ALIQUOTA IS
'Percencial da Aliquota.';


CREATE DOMAIN DMN_QUANTIDADE_D3 AS
NUMERIC(18,3)
DEFAULT 0
NOT NULL;;
COMMENT ON DOMAIN DMN_QUANTIDADE_D3 IS 'Quantidade

(Aceita valores decimais)';


ALTER TABLE TBPRODUTO DROP CONSTRAINT FK_TBPRODUTO_FABRICANTE;


update RDB$RELATION_FIELDS set
RDB$FIELD_SOURCE = 'DMN_INTEGER_N'
where (RDB$FIELD_NAME = 'CODFABRICANTE') and
(RDB$RELATION_NAME = 'TBPRODUTO')
;


alter table TBPRODUTO
add constraint FK_TBPRODUTO_FABRICANTE
foreign key (CODFABRICANTE)
references TBFABRICANTE(COD);


CREATE SEQUENCE GEN_TBFABRICANTE_ID;
SET TERM ^ ;

CREATE TRIGGER TG_FABRICANTE_COD FOR TBFABRICANTE
ACTIVE BEFORE INSERT POSITION 0
AS
BEGIN
  IF (NEW.COD IS NULL) THEN
    NEW.COD = GEN_ID(GEN_TBFABRICANTE_ID,1);
END
^

SET TERM ; ^



CREATE SEQUENCE GEN_FABRICANTE_ID;


SET TERM ^ ;

CREATE OR ALTER Trigger Tg_fabricante_cod For Tbfabricante
Active Before Insert Position 0
AS
BEGIN
  IF (NEW.COD IS NULL) THEN
    NEW.COD = GEN_ID(GEN_FABRICANTE_ID, 1);
END
^

SET TERM ; ^



SET TERM ^ ;

CREATE OR ALTER Trigger Tg_fabricante_cod For Tbfabricante
Active Before Insert Position 0
AS
BEGIN
  IF (NEW.COD IS NULL) THEN
    NEW.COD = GEN_ID(GEN_FABRICANTE_ID, 1);
END
^

SET TERM ; ^



DROP SEQUENCE GEN_TBFABRICANTE_ID;

/*!!! Error occured !!!
Invalid token.
Dynamic SQL Error.
SQL error code = -104.
Token unknown - line 35, column 42.
trim.

*/


ALTER TABLE TB_TESTE DROP CONSTRAINT PK_TB_TESTE;


ALTER TABLE TBCLIENTE
    ADD BLOQUEADO DMN_LOGICO DEFAULT 0,
    ADD BLOQUEADO_DATA DMN_DATE,
    ADD BLOQUEADO_MOTIVO DMN_TEXTO,
    ADD BLOQUEADO_USUARIO DMN_VCHAR_50;
COMMENT ON COLUMN TBCLIENTE.BLOQUEADO IS
'Bloqueado?
0 - Nao
1 - Sim';
COMMENT ON COLUMN TBCLIENTE.BLOQUEADO_DATA IS
'Data do bloqueio.';
COMMENT ON COLUMN TBCLIENTE.BLOQUEADO_MOTIVO IS
'Motivo do bloqueio.';
COMMENT ON COLUMN TBCLIENTE.BLOQUEADO_USUARIO IS
'Usuario do bloqueio.';


CREATE INDEX IDX_TBCLIENTE_BLOQUEADO
ON TBCLIENTE (BLOQUEADO);

/*!!! Error occured !!!
Invalid token.
Dynamic SQL Error.
SQL error code = -104.
Token unknown - line 6, column 3.
from.

*/


ALTER TABLE TBCLIENTE
    ADD DESBLOQUEADO_DATA DMN_DATE;
COMMENT ON COLUMN TBCLIENTE.DESBLOQUEADO_DATA IS
'Data de desbloqueio.';


ALTER TABLE TBFORMPAGTO
    ADD DEBITAR_LIMITE_CLIENTE DMN_LOGICO DEFAULT 1;
COMMENT ON COLUMN TBFORMPAGTO.DEBITAR_LIMITE_CLIENTE IS
'Forma de Pagamento DECREMENTA Limite de Credito do Cliente:
0 - Nao
1 - Sim';

/*------ SYSDBA 30/10/2012 18:07:05 --------*/

Update TBFORMPAGTO x Set x.Debitar_limite_cliente = 1;
COMMIT WORK;


SET TERM ^ ;

CREATE OR ALTER procedure GET_LIMITE_DISPONIVEL_CLIENTE (
    CPF_CNPJ varchar(18))
returns (
    VALOR_LIMITE numeric(15,2),
    VALOR_COMPRAS_ABERTAS numeric(15,2),
    VALOR_LIMITE_DISPONIVEL numeric(15,2))
as
begin
  Select
      coalesce(c.Valor_limite_compra, 0)
    , sum( coalesce(r.Valorrec, 0) - coalesce(r.Valorrectot, 0) )
  from TBCLIENTE c
    left join TBCONTREC r on ( (r.Cnpj = c.Cnpj and r.Baixado = 0 and r.Parcela > 0) and ((r.Status is null) or (r.Situacao = 1)) )
    left join TBFORMPAGTO f on (f.Cod = r.Forma_pagto and f.Debitar_limite_cliente = 1)
  where c.Cnpj = :Cpf_cnpj
  Group by 1
  into
      Valor_limite
    , Valor_compras_abertas;

  Valor_limite            = coalesce(:Valor_limite, 0);
  Valor_limite_disponivel = 0;

  if ( coalesce(:Valor_compras_abertas, 0) <= 0 ) then
    Valor_compras_abertas = 0;

  if ( :Valor_limite > 0 ) then
    Valor_limite_disponivel = :Valor_limite - :Valor_compras_abertas;

  suspend;
end
^

SET TERM ; ^



CREATE TABLE TBSEGMENTO (
    SEG_ID DMN_SMALLINT_NN NOT NULL,
    SEG_DESCRICAO DMN_NOME);

ALTER TABLE TBSEGMENTO
ADD CONSTRAINT PK_TBSEGMENTO
PRIMARY KEY (SEG_ID);

COMMENT ON COLUMN TBSEGMENTO.SEG_ID IS
'Código.';

COMMENT ON COLUMN TBSEGMENTO.SEG_DESCRICAO IS
'Descrição.';



COMMENT ON TABLE TBSEGMENTO IS 'Tabela de Segmentos.
    
    Autor   :   Isaque Marinho Ribeiro
    Data    :   07/11/2012

Tabela responsável por armazenar os códigos e descrições dos segmentos que a empresa poderá assumir.';

GRANT ALL ON TBSEGMENTO TO "PUBLIC";


SET TERM ^ ;

create or alter procedure SET_SEGMENTO (
    SEG_ID smallint,
    SEG_DESCRICAO varchar(60))
as
begin
  if ( (:Seg_id is null) or (:Seg_descricao is null)  ) then
    Exit;

  if ( not exists(
    Select
      s.Seg_id
    from TBSEGMENTO s
    where s.Seg_id = :Seg_id
  ) ) then
    Update TBSEGMENTO u Set
      u.Seg_descricao = :Seg_descricao
    where u.Seg_id = :Seg_id;
  else
    Insert Into TBSEGMENTO (
        Seg_id
      , Seg_descricao
    ) values (
        :Seg_id
      , :Seg_descricao
    );
end^

SET TERM ; ^

GRANT EXECUTE ON PROCEDURE SET_SEGMENTO TO "PUBLIC";


ALTER TABLE TBEMPRESA
    ADD SEGMENTO DMN_SMALLINT_N;

COMMENT ON COLUMN TBEMPRESA.SEGMENTO IS
'Segmento.';

alter table TBEMPRESA
alter CODIGO position 1;

alter table TBEMPRESA
alter PESSOA_FISICA position 2;

alter table TBEMPRESA
alter CNPJ position 3;

alter table TBEMPRESA
alter RZSOC position 4;

alter table TBEMPRESA
alter NMFANT position 5;

alter table TBEMPRESA
alter IE position 6;

alter table TBEMPRESA
alter IM position 7;

alter table TBEMPRESA
alter CNAE position 8;

alter table TBEMPRESA
alter SEGMENTO position 9;

alter table TBEMPRESA
alter ENDER position 10;

alter table TBEMPRESA
alter COMPLEMENTO position 11;

alter table TBEMPRESA
alter BAIRRO position 12;

alter table TBEMPRESA
alter CEP position 13;

alter table TBEMPRESA
alter CIDADE position 14;

alter table TBEMPRESA
alter UF position 15;

alter table TBEMPRESA
alter FONE position 16;

alter table TBEMPRESA
alter LOGO position 17;

alter table TBEMPRESA
alter TLG_TIPO position 18;

alter table TBEMPRESA
alter LOG_COD position 19;

alter table TBEMPRESA
alter BAI_COD position 20;

alter table TBEMPRESA
alter CID_COD position 21;

alter table TBEMPRESA
alter EST_COD position 22;

alter table TBEMPRESA
alter NUMERO_END position 23;

alter table TBEMPRESA
alter EMAIL position 24;

alter table TBEMPRESA
alter HOME_PAGE position 25;

alter table TBEMPRESA
alter CHAVE_ACESSO_NFE position 26;

alter table TBEMPRESA
alter PAIS_ID position 27;

alter table TBEMPRESA
alter TIPO_REGIME_NFE position 28;

alter table TBEMPRESA
alter SERIE_NFE position 29;

alter table TBEMPRESA
alter NUMERO_NFE position 30;

alter table TBEMPRESA
alter LOTE_ANO_NFE position 31;

alter table TBEMPRESA
alter LOTE_NUM_NFE position 32;



ALTER TABLE TBEMPRESA
ADD CONSTRAINT FK_TBEMPRESA_SEGMENTO
FOREIGN KEY (SEGMENTO)
REFERENCES TBSEGMENTO(SEG_ID)
ON UPDATE CASCADE;



CREATE DOMAIN DMN_VCHAR_100 AS
VARCHAR(100);

ALTER TABLE TBPRODUTO
    ADD APRESENTACAO DMN_VCHAR_50,
    ADD DESCRI_APRESENTACAO DMN_VCHAR_100;

COMMENT ON COLUMN TBPRODUTO.DESCRI IS
'Descrição.';

COMMENT ON COLUMN TBPRODUTO.APRESENTACAO IS
'Apresentação.';

COMMENT ON COLUMN TBPRODUTO.DESCRI_APRESENTACAO IS
'Campo Calculado = Descrição + Apresentação.';

alter table TBPRODUTO
alter CODIGO position 1;

alter table TBPRODUTO
alter COD position 2;

alter table TBPRODUTO
alter DESCRI position 3;

alter table TBPRODUTO
alter APRESENTACAO position 4;

alter table TBPRODUTO
alter DESCRI_APRESENTACAO position 5;

alter table TBPRODUTO
alter MODELO position 6;

alter table TBPRODUTO
alter PRECO position 7;

alter table TBPRODUTO
alter PRECO_PROMOCAO position 8;

alter table TBPRODUTO
alter REFERENCIA position 9;

alter table TBPRODUTO
alter SECAO position 10;

alter table TBPRODUTO
alter QTDE position 11;

alter table TBPRODUTO
alter UNIDADE position 12;

alter table TBPRODUTO
alter ESTOQMIN position 13;

alter table TBPRODUTO
alter CODGRUPO position 14;

alter table TBPRODUTO
alter CODFABRICANTE position 15;

alter table TBPRODUTO
alter CUSTOMEDIO position 16;

alter table TBPRODUTO
alter CODEMP position 17;

alter table TBPRODUTO
alter CODSECAO position 18;

alter table TBPRODUTO
alter CODORIGEM position 19;

alter table TBPRODUTO
alter CODTRIBUTACAO position 20;

alter table TBPRODUTO
alter CST position 21;

alter table TBPRODUTO
alter CSOSN position 22;

alter table TBPRODUTO
alter NCM_SH position 23;

alter table TBPRODUTO
alter CODCFOP position 24;

alter table TBPRODUTO
alter CODBARRA_EAN position 25;

alter table TBPRODUTO
alter CODUNIDADE position 26;

alter table TBPRODUTO
alter ALIQUOTA_TIPO position 27;

alter table TBPRODUTO
alter ALIQUOTA position 28;

alter table TBPRODUTO
alter ALIQUOTA_CSOSN position 29;

alter table TBPRODUTO
alter VALOR_IPI position 30;

alter table TBPRODUTO
alter RESERVA position 31;



SET TERM ^ ;

CREATE OR ALTER procedure SET_SEGMENTO (
    SEG_ID smallint,
    SEG_DESCRICAO varchar(60))
as
begin
  if ( (:Seg_id is null) or (:Seg_descricao is null)  ) then
    Exit;

  if ( exists(
    Select
      s.Seg_id
    from TBSEGMENTO s
    where s.Seg_id = :Seg_id
  ) ) then
    Update TBSEGMENTO u Set
      u.Seg_descricao = :Seg_descricao
    where u.Seg_id = :Seg_id;
  else
    Insert Into TBSEGMENTO (
        Seg_id
      , Seg_descricao
    ) values (
        :Seg_id
      , :Seg_descricao
    );
end^

SET TERM ; ^



COMMENT ON COLUMN TBSEGMENTO.SEG_DESCRICAO IS
'Descricao.';



COMMENT ON COLUMN TBSEGMENTO.SEG_ID IS
'Codigo.';



COMMENT ON TABLE TBSEGMENTO IS 'Tabela de Segmentos.
    
    Autor   :   Isaque Marinho Ribeiro
    Data    :   07/11/2012

Tabela responsavel por armazenar os codigos e descricoes dos segmentos que a empresa podera assumir.';



COMMENT ON COLUMN TBPRODUTO.DESCRI IS
'Descricao.';



COMMENT ON COLUMN TBPRODUTO.APRESENTACAO IS
'Apresentacao.';



COMMENT ON COLUMN TBPRODUTO.DESCRI_APRESENTACAO IS
'Campo Calculado = Descricao + Apresentacao.';



CREATE INDEX IBE$$RC_TEMP_INDEX
ON RDB$RELATION_CONSTRAINTS (RDB$INDEX_NAME);



DROP INDEX IBE$$RC_TEMP_INDEX;



alter table TBEMPRESA
alter column CODIGO position 1;

alter table TBEMPRESA
alter column PESSOA_FISICA position 2;

alter table TBEMPRESA
alter column CNPJ position 3;

alter table TBEMPRESA
alter column RZSOC position 4;

alter table TBEMPRESA
alter column NMFANT position 5;

alter table TBEMPRESA
alter column IE position 6;

alter table TBEMPRESA
alter column IM position 7;

alter table TBEMPRESA
alter column SEGMENTO position 8;

alter table TBEMPRESA
alter column CNAE position 9;

alter table TBEMPRESA
alter column ENDER position 10;

alter table TBEMPRESA
alter column COMPLEMENTO position 11;

alter table TBEMPRESA
alter column BAIRRO position 12;

alter table TBEMPRESA
alter column CEP position 13;

alter table TBEMPRESA
alter column CIDADE position 14;

alter table TBEMPRESA
alter column UF position 15;

alter table TBEMPRESA
alter column FONE position 16;

alter table TBEMPRESA
alter column LOGO position 17;

alter table TBEMPRESA
alter column TLG_TIPO position 18;

alter table TBEMPRESA
alter column LOG_COD position 19;

alter table TBEMPRESA
alter column BAI_COD position 20;

alter table TBEMPRESA
alter column CID_COD position 21;

alter table TBEMPRESA
alter column EST_COD position 22;

alter table TBEMPRESA
alter column NUMERO_END position 23;

alter table TBEMPRESA
alter column EMAIL position 24;

alter table TBEMPRESA
alter column HOME_PAGE position 25;

alter table TBEMPRESA
alter column CHAVE_ACESSO_NFE position 26;

alter table TBEMPRESA
alter column PAIS_ID position 27;

alter table TBEMPRESA
alter column TIPO_REGIME_NFE position 28;

alter table TBEMPRESA
alter column SERIE_NFE position 29;

alter table TBEMPRESA
alter column NUMERO_NFE position 30;

alter table TBEMPRESA
alter column LOTE_ANO_NFE position 31;

alter table TBEMPRESA
alter column LOTE_NUM_NFE position 32;

alter table TBPRODUTO
alter column CODIGO position 1;

alter table TBPRODUTO
alter column COD position 2;

alter table TBPRODUTO
alter column DESCRI position 3;

alter table TBPRODUTO
alter column APRESENTACAO position 4;

alter table TBPRODUTO
alter column DESCRI_APRESENTACAO position 5;

alter table TBPRODUTO
alter column MODELO position 6;

alter table TBPRODUTO
alter column PRECO position 7;

alter table TBPRODUTO
alter column PRECO_PROMOCAO position 8;

alter table TBPRODUTO
alter column REFERENCIA position 9;

alter table TBPRODUTO
alter column SECAO position 10;

alter table TBPRODUTO
alter column QTDE position 11;

alter table TBPRODUTO
alter column UNIDADE position 12;

alter table TBPRODUTO
alter column ESTOQMIN position 13;

alter table TBPRODUTO
alter column CODGRUPO position 14;

alter table TBPRODUTO
alter column CODFABRICANTE position 15;

alter table TBPRODUTO
alter column CUSTOMEDIO position 16;

alter table TBPRODUTO
alter column CODEMP position 17;

alter table TBPRODUTO
alter column CODSECAO position 18;

alter table TBPRODUTO
alter column CODORIGEM position 19;

alter table TBPRODUTO
alter column CODTRIBUTACAO position 20;

alter table TBPRODUTO
alter column CST position 21;

alter table TBPRODUTO
alter column CSOSN position 22;

alter table TBPRODUTO
alter column NCM_SH position 23;

alter table TBPRODUTO
alter column CODCFOP position 24;

alter table TBPRODUTO
alter column CODBARRA_EAN position 25;

alter table TBPRODUTO
alter column CODUNIDADE position 26;

alter table TBPRODUTO
alter column ALIQUOTA_TIPO position 27;

alter table TBPRODUTO
alter column ALIQUOTA position 28;

alter table TBPRODUTO
alter column ALIQUOTA_CSOSN position 29;

alter table TBPRODUTO
alter column VALOR_IPI position 30;

alter table TBPRODUTO
alter column RESERVA position 31;

ALTER TABLE TBPRODUTO
    ADD PRODUTO_NOVO DMN_LOGICO DEFAULT 0;

COMMENT ON COLUMN TBPRODUTO.PRODUTO_NOVO IS
'Produto novo:
0 - Nao
1 - Sim';



CREATE TABLE RENAVAM_COR (
    CODIGO DMN_SMALLINT_NN NOT NULL,
    DESCRICAO DMN_VCHAR_50);

ALTER TABLE RENAVAM_COR
ADD CONSTRAINT PK_RENAVAM_COR
PRIMARY KEY (CODIGO);

COMMENT ON COLUMN RENAVAM_COR.CODIGO IS
'Codigo.';

COMMENT ON COLUMN RENAVAM_COR.DESCRICAO IS
'Descricao.';



COMMENT ON TABLE RENAVAM_COR IS 'Tabela de Cores RENAVAM

    Autor   :   Isaque Marinho Ribeiro
    Data    :   09/11/2012

Tabela padrao de cores para veiculos de acordo com o sistema RENAVAM de veiculos.';

GRANT ALL ON RENAVAM_COR TO "PUBLIC";


ALTER TABLE RENAVAM_COR DROP CONSTRAINT PK_RENAVAM_COR;



update RDB$RELATION_FIELDS set
RDB$FIELD_SOURCE = 'DMN_VCHAR_03'
where (RDB$FIELD_NAME = 'CODIGO') and
(RDB$RELATION_NAME = 'RENAVAM_COR')
;



ALTER TABLE RENAVAM_COR
ADD CONSTRAINT PK_RENAVAM_COR
PRIMARY KEY (CODIGO);

Insert Into RENAVAM_COR values ('01', 'AMARELA');
Insert Into RENAVAM_COR values ('02', 'AZUL');
Insert Into RENAVAM_COR values ('03', 'BEGE');
Insert Into RENAVAM_COR values ('04', 'BRANCA');
Insert Into RENAVAM_COR values ('05', 'CINZA');
Insert Into RENAVAM_COR values ('06', 'DOURADA');
Insert Into RENAVAM_COR values ('07', 'GRENA');
Insert Into RENAVAM_COR values ('08', 'LARANJA');
Insert Into RENAVAM_COR values ('09', 'MARROM');
Insert Into RENAVAM_COR values ('10', 'PRATA');
Insert Into RENAVAM_COR values ('11', 'PRETA');
Insert Into RENAVAM_COR values ('12', 'ROSA');
Insert Into RENAVAM_COR values ('13', 'ROXA');
Insert Into RENAVAM_COR values ('14', 'VERDE');
Insert Into RENAVAM_COR values ('15', 'VERMELHA');
Insert Into RENAVAM_COR values ('16', 'FANTASIA');
COMMIT WORK;



CREATE TABLE RENAVAM_COBUSTIVEL (
    CODIGO DMN_VCHAR_03 NOT NULL,
    DESCRICAO DMN_VCHAR_100);

ALTER TABLE RENAVAM_COBUSTIVEL
ADD CONSTRAINT PK_RENAVAM_COBUSTIVEL
PRIMARY KEY (CODIGO);

COMMENT ON COLUMN RENAVAM_COBUSTIVEL.CODIGO IS
'Codigo.';

COMMENT ON COLUMN RENAVAM_COBUSTIVEL.DESCRICAO IS
'Descricao.';



COMMENT ON TABLE RENAVAM_COBUSTIVEL IS 'Tabela de Tipos de Combustiveis RENAVAM.

    Autor   :   Isaque Marinho Ribeiro
    Data    :   09/11/2012

Tabela padrao de tipos de combustiveis para veiculos de acordo com o sistema RENAVAM de veiculos.';

GRANT ALL ON RENAVAM_COBUSTIVEL TO "PUBLIC";

Insert Into RENAVAM_COBUSTIVEL values ('01', 'ALCOOL');
Insert Into RENAVAM_COBUSTIVEL values ('02', 'GASOLINA');
Insert Into RENAVAM_COBUSTIVEL values ('03', 'DIESEL');
Insert Into RENAVAM_COBUSTIVEL values ('04', 'GASOGENIO');
Insert Into RENAVAM_COBUSTIVEL values ('05', 'GAS METANO');
Insert Into RENAVAM_COBUSTIVEL values ('06', 'ELETRICO/FONTE INTERNA');
Insert Into RENAVAM_COBUSTIVEL values ('07', 'ELETRICO/FONTE EXTERNA');
Insert Into RENAVAM_COBUSTIVEL values ('08', 'GASOL/GAS NATURAL COMBUSTIVEL');
Insert Into RENAVAM_COBUSTIVEL values ('09', 'ALCOOL/GAS NATURAL COMBUSTIVEL');
Insert Into RENAVAM_COBUSTIVEL values ('10', 'DIESEL/GAS NATURAL COMBUSTIVEL');
Insert Into RENAVAM_COBUSTIVEL values ('11', 'VIDE/CAMPO/OBSERVACAO');
Insert Into RENAVAM_COBUSTIVEL values ('12', 'ALCOOL/GAS NATURAL VEICULAR');
Insert Into RENAVAM_COBUSTIVEL values ('13', 'GASOLINA/GAS NATURAL VEICULAR');
Insert Into RENAVAM_COBUSTIVEL values ('14', 'DIESEL/GAS NATURAL VEICULAR');
Insert Into RENAVAM_COBUSTIVEL values ('15', 'GAS NATURAL VEICULAR');
Insert Into RENAVAM_COBUSTIVEL values ('16', 'ALCOOL/GASOLINA');
Insert Into RENAVAM_COBUSTIVEL values ('17', 'GASOLINA/ALCOOL/GAS NATURAL');
Insert Into RENAVAM_COBUSTIVEL values ('18', 'GASOLINA/ELETRICO');
COMMIT WORK;






CREATE TABLE RENAVAM_TIPOVEICULO (
    CODIGO DMN_VCHAR_03 NOT NULL,
    DESCRICAO DMN_VCHAR_100);

ALTER TABLE RENAVAM_TIPOVEICULO
ADD CONSTRAINT PK_RENAVAM_TIPOVEICULO
PRIMARY KEY (CODIGO);

COMMENT ON COLUMN RENAVAM_TIPOVEICULO.CODIGO IS
'Codigo.';

COMMENT ON COLUMN RENAVAM_TIPOVEICULO.DESCRICAO IS
'Descricao.';



COMMENT ON TABLE RENAVAM_TIPOVEICULO IS 'Tabela de Tipos de Veiculos RENAVAM.

    Autor   :   Isaque Marinho Ribeiro
    Data    :   09/11/2012

Tabela padrao de tipos de veiculos de acordo com o sistema RENAVAM de veiculos.';

GRANT ALL ON RENAVAM_TIPOVEICULO TO "PUBLIC";

Insert Into RENAVAM_TIPOVEICULO values ('01', 'BICICLETA');
Insert Into RENAVAM_TIPOVEICULO values ('02', 'CICLOMOTOR');
Insert Into RENAVAM_TIPOVEICULO values ('03', 'MOTONETA');
Insert Into RENAVAM_TIPOVEICULO values ('04', 'MOTOCICLETA');
Insert Into RENAVAM_TIPOVEICULO values ('05', 'TRICICLO');
Insert Into RENAVAM_TIPOVEICULO values ('06', 'AUTOMOVEL');
Insert Into RENAVAM_TIPOVEICULO values ('07', 'MICROONIBUS');
Insert Into RENAVAM_TIPOVEICULO values ('08', 'ONIBUS');
Insert Into RENAVAM_TIPOVEICULO values ('09', 'BONDE');
Insert Into RENAVAM_TIPOVEICULO values ('10', 'REBOQUE');
Insert Into RENAVAM_TIPOVEICULO values ('11', 'SEMI-REBOQUE');
Insert Into RENAVAM_TIPOVEICULO values ('12', 'CHARRETE');
Insert Into RENAVAM_TIPOVEICULO values ('13', 'CAMIONETA');
Insert Into RENAVAM_TIPOVEICULO values ('14', 'CAMINHAO');
Insert Into RENAVAM_TIPOVEICULO values ('15', 'CARROCA');
Insert Into RENAVAM_TIPOVEICULO values ('16', 'CARRO DE MAO');
Insert Into RENAVAM_TIPOVEICULO values ('17', 'CAMINHAO TRATOR');
Insert Into RENAVAM_TIPOVEICULO values ('18', 'TRATOR DE RODAS');
Insert Into RENAVAM_TIPOVEICULO values ('19', 'TRATOR DE ESTEIRAS');
Insert Into RENAVAM_TIPOVEICULO values ('20', 'TRATOR MISTO');
Insert Into RENAVAM_TIPOVEICULO values ('21', 'QUADRICICLO');
COMMIT WORK;



ALTER TABLE TBPRODUTO
    ADD COR_VEICULO DMN_VCHAR_03,
    ADD COMBUSTIVEL_VEICULO DMN_VCHAR_03,
    ADD TIPO_VEICULO DMN_VCHAR_03;

COMMENT ON COLUMN TBPRODUTO.COR_VEICULO IS
'Codigo da Cor (Tabela RENAVAM).';

COMMENT ON COLUMN TBPRODUTO.COMBUSTIVEL_VEICULO IS
'Codigo do Combustivel (Tabela RENAVAM).';

COMMENT ON COLUMN TBPRODUTO.TIPO_VEICULO IS
'Codigo do Tipo do Veiculo (Tabela RENAVAM).';



ALTER TABLE TBPRODUTO
ADD CONSTRAINT FK_TBPRODUTO_COR
FOREIGN KEY (COR_VEICULO)
REFERENCES RENAVAM_COR(CODIGO)
ON UPDATE CASCADE;

ALTER TABLE TBPRODUTO
ADD CONSTRAINT FK_TBPRODUTO_COMBUSTIVEL
FOREIGN KEY (COMBUSTIVEL_VEICULO)
REFERENCES RENAVAM_COBUSTIVEL(CODIGO)
ON UPDATE CASCADE;

ALTER TABLE TBPRODUTO
ADD CONSTRAINT FK_TBPRODUTO_TIPO_VEI
FOREIGN KEY (TIPO_VEICULO)
REFERENCES RENAVAM_TIPOVEICULO(CODIGO)
ON UPDATE CASCADE;



ALTER TABLE TBPRODUTO
    ADD ANO_MODELO_VEICULO DMN_SMALLINT_N,
    ADD ANO_FABRICACAO_VEICULO DMN_SMALLINT_N;

COMMENT ON COLUMN TBPRODUTO.ANO_MODELO_VEICULO IS
'Ano do Modelo do Veiculo.';

COMMENT ON COLUMN TBPRODUTO.ANO_FABRICACAO_VEICULO IS
'Ano de Fabricacao do Veiculo.';



ALTER TABLE TBPRODUTO
    ADD RENAVAM_VEICULO DMN_VCHAR_50,
    ADD CHASSI_VEICULO DMN_VCHAR_50;

COMMENT ON COLUMN TBPRODUTO.RENAVAM_VEICULO IS
'Numero de Renavam do Veiculo.';

COMMENT ON COLUMN TBPRODUTO.CHASSI_VEICULO IS
'Chassi do Veiculo.';



ALTER TABLE TBPRODUTO
    ADD KILOMETRAGEM_VEICULO DMN_INTEGER_N;

COMMENT ON COLUMN TBPRODUTO.KILOMETRAGEM_VEICULO IS
'Kilometragem do Veiculo.';


/*!!! Error occured !!!
Invalid token.
Dynamic SQL Error.
SQL error code = -104.
Token unknown - line 55, column 69.
).

*/


ALTER TABLE RENAVAM_COBUSTIVEL
    ADD APELIDO DMN_VCHAR_10;

COMMENT ON COLUMN RENAVAM_COBUSTIVEL.APELIDO IS
'Apelido.';



ALTER TABLE TBPRODUTO
    ADD SITUACAO_ATUAL_VEICULO DMN_VCHAR_100,
    ADD SITUACAO_HISTORICO_VEICULO DMN_TEXTO;

COMMENT ON COLUMN TBPRODUTO.SITUACAO_ATUAL_VEICULO IS
'Descricao simples e breve da situacao atual do produto (Veiculo).';

COMMENT ON COLUMN TBPRODUTO.SITUACAO_HISTORICO_VEICULO IS
'Historico das situacoes do produto (Veiculo).';



DROP VIEW VW_TIPO_MOVIMENTO_CAIXA;


/*------ SYSDBA 22/11/2012 13:26:27 --------*/

CREATE VIEW VW_TIPO_MOVIMENTO_CAIXA(
    TIPO,
    TIPO_DESC)
AS
Select First 1
    'C' as TIPO
  , 'Crédito' as TIPO_DESC
from TBEMPRESA

union

Select First 1
    'D' as TIPO
  , 'Débito' as TIPO_DESC
from TBEMPRESA
;
COMMIT WORK;


COMMENT ON COLUMN TBTRIBUTACAO_TIPO.CRT IS
'Codigo do Regime Tributario.
0 - Normal
1 - Simples Nacional';



ALTER TABLE TBPRODUTO
    ADD PERCENTUAL_REDUCAO_BC DECIMAL(15,2);

COMMENT ON COLUMN TBPRODUTO.PERCENTUAL_REDUCAO_BC IS
'Percentual de reducao da Base de Calculo da Aliquota ICMS.';



ALTER TABLE TBPRODUTO ADD IBE$$TEMP_COLUMN
 NUMERIC(1,1) DEFAULT 0
;

UPDATE RDB$RELATION_FIELDS F1
SET
F1.RDB$DEFAULT_VALUE  = (SELECT F2.RDB$DEFAULT_VALUE
                         FROM RDB$RELATION_FIELDS F2
                         WHERE (F2.RDB$RELATION_NAME = 'TBPRODUTO') AND
                               (F2.RDB$FIELD_NAME = 'IBE$$TEMP_COLUMN')),
F1.RDB$DEFAULT_SOURCE = (SELECT F3.RDB$DEFAULT_SOURCE FROM RDB$RELATION_FIELDS F3
                         WHERE (F3.RDB$RELATION_NAME = 'TBPRODUTO') AND
                               (F3.RDB$FIELD_NAME = 'IBE$$TEMP_COLUMN'))
WHERE (F1.RDB$RELATION_NAME = 'TBPRODUTO') AND
      (F1.RDB$FIELD_NAME = 'PERCENTUAL_REDUCAO_BC');

ALTER TABLE TBPRODUTO DROP IBE$$TEMP_COLUMN;



COMMENT ON COLUMN TBPRODUTO.PERCENTUAL_REDUCAO_BC IS
'Percentual de reducao da Base de Calculo da Aliquota ICMS.

Exemplo:
Caso um produto tenha uma reducao de 94% sobre o seu preco de venda, seu percentual sera de 6% (100% - 94%).';



COMMENT ON COLUMN TBPRODUTO.PERCENTUAL_REDUCAO_BC IS
'Percentual de reducao da Base de Calculo da Aliquota ICMS.';



ALTER TABLE TVENDASITENS
    ADD PERCENTUAL_REDUCAO_BC DECIMAL(15,2) DEFAULT 0;

COMMENT ON COLUMN TVENDASITENS.PERCENTUAL_REDUCAO_BC IS
'Percentual de Reducao BC.';



CREATE TABLE TBCST_PIS (
    CODIGO DMN_VCHAR_03 NOT NULL,
    DESCRICAO DMN_VCHAR_250,
    INDICE_ACBR DMN_SMALLINT_NN);

ALTER TABLE TBCST_PIS
ADD CONSTRAINT PK_TBCST_PIS
PRIMARY KEY (CODIGO);

COMMENT ON COLUMN TBCST_PIS.CODIGO IS
'Codigo.';

COMMENT ON COLUMN TBCST_PIS.DESCRICAO IS
'Descricao.';

COMMENT ON COLUMN TBCST_PIS.INDICE_ACBR IS
'Indice ACBr para geracao da NF-e.';

GRANT ALL ON TBCST_PIS TO "PUBLIC";


CREATE TABLE TBCST_COFINS (
    CODIGO       DMN_VCHAR_03 NOT NULL /* DMN_VCHAR_03 = VARCHAR(3) */,
    DESCRICAO    DMN_VCHAR_250 /* DMN_VCHAR_250 = VARCHAR(250) */,
    INDICE_ACBR  DMN_SMALLINT_NN /* DMN_SMALLINT_NN = SMALLINT DEFAULT 0 */
);

ALTER TABLE TBCST_COFINS ADD CONSTRAINT PK_TBCST_COFINS PRIMARY KEY (CODIGO);

COMMENT ON COLUMN TBCST_COFINS.CODIGO IS 
'Codigo.';

COMMENT ON COLUMN TBCST_COFINS.DESCRICAO IS 
'Descricao.';

COMMENT ON COLUMN TBCST_COFINS.INDICE_ACBR IS 
'Indice ACBr para geracao da NF-e.';

GRANT ALL ON TBCST_COFINS TO PUBLIC;

SET TERM ^ ;

create or alter procedure SET_CST_PIS (
    CODIGO varchar(3),
    DESCRICAO varchar(250),
    INDICE_ACBR smallint)
as
begin
  if ( Trim(coalesce(:Codigo, '')) <> '' ) then
  begin
    Codigo      = Trim(:Codigo);
    Descricao   = Trim(:Descricao);
    Indice_acbr = coalesce(:Indice_acbr, 99);

    if (not Exists(
      Select
        p.Codigo
      from TBCST_PIS p
      where p.Codigo = :Codigo
    )) then
    begin

      /* Inserir CST, caso nao exista */

      Insert Into TBCST_PIS (
          Codigo
        , Descricao
        , Indice_acbr
      ) values (
          :Codigo
        , :Descricao
        , :Indice_acbr
      );

    end
    else
    begin

      /* Atualizar CST, caso exista */

      Update TBCST_PIS Set
          Descricao   = :Descricao
        , Indice_acbr = :Indice_acbr
      where Codigo = :Codigo;

    end 

  end 
end^

SET TERM ; ^

GRANT EXECUTE ON PROCEDURE SET_CST_PIS TO "PUBLIC";

/*!!! Error occured !!!
Invalid token.
Dynamic SQL Error.
SQL error code = -104.
Token unknown - line 33, column 61.
=.

*/


SET TERM ^ ;

create or alter procedure SET_CST_COFINS (
    CODIGO varchar(3),
    DESCRICAO varchar(250),
    INDICE_ACBR smallint)
as
begin
  if ( Trim(coalesce(:Codigo, '')) <> '' ) then
  begin
    Codigo      = Trim(:Codigo);
    Descricao   = Trim(:Descricao);
    Indice_acbr = coalesce(:Indice_acbr, 99);

    if (not Exists(
      Select
        p.Codigo
      from TBCST_COFINS p
      where p.Codigo = :Codigo
    )) then
    begin

      /* Inserir CST, caso nao exista */

      Insert Into TBCST_COFINS (
          Codigo
        , Descricao
        , Indice_acbr
      ) values (
          :Codigo
        , :Descricao
        , :Indice_acbr
      );

    end
    else
    begin

      /* Atualizar CST, caso exista */

      Update TBCST_COFINS Set
          Descricao   = :Descricao
        , Indice_acbr = :Indice_acbr
      where Codigo = :Codigo;

    end 

  end 
end^

SET TERM ; ^

GRANT EXECUTE ON PROCEDURE SET_CST_COFINS TO "PUBLIC";
