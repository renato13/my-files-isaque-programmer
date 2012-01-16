CREATE DOMAIN DMN_BIGINT_NN AS BIGINT NOT NULL;
CREATE DOMAIN DMN_INTEGER_NN AS INTEGER NOT NULL;

ALTER TABLE TVENDASITENS DROP CONSTRAINT PK_TVENDASITENS;

ALTER TABLE TBVENDAS DROP CONSTRAINT PK_TBVENDAS;

ALTER TABLE TBVENDAS ADD ANO SMALLINT NOT NULL;

UPDATE TBVENDAS SET ANO = 2011;
 
alter table TBVENDAS
add constraint PK_TBVENDAS
primary key (ANO,CODCONTROL);

ALTER TABLE TVENDASITENS ADD ANO SMALLINT NOT NULL;

ALTER TABLE TVENDASITENS ADD SEQ SMALLINT NOT NULL;

ALTER TABLE TBVENDAS ADD DTFINALIZACAO_VENDA DATE;
    
ALTER TABLE TBVENDAS ADD CFOP INTEGER;
        
Update TVENDASITENS Set ANO = 2011, SEQ = 1;

alter table TVENDASITENS add constraint PK_TVENDASITENS primary key (CODCONTROL,SEQ,CODPROD);

alter table TBVENDAS
add constraint FK_TBVENDAS_EMPRESA
foreign key (CODEMP)
references TBEMPRESA(CNPJ)
on update CASCADE;

alter table TBVENDAS
add constraint FK_TBVENDAS_CLIENTE
foreign key (CODCLI)
references TBCLIENTE(CNPJ)
on update CASCADE;

alter table TBVENDAS
add constraint FK_TBVENDAS_CFOP
foreign key (CFOP)
references TBCFOP(CFOP_COD);

ALTER TABLE TVENDASITENS DROP CONSTRAINT FK_TVENDASITENS_1;

ALTER TABLE TVENDASITENS DROP CONSTRAINT FK_TVENDASITENS_2;

ALTER TABLE TVENDASITENS DROP CONSTRAINT FK_TVENDASITENS_3;

alter table TVENDASITENS
add constraint FK_TVENDASITENS_PRODUTO
foreign key (CODPROD)
references TBPRODUTO(COD);

alter table TVENDASITENS
add constraint FK_TVENDASITENS_EMPRESA
foreign key (CODEMP)
references TBEMPRESA(CNPJ)
on update CASCADE;

alter table TVENDASITENS
add constraint FK_TVENDASITENS_CLIENTE
foreign key (CODCLI)
references TBCLIENTE(CNPJ)
on update CASCADE;

CREATE SEQUENCE GEN_VENDAS_CONTROLE_2011;
CREATE SEQUENCE GEN_VENDAS_CONTROLE_2012;
CREATE SEQUENCE GEN_VENDAS_CONTROLE_2013;
CREATE SEQUENCE GEN_VENDAS_CONTROLE_2014;
CREATE SEQUENCE GEN_VENDAS_CONTROLE_2015;
CREATE SEQUENCE GEN_VENDAS_CONTROLE_2016;
CREATE SEQUENCE GEN_VENDAS_CONTROLE_2017;
CREATE SEQUENCE GEN_VENDAS_CONTROLE_2018;
CREATE SEQUENCE GEN_VENDAS_CONTROLE_2019;
CREATE SEQUENCE GEN_VENDAS_CONTROLE_2020;

SET TERM ^ ;

