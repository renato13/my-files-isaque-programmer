
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

      -- Gerar histÛrico
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
'CÛdigo.';

COMMENT ON COLUMN TBSEGMENTO.SEG_DESCRICAO IS
'DescriÁ„o.';



COMMENT ON TABLE TBSEGMENTO IS 'Tabela de Segmentos.
    
    Autor   :   Isaque Marinho Ribeiro
    Data    :   07/11/2012

Tabela respons·vel por armazenar os cÛdigos e descriÁıes dos segmentos que a empresa poder· assumir.';

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
'DescriÁ„o.';

COMMENT ON COLUMN TBPRODUTO.APRESENTACAO IS
'ApresentaÁ„o.';

COMMENT ON COLUMN TBPRODUTO.DESCRI_APRESENTACAO IS
'Campo Calculado = DescriÁ„o + ApresentaÁ„o.';

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
  , 'CrÈdito' as TIPO_DESC
from TBEMPRESA

union

Select First 1
    'D' as TIPO
  , 'DÈbito' as TIPO_DESC
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


ALTER TABLE TBPRODUTO
    ADD CST_PIS DMN_VCHAR_03 DEFAULT '99',
    ADD CST_COFINS DMN_VCHAR_03 DEFAULT '99';

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
alter CST_PIS position 23;

alter table TBPRODUTO
alter CST_COFINS position 24;

alter table TBPRODUTO
alter NCM_SH position 25;

alter table TBPRODUTO
alter CODCFOP position 26;

alter table TBPRODUTO
alter CODBARRA_EAN position 27;

alter table TBPRODUTO
alter CODUNIDADE position 28;

alter table TBPRODUTO
alter ALIQUOTA_TIPO position 29;

alter table TBPRODUTO
alter ALIQUOTA position 30;

alter table TBPRODUTO
alter ALIQUOTA_CSOSN position 31;

alter table TBPRODUTO
alter VALOR_IPI position 32;

alter table TBPRODUTO
alter RESERVA position 33;

alter table TBPRODUTO
alter PRODUTO_NOVO position 34;

alter table TBPRODUTO
alter COR_VEICULO position 35;

alter table TBPRODUTO
alter COMBUSTIVEL_VEICULO position 36;

alter table TBPRODUTO
alter TIPO_VEICULO position 37;

alter table TBPRODUTO
alter ANO_MODELO_VEICULO position 38;

alter table TBPRODUTO
alter ANO_FABRICACAO_VEICULO position 39;

alter table TBPRODUTO
alter RENAVAM_VEICULO position 40;

alter table TBPRODUTO
alter CHASSI_VEICULO position 41;

alter table TBPRODUTO
alter KILOMETRAGEM_VEICULO position 42;

alter table TBPRODUTO
alter SITUACAO_ATUAL_VEICULO position 43;

alter table TBPRODUTO
alter SITUACAO_HISTORICO_VEICULO position 44;

alter table TBPRODUTO
alter PERCENTUAL_REDUCAO_BC position 45;



ALTER TABLE TBPRODUTO
    ADD ALIQUOTA_PIS DECIMAL(15,2) DEFAULT 0,
    ADD ALIQUOTA_COFINS DECIMAL(15,2) DEFAULT 0;

COMMENT ON COLUMN TBPRODUTO.CST_PIS IS
'Codigo de Situacao Tributaria PIS.';

COMMENT ON COLUMN TBPRODUTO.CST_COFINS IS
'Codigo de Situacao Tributaria COFINS.';

COMMENT ON COLUMN TBPRODUTO.ALIQUOTA_PIS IS
'Aliquota PIS.';

COMMENT ON COLUMN TBPRODUTO.ALIQUOTA_COFINS IS
'Aliquota COFINS.';

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
alter CST_PIS position 23;

alter table TBPRODUTO
alter CST_COFINS position 24;

alter table TBPRODUTO
alter NCM_SH position 25;

alter table TBPRODUTO
alter CODCFOP position 26;

alter table TBPRODUTO
alter CODBARRA_EAN position 27;

alter table TBPRODUTO
alter CODUNIDADE position 28;

alter table TBPRODUTO
alter ALIQUOTA_TIPO position 29;

alter table TBPRODUTO
alter ALIQUOTA position 30;

alter table TBPRODUTO
alter ALIQUOTA_CSOSN position 31;

alter table TBPRODUTO
alter ALIQUOTA_PIS position 32;

alter table TBPRODUTO
alter ALIQUOTA_COFINS position 33;

alter table TBPRODUTO
alter VALOR_IPI position 34;

alter table TBPRODUTO
alter RESERVA position 35;

alter table TBPRODUTO
alter PRODUTO_NOVO position 36;

alter table TBPRODUTO
alter COR_VEICULO position 37;

alter table TBPRODUTO
alter COMBUSTIVEL_VEICULO position 38;

alter table TBPRODUTO
alter TIPO_VEICULO position 39;

alter table TBPRODUTO
alter ANO_MODELO_VEICULO position 40;

alter table TBPRODUTO
alter ANO_FABRICACAO_VEICULO position 41;

alter table TBPRODUTO
alter RENAVAM_VEICULO position 42;

alter table TBPRODUTO
alter CHASSI_VEICULO position 43;

alter table TBPRODUTO
alter KILOMETRAGEM_VEICULO position 44;

alter table TBPRODUTO
alter SITUACAO_ATUAL_VEICULO position 45;

alter table TBPRODUTO
alter SITUACAO_HISTORICO_VEICULO position 46;

alter table TBPRODUTO
alter PERCENTUAL_REDUCAO_BC position 47;


/*------ SYSDBA 10/12/2012 17:27:29 --------*/

Update TBPRODUTO x Set
    x.Cst_pis    = '99'
  , x.Cst_cofins = '99'
  , x.Aliquota_pis   = 0.0
  , x.Aliquota_cofins = 0.0
where x.Cst_pis is null;
COMMIT WORK;


create view new_view (
    Codigo
  , Descricao_FULL
  , Descricao
  , Indice_acbr)
as
Select
    p.Codigo
  , p.Codigo || ' - ' || p.Descricao as Descricao_FULL
  , p.Descricao
  , p.Indice_acbr
from TBCST_PIS p
order by
    2
;

GRANT ALL ON NEW_VIEW TO "PUBLIC";


create view vw_aliquota_pis (
    Codigo
  , Descricao_FULL
  , Descricao
  , Indice_acbr)
as
Select
    p.Codigo
  , p.Codigo || ' - ' || p.Descricao as Descricao_FULL
  , p.Descricao
  , p.Indice_acbr
from TBCST_PIS p
order by
    2
;

GRANT ALL ON VW_ALIQUOTA_PIS TO "PUBLIC";


DROP VIEW NEW_VIEW;



CREATE VIEW VW_ALIQUOTA_COFINS (
    CODIGO,
    DESCRICAO_FULL,
    DESCRICAO,
    INDICE_ACBR)
AS
Select
    p.Codigo
  , p.Codigo || ' - ' || p.Descricao as Descricao_FULL
  , p.Descricao
  , p.Indice_acbr
from TBCST_COFINS p
order by
    2
;

GRANT ALL ON VW_ALIQUOTA_COFINS TO "PUBLIC";


ALTER TABLE TVENDASITENS
    ADD ALIQUOTA_PIS DECIMAL(15,2) DEFAULT 0,
    ADD ALIQUOTA_COFINS DECIMAL(15,2) DEFAULT 0;

COMMENT ON COLUMN TVENDASITENS.ALIQUOTA_PIS IS
'Percentual Aliquota PIS.';

COMMENT ON COLUMN TVENDASITENS.ALIQUOTA_COFINS IS
'Percentual Aliquota COFINS.';

alter table TVENDASITENS
alter ANO position 1;

alter table TVENDASITENS
alter CODCONTROL position 2;

alter table TVENDASITENS
alter SEQ position 3;

alter table TVENDASITENS
alter CODPROD position 4;

alter table TVENDASITENS
alter CODEMP position 5;

alter table TVENDASITENS
alter CODCLI position 6;

alter table TVENDASITENS
alter DTVENDA position 7;

alter table TVENDASITENS
alter QTDE position 8;

alter table TVENDASITENS
alter PUNIT position 9;

alter table TVENDASITENS
alter PUNIT_PROMOCAO position 10;

alter table TVENDASITENS
alter DESCONTO position 11;

alter table TVENDASITENS
alter DESCONTO_VALOR position 12;

alter table TVENDASITENS
alter PFINAL position 13;

alter table TVENDASITENS
alter QTDEFINAL position 14;

alter table TVENDASITENS
alter UNID_COD position 15;

alter table TVENDASITENS
alter CFOP_COD position 16;

alter table TVENDASITENS
alter ALIQUOTA position 17;

alter table TVENDASITENS
alter ALIQUOTA_CSOSN position 18;

alter table TVENDASITENS
alter ALIQUOTA_PIS position 19;

alter table TVENDASITENS
alter ALIQUOTA_COFINS position 20;

alter table TVENDASITENS
alter VALOR_IPI position 21;

alter table TVENDASITENS
alter PERCENTUAL_REDUCAO_BC position 22;



CREATE TABLE TBVENDAS_FORMAPAGTO (
    ANO_VENDA          DMN_SMALLINT_NN NOT NULL /* DMN_SMALLINT_NN = SMALLINT DEFAULT 0 */,
    CONTROLE_VENDA     DMN_INTEGER_NN NOT NULL /* DMN_INTEGER_NN = INTEGER NOT NULL */,
    FORMAPAGTO_COD     DMN_SMALLINT_NN NOT NULL /* DMN_SMALLINT_NN = SMALLINT DEFAULT 0 */,
    CONDICAOPAGTO_COD  SMALLINT,
    VENDA_PRAZO        DMN_LOGICO /* DMN_LOGICO = SMALLINT DEFAULT 0 NOT NULL CHECK (value between 0 and 1) */,
    VALOR_FPAGTO       DMN_MONEY /* DMN_MONEY = NUMERIC(15,2) */,
    PRAZO_01           SMALLINT,
    PRAZO_02           SMALLINT,
    PRAZO_03           SMALLINT,
    PRAZO_04           SMALLINT,
    PRAZO_05           SMALLINT,
    PRAZO_06           SMALLINT,
    PRAZO_07           SMALLINT,
    PRAZO_08           SMALLINT,
    PRAZO_09           SMALLINT,
    PRAZO_10           SMALLINT,
    PRAZO_11           SMALLINT,
    PRAZO_12           SMALLINT
);




/******************************************************************************/
/***                              Primary Keys                              ***/
/******************************************************************************/

ALTER TABLE TBVENDAS_FORMAPAGTO ADD CONSTRAINT PK_TBVENDAS_FORMAPAGTO PRIMARY KEY (ANO_VENDA, CONTROLE_VENDA, FORMAPAGTO_COD);


/******************************************************************************/
/***                              Foreign Keys                              ***/
/******************************************************************************/

ALTER TABLE TBVENDAS_FORMAPAGTO ADD CONSTRAINT FK_TBVENDAS_FORMAPAGTO FOREIGN KEY (ANO_VENDA, CONTROLE_VENDA) REFERENCES TBVENDAS (ANO, CODCONTROL) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE TBVENDAS_FORMAPAGTO ADD CONSTRAINT FK_TBVENDAS_FORMAPAGTO_CPG FOREIGN KEY (CONDICAOPAGTO_COD) REFERENCES TBCONDICAOPAGTO (COND_COD);
ALTER TABLE TBVENDAS_FORMAPAGTO ADD CONSTRAINT FK_TBVENDAS_FORMAPAGTO_FPG FOREIGN KEY (FORMAPAGTO_COD) REFERENCES TBFORMPAGTO (COD);


/******************************************************************************/
/***                          Fields descriptions                           ***/
/******************************************************************************/

COMMENT ON COLUMN TBVENDAS_FORMAPAGTO.ANO_VENDA IS 
'Ano.';

COMMENT ON COLUMN TBVENDAS_FORMAPAGTO.CONTROLE_VENDA IS 
'Nro. de Controle.';

COMMENT ON COLUMN TBVENDAS_FORMAPAGTO.FORMAPAGTO_COD IS 
'Forma de Pagamento.';

COMMENT ON COLUMN TBVENDAS_FORMAPAGTO.CONDICAOPAGTO_COD IS 
'Condicao de Pagamento.';

COMMENT ON COLUMN TBVENDAS_FORMAPAGTO.VENDA_PRAZO IS 
'Venda a Prazo:
0 - Nao
1 - Sim';

COMMENT ON COLUMN TBVENDAS_FORMAPAGTO.VALOR_FPAGTO IS 
'Valor A Pagar.';



/******************************************************************************/
/***                               Privileges                               ***/
/******************************************************************************/


/* Privileges of users */
GRANT ALL ON TBVENDAS_FORMAPAGTO TO PUBLIC;




