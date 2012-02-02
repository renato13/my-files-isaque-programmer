


/*------ SYSDBA 01/02/2012 23:13:46 --------*/

CREATE TABLE TBFUNCAO (
    COD SMALLINT NOT NULL,
    FUNCAO VARCHAR(25));
alter table TBFUNCAO
add constraint PK_TBFUNCAO
primary key (COD);
CREATE SEQUENCE GEN_TBFUNCAO_ID;



/*------ SYSDBA 01/02/2012 23:14:00 --------*/

alter table TBFUNCAO
add constraint UNQ1_TBFUNCAO
unique (FUNCAO);



/*------ SYSDBA 01/02/2012 23:14:57 --------*/

ALTER TABLE TBUSERS DROP FUNCAO;



/*------ SYSDBA 01/02/2012 23:15:35 --------*/

update RDB$FIELDS set
RDB$FIELD_LENGTH = 16,
RDB$CHARACTER_LENGTH = 16
where RDB$FIELD_NAME = 'RDB$602'
;



/*------ SYSDBA 01/02/2012 23:16:18 --------*/

ALTER TABLE TBUSERS
    ADD CODFUNCAO SMALLINT NOT NULL;



/*------ SYSDBA 01/02/2012 23:16:31 --------*/

UPDATE TBUSERS
SET CODFUNCAO = 1;



/*------ SYSDBA 01/02/2012 23:24:30 --------*/

alter table TBUSERS
add constraint FK_TBUSERS_1
foreign key (CODFUNCAO)
references TBFUNCAO(COD);
