


/*------ SYSDBA 14/05/2012 17:03:14 --------*/

ALTER TABLE TBVENDEDOR
    ADD COMISSAO DECIMAL(2,2);



/*------ SYSDBA 15/05/2012 17:38:45 --------*/

ALTER TABLE TBCLIENTE
    ADD DTCAD DATE;



/*------ SYSDBA 16/05/2012 14:30:25 --------*/

ALTER TABLE TBCLIENTE DROP DTCAD;



/*------ SYSDBA 16/05/2012 14:33:39 --------*/

ALTER TABLE TBCLIENTE
    ADD DTCAD DMN_DATE_NN;



/*------ SYSDBA 03/01/2013 15:57:03 --------*/

ALTER TABLE TBCLIENTE
    ADD VENDEDOR_COD INTEGER;




/*------ SYSDBA 03/01/2013 15:57:57 --------*/

ALTER TABLE TBCLIENTE
ADD CONSTRAINT FK_TBCLIENTE_VENDEDOR
FOREIGN KEY (VENDEDOR_COD)
REFERENCES TBVENDEDOR(COD);




/*------ SYSDBA 03/01/2013 17:06:42 --------*/

ALTER TABLE TBCLIENTE
    ADD FONECEL DMN_FONERSD,
    ADD FONECOMERC DMN_FONERSD;




/*------ SYSDBA 03/01/2013 17:07:44 --------*/

ALTER TABLE TBEMPRESA
    ADD FONE2 DMN_FONERSD;

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
alter SEGMENTO position 8;

alter table TBEMPRESA
alter CNAE position 9;

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
alter FONE2 position 17;

alter table TBEMPRESA
alter LOGO position 18;

alter table TBEMPRESA
alter TLG_TIPO position 19;

alter table TBEMPRESA
alter LOG_COD position 20;

alter table TBEMPRESA
alter BAI_COD position 21;

alter table TBEMPRESA
alter CID_COD position 22;

alter table TBEMPRESA
alter EST_COD position 23;

alter table TBEMPRESA
alter NUMERO_END position 24;

alter table TBEMPRESA
alter EMAIL position 25;

alter table TBEMPRESA
alter HOME_PAGE position 26;

alter table TBEMPRESA
alter CHAVE_ACESSO_NFE position 27;

alter table TBEMPRESA
alter PAIS_ID position 28;

alter table TBEMPRESA
alter TIPO_REGIME_NFE position 29;

alter table TBEMPRESA
alter SERIE_NFE position 30;

alter table TBEMPRESA
alter NUMERO_NFE position 31;

alter table TBEMPRESA
alter LOTE_ANO_NFE position 32;

alter table TBEMPRESA
alter LOTE_NUM_NFE position 33;