/*------ SYSDBA 26/12/2012 22:45:31 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure SET_GERAR_TITULOS (
    ANOVENDA smallint,
    NUMVENDA integer)
returns (
    CLIENTE varchar(18),
    PARCELAS smallint,
    VALOR_TOTAL numeric(15,2),
    PARCELA smallint,
    EMISSAO date,
    VENCIMENTO date,
    VALOR_DOCUMENTO numeric(15,2),
    FORMA_PAGTO smallint,
    DATA_FINALIZ_VENDA date,
    ANO_LANC smallint,
    NUM_LANC integer)
as
declare variable P01 smallint;
declare variable P02 smallint;
declare variable P03 smallint;
declare variable P04 smallint;
declare variable P05 smallint;
declare variable P06 smallint;
declare variable P07 smallint;
declare variable P08 smallint;
declare variable P09 smallint;
declare variable P10 smallint;
declare variable P11 smallint;
declare variable P12 smallint;
declare variable VALOR_TOTAL_PARCELAS numeric(15,2);
begin
  for
    Select
        x.Codcli
      , coalesce(v.Prazo_01, 0)
      , v.Prazo_02
      , v.Prazo_03
      , v.Prazo_04
      , v.Prazo_05
      , v.Prazo_06
      , v.Prazo_07
      , v.Prazo_08
      , v.Prazo_09
      , v.Prazo_10
      , v.Prazo_11
      , v.Prazo_12
      , case when coalesce(v.Prazo_01, 0) is not null then 1 else 0 end +
        case when v.Prazo_02 is not null then 1 else 0 end +
        case when v.Prazo_03 is not null then 1 else 0 end +
        case when v.Prazo_04 is not null then 1 else 0 end +
        case when v.Prazo_05 is not null then 1 else 0 end +
        case when v.Prazo_06 is not null then 1 else 0 end +
        case when v.Prazo_07 is not null then 1 else 0 end +
        case when v.Prazo_08 is not null then 1 else 0 end +
        case when v.Prazo_09 is not null then 1 else 0 end +
        case when v.Prazo_10 is not null then 1 else 0 end +
        case when v.Prazo_11 is not null then 1 else 0 end +
        case when v.Prazo_12 is not null then 1 else 0 end as parcelas
      , v.valor_fpagto
      , v.Formapagto_cod
      , x.Dtfinalizacao_venda
    from TBVENDAS x
      inner join TBVENDAS_FORMAPAGTO v on (v.ano_venda = x.ano and v.controle_venda = x.codcontrol)
    where x.Ano        = :Anovenda
      and x.Codcontrol = :Numvenda
    into
        cliente
      , p01
      , p02
      , p03
      , p04
      , p05
      , p06
      , p07
      , p08
      , p09
      , p10
      , p11
      , p12
      , parcelas
      , valor_total
      , forma_pagto
      , data_finaliz_venda
  do
  begin

    parcela = 0;
    emissao = :Data_finaliz_venda;
    valor_documento = :Valor_total / :Parcelas;

    -- Parcela 1
    if ( :P01 is not null ) then
    begin
      if ( :P01 = 0 ) then
        parcela = 0;
      else
      if ( :P01 > 0 ) then
        parcela = 1;

      Select d.Dia_util from Get_dia_util(:Emissao, :P01) d into vencimento;

      Select
          t.Anolancamento
        , t.Numlancamento
      from SET_TITULO_RECEBER (
          :Anovenda
        , :Numvenda
        , :Cliente
        , :Forma_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela) t
      into
          Ano_lanc
        , Num_lanc;
    end

    -- Parcela 2
    if ( :P02 is not null ) then
    begin
      parcela = :Parcela + 1;

      Select d.Dia_util from Get_dia_util(:Emissao, :P02) d into vencimento;

      Select
          t.Anolancamento
        , t.Numlancamento
      from SET_TITULO_RECEBER (
          :Anovenda
        , :Numvenda
        , :Cliente
        , :Forma_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela) t
      into
          Ano_lanc
        , Num_lanc;
    end

    -- Parcela 3
    if ( :P03 is not null ) then
    begin
      parcela = :Parcela + 1;

      Select d.Dia_util from Get_dia_util(:Emissao, :P03) d into vencimento;

      Select
          t.Anolancamento
        , t.Numlancamento
      from SET_TITULO_RECEBER (
          :Anovenda
        , :Numvenda
        , :Cliente
        , :Forma_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela) t
      into
          Ano_lanc
        , Num_lanc;
    end

    -- Parcela 4
    if ( :P04 is not null ) then
    begin
      parcela = :Parcela + 1;

      Select d.Dia_util from Get_dia_util(:Emissao, :P04) d into vencimento;

      Select
          t.Anolancamento
        , t.Numlancamento
      from SET_TITULO_RECEBER (
          :Anovenda
        , :Numvenda
        , :Cliente
        , :Forma_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela) t
      into
          Ano_lanc
        , Num_lanc;
    end

    -- Parcela 5
    if ( :P05 is not null ) then
    begin
      parcela = :Parcela + 1;

      Select d.Dia_util from Get_dia_util(:Emissao, :P05) d into vencimento;

      Select
          t.Anolancamento
        , t.Numlancamento
      from SET_TITULO_RECEBER (
          :Anovenda
        , :Numvenda
        , :Cliente
        , :Forma_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela) t
      into
          Ano_lanc
        , Num_lanc;
    end

    -- Parcela 6
    if ( :P06 is not null ) then
    begin
      parcela = :Parcela + 1;

      Select d.Dia_util from Get_dia_util(:Emissao, :P06) d into vencimento;

      Select
          t.Anolancamento
        , t.Numlancamento
      from SET_TITULO_RECEBER (
          :Anovenda
        , :Numvenda
        , :Cliente
        , :Forma_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela) t
      into
          Ano_lanc
        , Num_lanc;
    end

    -- Parcela 7
    if ( :P07 is not null ) then
    begin
      parcela = :Parcela + 1;

      Select d.Dia_util from Get_dia_util(:Emissao, :P07) d into vencimento;

      Select
          t.Anolancamento
        , t.Numlancamento
      from SET_TITULO_RECEBER (
          :Anovenda
        , :Numvenda
        , :Cliente
        , :Forma_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela) t
      into
          Ano_lanc
        , Num_lanc;
    end

    -- Parcela 8
    if ( :P08 is not null ) then
    begin
      parcela = :Parcela + 1;

      Select d.Dia_util from Get_dia_util(:Emissao, :P08) d into vencimento;

      Select
          t.Anolancamento
        , t.Numlancamento
      from SET_TITULO_RECEBER (
          :Anovenda
        , :Numvenda
        , :Cliente
        , :Forma_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela) t
      into
          Ano_lanc
        , Num_lanc;
    end

    -- Parcela 9
    if ( :P09 is not null ) then
    begin
      parcela = :Parcela + 1;

      Select d.Dia_util from Get_dia_util(:Emissao, :P09) d into vencimento;

      Select
          t.Anolancamento
        , t.Numlancamento
      from SET_TITULO_RECEBER (
          :Anovenda
        , :Numvenda
        , :Cliente
        , :Forma_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela) t
      into
          Ano_lanc
        , Num_lanc;
    end

    -- Parcela 10
    if ( :P10 is not null ) then
    begin
      parcela = :Parcela + 1;

      Select d.Dia_util from Get_dia_util(:Emissao, :P10) d into vencimento;

      Select
          t.Anolancamento
        , t.Numlancamento
      from SET_TITULO_RECEBER (
          :Anovenda
        , :Numvenda
        , :Cliente
        , :Forma_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela) t
      into
          Ano_lanc
        , Num_lanc;
    end

    -- Parcela 11
    if ( :P11 is not null ) then
    begin
      parcela = :Parcela + 1;

      Select d.Dia_util from Get_dia_util(:Emissao, :P11) d into vencimento;

      Select
          t.Anolancamento
        , t.Numlancamento
      from SET_TITULO_RECEBER (
          :Anovenda
        , :Numvenda
        , :Cliente
        , :Forma_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela) t
      into
          Ano_lanc
        , Num_lanc;
    end

    -- Parcela 12
    if ( :P12 is not null ) then
    begin
      parcela = :Parcela + 1;

      Select d.Dia_util from Get_dia_util(:Emissao, :P12) d into vencimento;

      Select
          t.Anolancamento
        , t.Numlancamento
      from SET_TITULO_RECEBER (
          :Anovenda
        , :Numvenda
        , :Cliente
        , :Forma_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela) t
      into
          Ano_lanc
        , Num_lanc;
    end

    -- Verificar ao valor total das parcelas
    if ( :Parcelas > 1 ) then
    begin
      Select
          sum( coalesce(r.Valorrec, 0) )
      from TBCONTREC r
      where r.Anovenda = :Anovenda
        and r.Numvenda = :Numvenda
        and r.forma_pagto = :forma_pagto
      into
          valor_total_parcelas;

      -- Atualizar o valor da ultima parcela
      if ( :Valor_total_parcelas < :Valor_total ) then
      begin
        Update TBCONTREC r Set
            r.Valorrec = :Valor_documento + (:Valor_total - :Valor_total_parcelas)
        where r.Anovenda = :Anovenda
          and r.Numvenda = :Numvenda
          and r.forma_pagto = :forma_pagto
          and r.Parcela  = :Parcela;
      end 
    end 

  end
end
^

SET TERM ; ^


/*!!! Error occured !!!
Invalid token.
Dynamic SQL Error.
SQL error code = -104.
Invalid expression in the ORDER BY clause (not contained in either an aggregate function or the GROUP BY clause).

*/

/*!!! Error occured !!!
Invalid token.
Dynamic SQL Error.
SQL error code = -104.
Invalid expression in the ORDER BY clause (not contained in either an aggregate function or the GROUP BY clause).

*/

/*!!! Error occured !!!
Invalid token.
Dynamic SQL Error.
SQL error code = -104.
Invalid expression in the ORDER BY clause (not contained in either an aggregate function or the GROUP BY clause).

*/

/*!!! Error occured !!!
Invalid token.
Dynamic SQL Error.
SQL error code = -104.
Invalid expression in the ORDER BY clause (not contained in either an aggregate function or the GROUP BY clause).

*/

/*!!! Error occured !!!
Invalid token.
Dynamic SQL Error.
SQL error code = -104.
Invalid expression in the ORDER BY clause (not contained in either an aggregate function or the GROUP BY clause).

*/

/*!!! Error occured !!!
Invalid token.
Dynamic SQL Error.
SQL error code = -104.
Invalid expression in the ORDER BY clause (not contained in either an aggregate function or the GROUP BY clause).

*/

/*!!! Error occured !!!
Invalid token.
Dynamic SQL Error.
SQL error code = -104.
Invalid expression in the ORDER BY clause (not contained in either an aggregate function or the GROUP BY clause).

*/

/*!!! Error occured !!!
Invalid token.
Dynamic SQL Error.
SQL error code = -104.
Invalid expression in the ORDER BY clause (not contained in either an aggregate function or the GROUP BY clause).

*/

/*!!! Error occured !!!
Invalid token.
Dynamic SQL Error.
SQL error code = -104.
Invalid expression in the ORDER BY clause (not contained in either an aggregate function or the GROUP BY clause).

*/

/*!!! Error occured !!!
Invalid token.
Dynamic SQL Error.
SQL error code = -104.
Invalid expression in the ORDER BY clause (not contained in either an aggregate function or the GROUP BY clause).

*/

/*!!! Error occured !!!
Invalid token.
Dynamic SQL Error.
SQL error code = -104.
Invalid expression in the ORDER BY clause (not contained in either an aggregate function or the GROUP BY clause).

*/



/*------ SYSDBA 07/01/2013 12:34:21 --------*/

SET TERM ^ ;

create or alter procedure SET_CAIXA_MOVIMENTO_ESTORNO_PAG (
    USUARIO varchar(12),
    DATA_PAGTO timestamp,
    FORMA_PAGTO smallint,
    ANOLANC smallint,
    NUMLANC integer,
    SEQ smallint,
    VALOR_BAIXA numeric(18,2))
as
declare variable EMPRESA varchar(18);
declare variable FORNECEDOR integer;
declare variable ANO_CAIXA smallint;
declare variable NUM_CAIXA integer;
declare variable CCR_CAIXA integer;
declare variable HISTORICO varchar(250);
declare variable ANO_COMPRA smallint;
declare variable NUM_COMPRA integer;
begin
  -- Buscar Numero do Caixa Aberto
  Select
      cx.Ano_caixa
    , cx.Num_caixa
    , cx.Conta_corrente
  from GET_CAIXA_ABERTO(:Usuario, :Data_pagto, :Forma_pagto) cx
  into
      Ano_caixa
    , Num_caixa
    , Ccr_caixa;

  -- Montar Historico
  Select
      cc.Codemp
    , cc.Codforn
    , 'COMPRA No. ' || r.Anocompra || '/' || r.Numcompra || ' - ' || f.Nomeforn
    , r.Anocompra
    , r.Numcompra
  from TBCONTPAG r
    left join TBFORNECEDOR f on (f.Codforn = r.Codforn)
    left join TBCOMPRAS cc on (cc.Ano = r.Anocompra and cc.Codcontrol = r.Numcompra)
  where r.Anolanc = :Anolanc
    and r.Numlanc = :Numlanc
  into
      Empresa
    , Fornecedor
    , Historico
    , Ano_compra
    , Num_compra;

  Historico = coalesce(:Historico, 'ESTORNO DO PAGTO. DA DUPLICATA No. ' || :Anolanc || '/' || :Numlanc || ' P' || :Seq);

  -- Inserir Movimento Caixa
  Insert Into TBCAIXA_MOVIMENTO (
      Ano
    , Numero
    , Caixa_ano
    , Caixa_num
    , Conta_corrente
    , Forma_pagto
    , Datahora
    , Tipo
    , Historico
    , Valor
    , Situacao
    , Venda_ano
    , Venda_num
    , Cliente
    , Compra_ano
    , Compra_num
    , Empresa
    , Fornecedor
    , Usuario
    , Apagar_ano
    , Apagar_num
  ) values (
      Extract(Year from :Data_pagto)
    , Null
    , :Ano_caixa
    , :Num_caixa
    , :Ccr_caixa
    , :Forma_pagto
    , :Data_pagto
    , 'C'
    , :Historico
    , :Valor_baixa
    , 1
    , Null
    , Null
    , Null
    , :Ano_compra
    , :Num_compra
    , :Empresa
    , :Fornecedor
    , :Usuario
    , :Anolanc
    , :Numlanc
  );

end
^

SET TERM ; ^




/*------ SYSDBA 07/01/2013 12:34:45 --------*/

SET TERM ^ ;

create or alter procedure SET_CAIXA_MOVIMENTO_PAG_ESTORNO (
    USUARIO varchar(12),
    DATA_PAGTO timestamp,
    FORMA_PAGTO smallint,
    ANOLANC smallint,
    NUMLANC integer,
    SEQ smallint,
    VALOR_BAIXA numeric(18,2))
as
declare variable EMPRESA varchar(18);
declare variable FORNECEDOR integer;
declare variable ANO_CAIXA smallint;
declare variable NUM_CAIXA integer;
declare variable CCR_CAIXA integer;
declare variable HISTORICO varchar(250);
declare variable ANO_COMPRA smallint;
declare variable NUM_COMPRA integer;
begin
  -- Buscar Numero do Caixa Aberto
  Select
      cx.Ano_caixa
    , cx.Num_caixa
    , cx.Conta_corrente
  from GET_CAIXA_ABERTO(:Usuario, :Data_pagto, :Forma_pagto) cx
  into
      Ano_caixa
    , Num_caixa
    , Ccr_caixa;

  -- Montar Historico
  Select
      cc.Codemp
    , cc.Codforn
    , 'COMPRA No. ' || r.Anocompra || '/' || r.Numcompra || ' - ' || f.Nomeforn
    , r.Anocompra
    , r.Numcompra
  from TBCONTPAG r
    left join TBFORNECEDOR f on (f.Codforn = r.Codforn)
    left join TBCOMPRAS cc on (cc.Ano = r.Anocompra and cc.Codcontrol = r.Numcompra)
  where r.Anolanc = :Anolanc
    and r.Numlanc = :Numlanc
  into
      Empresa
    , Fornecedor
    , Historico
    , Ano_compra
    , Num_compra;

  Historico = coalesce(:Historico, 'ESTORNO DO PAGTO. DA DUPLICATA No. ' || :Anolanc || '/' || :Numlanc || ' P' || :Seq);

  -- Inserir Movimento Caixa
  Insert Into TBCAIXA_MOVIMENTO (
      Ano
    , Numero
    , Caixa_ano
    , Caixa_num
    , Conta_corrente
    , Forma_pagto
    , Datahora
    , Tipo
    , Historico
    , Valor
    , Situacao
    , Venda_ano
    , Venda_num
    , Cliente
    , Compra_ano
    , Compra_num
    , Empresa
    , Fornecedor
    , Usuario
    , Apagar_ano
    , Apagar_num
  ) values (
      Extract(Year from :Data_pagto)
    , Null
    , :Ano_caixa
    , :Num_caixa
    , :Ccr_caixa
    , :Forma_pagto
    , :Data_pagto
    , 'C'
    , :Historico
    , :Valor_baixa
    , 1
    , Null
    , Null
    , Null
    , :Ano_compra
    , :Num_compra
    , :Empresa
    , :Fornecedor
    , :Usuario
    , :Anolanc
    , :Numlanc
  );

end
^

SET TERM ; ^




/*------ SYSDBA 07/01/2013 12:34:51 --------*/

DROP PROCEDURE SET_CAIXA_MOVIMENTO_ESTORNO_PAG;




/*------ SYSDBA 07/01/2013 12:35:28 --------*/

SET TERM ^ ;

create or alter procedure SET_CAIXA_MOVIMENTO_REC_ESTORNO (
    USUARIO varchar(12),
    DATA_PAGTO timestamp,
    FORMA_PAGTO smallint,
    ANOLANC smallint,
    NUMLANC integer,
    SEQ smallint,
    VALOR_BAIXA numeric(18,2))
