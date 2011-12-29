CREATE DOMAIN DMN_LOGICO AS
SMALLINT
DEFAULT 0
NOT NULL
CHECK (value between 0 and 1);

ALTER DOMAIN DMN_END
TYPE VARCHAR(250) CHARACTER SET ISO8859_2;

ALTER TABLE TBEMPRESA
    ADD CODIGO INTEGER NOT NULL,
    ADD PESSOA_FISICA DMN_LOGICO,
    ADD COMPLEMENTO VARCHAR(50),
    ADD TLG_TIPO SMALLINT,
    ADD LOG_COD INTEGER,
    ADD BAI_COD INTEGER,
    ADD CID_COD INTEGER,
    ADD EST_COD SMALLINT;
    
alter table TBEMPRESA alter CODIGO position 1;

alter table TBEMPRESA alter PESSOA_FISICA position 2;

alter table TBEMPRESA alter CNPJ position 3;

alter table TBEMPRESA alter RZSOC position 4;

alter table TBEMPRESA alter NMFANT position 5;

alter table TBEMPRESA alter IE position 6;

alter table TBEMPRESA alter IM position 7;

alter table TBEMPRESA alter ENDER position 8;

alter table TBEMPRESA alter COMPLEMENTO position 9;

alter table TBEMPRESA alter BAIRRO position 10;

alter table TBEMPRESA alter CEP position 11;

alter table TBEMPRESA alter CIDADE position 12;

alter table TBEMPRESA alter UF position 13;

alter table TBEMPRESA alter FONE position 14;

alter table TBEMPRESA alter LOGO position 15;

alter table TBEMPRESA alter TLG_TIPO position 16;

alter table TBEMPRESA alter LOG_COD position 17;

alter table TBEMPRESA alter BAI_COD position 18;

alter table TBEMPRESA alter CID_COD position 19;

alter table TBEMPRESA alter EST_COD position 20;

CREATE SEQUENCE GEN_EMPRESA_ID;

Create Trigger Tg_empresa_cod For Tbempresa
Active Before Insert Position 0
As
Begin
  If (New.Codigo Is Null) Then
    New.Codigo = Gen_id(Gen_empresa_id, 1);
End;

alter table TBEMPRESA
add constraint UNQ_TBEMPRESA_CODIGO
unique (CODIGO);    

alter table TBEMPRESA
add constraint FK_TBEMPRESA_TIPO_LOG
foreign key (TLG_TIPO)
references TBTIPO_LOGRADOURO(TLG_COD)
on update CASCADE;

alter table TBEMPRESA
add constraint FK_TBEMPRESA_LOG
foreign key (LOG_COD)
references TBLOGRADOURO(LOG_COD)
on update CASCADE;

alter table TBEMPRESA
add constraint FK_TBEMPRESA_BAI
foreign key (BAI_COD)
references TBBAIRRO(BAI_COD)
on update CASCADE;

alter table TBEMPRESA
add constraint FK_TBEMPRESA_CID
foreign key (CID_COD)
references TBCIDADE(CID_COD)
on update CASCADE;

alter table TBEMPRESA
add constraint FK_TBEMPRESA_EST
foreign key (EST_COD)
references TBESTADO(EST_COD)
on update CASCADE;

ALTER TABLE TBEMPRESA
    ADD NUMERO_END VARCHAR(10);

ALTER TABLE TBEMPRESA
    ADD EMAIL VARCHAR(100),
    ADD HOME_PAGE VARCHAR(100),
    ADD CHAVE_ACESSO_NFE VARCHAR(250),
    ADD PAIS_ID VARCHAR(5);
    
        