


/*------ SYSDBA 21/01/2012 18:50:59 --------*/

CREATE TABLE TBTESTE (
    COD INTEGER NOT NULL,
    NOME VARCHAR(10));
alter table TBTESTE
add constraint PK_TBTESTE
primary key (COD);



/*------ SYSDBA 21/01/2012 18:51:46 --------*/

DROP TABLE TBTESTE;