as
declare variable EMPRESA varchar(18);
declare variable CLIENTE varchar(18);
declare variable ANO_CAIXA smallint;
declare variable NUM_CAIXA integer;
declare variable CCR_CAIXA integer;
declare variable HISTORICO varchar(250);
declare variable ANO_VENDA smallint;
declare variable NUM_VENDA integer;
begin
  -- Buscar Numero do Caixa Aberto
  Select
      cx.Ano_caixa
    , cx.Num_caixa
    , cx.Conta_corrente
  from GET_CAIXA_ABERTO(:Usuario, :Data_pagto, :Forma_pagto) cx
  into
      Ano_caixa
    , Num_caixa
    , Ccr_caixa;

  -- Montar Historico
  Select
      v.Codemp
    , r.Cnpj
    , 'VENDA No. ' || r.Anovenda || '/' || r.Numvenda || ' - ' || c.Nome
    , r.Anovenda
    , r.Numvenda
  from TBCONTREC r
    left join TBCLIENTE c on (c.Cnpj = r.Cnpj)
    left join TBVENDAS v on (v.Ano = r.Anovenda and v.Codcontrol = r.Numvenda)
  where r.Anolanc = :Anolanc
    and r.Numlanc = :Numlanc
  into
      Empresa
    , Cliente
    , Historico
    , Ano_venda
    , Num_venda;

  Historico = coalesce(:Historico, 'ESTORNO DO RECEBIMENTO DO TITULO No. ' || :Anolanc || '/' || :Numlanc || ' P' || :Seq);

  -- Inserir Movimento Caixa
  Insert Into TBCAIXA_MOVIMENTO (
      Ano
    , Numero
    , Caixa_ano
    , Caixa_num
    , Conta_corrente
    , Forma_pagto
    , Datahora
    , Tipo
    , Historico
    , Valor
    , Situacao
    , Venda_ano
    , Venda_num
    , Cliente
    , Compra_ano
    , Compra_num
    , Empresa
    , Fornecedor
    , Usuario
    , Areceber_ano
    , Areceber_num
  ) values (
      Extract(Year from :Data_pagto)
    , Null
    , :Ano_caixa
    , :Num_caixa
    , :Ccr_caixa
    , :Forma_pagto
    , :Data_pagto
    , 'D'
    , :Historico
    , :Valor_baixa
    , 1
    , :Ano_venda
    , :Num_venda
    , :Cliente
    , Null
    , Null
    , :Empresa
    , Null
    , :Usuario
    , :Anolanc
    , :Numlanc
  );

end
^

SET TERM ; ^



/*------ 07/01/2013 21:10:33 --------*/

ALTER TABLE TBCLIENTE DROP DTCAD;

/*------ 07/01/2013 21:10:33 --------*/

ALTER TABLE TBCLIENTE
    ADD DTCAD DMN_DATE_NN;

/*------ 07/01/2013 21:10:33 --------*/

ALTER TABLE TBCLIENTE
    ADD VENDEDOR_COD INTEGER;

/*------ 07/01/2013 21:10:33 --------*/

ALTER TABLE TBCLIENTE
ADD CONSTRAINT FK_TBCLIENTE_VENDEDOR
FOREIGN KEY (VENDEDOR_COD)
REFERENCES TBVENDEDOR(COD);

/*------ 07/01/2013 21:10:33 --------*/

ALTER TABLE TBCLIENTE
    ADD FONECEL DMN_FONERSD,
    ADD FONECOMERC DMN_FONERSD;

/*------ 07/01/2013 21:10:33 --------*/

ALTER TABLE TBEMPRESA
    ADD FONE2 DMN_FONERSD;

/*------ 07/01/2013 21:10:33 --------*/

alter table TBEMPRESA
alter CODIGO position 1;

/*------ 07/01/2013 21:10:33 --------*/

alter table TBEMPRESA
alter PESSOA_FISICA position 2;

/*------ 07/01/2013 21:10:33 --------*/

alter table TBEMPRESA
alter CNPJ position 3;

/*------ 07/01/2013 21:10:33 --------*/

alter table TBEMPRESA
alter RZSOC position 4;

/*------ 07/01/2013 21:10:33 --------*/

alter table TBEMPRESA
alter NMFANT position 5;

/*------ 07/01/2013 21:10:33 --------*/

alter table TBEMPRESA
alter IE position 6;

/*------ 07/01/2013 21:10:33 --------*/

alter table TBEMPRESA
alter IM position 7;

/*------ 07/01/2013 21:10:33 --------*/

alter table TBEMPRESA
alter SEGMENTO position 8;

/*------ 07/01/2013 21:10:33 --------*/

alter table TBEMPRESA
alter CNAE position 9;

/*------ 07/01/2013 21:10:33 --------*/

alter table TBEMPRESA
alter ENDER position 10;

/*------ 07/01/2013 21:10:33 --------*/

alter table TBEMPRESA
alter COMPLEMENTO position 11;

/*------ 07/01/2013 21:10:33 --------*/

alter table TBEMPRESA
alter BAIRRO position 12;

/*------ 07/01/2013 21:10:33 --------*/

alter table TBEMPRESA
alter CEP position 13;

/*------ 07/01/2013 21:10:33 --------*/

alter table TBEMPRESA
alter CIDADE position 14;

/*------ 07/01/2013 21:10:33 --------*/

alter table TBEMPRESA
alter UF position 15;

/*------ 07/01/2013 21:10:33 --------*/

alter table TBEMPRESA
alter FONE position 16;

/*------ 07/01/2013 21:10:33 --------*/

alter table TBEMPRESA
alter FONE2 position 17;

/*------ 07/01/2013 21:10:33 --------*/

alter table TBEMPRESA
alter LOGO position 18;

/*------ 07/01/2013 21:10:33 --------*/

alter table TBEMPRESA
alter TLG_TIPO position 19;

/*------ 07/01/2013 21:10:33 --------*/

alter table TBEMPRESA
alter LOG_COD position 20;

/*------ 07/01/2013 21:10:33 --------*/

alter table TBEMPRESA
alter BAI_COD position 21;

/*------ 07/01/2013 21:10:33 --------*/

alter table TBEMPRESA
alter CID_COD position 22;

/*------ 07/01/2013 21:10:33 --------*/

alter table TBEMPRESA
alter EST_COD position 23;

/*------ 07/01/2013 21:10:33 --------*/

alter table TBEMPRESA
alter NUMERO_END position 24;

/*------ 07/01/2013 21:10:33 --------*/

alter table TBEMPRESA
alter EMAIL position 25;

/*------ 07/01/2013 21:10:33 --------*/

alter table TBEMPRESA
alter HOME_PAGE position 26;

/*------ 07/01/2013 21:10:33 --------*/

alter table TBEMPRESA
alter CHAVE_ACESSO_NFE position 27;

/*------ 07/01/2013 21:10:33 --------*/

alter table TBEMPRESA
alter PAIS_ID position 28;

/*------ 07/01/2013 21:10:33 --------*/

alter table TBEMPRESA
alter TIPO_REGIME_NFE position 29;

/*------ 07/01/2013 21:10:33 --------*/

alter table TBEMPRESA
alter SERIE_NFE position 30;

/*------ 07/01/2013 21:10:33 --------*/

alter table TBEMPRESA
alter NUMERO_NFE position 31;

/*------ 07/01/2013 21:10:33 --------*/

alter table TBEMPRESA
alter LOTE_ANO_NFE position 32;

/*------ 07/01/2013 21:10:33 --------*/

alter table TBEMPRESA
alter LOTE_NUM_NFE position 33;


/*------ SYSDBA 07/01/2013 21:11:44 --------*/

COMMENT ON COLUMN TBEMPRESA.FONE IS
'Telefone 1.';




/*------ SYSDBA 07/01/2013 21:11:50 --------*/

COMMENT ON COLUMN TBEMPRESA.FONE2 IS
'Telefone 1.';




/*------ SYSDBA 07/01/2013 21:12:16 --------*/

COMMENT ON COLUMN TBCLIENTE.VENDEDOR_COD IS
'Vendedor responsavel pelo cliente.';




/*------ SYSDBA 07/01/2013 21:12:31 --------*/

alter table TBCLIENTE
alter column CODIGO position 1;


/*------ SYSDBA 07/01/2013 21:12:31 --------*/

alter table TBCLIENTE
alter column PESSOA_FISICA position 2;


/*------ SYSDBA 07/01/2013 21:12:31 --------*/

alter table TBCLIENTE
alter column CNPJ position 3;


/*------ SYSDBA 07/01/2013 21:12:31 --------*/

alter table TBCLIENTE
alter column NOME position 4;


/*------ SYSDBA 07/01/2013 21:12:31 --------*/

alter table TBCLIENTE
alter column INSCEST position 5;


/*------ SYSDBA 07/01/2013 21:12:31 --------*/

alter table TBCLIENTE
alter column INSCMUN position 6;


/*------ SYSDBA 07/01/2013 21:12:31 --------*/

alter table TBCLIENTE
alter column ENDER position 7;


/*------ SYSDBA 07/01/2013 21:12:31 --------*/

alter table TBCLIENTE
alter column COMPLEMENTO position 8;


/*------ SYSDBA 07/01/2013 21:12:31 --------*/

alter table TBCLIENTE
alter column BAIRRO position 9;


/*------ SYSDBA 07/01/2013 21:12:31 --------*/

alter table TBCLIENTE
alter column CEP position 10;


/*------ SYSDBA 07/01/2013 21:12:31 --------*/

alter table TBCLIENTE
alter column CIDADE position 11;


/*------ SYSDBA 07/01/2013 21:12:31 --------*/

alter table TBCLIENTE
alter column UF position 12;


/*------ SYSDBA 07/01/2013 21:12:31 --------*/

alter table TBCLIENTE
alter column FONE position 13;


/*------ SYSDBA 07/01/2013 21:12:31 --------*/

alter table TBCLIENTE
alter column FONECEL position 14;


/*------ SYSDBA 07/01/2013 21:12:31 --------*/

alter table TBCLIENTE
alter column FONECOMERC position 15;


/*------ SYSDBA 07/01/2013 21:12:31 --------*/

alter table TBCLIENTE
alter column EMAIL position 16;


/*------ SYSDBA 07/01/2013 21:12:31 --------*/

alter table TBCLIENTE
alter column SITE position 17;


/*------ SYSDBA 07/01/2013 21:12:31 --------*/

alter table TBCLIENTE
alter column TLG_TIPO position 18;


/*------ SYSDBA 07/01/2013 21:12:31 --------*/

alter table TBCLIENTE
alter column LOG_COD position 19;


/*------ SYSDBA 07/01/2013 21:12:31 --------*/

alter table TBCLIENTE
alter column BAI_COD position 20;


/*------ SYSDBA 07/01/2013 21:12:31 --------*/

alter table TBCLIENTE
alter column CID_COD position 21;


/*------ SYSDBA 07/01/2013 21:12:31 --------*/

alter table TBCLIENTE
alter column EST_COD position 22;


/*------ SYSDBA 07/01/2013 21:12:31 --------*/

alter table TBCLIENTE
alter column NUMERO_END position 23;


/*------ SYSDBA 07/01/2013 21:12:31 --------*/

alter table TBCLIENTE
alter column PAIS_ID position 24;


/*------ SYSDBA 07/01/2013 21:12:31 --------*/

alter table TBCLIENTE
alter column VALOR_LIMITE_COMPRA position 25;


/*------ SYSDBA 07/01/2013 21:12:31 --------*/

alter table TBCLIENTE
alter column BLOQUEADO position 26;


/*------ SYSDBA 07/01/2013 21:12:31 --------*/

alter table TBCLIENTE
alter column BLOQUEADO_DATA position 27;


/*------ SYSDBA 07/01/2013 21:12:31 --------*/

alter table TBCLIENTE
alter column BLOQUEADO_MOTIVO position 28;


/*------ SYSDBA 07/01/2013 21:12:31 --------*/

alter table TBCLIENTE
alter column BLOQUEADO_USUARIO position 29;


/*------ SYSDBA 07/01/2013 21:12:31 --------*/

alter table TBCLIENTE
alter column DESBLOQUEADO_DATA position 30;


/*------ SYSDBA 07/01/2013 21:12:31 --------*/

alter table TBCLIENTE
alter column DTCAD position 31;


/*------ SYSDBA 07/01/2013 21:12:31 --------*/

alter table TBCLIENTE
alter column VENDEDOR_COD position 32;


/*------ SYSDBA 07/01/2013 21:12:42 --------*/

COMMENT ON COLUMN TBCLIENTE.FONE IS
'Telefone Fixo.';




/*------ SYSDBA 07/01/2013 21:12:49 --------*/

COMMENT ON COLUMN TBCLIENTE.FONECEL IS
'Telefone Celular.';




/*------ SYSDBA 07/01/2013 21:12:57 --------*/

COMMENT ON COLUMN TBCLIENTE.FONECOMERC IS
'Telefone Comercial.';

GRANT ALL ON VW_TIPO_MOVIMENTO_CAIXA TO "PUBLIC";


/*------ 07/01/2013 21:38:31 --------*/

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
end^

/*------ 07/01/2013 21:38:31 --------*/

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
end^

/*------ 07/01/2013 21:38:31 --------*/

SET TERM ; ^

SET TERM ^ ;

SET TERM ; ^

GRANT EXECUTE ON PROCEDURE GET_CAIXA_ABERTO_DETALHE TO "PUBLIC";

/*------ 07/01/2013 21:38:31 --------*/

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
end^

/*------ 07/01/2013 21:38:31 --------*/

SET TERM ; ^

COMMENT ON DOMAIN DMN_COMISSAO IS 'Percentual de comissao.';

/*------ 07/01/2013 21:38:31 --------*/

COMMENT ON COLUMN TBVENDEDOR.COMISSAO IS
'Percentual de comissao.';

/*------ 07/01/2013 21:38:31 --------*/

COMMENT ON COLUMN TBVENDAS.VENDA_PRAZO IS
'Venda A Prazo?
0 - Nao
1 - Sim';

/*------ 07/01/2013 21:38:31 --------*/

COMMENT ON COLUMN TBPRODUTO.ALIQUOTA_TIPO IS
'Tipo Aliquota:
0 - ICMS (Para Produtos)
1 - ISS  (Para Servicos)';

/*------ 07/01/2013 21:38:31 --------*/

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
end^

/*------ 07/01/2013 21:38:31 --------*/

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
end^

/*------ 07/01/2013 21:38:31 --------*/

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

      -- Gerar hist√≥rico
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
end^

/*------ 07/01/2013 21:38:31 --------*/

SET TERM ; ^

COMMENT ON COLUMN TBFABRICANTE.COD IS
'Codigo.';

/*------ 07/01/2013 21:38:31 --------*/

COMMENT ON COLUMN TBFABRICANTE.NOME IS
'Nome.';

/*------ 07/01/2013 21:38:31 --------*/

GRANT ALL ON TBFABRICANTE TO "PUBLIC";

/*------ 07/01/2013 21:38:31 --------*/

COMMENT ON COLUMN TBPRODUTO.CODFABRICANTE IS
'Fabricante.';

/*------ 07/01/2013 21:38:31 --------*/

alter table TBPRODUTO
alter CODIGO position 1;

/*------ 07/01/2013 21:38:31 --------*/

alter table TBPRODUTO
alter COD position 2;

/*------ 07/01/2013 21:38:31 --------*/

alter table TBPRODUTO
alter DESCRI position 3;

/*------ 07/01/2013 21:38:31 --------*/

alter table TBPRODUTO
alter MODELO position 4;

/*------ 07/01/2013 21:38:31 --------*/

alter table TBPRODUTO
alter PRECO position 5;

/*------ 07/01/2013 21:38:31 --------*/

alter table TBPRODUTO
alter PRECO_PROMOCAO position 6;

/*------ 07/01/2013 21:38:31 --------*/

alter table TBPRODUTO
alter REFERENCIA position 7;

