
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