CREATE OR ALTER Trigger Tg_vendas_controle For Tbvendas
Active Before Insert Position 0
AS
BEGIN
  IF (NEW.CODCONTROL IS NULL) THEN
    if ( new.Ano = 2011 ) then
      NEW.CODCONTROL = GEN_ID(GEN_VENDAS_CONTROLE_2011, 1);
    else
    if ( new.Ano = 2012 ) then
      NEW.CODCONTROL = GEN_ID(GEN_VENDAS_CONTROLE_2012, 1);
    else
    if ( new.Ano = 2013 ) then
      NEW.CODCONTROL = GEN_ID(GEN_VENDAS_CONTROLE_2013, 1);
    else
    if ( new.Ano = 2014 ) then
      NEW.CODCONTROL = GEN_ID(GEN_VENDAS_CONTROLE_2014, 1);
    else
    if ( new.Ano = 2015 ) then
      NEW.CODCONTROL = GEN_ID(GEN_VENDAS_CONTROLE_2015, 1);
    else
    if ( new.Ano = 2016 ) then
      NEW.CODCONTROL = GEN_ID(GEN_VENDAS_CONTROLE_2016, 1);
    else
    if ( new.Ano = 2017 ) then
      NEW.CODCONTROL = GEN_ID(GEN_VENDAS_CONTROLE_2017, 1);
    else
    if ( new.Ano = 2018 ) then
      NEW.CODCONTROL = GEN_ID(GEN_VENDAS_CONTROLE_2018, 1);
    else
    if ( new.Ano = 2019 ) then
      NEW.CODCONTROL = GEN_ID(GEN_VENDAS_CONTROLE_2019, 1);
    else
    if ( new.Ano = 2020 ) then
      NEW.CODCONTROL = GEN_ID(GEN_VENDAS_CONTROLE_2020, 1);
END

SET TERM ; ^
 
DROP TRIGGER TRGBAIXAESTOQQ;

CREATE DOMAIN DMN_STATUS AS
SMALLINT
DEFAULT 0
NOT NULL
CHECK (value between 0 and 9);

UPDATE TBVENDAS
SET STATUS = '3';     

update RDB$RELATION_FIELDS set
RDB$FIELD_SOURCE = 'DMN_STATUS',
RDB$COLLATION_ID = -1
where (RDB$FIELD_NAME = 'STATUS') and
(RDB$RELATION_NAME = 'TBVENDAS');

CREATE DOMAIN DMN_VCHAR_04 AS
VARCHAR(4);

ALTER TABLE TBVENDAS
    ADD SERIE DMN_VCHAR_04,
    ADD NFE BIGINT,
    ADD DATAEMISSAO DATE,
    ADD HORAEMISSAO TIME,
    ADD VERIFICADOR_NFE VARCHAR(250),
    ADD XML_NFE BLOB SUB_TYPE 1 SEGMENT SIZE 80,
    ADD VENDEDOR_COD INTEGER,
    ADD USUARIO VARCHAR(50) DEFAULT user,
    ADD FORMAPAGTO_COD SMALLINT,
    ADD CONDICAOPAGTO_COD SMALLINT,
    ADD VENDA_PRAZO DMN_LOGICO,
    ADD PRAZO_01 SMALLINT,
    ADD PRAZO_02 SMALLINT,
    ADD PRAZO_03 SMALLINT,
    ADD PRAZO_04 SMALLINT,
    ADD PRAZO_05 SMALLINT,
    ADD PRAZO_06 SMALLINT,
    ADD PRAZO_07 SMALLINT,
    ADD PRAZO_08 SMALLINT,
    ADD PRAZO_09 SMALLINT,
    ADD PRAZO_10 SMALLINT,
    ADD PRAZO_11 SMALLINT,
    ADD PRAZO_12 SMALLINT;
    
UPDATE TBVENDAS
SET VENDA_PRAZO = 0;     

alter table TBVENDAS
add constraint FK_TBVENDAS_VENDEDOR
foreign key (VENDEDOR_COD)
references TBVENDEDOR(COD);

alter table TBVENDAS
add constraint FK_TBVENDAS_FORMAPGTO
foreign key (FORMAPAGTO_COD)
references TBFORMPAGTO(COD);

alter table TBVENDAS
add constraint FK_TBVENDAS_CONDPGTO
foreign key (CONDICAOPAGTO_COD)
references TBCONDICAOPAGTO(COND_COD);

alter table TBVENDAS
add constraint UNQ_TBVENDAS_NFE
unique (SERIE,NFE);