/*------ 07/01/2013 21:38:31 --------*/

alter table TBPRODUTO
alter SECAO position 8;

/*------ 07/01/2013 21:38:31 --------*/

alter table TBPRODUTO
alter QTDE position 9;

/*------ 07/01/2013 21:38:31 --------*/

alter table TBPRODUTO
alter UNIDADE position 10;

/*------ 07/01/2013 21:38:31 --------*/

alter table TBPRODUTO
alter ESTOQMIN position 11;

/*------ 07/01/2013 21:38:31 --------*/

alter table TBPRODUTO
alter CODGRUPO position 12;

/*------ 07/01/2013 21:38:31 --------*/

alter table TBPRODUTO
alter CODFABRICANTE position 13;

/*------ 07/01/2013 21:38:31 --------*/

alter table TBPRODUTO
alter CUSTOMEDIO position 14;

/*------ 07/01/2013 21:38:31 --------*/

alter table TBPRODUTO
alter CODEMP position 15;

/*------ 07/01/2013 21:38:31 --------*/

alter table TBPRODUTO
alter CODSECAO position 16;

/*------ 07/01/2013 21:38:31 --------*/

alter table TBPRODUTO
alter CODORIGEM position 17;

/*------ 07/01/2013 21:38:31 --------*/

alter table TBPRODUTO
alter CODTRIBUTACAO position 18;

/*------ 07/01/2013 21:38:31 --------*/

alter table TBPRODUTO
alter CST position 19;

/*------ 07/01/2013 21:38:31 --------*/

alter table TBPRODUTO
alter CSOSN position 20;

/*------ 07/01/2013 21:38:31 --------*/

alter table TBPRODUTO
alter NCM_SH position 21;

/*------ 07/01/2013 21:38:31 --------*/

alter table TBPRODUTO
alter CODCFOP position 22;

/*------ 07/01/2013 21:38:31 --------*/

alter table TBPRODUTO
alter CODBARRA_EAN position 23;

/*------ 07/01/2013 21:38:31 --------*/

alter table TBPRODUTO
alter CODUNIDADE position 24;

/*------ 07/01/2013 21:38:31 --------*/

alter table TBPRODUTO
alter ALIQUOTA_TIPO position 25;

/*------ 07/01/2013 21:38:31 --------*/

alter table TBPRODUTO
alter ALIQUOTA position 26;

/*------ 07/01/2013 21:38:31 --------*/

alter table TBPRODUTO
alter ALIQUOTA_CSOSN position 27;

/*------ 07/01/2013 21:38:31 --------*/

alter table TBPRODUTO
alter VALOR_IPI position 28;

/*------ 07/01/2013 21:38:31 --------*/

alter table TBPRODUTO
alter RESERVA position 29;

/*------ 07/01/2013 21:38:31 --------*/

COMMENT ON COLUMN TBPRODUTO.ALIQUOTA IS
'Percencial da Aliquota.';

/*------ 07/01/2013 21:38:32 --------*/

COMMENT ON DOMAIN DMN_QUANTIDADE_D3 IS 'Quantidade

(Aceita valores decimais)';

/*------ 07/01/2013 21:38:32 --------*/

ALTER TABLE TBPRODUTO DROP CONSTRAINT FK_TBPRODUTO_FABRICANTE;

/*------ 07/01/2013 21:38:32 --------*/

alter table TBPRODUTO
add constraint FK_TBPRODUTO_FABRICANTE
foreign key (CODFABRICANTE)
references TBFABRICANTE(COD);

/*------ 07/01/2013 21:38:32 --------*/

CREATE SEQUENCE GEN_TBFABRICANTE_ID;

/*------ 07/01/2013 21:38:32 --------*/

SET TERM ^ ;

SET TERM ; ^

SET TERM ^ ;

CREATE OR ALTER Trigger Tg_fabricante_cod For Tbfabricante
Active Before Insert Position 0
AS
BEGIN
  IF (NEW.COD IS NULL) THEN
    NEW.COD = GEN_ID(GEN_FABRICANTE_ID, 1);
END^

/*------ 07/01/2013 21:38:32 --------*/

SET TERM ; ^

SET TERM ^ ;

CREATE OR ALTER Trigger Tg_fabricante_cod For Tbfabricante
Active Before Insert Position 0
AS
BEGIN
  IF (NEW.COD IS NULL) THEN
    NEW.COD = GEN_ID(GEN_FABRICANTE_ID, 1);
END^

/*------ 07/01/2013 21:38:32 --------*/

SET TERM ; ^

DROP SEQUENCE GEN_TBFABRICANTE_ID;

/*------ 07/01/2013 21:38:32 --------*/

COMMENT ON COLUMN TBCLIENTE.BLOQUEADO IS
'Bloqueado?
0 - Nao
1 - Sim';

/*------ 07/01/2013 21:38:32 --------*/

COMMENT ON COLUMN TBCLIENTE.BLOQUEADO_DATA IS
'Data do bloqueio.';

/*------ 07/01/2013 21:38:32 --------*/

COMMENT ON COLUMN TBCLIENTE.BLOQUEADO_MOTIVO IS
'Motivo do bloqueio.';

/*------ 07/01/2013 21:38:32 --------*/

COMMENT ON COLUMN TBCLIENTE.BLOQUEADO_USUARIO IS
'Usuario do bloqueio.';

/*------ 07/01/2013 21:38:32 --------*/

COMMENT ON COLUMN TBCLIENTE.DESBLOQUEADO_DATA IS
'Data de desbloqueio.';

/*------ 07/01/2013 21:38:32 --------*/

COMMENT ON COLUMN TBFORMPAGTO.DEBITAR_LIMITE_CLIENTE IS
'Forma de Pagamento DECREMENTA Limite de Credito do Cliente:
0 - Nao
1 - Sim';

/*------ 07/01/2013 21:38:32 --------*/

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
end^

/*------ 07/01/2013 21:38:32 --------*/

SET TERM ; ^

COMMENT ON COLUMN TBSEGMENTO.SEG_ID IS
'C√≥digo.';

/*------ 07/01/2013 21:38:32 --------*/

COMMENT ON COLUMN TBSEGMENTO.SEG_DESCRICAO IS
'Descri√ß√£o.';

/*------ 07/01/2013 21:38:32 --------*/

COMMENT ON TABLE TBSEGMENTO IS 'Tabela de Segmentos.
    
    Autor   :   Isaque Marinho Ribeiro
    Data    :   07/11/2012

Tabela respons√°vel por armazenar os c√≥digos e descri√ß√µes dos segmentos que a empresa poder√° assumir.';

/*------ 07/01/2013 21:38:32 --------*/

GRANT ALL ON TBSEGMENTO TO "PUBLIC";

/*------ 07/01/2013 21:38:32 --------*/

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

/*------ 07/01/2013 21:38:32 --------*/

SET TERM ; ^

GRANT EXECUTE ON PROCEDURE SET_SEGMENTO TO "PUBLIC";

/*------ 07/01/2013 21:38:32 --------*/

COMMENT ON COLUMN TBEMPRESA.SEGMENTO IS
'Segmento.';

/*------ 07/01/2013 21:38:32 --------*/

alter table TBEMPRESA
alter CODIGO position 1;

/*------ 07/01/2013 21:38:32 --------*/

alter table TBEMPRESA
alter PESSOA_FISICA position 2;

/*------ 07/01/2013 21:38:32 --------*/

alter table TBEMPRESA
alter CNPJ position 3;

/*------ 07/01/2013 21:38:32 --------*/

alter table TBEMPRESA
alter RZSOC position 4;

/*------ 07/01/2013 21:38:32 --------*/

alter table TBEMPRESA
alter NMFANT position 5;

/*------ 07/01/2013 21:38:32 --------*/

alter table TBEMPRESA
alter IE position 6;

/*------ 07/01/2013 21:38:32 --------*/

alter table TBEMPRESA
alter IM position 7;

/*------ 07/01/2013 21:38:32 --------*/

alter table TBEMPRESA
alter CNAE position 8;

/*------ 07/01/2013 21:38:32 --------*/

alter table TBEMPRESA
alter SEGMENTO position 9;

/*------ 07/01/2013 21:38:32 --------*/

alter table TBEMPRESA
alter ENDER position 10;

/*------ 07/01/2013 21:38:32 --------*/

alter table TBEMPRESA
alter COMPLEMENTO position 11;

/*------ 07/01/2013 21:38:32 --------*/

alter table TBEMPRESA
alter BAIRRO position 12;

/*------ 07/01/2013 21:38:32 --------*/

alter table TBEMPRESA
alter CEP position 13;

/*------ 07/01/2013 21:38:32 --------*/

alter table TBEMPRESA
alter CIDADE position 14;

/*------ 07/01/2013 21:38:32 --------*/

alter table TBEMPRESA
alter UF position 15;

/*------ 07/01/2013 21:38:32 --------*/

alter table TBEMPRESA
alter FONE position 16;

/*------ 07/01/2013 21:38:32 --------*/

alter table TBEMPRESA
alter LOGO position 17;

/*------ 07/01/2013 21:38:32 --------*/

alter table TBEMPRESA
alter TLG_TIPO position 18;

/*------ 07/01/2013 21:38:32 --------*/

alter table TBEMPRESA
alter LOG_COD position 19;

/*------ 07/01/2013 21:38:32 --------*/

alter table TBEMPRESA
alter BAI_COD position 20;

/*------ 07/01/2013 21:38:32 --------*/

alter table TBEMPRESA
alter CID_COD position 21;

/*------ 07/01/2013 21:38:32 --------*/

alter table TBEMPRESA
alter EST_COD position 22;

/*------ 07/01/2013 21:38:32 --------*/

alter table TBEMPRESA
alter NUMERO_END position 23;

/*------ 07/01/2013 21:38:32 --------*/

alter table TBEMPRESA
alter EMAIL position 24;

/*------ 07/01/2013 21:38:32 --------*/

alter table TBEMPRESA
alter HOME_PAGE position 25;

/*------ 07/01/2013 21:38:32 --------*/

alter table TBEMPRESA
alter CHAVE_ACESSO_NFE position 26;

/*------ 07/01/2013 21:38:33 --------*/

alter table TBEMPRESA
alter PAIS_ID position 27;

/*------ 07/01/2013 21:38:33 --------*/

alter table TBEMPRESA
alter TIPO_REGIME_NFE position 28;

/*------ 07/01/2013 21:38:33 --------*/

alter table TBEMPRESA
alter SERIE_NFE position 29;

/*------ 07/01/2013 21:38:33 --------*/

alter table TBEMPRESA
alter NUMERO_NFE position 30;

/*------ 07/01/2013 21:38:33 --------*/

alter table TBEMPRESA
alter LOTE_ANO_NFE position 31;

/*------ 07/01/2013 21:38:33 --------*/

alter table TBEMPRESA
alter LOTE_NUM_NFE position 32;

/*------ 07/01/2013 21:38:33 --------*/

COMMENT ON COLUMN TBPRODUTO.DESCRI IS
'Descri√ß√£o.';

/*------ 07/01/2013 21:38:33 --------*/

COMMENT ON COLUMN TBPRODUTO.APRESENTACAO IS
'Apresenta√ß√£o.';

/*------ 07/01/2013 21:38:33 --------*/

COMMENT ON COLUMN TBPRODUTO.DESCRI_APRESENTACAO IS
'Campo Calculado = Descri√ß√£o + Apresenta√ß√£o.';

/*------ 07/01/2013 21:38:33 --------*/

alter table TBPRODUTO
alter CODIGO position 1;

/*------ 07/01/2013 21:38:33 --------*/

alter table TBPRODUTO
alter COD position 2;

/*------ 07/01/2013 21:38:33 --------*/

alter table TBPRODUTO
alter DESCRI position 3;

/*------ 07/01/2013 21:38:33 --------*/

alter table TBPRODUTO
alter APRESENTACAO position 4;

/*------ 07/01/2013 21:38:33 --------*/

alter table TBPRODUTO
alter DESCRI_APRESENTACAO position 5;

/*------ 07/01/2013 21:38:33 --------*/

alter table TBPRODUTO
alter MODELO position 6;

/*------ 07/01/2013 21:38:33 --------*/

alter table TBPRODUTO
alter PRECO position 7;

/*------ 07/01/2013 21:38:33 --------*/

alter table TBPRODUTO
alter PRECO_PROMOCAO position 8;

/*------ 07/01/2013 21:38:33 --------*/

alter table TBPRODUTO
alter REFERENCIA position 9;

/*------ 07/01/2013 21:38:33 --------*/

alter table TBPRODUTO
alter SECAO position 10;

/*------ 07/01/2013 21:38:33 --------*/

alter table TBPRODUTO
alter QTDE position 11;

/*------ 07/01/2013 21:38:33 --------*/

alter table TBPRODUTO
alter UNIDADE position 12;

/*------ 07/01/2013 21:38:33 --------*/

alter table TBPRODUTO
alter ESTOQMIN position 13;

/*------ 07/01/2013 21:38:33 --------*/

alter table TBPRODUTO
alter CODGRUPO position 14;

/*------ 07/01/2013 21:38:33 --------*/

alter table TBPRODUTO
alter CODFABRICANTE position 15;

/*------ 07/01/2013 21:38:33 --------*/

alter table TBPRODUTO
alter CUSTOMEDIO position 16;

/*------ 07/01/2013 21:38:33 --------*/

alter table TBPRODUTO
alter CODEMP position 17;

/*------ 07/01/2013 21:38:33 --------*/

alter table TBPRODUTO
alter CODSECAO position 18;

/*------ 07/01/2013 21:38:33 --------*/

alter table TBPRODUTO
alter CODORIGEM position 19;

/*------ 07/01/2013 21:38:33 --------*/

alter table TBPRODUTO
alter CODTRIBUTACAO position 20;

/*------ 07/01/2013 21:38:33 --------*/

alter table TBPRODUTO
alter CST position 21;

/*------ 07/01/2013 21:38:33 --------*/

alter table TBPRODUTO
alter CSOSN position 22;

/*------ 07/01/2013 21:38:33 --------*/

alter table TBPRODUTO
alter NCM_SH position 23;

/*------ 07/01/2013 21:38:33 --------*/

alter table TBPRODUTO
alter CODCFOP position 24;

/*------ 07/01/2013 21:38:33 --------*/

alter table TBPRODUTO
alter CODBARRA_EAN position 25;

/*------ 07/01/2013 21:38:33 --------*/

alter table TBPRODUTO
alter CODUNIDADE position 26;

/*------ 07/01/2013 21:38:33 --------*/

alter table TBPRODUTO
alter ALIQUOTA_TIPO position 27;

/*------ 07/01/2013 21:38:33 --------*/

alter table TBPRODUTO
alter ALIQUOTA position 28;

/*------ 07/01/2013 21:38:33 --------*/

alter table TBPRODUTO
alter ALIQUOTA_CSOSN position 29;

/*------ 07/01/2013 21:38:33 --------*/

alter table TBPRODUTO
alter VALOR_IPI position 30;

/*------ 07/01/2013 21:38:33 --------*/

alter table TBPRODUTO
alter RESERVA position 31;

/*------ 07/01/2013 21:38:33 --------*/

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

/*------ 07/01/2013 21:38:33 --------*/

SET TERM ; ^

COMMENT ON COLUMN TBSEGMENTO.SEG_DESCRICAO IS
'Descricao.';

/*------ 07/01/2013 21:38:33 --------*/

COMMENT ON COLUMN TBSEGMENTO.SEG_ID IS
'Codigo.';

/*------ 07/01/2013 21:38:33 --------*/

