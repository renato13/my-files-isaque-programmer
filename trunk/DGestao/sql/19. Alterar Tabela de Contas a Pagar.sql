ALTER TABLE TBCONTPAG DROP CONSTRAINT PK_TBCONTPAG;

ALTER TABLE TBCONTPAG DROP NUMLANC;

ALTER TABLE TBCONTPAG
    ADD ANOLANC SMALLINT NOT NULL,
    ADD NUMLANC INTEGER NOT NULL,
    ADD ANOCOMPRA SMALLINT,
    ADD NUMCOMPRA INTEGER,
    ADD FORMA_PAGTO SMALLINT,
    ADD CONDICAO_PAGTO SMALLINT;
    
CREATE SEQUENCE GEN_CONTAPAG_NUM_2011;
CREATE SEQUENCE GEN_CONTAPAG_NUM_2012;
CREATE SEQUENCE GEN_CONTAPAG_NUM_2013;
CREATE SEQUENCE GEN_CONTAPAG_NUM_2014;
CREATE SEQUENCE GEN_CONTAPAG_NUM_2015;
CREATE SEQUENCE GEN_CONTAPAG_NUM_2016;
CREATE SEQUENCE GEN_CONTAPAG_NUM_2017;
CREATE SEQUENCE GEN_CONTAPAG_NUM_2018;
CREATE SEQUENCE GEN_CONTAPAG_NUM_2019;
CREATE SEQUENCE GEN_CONTAPAG_NUM_2020;
    
SET TERM ^ ;

CREATE Trigger Tg_contpag_numlanc For Tbcontpag
Active Before Insert Position 0
AS
begin
  IF (NEW.Numlanc IS NULL) THEN
    if ( new.Anolanc = 2011 ) then
      NEW.Numlanc = GEN_ID(GEN_CONTAPAG_NUM_2011, 1);
    else
    if ( new.Anolanc = 2012 ) then
      NEW.Numlanc = GEN_ID(GEN_CONTAPAG_NUM_2012, 1);
    else
    if ( new.Anolanc = 2013 ) then
      NEW.Numlanc = GEN_ID(GEN_CONTAPAG_NUM_2013, 1);
    else
    if ( new.Anolanc = 2014 ) then
      NEW.Numlanc = GEN_ID(GEN_CONTAPAG_NUM_2014, 1);
    else
    if ( new.Anolanc = 2015 ) then
      NEW.Numlanc = GEN_ID(GEN_CONTAPAG_NUM_2015, 1);
    else
    if ( new.Anolanc = 2016 ) then
      NEW.Numlanc = GEN_ID(GEN_CONTAPAG_NUM_2016, 1);
    else
    if ( new.Anolanc = 2017 ) then
      NEW.Numlanc = GEN_ID(GEN_CONTAPAG_NUM_2017, 1);
    else
    if ( new.Anolanc = 2018 ) then
      NEW.Numlanc = GEN_ID(GEN_CONTAPAG_NUM_2018, 1);
    else
    if ( new.Anolanc = 2019 ) then
      NEW.Numlanc = GEN_ID(GEN_CONTAPAG_NUM_2019, 1);
    else
    if ( new.Anolanc = 2020 ) then
      NEW.Numlanc = GEN_ID(GEN_CONTAPAG_NUM_2020, 1);
end
^

alter table TBCONTPAG
add constraint FK_TBCONTPAG_FORMA_PAGTO
foreign key (FORMA_PAGTO)
references TBFORMPAGTO(COD);

alter table TBCONTPAG
add constraint FK_TBCONTPAG_COND_PAGTO
foreign key (CONDICAO_PAGTO)
references TBCONDICAOPAGTO(COND_COD);

alter table TBCONTPAG
add constraint PK_TBCONTPAG
primary key (ANOLANC,NUMLANC);




    