ALTER TABLE TVENDASITENS
    ADD UNID_COD SMALLINT,
    ADD CFOP_COD INTEGER,
    ADD ALIQUOTA DECIMAL(10,2),
    ADD VALOR_IPI NUMERIC(10,2);
    
alter table TVENDASITENS
add constraint FK_TVENDASITENS_VENDA
foreign key (ANO,CODCONTROL)
references TBVENDAS(ANO,CODCONTROL)
on delete CASCADE
on update CASCADE;
    
update RDB$FIELDS set
RDB$FIELD_LENGTH = 30,
RDB$CHARACTER_LENGTH = 30
where RDB$FIELD_NAME = 'RDB$168';

update RDB$FIELDS set
RDB$FIELD_LENGTH = 20,
RDB$CHARACTER_LENGTH = 20
where RDB$FIELD_NAME = 'RDB$162';

ALTER TABLE TBPRODHIST
    ADD CODEMPRESA VARCHAR(18);
    
ALTER TABLE TBPRODHIST DROP CONSTRAINT FK_TBPRODHIST_1;

alter table TBPRODHIST
add constraint FK_TBPRODHIST_PROD
foreign key (CODPROD)
references TBPRODUTO(COD)
using index FK_TBPRODHIST_1;

alter table TBPRODHIST
add constraint FK_TBPRODHIST_EMP
foreign key (CODEMPRESA)
references TBEMPRESA(CNPJ);

SET TERM ^ ;

CREATE OR ALTER Trigger Tg_vendas_atualizar_estoque For Tbvendas
Active After Update Position 1
AS
  declare variable produto varchar(10);
  declare variable empresa varchar(18);
  declare variable estoque integer;
  declare variable quantidade integer;
  declare variable reserva integer;
  declare variable valor_produto numeric(15,2);
begin
  if ( (coalesce(old.Status, 0) <> coalesce(new.Status, 0)) and (new.Status = 3)) then
  begin

    -- Baixar produto do Estoque
    for
      Select
          i.Codprod
        , i.Codemp
        , i.Qtde
        , coalesce(p.Qtde, 0)
        , coalesce(p.Reserva, 0)
        , coalesce(p.Preco, 0)
      from TVENDASITENS i
        inner join TBPRODUTO p on (p.Cod = i.Codprod)
      where i.Ano = new.Ano
        and i.Codcontrol = new.Codcontrol
      into
          produto
        , empresa
        , quantidade
        , estoque
        , reserva
        , valor_produto
    do
    begin
      reserva = :reserva - :Quantidade;
      estoque = :Estoque - :Quantidade;

      -- Baixar estoque
      Update TBPRODUTO p Set
          p.Reserva = :Reserva
        , p.Qtde    = :Estoque
      where p.Cod    = :Produto
        and p.Codemp = :Empresa;

      -- Gravar posicao de estoque
      Update TVENDASITENS i Set
        i.Qtdefinal = :Estoque
      where i.Ano        = new.Ano
        and i.Codcontrol = new.Codcontrol
        and i.Codemp     = new.Codemp
        and i.Codprod    = :Produto;

      -- Gerar histórico
      Insert Into TBPRODHIST (
          Codempresa
        , Codprod
        , Doc
        , Historico
        , Dthist
        , Qtdeatual
        , Qtdenova
        , Qtdefinal
        , Resp
        , Motivo
      ) values (
          :Empresa
        , :Produto
        , new.Ano || '/' || new.Codcontrol
        , 'SAIDA - VENDA'
        , Current_time
        , null
        , :Quantidade
        , :Estoque
        , user
        , 'Venda no valor de R$ ' || :Valor_produto
      );
    end
     
  end 
end
^

SET TERM ; ^

SET TERM ^ ;

CREATE OR ALTER Trigger Tg_vendasitens_reservar For Tvendasitens
Active After Insert Or Update Or Delete Position 1
AS
  declare variable reserva integer;
begin
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