COMMENT ON TABLE TBSEGMENTO IS 'Tabela de Segmentos.
    
    Autor   :   Isaque Marinho Ribeiro
    Data    :   07/11/2012

Tabela responsavel por armazenar os codigos e descricoes dos segmentos que a empresa podera assumir.';

/*------ 07/01/2013 21:38:33 --------*/

COMMENT ON COLUMN TBPRODUTO.DESCRI IS
'Descricao.';

/*------ 07/01/2013 21:38:33 --------*/

COMMENT ON COLUMN TBPRODUTO.APRESENTACAO IS
'Apresentacao.';

/*------ 07/01/2013 21:38:33 --------*/

COMMENT ON COLUMN TBPRODUTO.DESCRI_APRESENTACAO IS
'Campo Calculado = Descricao + Apresentacao.';

/*------ 07/01/2013 21:38:33 --------*/

CREATE INDEX IBE$$RC_TEMP_INDEX
ON RDB$RELATION_CONSTRAINTS (RDB$INDEX_NAME);

/*------ 07/01/2013 21:38:33 --------*/

DROP INDEX IBE$$RC_TEMP_INDEX;

/*------ 07/01/2013 21:38:33 --------*/

alter table TBEMPRESA
alter column CODIGO position 1;

/*------ 07/01/2013 21:38:33 --------*/

alter table TBEMPRESA
alter column PESSOA_FISICA position 2;

/*------ 07/01/2013 21:38:33 --------*/

alter table TBEMPRESA
alter column CNPJ position 3;

/*------ 07/01/2013 21:38:33 --------*/

alter table TBEMPRESA
alter column RZSOC position 4;

/*------ 07/01/2013 21:38:33 --------*/

alter table TBEMPRESA
alter column NMFANT position 5;

/*------ 07/01/2013 21:38:33 --------*/

alter table TBEMPRESA
alter column IE position 6;

/*------ 07/01/2013 21:38:33 --------*/

alter table TBEMPRESA
alter column IM position 7;

/*------ 07/01/2013 21:38:33 --------*/

alter table TBEMPRESA
alter column SEGMENTO position 8;

/*------ 07/01/2013 21:38:33 --------*/

alter table TBEMPRESA
alter column CNAE position 9;

/*------ 07/01/2013 21:38:33 --------*/

alter table TBEMPRESA
alter column ENDER position 10;

/*------ 07/01/2013 21:38:33 --------*/

alter table TBEMPRESA
alter column COMPLEMENTO position 11;

/*------ 07/01/2013 21:38:33 --------*/

alter table TBEMPRESA
alter column BAIRRO position 12;

/*------ 07/01/2013 21:38:33 --------*/

alter table TBEMPRESA
alter column CEP position 13;

/*------ 07/01/2013 21:38:33 --------*/

alter table TBEMPRESA
alter column CIDADE position 14;

/*------ 07/01/2013 21:38:33 --------*/

alter table TBEMPRESA
alter column UF position 15;

/*------ 07/01/2013 21:38:33 --------*/

alter table TBEMPRESA
alter column FONE position 16;

/*------ 07/01/2013 21:38:33 --------*/

alter table TBEMPRESA
alter column LOGO position 17;

/*------ 07/01/2013 21:38:33 --------*/

alter table TBEMPRESA
alter column TLG_TIPO position 18;

/*------ 07/01/2013 21:38:33 --------*/

alter table TBEMPRESA
alter column LOG_COD position 19;

/*------ 07/01/2013 21:38:33 --------*/

alter table TBEMPRESA
alter column BAI_COD position 20;

/*------ 07/01/2013 21:38:33 --------*/

alter table TBEMPRESA
alter column CID_COD position 21;

/*------ 07/01/2013 21:38:33 --------*/

alter table TBEMPRESA
alter column EST_COD position 22;

/*------ 07/01/2013 21:38:33 --------*/

alter table TBEMPRESA
alter column NUMERO_END position 23;

/*------ 07/01/2013 21:38:33 --------*/

alter table TBEMPRESA
alter column EMAIL position 24;

/*------ 07/01/2013 21:38:33 --------*/

alter table TBEMPRESA
alter column HOME_PAGE position 25;

/*------ 07/01/2013 21:38:33 --------*/

alter table TBEMPRESA
alter column CHAVE_ACESSO_NFE position 26;

/*------ 07/01/2013 21:38:33 --------*/

alter table TBEMPRESA
alter column PAIS_ID position 27;

/*------ 07/01/2013 21:38:33 --------*/

alter table TBEMPRESA
alter column TIPO_REGIME_NFE position 28;

/*------ 07/01/2013 21:38:33 --------*/

alter table TBEMPRESA
alter column SERIE_NFE position 29;

/*------ 07/01/2013 21:38:33 --------*/

alter table TBEMPRESA
alter column NUMERO_NFE position 30;

/*------ 07/01/2013 21:38:33 --------*/

alter table TBEMPRESA
alter column LOTE_ANO_NFE position 31;

/*------ 07/01/2013 21:38:33 --------*/

alter table TBEMPRESA
alter column LOTE_NUM_NFE position 32;

/*------ 07/01/2013 21:38:33 --------*/

alter table TBPRODUTO
alter column CODIGO position 1;

/*------ 07/01/2013 21:38:33 --------*/

alter table TBPRODUTO
alter column COD position 2;

/*------ 07/01/2013 21:38:33 --------*/

alter table TBPRODUTO
alter column DESCRI position 3;

/*------ 07/01/2013 21:38:33 --------*/

alter table TBPRODUTO
alter column APRESENTACAO position 4;

/*------ 07/01/2013 21:38:33 --------*/

alter table TBPRODUTO
alter column DESCRI_APRESENTACAO position 5;

/*------ 07/01/2013 21:38:33 --------*/

alter table TBPRODUTO
alter column MODELO position 6;

/*------ 07/01/2013 21:38:33 --------*/

alter table TBPRODUTO
alter column PRECO position 7;

/*------ 07/01/2013 21:38:33 --------*/

alter table TBPRODUTO
alter column PRECO_PROMOCAO position 8;

/*------ 07/01/2013 21:38:33 --------*/

alter table TBPRODUTO
alter column REFERENCIA position 9;

/*------ 07/01/2013 21:38:33 --------*/

alter table TBPRODUTO
alter column SECAO position 10;

/*------ 07/01/2013 21:38:33 --------*/

alter table TBPRODUTO
alter column QTDE position 11;

/*------ 07/01/2013 21:38:33 --------*/

alter table TBPRODUTO
alter column UNIDADE position 12;

/*------ 07/01/2013 21:38:33 --------*/

alter table TBPRODUTO
alter column ESTOQMIN position 13;

/*------ 07/01/2013 21:38:33 --------*/

alter table TBPRODUTO
alter column CODGRUPO position 14;

/*------ 07/01/2013 21:38:33 --------*/

alter table TBPRODUTO
alter column CODFABRICANTE position 15;

/*------ 07/01/2013 21:38:33 --------*/

alter table TBPRODUTO
alter column CUSTOMEDIO position 16;

/*------ 07/01/2013 21:38:33 --------*/

alter table TBPRODUTO
alter column CODEMP position 17;

/*------ 07/01/2013 21:38:33 --------*/

alter table TBPRODUTO
alter column CODSECAO position 18;

/*------ 07/01/2013 21:38:33 --------*/

alter table TBPRODUTO
alter column CODORIGEM position 19;

/*------ 07/01/2013 21:38:33 --------*/

alter table TBPRODUTO
alter column CODTRIBUTACAO position 20;

/*------ 07/01/2013 21:38:33 --------*/

alter table TBPRODUTO
alter column CST position 21;

/*------ 07/01/2013 21:38:33 --------*/

alter table TBPRODUTO
alter column CSOSN position 22;

/*------ 07/01/2013 21:38:33 --------*/

alter table TBPRODUTO
alter column NCM_SH position 23;

/*------ 07/01/2013 21:38:33 --------*/

alter table TBPRODUTO
alter column CODCFOP position 24;

/*------ 07/01/2013 21:38:33 --------*/

alter table TBPRODUTO
alter column CODBARRA_EAN position 25;

/*------ 07/01/2013 21:38:33 --------*/

alter table TBPRODUTO
alter column CODUNIDADE position 26;

/*------ 07/01/2013 21:38:33 --------*/

alter table TBPRODUTO
alter column ALIQUOTA_TIPO position 27;

/*------ 07/01/2013 21:38:33 --------*/

alter table TBPRODUTO
alter column ALIQUOTA position 28;

/*------ 07/01/2013 21:38:33 --------*/

alter table TBPRODUTO
alter column ALIQUOTA_CSOSN position 29;

/*------ 07/01/2013 21:38:33 --------*/

alter table TBPRODUTO
alter column VALOR_IPI position 30;

/*------ 07/01/2013 21:38:33 --------*/

alter table TBPRODUTO
alter column RESERVA position 31;

/*------ 07/01/2013 21:38:33 --------*/

COMMENT ON COLUMN TBPRODUTO.PRODUTO_NOVO IS
'Produto novo:
0 - Nao
1 - Sim';

/*------ 07/01/2013 21:38:33 --------*/

COMMENT ON COLUMN RENAVAM_COR.CODIGO IS
'Codigo.';

/*------ 07/01/2013 21:38:33 --------*/

COMMENT ON COLUMN RENAVAM_COR.DESCRICAO IS
'Descricao.';

/*------ 07/01/2013 21:38:33 --------*/

COMMENT ON TABLE RENAVAM_COR IS 'Tabela de Cores RENAVAM

    Autor   :   Isaque Marinho Ribeiro
    Data    :   09/11/2012

Tabela padrao de cores para veiculos de acordo com o sistema RENAVAM de veiculos.';

/*------ 07/01/2013 21:38:33 --------*/

GRANT ALL ON RENAVAM_COR TO "PUBLIC";

/*------ 07/01/2013 21:38:34 --------*/

COMMENT ON COLUMN RENAVAM_COBUSTIVEL.CODIGO IS
'Codigo.';

/*------ 07/01/2013 21:38:34 --------*/

COMMENT ON COLUMN RENAVAM_COBUSTIVEL.DESCRICAO IS
'Descricao.';

/*------ 07/01/2013 21:38:34 --------*/

COMMENT ON TABLE RENAVAM_COBUSTIVEL IS 'Tabela de Tipos de Combustiveis RENAVAM.

    Autor   :   Isaque Marinho Ribeiro
    Data    :   09/11/2012

Tabela padrao de tipos de combustiveis para veiculos de acordo com o sistema RENAVAM de veiculos.';

/*------ 07/01/2013 21:38:34 --------*/

GRANT ALL ON RENAVAM_COBUSTIVEL TO "PUBLIC";

/*------ 07/01/2013 21:38:35 --------*/

COMMENT ON COLUMN RENAVAM_TIPOVEICULO.CODIGO IS
'Codigo.';

/*------ 07/01/2013 21:38:35 --------*/

COMMENT ON COLUMN RENAVAM_TIPOVEICULO.DESCRICAO IS
'Descricao.';

/*------ 07/01/2013 21:38:35 --------*/

COMMENT ON TABLE RENAVAM_TIPOVEICULO IS 'Tabela de Tipos de Veiculos RENAVAM.

    Autor   :   Isaque Marinho Ribeiro
    Data    :   09/11/2012

Tabela padrao de tipos de veiculos de acordo com o sistema RENAVAM de veiculos.';

/*------ 07/01/2013 21:38:35 --------*/

GRANT ALL ON RENAVAM_TIPOVEICULO TO "PUBLIC";

/*------ 07/01/2013 21:38:35 --------*/

COMMENT ON COLUMN TBPRODUTO.COR_VEICULO IS
'Codigo da Cor (Tabela RENAVAM).';

/*------ 07/01/2013 21:38:35 --------*/

COMMENT ON COLUMN TBPRODUTO.COMBUSTIVEL_VEICULO IS
'Codigo do Combustivel (Tabela RENAVAM).';

/*------ 07/01/2013 21:38:35 --------*/

COMMENT ON COLUMN TBPRODUTO.TIPO_VEICULO IS
'Codigo do Tipo do Veiculo (Tabela RENAVAM).';

/*------ 07/01/2013 21:38:35 --------*/

COMMENT ON COLUMN TBPRODUTO.ANO_MODELO_VEICULO IS
'Ano do Modelo do Veiculo.';

/*------ 07/01/2013 21:38:35 --------*/

COMMENT ON COLUMN TBPRODUTO.ANO_FABRICACAO_VEICULO IS
'Ano de Fabricacao do Veiculo.';

/*------ 07/01/2013 21:38:35 --------*/

COMMENT ON COLUMN TBPRODUTO.RENAVAM_VEICULO IS
'Numero de Renavam do Veiculo.';

/*------ 07/01/2013 21:38:35 --------*/

COMMENT ON COLUMN TBPRODUTO.CHASSI_VEICULO IS
'Chassi do Veiculo.';

/*------ 07/01/2013 21:38:35 --------*/

COMMENT ON COLUMN TBPRODUTO.KILOMETRAGEM_VEICULO IS
'Kilometragem do Veiculo.';

/*------ 07/01/2013 21:38:35 --------*/

COMMENT ON COLUMN RENAVAM_COBUSTIVEL.APELIDO IS
'Apelido.';

/*------ 07/01/2013 21:38:35 --------*/

COMMENT ON COLUMN TBPRODUTO.SITUACAO_ATUAL_VEICULO IS
'Descricao simples e breve da situacao atual do produto (Veiculo).';

/*------ 07/01/2013 21:38:35 --------*/

COMMENT ON COLUMN TBPRODUTO.SITUACAO_HISTORICO_VEICULO IS
'Historico das situacoes do produto (Veiculo).';

/*------ 07/01/2013 21:38:35 --------*/

DROP VIEW VW_TIPO_MOVIMENTO_CAIXA;

/*------ 07/01/2013 21:38:35 --------*/

CREATE VIEW VW_TIPO_MOVIMENTO_CAIXA(
    TIPO,
    TIPO_DESC)
AS
Select First 1
    'C' as TIPO
  , 'Cr√©dito' as TIPO_DESC
from TBEMPRESA

union

Select First 1
    'D' as TIPO
  , 'D√©bito' as TIPO_DESC
from TBEMPRESA;

/*------ 07/01/2013 21:38:35 --------*/

COMMENT ON COLUMN TBTRIBUTACAO_TIPO.CRT IS
'Codigo do Regime Tributario.
0 - Normal
1 - Simples Nacional';

/*------ 07/01/2013 21:38:35 --------*/

COMMENT ON COLUMN TBPRODUTO.PERCENTUAL_REDUCAO_BC IS
'Percentual de reducao da Base de Calculo da Aliquota ICMS.';

/*------ 07/01/2013 21:38:35 --------*/

ALTER TABLE TBPRODUTO ADD IBE$$TEMP_COLUMN
 NUMERIC(1,1) DEFAULT 0;

/*------ 07/01/2013 21:38:35 --------*/

ALTER TABLE TBPRODUTO DROP IBE$$TEMP_COLUMN;

/*------ 07/01/2013 21:38:35 --------*/

COMMENT ON COLUMN TBPRODUTO.PERCENTUAL_REDUCAO_BC IS
'Percentual de reducao da Base de Calculo da Aliquota ICMS.

Exemplo:
Caso um produto tenha uma reducao de 94% sobre o seu preco de venda, seu percentual sera de 6% (100% - 94%).';

/*------ 07/01/2013 21:38:35 --------*/

COMMENT ON COLUMN TBPRODUTO.PERCENTUAL_REDUCAO_BC IS
'Percentual de reducao da Base de Calculo da Aliquota ICMS.';

/*------ 07/01/2013 21:38:35 --------*/

