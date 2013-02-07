/*------ SYSDBA 29/01/2013 16:47:19 --------*/

COMMENT ON DOMAIN DMN_MONEY_DESCONTO IS 'Valor Desconto c/ 3 cadas decimais.';

CREATE DOMAIN DMN_MONEY_DESCONTO_4 AS
NUMERIC(15,4)
DEFAULT 0;COMMENT ON DOMAIN DMN_MONEY_DESCONTO_4 IS 'Valor Desconto c/ 4 cadas decimais.';




/*------ SYSDBA 29/01/2013 16:53:42 --------*/

CREATE DOMAIN DMN_PERCENTUAL_3 AS
NUMERIC(15,3)
DEFAULT 0;COMMENT ON DOMAIN DMN_PERCENTUAL_3 IS 'Percentual c/ 3 casas decimais.';

CREATE DOMAIN DMN_PERCENTUAL_2 AS
NUMERIC(15,2)
DEFAULT 0;COMMENT ON DOMAIN DMN_PERCENTUAL_2 IS 'Percentual c/ 2 casas decimais.';

CREATE DOMAIN DMN_PERCENTUAL_4 AS
NUMERIC(15,4)
DEFAULT 0;COMMENT ON DOMAIN DMN_PERCENTUAL_4 IS 'Percentual c/ 4 casas decimais.';




/*------ SYSDBA 29/01/2013 16:55:19 --------*/

COMMENT ON COLUMN TBVENDAS.DESCONTO IS
'Valor Total Desconto.';




/*------ SYSDBA 29/01/2013 16:55:46 --------*/

COMMENT ON COLUMN TBVENDAS.NFE_VALOR_DESCONTO IS
'NFe - Valor Total Desconto.';




/*------ SYSDBA 29/01/2013 16:56:39 --------*/

update RDB$RELATION_FIELDS set
RDB$FIELD_SOURCE = 'DMN_PERCENTUAL_2'
where (RDB$FIELD_NAME = 'DESCONTO') and
(RDB$RELATION_NAME = 'TBVENDAS')
;

COMMENT ON COLUMN TBVENDAS.DESCONTO IS
'Valor Total Desconto.';




/*------ SYSDBA 29/01/2013 16:57:12 --------*/

update RDB$RELATION_FIELDS set
RDB$FIELD_SOURCE = 'DMN_MONEY_DESCONTO_4'
where (RDB$FIELD_NAME = 'DESCONTO') and
(RDB$RELATION_NAME = 'TBVENDAS')
;

COMMENT ON COLUMN TBVENDAS.DESCONTO IS
'Valor Total Desconto.';




/*------ SYSDBA 29/01/2013 16:59:39 --------*/

update RDB$RELATION_FIELDS set
RDB$FIELD_SOURCE = 'DMN_MONEY'
where (RDB$FIELD_NAME = 'DESCONTO') and
(RDB$RELATION_NAME = 'TBVENDAS')
;

COMMENT ON COLUMN TBVENDAS.DESCONTO IS
'Valor Total Desconto.';




/*------ SYSDBA 29/01/2013 17:00:14 --------*/

update RDB$RELATION_FIELDS set
RDB$FIELD_SOURCE = 'DMN_PERCENTUAL_3'
where (RDB$FIELD_NAME = 'DESCONTO') and
(RDB$RELATION_NAME = 'TVENDASITENS')
;

COMMENT ON COLUMN TVENDASITENS.DESCONTO IS
'Percentual desconto.';




/*------ SYSDBA 29/01/2013 17:00:25 --------*/

update RDB$RELATION_FIELDS set
RDB$FIELD_SOURCE = 'DMN_MONEY_DESCONTO_4'
where (RDB$FIELD_NAME = 'DESCONTO_VALOR') and
(RDB$RELATION_NAME = 'TVENDASITENS')
;

COMMENT ON COLUMN TVENDASITENS.DESCONTO_VALOR IS
'Valor desconto (Unitario).';




/*------ SYSDBA 30/01/2013 16:07:12 --------*/

update RDB$RELATION_FIELDS set
RDB$FIELD_SOURCE = 'DMN_MONEY_DESCONTO_4'
where (RDB$FIELD_NAME = 'DESCONTO') and
(RDB$RELATION_NAME = 'TBVENDAS')
;

COMMENT ON COLUMN TBVENDAS.DESCONTO IS
'Valor Total Desconto.';




/*------ SYSDBA 30/01/2013 16:09:02 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_vendasitens_total_venda for tvendasitens
active after insert or update or delete position 10
AS
  declare variable anovenda Smallint;
  declare variable numvenda Integer;
  declare variable total_bruto Dmn_money;
  declare variable total_desconto dmn_money_desconto_4;
begin
  if ( (Inserting) or (Updating) ) then
  begin
    anovenda = new.Ano;
    numvenda = new.Codcontrol;
  end
  else
  begin
    anovenda = old.Ano;
    numvenda = old.Codcontrol;
  end

  Select
      sum( coalesce(i.Qtde, 0) * coalesce(i.Punit, 0) )
    --, sum( coalesce(i.Qtde, 0) * (coalesce(i.Punit, 0) - coalesce(i.Pfinal, 0)) )
    , sum( coalesce(i.Qtde, 0) * coalesce(i.desconto_valor, 0) )
  from TVENDASITENS i
  where i.Ano = :Anovenda
    and i.Codcontrol = :Numvenda
  into
      Total_bruto
    , Total_desconto;

  Total_bruto    = coalesce(:Total_bruto, 0);
  Total_desconto = coalesce(:Total_desconto, 0);

  Update TBVENDAS v Set
      v.Desconto = :Total_desconto
    , v.Totalvenda = :Total_bruto - :Total_desconto
  where v.Ano = :Anovenda
    and v.Codcontrol = :Numvenda;
end
^

SET TERM ; ^


/*!!! Error occured !!!
Invalid token.
Dynamic SQL Error.
SQL error code = -104.
Token unknown - line 15, column 46.
as.

*/

/*!!! Error occured !!!
Invalid token.
Dynamic SQL Error.
SQL error code = -104.
Token unknown - line 9, column 74.
i.

*/

/*!!! Error occured !!!
Invalid token.
Dynamic SQL Error.
SQL error code = -104.
Token unknown - line 9, column 18.
and.

*/



/*------ SYSDBA 06/02/2013 01:23:14 --------*/

COMMENT ON COLUMN TBVENDAS.STATUS IS
'Status:
1 - Em Atendimento
2 - Aberta
3 - Finalizada
4 - NF-e emitida
5 - Cancelada';




/*------ SYSDBA 07/02/2013 16:37:51 --------*/

CREATE DOMAIN DMN_MONEY_4 AS
NUMERIC(15,4);


/*------ SYSDBA 07/02/2013 16:46:12 --------*/

update RDB$RELATION_FIELDS set
RDB$FIELD_SOURCE = 'DMN_MONEY'
where (RDB$FIELD_NAME = 'PFINAL') and
(RDB$RELATION_NAME = 'TVENDASITENS')
;

COMMENT ON COLUMN TVENDASITENS.PFINAL IS
'';

