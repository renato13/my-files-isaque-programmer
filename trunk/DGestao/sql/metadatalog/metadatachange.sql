


/*------ 09/02/2012 10:23:41: Creating domain DMN_MONEY_DESCONTO... --------*/

CREATE DOMAIN DMN_MONEY_DESCONTO AS
  NUMERIC(15, 3)
  DEFAULT 0;






/*------ 09/02/2012 12:54:08: Adding field DESCONTO_VALOR to table... --------*/

ALTER TABLE TVENDASITENS ADD DESCONTO_VALOR DMN_MONEY_DESCONTO;



/*------ 09/02/2012 12:54:22: Executing statement... --------*/

ALTER TABLE TVENDASITENS
ALTER COLUMN DESCONTO_VALOR
POSITION 11;



/*------ 09/02/2012 12:54:22: Executing statement... --------*/

ALTER TABLE TVENDASITENS
ALTER COLUMN PFINAL
POSITION 12;



/*------ 09/02/2012 12:54:22: Executing statement... --------*/

ALTER TABLE TVENDASITENS
ALTER COLUMN QTDEFINAL
POSITION 13;



/*------ 09/02/2012 12:54:22: Executing statement... --------*/

ALTER TABLE TVENDASITENS
ALTER COLUMN UNID_COD
POSITION 14;



/*------ 09/02/2012 12:54:22: Executing statement... --------*/

ALTER TABLE TVENDASITENS
ALTER COLUMN CFOP_COD
POSITION 15;



/*------ 09/02/2012 12:54:22: Executing statement... --------*/

ALTER TABLE TVENDASITENS
ALTER COLUMN ALIQUOTA
POSITION 16;



/*------ 09/02/2012 12:54:22: Executing statement... --------*/

ALTER TABLE TVENDASITENS
ALTER COLUMN ALIQUOTA_CSOSN
POSITION 17;



/*------ 09/02/2012 12:54:22: Executing statement... --------*/

ALTER TABLE TVENDASITENS
ALTER COLUMN VALOR_IPI
POSITION 18;



/*------ 09/02/2012 12:54:56: Setting description for DESCONTO_VALOR... --------*/

UPDATE RDB$RELATION_FIELDS SET
RDB$DESCRIPTION = :VALUE
WHERE RDB$RELATION_NAME = 'TVENDASITENS'
AND RDB$FIELD_NAME = 'DESCONTO_VALOR';



/*------ 09/02/2012 13:22:35: Changing domain for field DESCONTO_VALOR... --------*/

ALTER TABLE TVENDASITENS
ALTER COLUMN DESCONTO_VALOR
TYPE DMN_MONEY;


ALTER TABLE TBEMPRESA
    ADD CNAE VARCHAR(11);
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
alter ENDER position 9;
alter table TBEMPRESA
alter COMPLEMENTO position 10;
alter table TBEMPRESA
alter BAIRRO position 11;
alter table TBEMPRESA
alter CEP position 12;
alter table TBEMPRESA
alter CIDADE position 13;
alter table TBEMPRESA
alter UF position 14;
alter table TBEMPRESA
alter FONE position 15;
alter table TBEMPRESA
alter LOGO position 16;
alter table TBEMPRESA
alter TLG_TIPO position 17;
alter table TBEMPRESA
alter LOG_COD position 18;
alter table TBEMPRESA
alter BAI_COD position 19;
alter table TBEMPRESA
alter CID_COD position 20;
alter table TBEMPRESA
alter EST_COD position 21;
alter table TBEMPRESA
alter NUMERO_END position 22;
alter table TBEMPRESA
alter EMAIL position 23;
alter table TBEMPRESA
alter HOME_PAGE position 24;
alter table TBEMPRESA
alter CHAVE_ACESSO_NFE position 25;
alter table TBEMPRESA
alter PAIS_ID position 26;
alter table TBEMPRESA
alter TIPO_REGIME_NFE position 27;
alter table TBEMPRESA
alter SERIE_NFE position 28;
alter table TBEMPRESA
alter NUMERO_NFE position 29;
alter table TBEMPRESA
alter LOTE_ANO_NFE position 30;
alter table TBEMPRESA
alter LOTE_NUM_NFE position 31;


SET TERM ^ ;

CREATE OR ALTER Trigger Tg_vendasitens_reservar For Tvendasitens
Active After Insert Or Update Or Delete Position 1
AS
  --declare variable status_venda Smallint;
  declare variable reserva integer;
begin
  /*
  Select
    v.Status
  from TBVENDAS v
  where v.Ano = new.Ano
    and v.Codcontrol = new.Codcontrol
  into
    status_venda;
  */

  Exit; -- Descontinuada RESERVA

  if ( Inserting or Updating  ) then
  begin
      Select
         coalesce(p.Reserva, 0) - coalesce(old.Qtde, 0) + coalesce(new.Qtde, 0)
      from TBPRODUTO p
      where p.Cod    = new.Codprod
        and p.Codemp = new.Codemp
      into
        Reserva;
  end

  else

  if ( Deleting  ) then
  begin
      Select
         coalesce(p.Reserva, 0) - coalesce(old.Qtde, 0)
      from TBPRODUTO p
      where p.Cod    = old.Codprod
        and p.Codemp = old.Codemp
      into
        Reserva;
  end

  Update TBPRODUTO Set
    Reserva = :Reserva
  where Cod    = new.Codprod
    and Codemp = new.Codemp;
end
^

SET TERM ; ^