COMMENT ON COLUMN TVENDASITENS.PERCENTUAL_REDUCAO_BC IS
'Percentual de Reducao BC.';

/*------ 07/01/2013 21:38:35 --------*/

COMMENT ON COLUMN TBCST_PIS.CODIGO IS
'Codigo.';

/*------ 07/01/2013 21:38:35 --------*/

COMMENT ON COLUMN TBCST_PIS.DESCRICAO IS
'Descricao.';

/*------ 07/01/2013 21:38:35 --------*/

COMMENT ON COLUMN TBCST_PIS.INDICE_ACBR IS
'Indice ACBr para geracao da NF-e.';

/*------ 07/01/2013 21:38:35 --------*/

GRANT ALL ON TBCST_PIS TO "PUBLIC";

/*------ 07/01/2013 21:38:35 --------*/

COMMENT ON COLUMN TBCST_COFINS.CODIGO IS 
'Codigo.';

/*------ 07/01/2013 21:38:35 --------*/

COMMENT ON COLUMN TBCST_COFINS.DESCRICAO IS 
'Descricao.';

/*------ 07/01/2013 21:38:35 --------*/

COMMENT ON COLUMN TBCST_COFINS.INDICE_ACBR IS 
'Indice ACBr para geracao da NF-e.';

/*------ 07/01/2013 21:38:35 --------*/

GRANT ALL ON TBCST_COFINS TO PUBLIC;

/*------ 07/01/2013 21:38:35 --------*/

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

/*------ 07/01/2013 21:38:35 --------*/

SET TERM ; ^

GRANT EXECUTE ON PROCEDURE SET_CST_PIS TO "PUBLIC";

/*------ 07/01/2013 21:38:35 --------*/

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

/*------ 07/01/2013 21:38:35 --------*/

SET TERM ; ^

GRANT EXECUTE ON PROCEDURE SET_CST_COFINS TO "PUBLIC";

/*------ 07/01/2013 21:38:35 --------*/

alter table TBPRODUTO
alter CODIGO position 1;

/*------ 07/01/2013 21:38:35 --------*/

alter table TBPRODUTO
alter COD position 2;

/*------ 07/01/2013 21:38:35 --------*/

alter table TBPRODUTO
alter DESCRI position 3;

/*------ 07/01/2013 21:38:35 --------*/

alter table TBPRODUTO
alter APRESENTACAO position 4;

/*------ 07/01/2013 21:38:35 --------*/

alter table TBPRODUTO
alter DESCRI_APRESENTACAO position 5;

/*------ 07/01/2013 21:38:36 --------*/

alter table TBPRODUTO
alter MODELO position 6;

/*------ 07/01/2013 21:38:36 --------*/

alter table TBPRODUTO
alter PRECO position 7;

/*------ 07/01/2013 21:38:36 --------*/

alter table TBPRODUTO
alter PRECO_PROMOCAO position 8;

/*------ 07/01/2013 21:38:36 --------*/

alter table TBPRODUTO
alter REFERENCIA position 9;

/*------ 07/01/2013 21:38:36 --------*/

alter table TBPRODUTO
alter SECAO position 10;

/*------ 07/01/2013 21:38:36 --------*/

alter table TBPRODUTO
alter QTDE position 11;

/*------ 07/01/2013 21:38:36 --------*/

alter table TBPRODUTO
alter UNIDADE position 12;

/*------ 07/01/2013 21:38:36 --------*/

alter table TBPRODUTO
alter ESTOQMIN position 13;

/*------ 07/01/2013 21:38:36 --------*/

alter table TBPRODUTO
alter CODGRUPO position 14;

/*------ 07/01/2013 21:38:36 --------*/

alter table TBPRODUTO
alter CODFABRICANTE position 15;

/*------ 07/01/2013 21:38:36 --------*/

alter table TBPRODUTO
alter CUSTOMEDIO position 16;

/*------ 07/01/2013 21:38:36 --------*/

alter table TBPRODUTO
alter CODEMP position 17;

/*------ 07/01/2013 21:38:36 --------*/

alter table TBPRODUTO
alter CODSECAO position 18;

/*------ 07/01/2013 21:38:36 --------*/

alter table TBPRODUTO
alter CODORIGEM position 19;

/*------ 07/01/2013 21:38:36 --------*/

alter table TBPRODUTO
alter CODTRIBUTACAO position 20;

/*------ 07/01/2013 21:38:36 --------*/

alter table TBPRODUTO
alter CST position 21;

/*------ 07/01/2013 21:38:36 --------*/

alter table TBPRODUTO
alter CSOSN position 22;

/*------ 07/01/2013 21:38:36 --------*/

alter table TBPRODUTO
alter CST_PIS position 23;

/*------ 07/01/2013 21:38:36 --------*/

alter table TBPRODUTO
alter CST_COFINS position 24;

/*------ 07/01/2013 21:38:36 --------*/

alter table TBPRODUTO
alter NCM_SH position 25;

/*------ 07/01/2013 21:38:36 --------*/

alter table TBPRODUTO
alter CODCFOP position 26;

/*------ 07/01/2013 21:38:36 --------*/

alter table TBPRODUTO
alter CODBARRA_EAN position 27;

/*------ 07/01/2013 21:38:36 --------*/

alter table TBPRODUTO
alter CODUNIDADE position 28;

/*------ 07/01/2013 21:38:36 --------*/

alter table TBPRODUTO
alter ALIQUOTA_TIPO position 29;

/*------ 07/01/2013 21:38:36 --------*/

alter table TBPRODUTO
alter ALIQUOTA position 30;

/*------ 07/01/2013 21:38:36 --------*/

alter table TBPRODUTO
alter ALIQUOTA_CSOSN position 31;

/*------ 07/01/2013 21:38:36 --------*/

alter table TBPRODUTO
alter VALOR_IPI position 32;

/*------ 07/01/2013 21:38:36 --------*/

alter table TBPRODUTO
alter RESERVA position 33;

/*------ 07/01/2013 21:38:36 --------*/

alter table TBPRODUTO
alter PRODUTO_NOVO position 34;

/*------ 07/01/2013 21:38:36 --------*/

alter table TBPRODUTO
alter COR_VEICULO position 35;

/*------ 07/01/2013 21:38:36 --------*/

alter table TBPRODUTO
alter COMBUSTIVEL_VEICULO position 36;

/*------ 07/01/2013 21:38:36 --------*/

alter table TBPRODUTO
alter TIPO_VEICULO position 37;

/*------ 07/01/2013 21:38:36 --------*/

alter table TBPRODUTO
alter ANO_MODELO_VEICULO position 38;

/*------ 07/01/2013 21:38:36 --------*/

alter table TBPRODUTO
alter ANO_FABRICACAO_VEICULO position 39;

/*------ 07/01/2013 21:38:36 --------*/

alter table TBPRODUTO
alter RENAVAM_VEICULO position 40;

/*------ 07/01/2013 21:38:36 --------*/

alter table TBPRODUTO
alter CHASSI_VEICULO position 41;

/*------ 07/01/2013 21:38:36 --------*/

alter table TBPRODUTO
alter KILOMETRAGEM_VEICULO position 42;

/*------ 07/01/2013 21:38:36 --------*/

alter table TBPRODUTO
alter SITUACAO_ATUAL_VEICULO position 43;

/*------ 07/01/2013 21:38:36 --------*/

alter table TBPRODUTO
alter SITUACAO_HISTORICO_VEICULO position 44;

/*------ 07/01/2013 21:38:36 --------*/

alter table TBPRODUTO
alter PERCENTUAL_REDUCAO_BC position 45;

/*------ 07/01/2013 21:38:36 --------*/

COMMENT ON COLUMN TBPRODUTO.CST_PIS IS
'Codigo de Situacao Tributaria PIS.';

/*------ 07/01/2013 21:38:36 --------*/

COMMENT ON COLUMN TBPRODUTO.CST_COFINS IS
'Codigo de Situacao Tributaria COFINS.';

/*------ 07/01/2013 21:38:36 --------*/

COMMENT ON COLUMN TBPRODUTO.ALIQUOTA_PIS IS
'Aliquota PIS.';

/*------ 07/01/2013 21:38:36 --------*/

COMMENT ON COLUMN TBPRODUTO.ALIQUOTA_COFINS IS
'Aliquota COFINS.';

/*------ 07/01/2013 21:38:36 --------*/

alter table TBPRODUTO
alter CODIGO position 1;

/*------ 07/01/2013 21:38:36 --------*/

alter table TBPRODUTO
alter COD position 2;

/*------ 07/01/2013 21:38:36 --------*/

alter table TBPRODUTO
alter DESCRI position 3;

/*------ 07/01/2013 21:38:36 --------*/

alter table TBPRODUTO
alter APRESENTACAO position 4;

/*------ 07/01/2013 21:38:36 --------*/

alter table TBPRODUTO
alter DESCRI_APRESENTACAO position 5;

/*------ 07/01/2013 21:38:36 --------*/

alter table TBPRODUTO
alter MODELO position 6;

/*------ 07/01/2013 21:38:36 --------*/

alter table TBPRODUTO
alter PRECO position 7;

/*------ 07/01/2013 21:38:36 --------*/

alter table TBPRODUTO
alter PRECO_PROMOCAO position 8;

/*------ 07/01/2013 21:38:36 --------*/

alter table TBPRODUTO
alter REFERENCIA position 9;

/*------ 07/01/2013 21:38:36 --------*/

alter table TBPRODUTO
alter SECAO position 10;

/*------ 07/01/2013 21:38:36 --------*/

alter table TBPRODUTO
alter QTDE position 11;

/*------ 07/01/2013 21:38:36 --------*/

alter table TBPRODUTO
alter UNIDADE position 12;

/*------ 07/01/2013 21:38:36 --------*/

alter table TBPRODUTO
alter ESTOQMIN position 13;

/*------ 07/01/2013 21:38:36 --------*/

alter table TBPRODUTO
alter CODGRUPO position 14;

/*------ 07/01/2013 21:38:36 --------*/

alter table TBPRODUTO
alter CODFABRICANTE position 15;

/*------ 07/01/2013 21:38:36 --------*/

alter table TBPRODUTO
alter CUSTOMEDIO position 16;

/*------ 07/01/2013 21:38:36 --------*/

alter table TBPRODUTO
alter CODEMP position 17;

/*------ 07/01/2013 21:38:36 --------*/

alter table TBPRODUTO
alter CODSECAO position 18;

/*------ 07/01/2013 21:38:36 --------*/

alter table TBPRODUTO
alter CODORIGEM position 19;

/*------ 07/01/2013 21:38:36 --------*/

alter table TBPRODUTO
alter CODTRIBUTACAO position 20;

/*------ 07/01/2013 21:38:36 --------*/

alter table TBPRODUTO
alter CST position 21;

/*------ 07/01/2013 21:38:36 --------*/

alter table TBPRODUTO
alter CSOSN position 22;

/*------ 07/01/2013 21:38:36 --------*/

alter table TBPRODUTO
alter CST_PIS position 23;

/*------ 07/01/2013 21:38:36 --------*/

alter table TBPRODUTO
alter CST_COFINS position 24;

/*------ 07/01/2013 21:38:36 --------*/

alter table TBPRODUTO
alter NCM_SH position 25;

/*------ 07/01/2013 21:38:36 --------*/

alter table TBPRODUTO
alter CODCFOP position 26;

/*------ 07/01/2013 21:38:36 --------*/

alter table TBPRODUTO
alter CODBARRA_EAN position 27;

/*------ 07/01/2013 21:38:36 --------*/

alter table TBPRODUTO
alter CODUNIDADE position 28;

/*------ 07/01/2013 21:38:36 --------*/

alter table TBPRODUTO
alter ALIQUOTA_TIPO position 29;

/*------ 07/01/2013 21:38:36 --------*/

alter table TBPRODUTO
alter ALIQUOTA position 30;

/*------ 07/01/2013 21:38:36 --------*/

alter table TBPRODUTO
alter ALIQUOTA_CSOSN position 31;

/*------ 07/01/2013 21:38:36 --------*/

alter table TBPRODUTO
alter ALIQUOTA_PIS position 32;

/*------ 07/01/2013 21:38:36 --------*/

alter table TBPRODUTO
alter ALIQUOTA_COFINS position 33;

/*------ 07/01/2013 21:38:36 --------*/

alter table TBPRODUTO
alter VALOR_IPI position 34;

/*------ 07/01/2013 21:38:36 --------*/

alter table TBPRODUTO
alter RESERVA position 35;

/*------ 07/01/2013 21:38:36 --------*/

alter table TBPRODUTO
alter PRODUTO_NOVO position 36;

/*------ 07/01/2013 21:38:36 --------*/

alter table TBPRODUTO
alter COR_VEICULO position 37;

/*------ 07/01/2013 21:38:36 --------*/

alter table TBPRODUTO
alter COMBUSTIVEL_VEICULO position 38;

/*------ 07/01/2013 21:38:36 --------*/

alter table TBPRODUTO
alter TIPO_VEICULO position 39;

/*------ 07/01/2013 21:38:36 --------*/

alter table TBPRODUTO
alter ANO_MODELO_VEICULO position 40;

/*------ 07/01/2013 21:38:36 --------*/

alter table TBPRODUTO
alter ANO_FABRICACAO_VEICULO position 41;

/*------ 07/01/2013 21:38:36 --------*/

alter table TBPRODUTO
alter RENAVAM_VEICULO position 42;

/*------ 07/01/2013 21:38:36 --------*/

alter table TBPRODUTO
alter CHASSI_VEICULO position 43;

/*------ 07/01/2013 21:38:36 --------*/

alter table TBPRODUTO
alter KILOMETRAGEM_VEICULO position 44;

/*------ 07/01/2013 21:38:36 --------*/

alter table TBPRODUTO
alter SITUACAO_ATUAL_VEICULO position 45;

/*------ 07/01/2013 21:38:36 --------*/

alter table TBPRODUTO
alter SITUACAO_HISTORICO_VEICULO position 46;

/*------ 07/01/2013 21:38:36 --------*/

alter table TBPRODUTO
alter PERCENTUAL_REDUCAO_BC position 47;

/*------ 07/01/2013 21:38:36 --------*/

create view new_view (
    Codigo
  , Descricao_FULL
  , Descricao
  , Indice_acbr)
as
Select
    p.Codigo
  , p.Codigo || ' - ' || p.Descricao as Descricao_FULL
  , p.Descricao
  , p.Indice_acbr
from TBCST_PIS p
order by
    2;

/*------ 07/01/2013 21:38:36 --------*/

GRANT ALL ON NEW_VIEW TO "PUBLIC";

/*------ 07/01/2013 21:38:36 --------*/

GRANT ALL ON VW_ALIQUOTA_PIS TO "PUBLIC";

/*------ 07/01/2013 21:38:36 --------*/

DROP VIEW NEW_VIEW;

/*------ 07/01/2013 21:38:36 --------*/

GRANT ALL ON VW_ALIQUOTA_COFINS TO "PUBLIC";

/*------ 07/01/2013 21:38:36 --------*/

COMMENT ON COLUMN TVENDASITENS.ALIQUOTA_PIS IS
'Percentual Aliquota PIS.';

/*------ 07/01/2013 21:38:36 --------*/

COMMENT ON COLUMN TVENDASITENS.ALIQUOTA_COFINS IS
'Percentual Aliquota COFINS.';

/*------ 07/01/2013 21:38:36 --------*/

alter table TVENDASITENS
alter ANO position 1;

/*------ 07/01/2013 21:38:36 --------*/

alter table TVENDASITENS
alter CODCONTROL position 2;

/*------ 07/01/2013 21:38:36 --------*/

