


/*------ SYSDBA 30/01/2012 22:31:52 --------*/

CREATE TABLE TBTPDESPESA (
    COD SMALLINT NOT NULL,
    TIPODESP VARCHAR(25));
alter table TBTPDESPESA
add constraint PK_TBTPDESPESA
primary key (COD);
CREATE SEQUENCE GEN_TBTPDESPESA_ID;



/*------ SYSDBA 30/01/2012 22:32:09 --------*/

alter table TBTPDESPESA
add constraint UNQ1_TBTPDESPESA
unique (TIPODESP);



/*------ SYSDBA 30/01/2012 22:33:32 --------*/

ALTER TABLE TBCONTPAG
    ADD CODTPDESP SMALLINT;



/*------ SYSDBA 30/01/2012 22:34:00 --------*/

alter table TBCONTPAG
add constraint FK_TBCONTPAG_1
foreign key (CODTPDESP)
references TBTPDESPESA(COD);



/*------ SYSDBA 30/01/2012 22:48:39 --------*/

DROP DOMAIN DMN_FUNCAOACESSO;



/*------ SYSDBA 30/01/2012 22:53:20 --------*/

CREATE DOMAIN DMN_FUNCAOACESSO AS
CHAR(2)
CHECK (value in('VE','GV','DI','OF','OC','ES','GF'));;
COMMENT ON DOMAIN DMN_FUNCAOACESSO IS 'VE=Vendedor, GV=GerenteVendas, DI=Diretor,
OF=OperadorFinanceiro, OC=OperadorCaixa,
ES=Estoquista, GF=GerenteFinanceiro';



/*------ SYSDBA 30/01/2012 22:58:44 --------*/

ALTER DOMAIN DMN_FUNCAOACESSO
DROP CONSTRAINT;
ALTER DOMAIN DMN_FUNCAOACESSO
ADD CHECK (value in('VE','GV','DI','OF','OC','ES','GF','TI'));
COMMENT ON DOMAIN DMN_FUNCAOACESSO IS 'VE=Vendedor, GV=GerenteVendas, DI=Diretor,
OF=OperadorFinanceiro, OC=OperadorCaixa,
ES=Estoquista, GF=GerenteFinanceiro,
TI=TecnologiadaInformação';



/*------ SYSDBA 30/01/2012 23:00:31 --------*/

CREATE TABLE TBUSERS (
    NOME VARCHAR(12) NOT NULL,
    SENHA VARCHAR(6) NOT NULL,
    NOMECOMPLETO DMN_NOME NOT NULL,
    FUNCAO DMN_FUNCAOACESSO NOT NULL);
alter table TBUSERS
add constraint PK_TBUSERS
primary key (NOME);
COMMENT ON COLUMN TBUSERS.FUNCAO IS
'VE=Vendedor, GV=GerenteVendas, DI=Diretor,
OF=OperadorFinanceiro, OC=OperadorCaixa,
ES=Estoquista, GF=GerenteFinanceiro,
TI=TecnologiadaInformação';
