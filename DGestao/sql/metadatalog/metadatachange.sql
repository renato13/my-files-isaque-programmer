
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
<<<<<<< .mine


ALTER TABLE TBVENDAS
    ADD LOTE_NFE_ANO SMALLINT,
    ADD LOTE_NFE_NUMERO INTEGER,
    ADD NFE_ENVIADA DMN_LOGICO,
    ADD CANCEL_DATAHORA TIMESTAMP,
    ADD CANCEL_MOTIVO DMN_TEXTO;
alter table TBVENDAS
alter ANO position 1;
alter table TBVENDAS
alter CODCONTROL position 2;
alter table TBVENDAS
alter CODEMP position 3;
alter table TBVENDAS
alter CODCLI position 4;
alter table TBVENDAS
alter DTVENDA position 5;
alter table TBVENDAS
alter STATUS position 6;
alter table TBVENDAS
alter DESCONTO position 7;
alter table TBVENDAS
alter TOTALVENDA position 8;
alter table TBVENDAS
alter DTFINALIZACAO_VENDA position 9;
alter table TBVENDAS
alter OBS position 10;
alter table TBVENDAS
alter FORMAPAG position 11;
alter table TBVENDAS
alter FATDIAS position 12;
alter table TBVENDAS
alter SERIE position 13;
alter table TBVENDAS
alter NFE position 14;
alter table TBVENDAS
alter LOTE_NFE_ANO position 15;
alter table TBVENDAS
alter LOTE_NFE_NUMERO position 16;
alter table TBVENDAS
alter NFE_ENVIADA position 17;
alter table TBVENDAS
alter DATAEMISSAO position 18;
alter table TBVENDAS
alter HORAEMISSAO position 19;
alter table TBVENDAS
alter CANCEL_DATAHORA position 20;
alter table TBVENDAS
alter CANCEL_MOTIVO position 21;
alter table TBVENDAS
alter CFOP position 22;
alter table TBVENDAS
alter VERIFICADOR_NFE position 23;
alter table TBVENDAS
alter XML_NFE position 24;
alter table TBVENDAS
alter VENDEDOR_COD position 25;
alter table TBVENDAS
alter USUARIO position 26;
alter table TBVENDAS
alter FORMAPAGTO_COD position 27;
alter table TBVENDAS
alter CONDICAOPAGTO_COD position 28;
alter table TBVENDAS
alter VENDA_PRAZO position 29;
alter table TBVENDAS
alter PRAZO_01 position 30;
alter table TBVENDAS
alter PRAZO_02 position 31;
alter table TBVENDAS
alter PRAZO_03 position 32;
alter table TBVENDAS
alter PRAZO_04 position 33;
alter table TBVENDAS
alter PRAZO_05 position 34;
alter table TBVENDAS
alter PRAZO_06 position 35;
alter table TBVENDAS
alter PRAZO_07 position 36;
alter table TBVENDAS
alter PRAZO_08 position 37;
alter table TBVENDAS
alter PRAZO_09 position 38;
alter table TBVENDAS
alter PRAZO_10 position 39;
alter table TBVENDAS
alter PRAZO_11 position 40;
alter table TBVENDAS
alter PRAZO_12 position 41;
alter table TBVENDAS
alter NFE_VALOR_BASE_ICMS position 42;
alter table TBVENDAS
alter NFE_VALOR_ICMS position 43;
alter table TBVENDAS
alter NFE_VALOR_BASE_ICMS_SUBST position 44;
alter table TBVENDAS
alter NFE_VALOR_ICMS_SUBST position 45;
alter table TBVENDAS
alter NFE_VALOR_TOTAL_PRODUTO position 46;
alter table TBVENDAS
alter NFE_VALOR_FRETE position 47;
alter table TBVENDAS
alter NFE_VALOR_SEGURO position 48;
alter table TBVENDAS
alter NFE_VALOR_DESCONTO position 49;
alter table TBVENDAS
alter NFE_VALOR_TOTAL_II position 50;
alter table TBVENDAS
alter NFE_VALOR_TOTAL_IPI position 51;
alter table TBVENDAS
alter NFE_VALOR_PIS position 52;
alter table TBVENDAS
alter NFE_VALOR_COFINS position 53;
alter table TBVENDAS
alter NFE_VALOR_OUTROS position 54;
alter table TBVENDAS
alter NFE_VALOR_TOTAL_NOTA position 55;