alter table TVENDASITENS
alter SEQ position 3;

/*------ 07/01/2013 21:38:36 --------*/

alter table TVENDASITENS
alter CODPROD position 4;

/*------ 07/01/2013 21:38:36 --------*/

alter table TVENDASITENS
alter CODEMP position 5;

/*------ 07/01/2013 21:38:36 --------*/

alter table TVENDASITENS
alter CODCLI position 6;

/*------ 07/01/2013 21:38:36 --------*/

alter table TVENDASITENS
alter DTVENDA position 7;

/*------ 07/01/2013 21:38:36 --------*/

alter table TVENDASITENS
alter QTDE position 8;

/*------ 07/01/2013 21:38:36 --------*/

alter table TVENDASITENS
alter PUNIT position 9;

/*------ 07/01/2013 21:38:36 --------*/

alter table TVENDASITENS
alter PUNIT_PROMOCAO position 10;

/*------ 07/01/2013 21:38:36 --------*/

alter table TVENDASITENS
alter DESCONTO position 11;

/*------ 07/01/2013 21:38:36 --------*/

alter table TVENDASITENS
alter DESCONTO_VALOR position 12;

/*------ 07/01/2013 21:38:36 --------*/

alter table TVENDASITENS
alter PFINAL position 13;

/*------ 07/01/2013 21:38:36 --------*/

alter table TVENDASITENS
alter QTDEFINAL position 14;

/*------ 07/01/2013 21:38:36 --------*/

alter table TVENDASITENS
alter UNID_COD position 15;

/*------ 07/01/2013 21:38:36 --------*/

alter table TVENDASITENS
alter CFOP_COD position 16;

/*------ 07/01/2013 21:38:36 --------*/

alter table TVENDASITENS
alter ALIQUOTA position 17;

/*------ 07/01/2013 21:38:36 --------*/

alter table TVENDASITENS
alter ALIQUOTA_CSOSN position 18;

/*------ 07/01/2013 21:38:36 --------*/

alter table TVENDASITENS
alter ALIQUOTA_PIS position 19;

/*------ 07/01/2013 21:38:36 --------*/

alter table TVENDASITENS
alter ALIQUOTA_COFINS position 20;

/*------ 07/01/2013 21:38:36 --------*/

alter table TVENDASITENS
alter VALOR_IPI position 21;

/*------ 07/01/2013 21:38:36 --------*/

alter table TVENDASITENS
alter PERCENTUAL_REDUCAO_BC position 22;

/*------ 07/01/2013 21:38:37 --------*/

COMMENT ON COLUMN TBVENDAS_FORMAPAGTO.ANO_VENDA IS 
'Ano.';

/*------ 07/01/2013 21:38:37 --------*/

COMMENT ON COLUMN TBVENDAS_FORMAPAGTO.CONTROLE_VENDA IS 
'Nro. de Controle.';

/*------ 07/01/2013 21:38:37 --------*/

COMMENT ON COLUMN TBVENDAS_FORMAPAGTO.FORMAPAGTO_COD IS 
'Forma de Pagamento.';

/*------ 07/01/2013 21:38:37 --------*/

COMMENT ON COLUMN TBVENDAS_FORMAPAGTO.CONDICAOPAGTO_COD IS 
'Condicao de Pagamento.';

/*------ 07/01/2013 21:38:37 --------*/

COMMENT ON COLUMN TBVENDAS_FORMAPAGTO.VENDA_PRAZO IS 
'Venda a Prazo:
0 - Nao
1 - Sim';

/*------ 07/01/2013 21:38:37 --------*/

COMMENT ON COLUMN TBVENDAS_FORMAPAGTO.VALOR_FPAGTO IS 
'Valor A Pagar.';

/*------ 07/01/2013 21:38:37 --------*/

GRANT ALL ON TBVENDAS_FORMAPAGTO TO PUBLIC;

/*------ 07/01/2013 21:38:37 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure SET_GERAR_TITULOS (
    ANOVENDA smallint,
    NUMVENDA integer)
returns (
    CLIENTE varchar(18),
    PARCELAS smallint,
    VALOR_TOTAL numeric(15,2),
    PARCELA smallint,
    EMISSAO date,
    VENCIMENTO date,
    VALOR_DOCUMENTO numeric(15,2),
    FORMA_PAGTO smallint,
    DATA_FINALIZ_VENDA date,
    ANO_LANC smallint,
    NUM_LANC integer)
as
declare variable P01 smallint;
declare variable P02 smallint;
declare variable P03 smallint;
declare variable P04 smallint;
declare variable P05 smallint;
declare variable P06 smallint;
declare variable P07 smallint;
declare variable P08 smallint;
declare variable P09 smallint;
declare variable P10 smallint;
declare variable P11 smallint;
declare variable P12 smallint;
declare variable VALOR_TOTAL_PARCELAS numeric(15,2);
begin
  for
    Select
        x.Codcli
      , coalesce(v.Prazo_01, 0)
      , v.Prazo_02
      , v.Prazo_03
      , v.Prazo_04
      , v.Prazo_05
      , v.Prazo_06
      , v.Prazo_07
      , v.Prazo_08
      , v.Prazo_09
      , v.Prazo_10
      , v.Prazo_11
      , v.Prazo_12
      , case when coalesce(v.Prazo_01, 0) is not null then 1 else 0 end +
        case when v.Prazo_02 is not null then 1 else 0 end +
        case when v.Prazo_03 is not null then 1 else 0 end +
        case when v.Prazo_04 is not null then 1 else 0 end +
        case when v.Prazo_05 is not null then 1 else 0 end +
        case when v.Prazo_06 is not null then 1 else 0 end +
        case when v.Prazo_07 is not null then 1 else 0 end +
        case when v.Prazo_08 is not null then 1 else 0 end +
        case when v.Prazo_09 is not null then 1 else 0 end +
        case when v.Prazo_10 is not null then 1 else 0 end +
        case when v.Prazo_11 is not null then 1 else 0 end +
        case when v.Prazo_12 is not null then 1 else 0 end as parcelas
      , v.valor_fpagto
      , v.Formapagto_cod
      , x.Dtfinalizacao_venda
    from TBVENDAS x
      inner join TBVENDAS_FORMAPAGTO v on (v.ano_venda = x.ano and v.controle_venda = x.codcontrol)
    where x.Ano        = :Anovenda
      and x.Codcontrol = :Numvenda
    into
        cliente
      , p01
      , p02
      , p03
      , p04
      , p05
      , p06
      , p07
      , p08
      , p09
      , p10
      , p11
      , p12
      , parcelas
      , valor_total
      , forma_pagto
      , data_finaliz_venda
  do
  begin

    parcela = 0;
    emissao = :Data_finaliz_venda;
    valor_documento = :Valor_total / :Parcelas;

    -- Parcela 1
    if ( :P01 is not null ) then
    begin
      if ( :P01 = 0 ) then
        parcela = 0;
      else
      if ( :P01 > 0 ) then
        parcela = 1;

      Select d.Dia_util from Get_dia_util(:Emissao, :P01) d into vencimento;

      Select
          t.Anolancamento
        , t.Numlancamento
      from SET_TITULO_RECEBER (
          :Anovenda
        , :Numvenda
        , :Cliente
        , :Forma_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela) t
      into
          Ano_lanc
        , Num_lanc;
    end

    -- Parcela 2
    if ( :P02 is not null ) then
    begin
      parcela = :Parcela + 1;

      Select d.Dia_util from Get_dia_util(:Emissao, :P02) d into vencimento;

      Select
          t.Anolancamento
        , t.Numlancamento
      from SET_TITULO_RECEBER (
          :Anovenda
        , :Numvenda
        , :Cliente
        , :Forma_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela) t
      into
          Ano_lanc
        , Num_lanc;
    end

    -- Parcela 3
    if ( :P03 is not null ) then
    begin
      parcela = :Parcela + 1;

      Select d.Dia_util from Get_dia_util(:Emissao, :P03) d into vencimento;

      Select
          t.Anolancamento
        , t.Numlancamento
      from SET_TITULO_RECEBER (
          :Anovenda
        , :Numvenda
        , :Cliente
        , :Forma_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela) t
      into
          Ano_lanc
        , Num_lanc;
    end

    -- Parcela 4
    if ( :P04 is not null ) then
    begin
      parcela = :Parcela + 1;

      Select d.Dia_util from Get_dia_util(:Emissao, :P04) d into vencimento;

      Select
          t.Anolancamento
        , t.Numlancamento
      from SET_TITULO_RECEBER (
          :Anovenda
        , :Numvenda
        , :Cliente
        , :Forma_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela) t
      into
          Ano_lanc
        , Num_lanc;
    end

    -- Parcela 5
    if ( :P05 is not null ) then
    begin
      parcela = :Parcela + 1;

      Select d.Dia_util from Get_dia_util(:Emissao, :P05) d into vencimento;

      Select
          t.Anolancamento
        , t.Numlancamento
      from SET_TITULO_RECEBER (
          :Anovenda
        , :Numvenda
        , :Cliente
        , :Forma_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela) t
      into
          Ano_lanc
        , Num_lanc;
    end

    -- Parcela 6
    if ( :P06 is not null ) then
    begin
      parcela = :Parcela + 1;

      Select d.Dia_util from Get_dia_util(:Emissao, :P06) d into vencimento;

      Select
          t.Anolancamento
        , t.Numlancamento
      from SET_TITULO_RECEBER (
          :Anovenda
        , :Numvenda
        , :Cliente
        , :Forma_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela) t
      into
          Ano_lanc
        , Num_lanc;
    end

    -- Parcela 7
    if ( :P07 is not null ) then
    begin
      parcela = :Parcela + 1;

      Select d.Dia_util from Get_dia_util(:Emissao, :P07) d into vencimento;

      Select
          t.Anolancamento
        , t.Numlancamento
      from SET_TITULO_RECEBER (
          :Anovenda
        , :Numvenda
        , :Cliente
        , :Forma_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela) t
      into
          Ano_lanc
        , Num_lanc;
    end

    -- Parcela 8
    if ( :P08 is not null ) then
    begin
      parcela = :Parcela + 1;

      Select d.Dia_util from Get_dia_util(:Emissao, :P08) d into vencimento;

      Select
          t.Anolancamento
        , t.Numlancamento
      from SET_TITULO_RECEBER (
          :Anovenda
        , :Numvenda
        , :Cliente
        , :Forma_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela) t
      into
          Ano_lanc
        , Num_lanc;
    end

    -- Parcela 9
    if ( :P09 is not null ) then
    begin
      parcela = :Parcela + 1;

      Select d.Dia_util from Get_dia_util(:Emissao, :P09) d into vencimento;

      Select
          t.Anolancamento
        , t.Numlancamento
      from SET_TITULO_RECEBER (
          :Anovenda
        , :Numvenda
        , :Cliente
        , :Forma_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela) t
      into
          Ano_lanc
        , Num_lanc;
    end

    -- Parcela 10
    if ( :P10 is not null ) then
    begin
      parcela = :Parcela + 1;

      Select d.Dia_util from Get_dia_util(:Emissao, :P10) d into vencimento;

      Select
          t.Anolancamento
        , t.Numlancamento
      from SET_TITULO_RECEBER (
          :Anovenda
        , :Numvenda
        , :Cliente
        , :Forma_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela) t
      into
          Ano_lanc
        , Num_lanc;
    end

    -- Parcela 11
    if ( :P11 is not null ) then
    begin
      parcela = :Parcela + 1;

      Select d.Dia_util from Get_dia_util(:Emissao, :P11) d into vencimento;

      Select
          t.Anolancamento
        , t.Numlancamento
      from SET_TITULO_RECEBER (
          :Anovenda
        , :Numvenda
        , :Cliente
        , :Forma_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela) t
      into
          Ano_lanc
        , Num_lanc;
    end

    -- Parcela 12
    if ( :P12 is not null ) then
    begin
      parcela = :Parcela + 1;

      Select d.Dia_util from Get_dia_util(:Emissao, :P12) d into vencimento;

      Select
          t.Anolancamento
        , t.Numlancamento
      from SET_TITULO_RECEBER (
          :Anovenda
        , :Numvenda
        , :Cliente
        , :Forma_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela) t
      into
          Ano_lanc
        , Num_lanc;
    end

    -- Verificar ao valor total das parcelas
    if ( :Parcelas > 1 ) then
    begin
      Select
          sum( coalesce(r.Valorrec, 0) )
      from TBCONTREC r
      where r.Anovenda = :Anovenda
        and r.Numvenda = :Numvenda
        and r.forma_pagto = :forma_pagto
      into
          valor_total_parcelas;

      -- Atualizar o valor da ultima parcela
      if ( :Valor_total_parcelas < :Valor_total ) then
      begin
        Update TBCONTREC r Set
            r.Valorrec = :Valor_documento + (:Valor_total - :Valor_total_parcelas)
        where r.Anovenda = :Anovenda
          and r.Numvenda = :Numvenda
          and r.forma_pagto = :forma_pagto
          and r.Parcela  = :Parcela;
      end 
    end 

  end
end^

/*------ 07/01/2013 21:38:37 --------*/

SET TERM ; ^

SET TERM ^ ;

create or alter procedure SET_CAIXA_MOVIMENTO_ESTORNO_PAG (
    USUARIO varchar(12),
    DATA_PAGTO timestamp,
    FORMA_PAGTO smallint,
    ANOLANC smallint,
    NUMLANC integer,
    SEQ smallint,
    VALOR_BAIXA numeric(18,2))
as
declare variable EMPRESA varchar(18);
declare variable FORNECEDOR integer;
declare variable ANO_CAIXA smallint;
declare variable NUM_CAIXA integer;
declare variable CCR_CAIXA integer;
declare variable HISTORICO varchar(250);
declare variable ANO_COMPRA smallint;
declare variable NUM_COMPRA integer;
begin
  -- Buscar Numero do Caixa Aberto
  Select
      cx.Ano_caixa
    , cx.Num_caixa
    , cx.Conta_corrente
  from GET_CAIXA_ABERTO(:Usuario, :Data_pagto, :Forma_pagto) cx
  into
      Ano_caixa
    , Num_caixa
    , Ccr_caixa;

  -- Montar Historico
  Select
      cc.Codemp
    , cc.Codforn
    , 'COMPRA No. ' || r.Anocompra || '/' || r.Numcompra || ' - ' || f.Nomeforn
    , r.Anocompra
    , r.Numcompra
  from TBCONTPAG r
    left join TBFORNECEDOR f on (f.Codforn = r.Codforn)
    left join TBCOMPRAS cc on (cc.Ano = r.Anocompra and cc.Codcontrol = r.Numcompra)
  where r.Anolanc = :Anolanc
    and r.Numlanc = :Numlanc
  into
      Empresa
    , Fornecedor
    , Historico
    , Ano_compra
    , Num_compra;

  Historico = coalesce(:Historico, 'ESTORNO DO PAGTO. DA DUPLICATA No. ' || :Anolanc || '/' || :Numlanc || ' P' || :Seq);

  -- Inserir Movimento Caixa
  Insert Into TBCAIXA_MOVIMENTO (
      Ano
    , Numero
    , Caixa_ano
    , Caixa_num
    , Conta_corrente
    , Forma_pagto
    , Datahora
    , Tipo
    , Historico
    , Valor
    , Situacao
    , Venda_ano
    , Venda_num
    , Cliente
    , Compra_ano
    , Compra_num
    , Empresa
    , Fornecedor
    , Usuario
    , Apagar_ano
    , Apagar_num
  ) values (
      Extract(Year from :Data_pagto)
    , Null
    , :Ano_caixa
    , :Num_caixa
    , :Ccr_caixa
    , :Forma_pagto
    , :Data_pagto
    , 'C'
    , :Historico
    , :Valor_baixa
    , 1
    , Null
    , Null
    , Null
    , :Ano_compra
    , :Num_compra
    , :Empresa
    , :Fornecedor
    , :Usuario
    , :Anolanc
    , :Numlanc
  );

