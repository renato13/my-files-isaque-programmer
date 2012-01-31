
/*------ SYSDBA 25/01/2012 13:26:00 --------*/

CREATE TABLE TBTPDESPESA (
    COD SMALLINT NOT NULL,
    TIPODESP VARCHAR(25));
alter table TBTPDESPESA
add constraint PK_TBTPDESPESA
primary key (COD);
CREATE SEQUENCE GEN_TBTPDESPESA_ID;



/*------ SYSDBA 25/01/2012 13:26:29 --------*/

ALTER TABLE TBCONTPAG
    ADD CODTPDESP SMALLINT;



/*------ SYSDBA 25/01/2012 13:26:57 --------*/

alter table TBCONTPAG
add constraint FK_TBCONTPAG_1
foreign key (CODTPDESP)
references TBTPDESPESA(COD);




ALTER TABLE TBEMPRESA
    ADD TIPO_REGIME_NFE SMALLINT;
COMMENT ON COLUMN TBEMPRESA.TIPO_REGIME_NFE IS
'CRT:

1. Simples Nacional
2. Simples Excesso Receita
3. Regime Normal';
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
alter ENDER position 8;
alter table TBEMPRESA
alter COMPLEMENTO position 9;
alter table TBEMPRESA
alter BAIRRO position 10;
alter table TBEMPRESA
alter CEP position 11;
alter table TBEMPRESA
alter CIDADE position 12;
alter table TBEMPRESA
alter UF position 13;
alter table TBEMPRESA
alter FONE position 14;
alter table TBEMPRESA
alter LOGO position 15;
alter table TBEMPRESA
alter TLG_TIPO position 16;
alter table TBEMPRESA
alter LOG_COD position 17;
alter table TBEMPRESA
alter BAI_COD position 18;
alter table TBEMPRESA
alter CID_COD position 19;
alter table TBEMPRESA
alter EST_COD position 20;
alter table TBEMPRESA
alter NUMERO_END position 21;
alter table TBEMPRESA
alter EMAIL position 22;
alter table TBEMPRESA
alter HOME_PAGE position 23;
alter table TBEMPRESA
alter CHAVE_ACESSO_NFE position 24;
alter table TBEMPRESA
alter TIPO_REGIME_NFE position 25;
alter table TBEMPRESA
alter PAIS_ID position 26;


ALTER TABLE TBEMPRESA
    ADD SERIE_NFE SMALLINT,
    ADD NUMERO_NFE INTEGER;
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
alter ENDER position 8;
alter table TBEMPRESA
alter COMPLEMENTO position 9;
alter table TBEMPRESA
alter BAIRRO position 10;
alter table TBEMPRESA
alter CEP position 11;
alter table TBEMPRESA
alter CIDADE position 12;
alter table TBEMPRESA
alter UF position 13;
alter table TBEMPRESA
alter FONE position 14;
alter table TBEMPRESA
alter LOGO position 15;
alter table TBEMPRESA
alter TLG_TIPO position 16;
alter table TBEMPRESA
alter LOG_COD position 17;
alter table TBEMPRESA
alter BAI_COD position 18;
alter table TBEMPRESA
alter CID_COD position 19;
alter table TBEMPRESA
alter EST_COD position 20;
alter table TBEMPRESA
alter NUMERO_END position 21;
alter table TBEMPRESA
alter EMAIL position 22;
alter table TBEMPRESA
alter HOME_PAGE position 23;
alter table TBEMPRESA
alter CHAVE_ACESSO_NFE position 24;
alter table TBEMPRESA
alter TIPO_REGIME_NFE position 25;
alter table TBEMPRESA
alter SERIE_NFE position 26;
alter table TBEMPRESA
alter NUMERO_NFE position 27;
alter table TBEMPRESA
alter PAIS_ID position 28;


COMMENT ON COLUMN TBEMPRESA.TIPO_REGIME_NFE IS
'CRT:

0. Simples Nacional (1)
1. Simples Excesso Receita (2)
2. Regime Normal (3)';


CREATE VIEW VW_TIPO_REGIME_NFE(
    CODIGO,
    DESCRICAO)
AS
Select First 1
    0 as Codigo
  , 'Simples Nacional (1)' as Descricao
from TBORIGEMPROD

union

Select First 1
    1 as Codigo
  , 'Simples Excesso Receita (2)' as Descricao
from TBORIGEMPROD

union

Select First 1
    1 as Codigo
  , 'Regime Normal (3)' as Descricao
from TBORIGEMPROD
;


ALTER TABLE TBEMPRESA
    ADD LOTE_ANO_NFE SMALLINT,
    ADD LOTE_NUM_NFE INTEGER;
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
alter ENDER position 8;
alter table TBEMPRESA
alter COMPLEMENTO position 9;
alter table TBEMPRESA
alter BAIRRO position 10;
alter table TBEMPRESA
alter CEP position 11;
alter table TBEMPRESA
alter CIDADE position 12;
alter table TBEMPRESA
alter UF position 13;
alter table TBEMPRESA
alter FONE position 14;
alter table TBEMPRESA
alter LOGO position 15;
alter table TBEMPRESA
alter TLG_TIPO position 16;
alter table TBEMPRESA
alter LOG_COD position 17;
alter table TBEMPRESA
alter BAI_COD position 18;
alter table TBEMPRESA
alter CID_COD position 19;
alter table TBEMPRESA
alter EST_COD position 20;
alter table TBEMPRESA
alter NUMERO_END position 21;
alter table TBEMPRESA
alter EMAIL position 22;
alter table TBEMPRESA
alter HOME_PAGE position 23;
alter table TBEMPRESA
alter CHAVE_ACESSO_NFE position 24;
alter table TBEMPRESA
alter TIPO_REGIME_NFE position 25;
alter table TBEMPRESA
alter SERIE_NFE position 26;
alter table TBEMPRESA
alter NUMERO_NFE position 27;
alter table TBEMPRESA
alter LOTE_ANO_NFE position 28;
alter table TBEMPRESA
alter LOTE_NUM_NFE position 29;
alter table TBEMPRESA
alter PAIS_ID position 30;


CREATE SEQUENCE GEN_NUMERO_LOTE_NFE_2011;
CREATE SEQUENCE GEN_NUMERO_LOTE_NFE_2012;
CREATE SEQUENCE GEN_NUMERO_LOTE_NFE_2013;
CREATE SEQUENCE GEN_NUMERO_LOTE_NFE_2014;
CREATE SEQUENCE GEN_NUMERO_LOTE_NFE_2015;
CREATE SEQUENCE GEN_NUMERO_LOTE_NFE_2016;
CREATE SEQUENCE GEN_NUMERO_LOTE_NFE_2017;
CREATE SEQUENCE GEN_NUMERO_LOTE_NFE_2018;
CREATE SEQUENCE GEN_NUMERO_LOTE_NFE_2019;
CREATE SEQUENCE GEN_NUMERO_LOTE_NFE_2020;
>>>>>>> .r61