UPDATE TBVENDAS
SET NFE_ENVIADA = 0;


ALTER TABLE TBVENDAS
    ADD XML_NFE_FILENAME VARCHAR(250);
alter table TBVENDAS
alter ANO position 1;
alter table TBVENDAS
alter CODCONTROL position 2;
alter table TBVENDAS
alter CODEMP position 3;
alter table TBVENDAS
alter CODCLI position 4;
alter table TBVENDAS
alter DTVENDA position 5;
alter table TBVENDAS
alter STATUS position 6;
alter table TBVENDAS
alter DESCONTO position 7;
alter table TBVENDAS
alter TOTALVENDA position 8;
alter table TBVENDAS
alter DTFINALIZACAO_VENDA position 9;
alter table TBVENDAS
alter OBS position 10;
alter table TBVENDAS
alter FORMAPAG position 11;
alter table TBVENDAS
alter FATDIAS position 12;
alter table TBVENDAS
alter SERIE position 13;
alter table TBVENDAS
alter NFE position 14;
alter table TBVENDAS
alter LOTE_NFE_ANO position 15;
alter table TBVENDAS
alter LOTE_NFE_NUMERO position 16;
alter table TBVENDAS
alter NFE_ENVIADA position 17;
alter table TBVENDAS
alter DATAEMISSAO position 18;
alter table TBVENDAS
alter HORAEMISSAO position 19;
alter table TBVENDAS
alter CANCEL_DATAHORA position 20;
alter table TBVENDAS
alter CANCEL_MOTIVO position 21;
alter table TBVENDAS
alter CFOP position 22;
alter table TBVENDAS
alter VERIFICADOR_NFE position 23;
alter table TBVENDAS
alter XML_NFE_FILENAME position 24;
alter table TBVENDAS
alter XML_NFE position 25;
alter table TBVENDAS
alter VENDEDOR_COD position 26;
alter table TBVENDAS
alter USUARIO position 27;
alter table TBVENDAS
alter FORMAPAGTO_COD position 28;
alter table TBVENDAS
alter CONDICAOPAGTO_COD position 29;
alter table TBVENDAS
alter VENDA_PRAZO position 30;
alter table TBVENDAS
alter PRAZO_01 position 31;
alter table TBVENDAS
alter PRAZO_02 position 32;
alter table TBVENDAS
alter PRAZO_03 position 33;
alter table TBVENDAS
alter PRAZO_04 position 34;
alter table TBVENDAS
alter PRAZO_05 position 35;
alter table TBVENDAS
alter PRAZO_06 position 36;
alter table TBVENDAS
alter PRAZO_07 position 37;
alter table TBVENDAS
alter PRAZO_08 position 38;
alter table TBVENDAS
alter PRAZO_09 position 39;
alter table TBVENDAS
alter PRAZO_10 position 40;
alter table TBVENDAS
alter PRAZO_11 position 41;
alter table TBVENDAS
alter PRAZO_12 position 42;
alter table TBVENDAS
alter NFE_VALOR_BASE_ICMS position 43;
alter table TBVENDAS
alter NFE_VALOR_ICMS position 44;
alter table TBVENDAS
alter NFE_VALOR_BASE_ICMS_SUBST position 45;
alter table TBVENDAS
alter NFE_VALOR_ICMS_SUBST position 46;
alter table TBVENDAS
alter NFE_VALOR_TOTAL_PRODUTO position 47;
alter table TBVENDAS
alter NFE_VALOR_FRETE position 48;
alter table TBVENDAS
alter NFE_VALOR_SEGURO position 49;
alter table TBVENDAS
alter NFE_VALOR_DESCONTO position 50;
alter table TBVENDAS
alter NFE_VALOR_TOTAL_II position 51;
alter table TBVENDAS
alter NFE_VALOR_TOTAL_IPI position 52;
alter table TBVENDAS
alter NFE_VALOR_PIS position 53;
alter table TBVENDAS
alter NFE_VALOR_COFINS position 54;
alter table TBVENDAS
alter NFE_VALOR_OUTROS position 55;
alter table TBVENDAS
alter NFE_VALOR_TOTAL_NOTA position 56;
=======
>>>>>>> .r61
>>>>>>> .r64