end^

/*------ 07/01/2013 21:38:37 --------*/

SET TERM ; ^

SET TERM ^ ;

create or alter procedure SET_CAIXA_MOVIMENTO_PAG_ESTORNO (
    USUARIO varchar(12),
    DATA_PAGTO timestamp,
    FORMA_PAGTO smallint,
    ANOLANC smallint,
    NUMLANC integer,
    SEQ smallint,
    VALOR_BAIXA numeric(18,2))
as
declare variable EMPRESA varchar(18);
declare variable FORNECEDOR integer;
declare variable ANO_CAIXA smallint;
declare variable NUM_CAIXA integer;
declare variable CCR_CAIXA integer;
declare variable HISTORICO varchar(250);
declare variable ANO_COMPRA smallint;
declare variable NUM_COMPRA integer;
begin
  -- Buscar Numero do Caixa Aberto
  Select
      cx.Ano_caixa
    , cx.Num_caixa
    , cx.Conta_corrente
  from GET_CAIXA_ABERTO(:Usuario, :Data_pagto, :Forma_pagto) cx
  into
      Ano_caixa
    , Num_caixa
    , Ccr_caixa;

  -- Montar Historico
  Select
      cc.Codemp
    , cc.Codforn
    , 'COMPRA No. ' || r.Anocompra || '/' || r.Numcompra || ' - ' || f.Nomeforn
    , r.Anocompra
    , r.Numcompra
  from TBCONTPAG r
    left join TBFORNECEDOR f on (f.Codforn = r.Codforn)
    left join TBCOMPRAS cc on (cc.Ano = r.Anocompra and cc.Codcontrol = r.Numcompra)
  where r.Anolanc = :Anolanc
    and r.Numlanc = :Numlanc
  into
      Empresa
    , Fornecedor
    , Historico
    , Ano_compra
    , Num_compra;

  Historico = coalesce(:Historico, 'ESTORNO DO PAGTO. DA DUPLICATA No. ' || :Anolanc || '/' || :Numlanc || ' P' || :Seq);

  -- Inserir Movimento Caixa
  Insert Into TBCAIXA_MOVIMENTO (
      Ano
    , Numero
    , Caixa_ano
    , Caixa_num
    , Conta_corrente
    , Forma_pagto
    , Datahora
    , Tipo
    , Historico
    , Valor
    , Situacao
    , Venda_ano
    , Venda_num
    , Cliente
    , Compra_ano
    , Compra_num
    , Empresa
    , Fornecedor
    , Usuario
    , Apagar_ano
    , Apagar_num
  ) values (
      Extract(Year from :Data_pagto)
    , Null
    , :Ano_caixa
    , :Num_caixa
    , :Ccr_caixa
    , :Forma_pagto
    , :Data_pagto
    , 'C'
    , :Historico
    , :Valor_baixa
    , 1
    , Null
    , Null
    , Null
    , :Ano_compra
    , :Num_compra
    , :Empresa
    , :Fornecedor
    , :Usuario
    , :Anolanc
    , :Numlanc
  );

end^

/*------ 07/01/2013 21:38:37 --------*/

SET TERM ; ^

DROP PROCEDURE SET_CAIXA_MOVIMENTO_ESTORNO_PAG;

/*------ 07/01/2013 21:38:37 --------*/

SET TERM ^ ;

create or alter procedure SET_CAIXA_MOVIMENTO_REC_ESTORNO (
    USUARIO varchar(12),
    DATA_PAGTO timestamp,
    FORMA_PAGTO smallint,
    ANOLANC smallint,
    NUMLANC integer,
    SEQ smallint,
    VALOR_BAIXA numeric(18,2))
as
declare variable EMPRESA varchar(18);
declare variable CLIENTE varchar(18);
declare variable ANO_CAIXA smallint;
declare variable NUM_CAIXA integer;
declare variable CCR_CAIXA integer;
declare variable HISTORICO varchar(250);
declare variable ANO_VENDA smallint;
declare variable NUM_VENDA integer;
begin
  -- Buscar Numero do Caixa Aberto
  Select
      cx.Ano_caixa
    , cx.Num_caixa
    , cx.Conta_corrente
  from GET_CAIXA_ABERTO(:Usuario, :Data_pagto, :Forma_pagto) cx
  into
      Ano_caixa
    , Num_caixa
    , Ccr_caixa;

  -- Montar Historico
  Select
      v.Codemp
    , r.Cnpj
    , 'VENDA No. ' || r.Anovenda || '/' || r.Numvenda || ' - ' || c.Nome
    , r.Anovenda
    , r.Numvenda
  from TBCONTREC r
    left join TBCLIENTE c on (c.Cnpj = r.Cnpj)
    left join TBVENDAS v on (v.Ano = r.Anovenda and v.Codcontrol = r.Numvenda)
  where r.Anolanc = :Anolanc
    and r.Numlanc = :Numlanc
  into
      Empresa
    , Cliente
    , Historico
    , Ano_venda
    , Num_venda;

  Historico = coalesce(:Historico, 'ESTORNO DO RECEBIMENTO DO TITULO No. ' || :Anolanc || '/' || :Numlanc || ' P' || :Seq);

  -- Inserir Movimento Caixa
  Insert Into TBCAIXA_MOVIMENTO (
      Ano
    , Numero
    , Caixa_ano
    , Caixa_num
    , Conta_corrente
    , Forma_pagto
    , Datahora
    , Tipo
    , Historico
    , Valor
    , Situacao
    , Venda_ano
    , Venda_num
    , Cliente
    , Compra_ano
    , Compra_num
    , Empresa
    , Fornecedor
    , Usuario
    , Areceber_ano
    , Areceber_num
  ) values (
      Extract(Year from :Data_pagto)
    , Null
    , :Ano_caixa
    , :Num_caixa
    , :Ccr_caixa
    , :Forma_pagto
    , :Data_pagto
    , 'D'
    , :Historico
    , :Valor_baixa
    , 1
    , :Ano_venda
    , :Num_venda
    , :Cliente
    , Null
    , Null
    , :Empresa
    , Null
    , :Usuario
    , :Anolanc
    , :Numlanc
  );

end^

/*------ 07/01/2013 21:38:37 --------*/

SET TERM ; ^

ALTER TABLE TBCLIENTE DROP DTCAD;

/*------ 07/01/2013 21:38:37 --------*/

ALTER TABLE TBCLIENTE
    ADD DTCAD DMN_DATE_NN;

/*------ 07/01/2013 21:38:37 --------*/

alter table TBEMPRESA
alter CODIGO position 1;

/*------ 07/01/2013 21:38:37 --------*/

alter table TBEMPRESA
alter PESSOA_FISICA position 2;

/*------ 07/01/2013 21:38:37 --------*/

alter table TBEMPRESA
alter CNPJ position 3;

/*------ 07/01/2013 21:38:37 --------*/

alter table TBEMPRESA
alter RZSOC position 4;

/*------ 07/01/2013 21:38:37 --------*/

alter table TBEMPRESA
alter NMFANT position 5;

/*------ 07/01/2013 21:38:37 --------*/

alter table TBEMPRESA
alter IE position 6;

/*------ 07/01/2013 21:38:37 --------*/

alter table TBEMPRESA
alter IM position 7;

/*------ 07/01/2013 21:38:37 --------*/

alter table TBEMPRESA
alter SEGMENTO position 8;

/*------ 07/01/2013 21:38:37 --------*/

alter table TBEMPRESA
alter CNAE position 9;

/*------ 07/01/2013 21:38:37 --------*/

alter table TBEMPRESA
alter ENDER position 10;

/*------ 07/01/2013 21:38:37 --------*/

alter table TBEMPRESA
alter COMPLEMENTO position 11;

/*------ 07/01/2013 21:38:37 --------*/

alter table TBEMPRESA
alter BAIRRO position 12;

/*------ 07/01/2013 21:38:37 --------*/

alter table TBEMPRESA
alter CEP position 13;

/*------ 07/01/2013 21:38:37 --------*/

alter table TBEMPRESA
alter CIDADE position 14;

/*------ 07/01/2013 21:38:37 --------*/

alter table TBEMPRESA
alter UF position 15;

/*------ 07/01/2013 21:38:37 --------*/

alter table TBEMPRESA
alter FONE position 16;

/*------ 07/01/2013 21:38:37 --------*/

alter table TBEMPRESA
alter FONE2 position 17;

/*------ 07/01/2013 21:38:37 --------*/

alter table TBEMPRESA
alter LOGO position 18;

/*------ 07/01/2013 21:38:37 --------*/

alter table TBEMPRESA
alter TLG_TIPO position 19;

/*------ 07/01/2013 21:38:37 --------*/

alter table TBEMPRESA
alter LOG_COD position 20;

/*------ 07/01/2013 21:38:37 --------*/

alter table TBEMPRESA
alter BAI_COD position 21;

/*------ 07/01/2013 21:38:37 --------*/

alter table TBEMPRESA
alter CID_COD position 22;

/*------ 07/01/2013 21:38:37 --------*/

alter table TBEMPRESA
alter EST_COD position 23;

/*------ 07/01/2013 21:38:37 --------*/

alter table TBEMPRESA
alter NUMERO_END position 24;

/*------ 07/01/2013 21:38:37 --------*/

alter table TBEMPRESA
alter EMAIL position 25;

/*------ 07/01/2013 21:38:37 --------*/

alter table TBEMPRESA
alter HOME_PAGE position 26;

/*------ 07/01/2013 21:38:37 --------*/

alter table TBEMPRESA
alter CHAVE_ACESSO_NFE position 27;

/*------ 07/01/2013 21:38:37 --------*/

alter table TBEMPRESA
alter PAIS_ID position 28;

/*------ 07/01/2013 21:38:37 --------*/

alter table TBEMPRESA
alter TIPO_REGIME_NFE position 29;

/*------ 07/01/2013 21:38:37 --------*/

alter table TBEMPRESA
alter SERIE_NFE position 30;

/*------ 07/01/2013 21:38:37 --------*/

alter table TBEMPRESA
alter NUMERO_NFE position 31;

/*------ 07/01/2013 21:38:37 --------*/

alter table TBEMPRESA
alter LOTE_ANO_NFE position 32;

/*------ 07/01/2013 21:38:37 --------*/

alter table TBEMPRESA
alter LOTE_NUM_NFE position 33;

/*------ 07/01/2013 21:38:37 --------*/

COMMENT ON COLUMN TBEMPRESA.FONE IS
'Telefone 1.';

/*------ 07/01/2013 21:38:37 --------*/

COMMENT ON COLUMN TBEMPRESA.FONE2 IS
'Telefone 1.';

/*------ 07/01/2013 21:38:37 --------*/

COMMENT ON COLUMN TBCLIENTE.VENDEDOR_COD IS
'Vendedor responsavel pelo cliente.';

/*------ 07/01/2013 21:38:37 --------*/

alter table TBCLIENTE
alter column CODIGO position 1;

/*------ 07/01/2013 21:38:37 --------*/

alter table TBCLIENTE
alter column PESSOA_FISICA position 2;

/*------ 07/01/2013 21:38:37 --------*/

alter table TBCLIENTE
alter column CNPJ position 3;

/*------ 07/01/2013 21:38:37 --------*/

alter table TBCLIENTE
alter column NOME position 4;

/*------ 07/01/2013 21:38:37 --------*/

alter table TBCLIENTE
alter column INSCEST position 5;

/*------ 07/01/2013 21:38:37 --------*/

alter table TBCLIENTE
alter column INSCMUN position 6;

/*------ 07/01/2013 21:38:37 --------*/

alter table TBCLIENTE
alter column ENDER position 7;

/*------ 07/01/2013 21:38:37 --------*/

alter table TBCLIENTE
alter column COMPLEMENTO position 8;

/*------ 07/01/2013 21:38:37 --------*/

alter table TBCLIENTE
alter column BAIRRO position 9;

/*------ 07/01/2013 21:38:37 --------*/

alter table TBCLIENTE
alter column CEP position 10;

/*------ 07/01/2013 21:38:37 --------*/

alter table TBCLIENTE
alter column CIDADE position 11;

/*------ 07/01/2013 21:38:37 --------*/

alter table TBCLIENTE
alter column UF position 12;

/*------ 07/01/2013 21:38:37 --------*/

alter table TBCLIENTE
alter column FONE position 13;

/*------ 07/01/2013 21:38:37 --------*/

alter table TBCLIENTE
alter column FONECEL position 14;

/*------ 07/01/2013 21:38:37 --------*/

alter table TBCLIENTE
alter column FONECOMERC position 15;

/*------ 07/01/2013 21:38:37 --------*/

alter table TBCLIENTE
alter column EMAIL position 16;

/*------ 07/01/2013 21:38:37 --------*/

alter table TBCLIENTE
alter column SITE position 17;

/*------ 07/01/2013 21:38:37 --------*/

alter table TBCLIENTE
alter column TLG_TIPO position 18;

/*------ 07/01/2013 21:38:37 --------*/

alter table TBCLIENTE
alter column LOG_COD position 19;

/*------ 07/01/2013 21:38:37 --------*/

alter table TBCLIENTE
alter column BAI_COD position 20;

/*------ 07/01/2013 21:38:37 --------*/

alter table TBCLIENTE
alter column CID_COD position 21;

/*------ 07/01/2013 21:38:37 --------*/

alter table TBCLIENTE
alter column EST_COD position 22;

/*------ 07/01/2013 21:38:37 --------*/

alter table TBCLIENTE
alter column NUMERO_END position 23;

/*------ 07/01/2013 21:38:37 --------*/

alter table TBCLIENTE
alter column PAIS_ID position 24;

/*------ 07/01/2013 21:38:37 --------*/

alter table TBCLIENTE
alter column VALOR_LIMITE_COMPRA position 25;

/*------ 07/01/2013 21:38:37 --------*/

alter table TBCLIENTE
alter column BLOQUEADO position 26;

/*------ 07/01/2013 21:38:37 --------*/

alter table TBCLIENTE
alter column BLOQUEADO_DATA position 27;

/*------ 07/01/2013 21:38:37 --------*/

alter table TBCLIENTE
alter column BLOQUEADO_MOTIVO position 28;

/*------ 07/01/2013 21:38:37 --------*/

alter table TBCLIENTE
alter column BLOQUEADO_USUARIO position 29;

/*------ 07/01/2013 21:38:37 --------*/

alter table TBCLIENTE
alter column DESBLOQUEADO_DATA position 30;

/*------ 07/01/2013 21:38:37 --------*/

alter table TBCLIENTE
alter column DTCAD position 31;

/*------ 07/01/2013 21:38:37 --------*/

alter table TBCLIENTE
alter column VENDEDOR_COD position 32;

/*------ 07/01/2013 21:38:37 --------*/

COMMENT ON COLUMN TBCLIENTE.FONE IS
'Telefone Fixo.';

/*------ 07/01/2013 21:38:37 --------*/

COMMENT ON COLUMN TBCLIENTE.FONECEL IS
'Telefone Celular.';

/*------ 07/01/2013 21:38:37 --------*/

COMMENT ON COLUMN TBCLIENTE.FONECOMERC IS
'Telefone Comercial.';

/*------ 07/01/2013 21:38:37 --------*/

GRANT ALL ON VW_TIPO_MOVIMENTO_CAIXA TO "PUBLIC";