ALTER TABLE TBFORNECEDOR
    ADD PESSOA_FISICA DMN_LOGICO,
    ADD COMPLEMENTO VARCHAR(50),
    ADD CEP VARCHAR(8),
    ADD TLG_TIPO SMALLINT,
    ADD LOG_COD INTEGER,
    ADD BAI_COD INTEGER,
    ADD CID_COD INTEGER,
    ADD EST_COD SMALLINT,
    ADD NUMERO_END VARCHAR(10),
    ADD PAIS_ID VARCHAR(5),
    ADD INSCEST VARCHAR(20),
    ADD INSCMUN VARCHAR(20);

alter table TBFORNECEDOR alter CODFORN   position 1;

alter table TBFORNECEDOR alter PESSOA_FISICA position 2;

alter table TBFORNECEDOR alter NOMEFORN  position 3;

alter table TBFORNECEDOR alter CNPJ      position 4;

alter table TBFORNECEDOR alter INSCEST   position 5;

alter table TBFORNECEDOR alter INSCMUN   position 6;

alter table TBFORNECEDOR alter ENDER     position 7;

alter table TBFORNECEDOR alter COMPLEMENTO position 8;

alter table TBFORNECEDOR alter NUMERO_END  position 9;

alter table TBFORNECEDOR alter CEP       position 10;

alter table TBFORNECEDOR alter CIDADE    position 11;

alter table TBFORNECEDOR alter UF        position 12;

alter table TBFORNECEDOR alter CONTATO   position 13;

alter table TBFORNECEDOR alter FONE      position 14;

alter table TBFORNECEDOR alter EMAIL     position 15;

alter table TBFORNECEDOR alter SITE      position 16;

alter table TBFORNECEDOR alter TLG_TIPO  position 17;

alter table TBFORNECEDOR alter LOG_COD   position 18;

alter table TBFORNECEDOR alter BAI_COD   position 19;

alter table TBFORNECEDOR alter CID_COD   position 20;

alter table TBFORNECEDOR alter EST_COD   position 21;

alter table TBFORNECEDOR alter PAIS_ID   position 22;


CREATE SEQUENCE GEN_FORNECEDOR_ID;

Create Trigger TG_FORNECEDOR_COD For TBFORNECEDOR
Active Before Insert Position 0
As
Begin
  If (New.CODFORN Is Null) Then
    New.CODFORN = Gen_id(GEN_FORNECEDOR_ID, 1);
End;

alter table TBFORNECEDOR
add constraint FK_TBFORNECEDOR_TIPO_LOG
foreign key (TLG_TIPO)
references TBTIPO_LOGRADOURO(TLG_COD)
on update CASCADE;

alter table TBFORNECEDOR
add constraint FK_TBFORNECEDOR_LOG
foreign key (LOG_COD)
references TBLOGRADOURO(LOG_COD)
on update CASCADE;

alter table TBFORNECEDOR
add constraint FK_TBFORNECEDOR_BAI
foreign key (BAI_COD)
references TBBAIRRO(BAI_COD)
on update CASCADE;

alter table TBFORNECEDOR
add constraint FK_TBFORNECEDOR_CID
foreign key (CID_COD)
references TBCIDADE(CID_COD)
on update CASCADE;

alter table TBFORNECEDOR
add constraint FK_TBFORNECEDOR_EST
foreign key (EST_COD)
references TBESTADO(EST_COD)
on update CASCADE;

alter table TBFORNECEDOR
add constraint FK_TBFORNECEDOR_PAIS
foreign key (PAIS_ID)
references TBPAIS(PAIS_ID)
on update CASCADE;

/*
execute block
returns (
  codigo integer,
  fone varchar(20),
  fone_limpo varchar(20),
  cep varchar(20),
  cep_limpo varchar(20)
)
as
  declare variable i integer;
begin
  for
    Select
        c.CODFORN
      , trim(coalesce(c.Fone, ''))
      , trim(coalesce(c.Cep, ''))
    from TBFORNECEDOR c
    into
        codigo
      , fone
      , cep
  do
  begin
    i = 1;
    fone_limpo = '';

    while (i <= 11) do
    begin
      if (
         (Substring( :Fone from :i for 1) = '0') or
         (Substring( :Fone from :i for 1) = '1') or
         (Substring( :Fone from :i for 1) = '2') or
         (Substring( :Fone from :i for 1) = '3') or
         (Substring( :Fone from :i for 1) = '4') or
         (Substring( :Fone from :i for 1) = '5') or
         (Substring( :Fone from :i for 1) = '6') or
         (Substring( :Fone from :i for 1) = '7') or
         (Substring( :Fone from :i for 1) = '8') or
         (Substring( :Fone from :i for 1) = '9') )
      then
        fone_limpo = :fone_limpo || Substring( :Fone from :i for 1);

      i = :i + 1;
    end 

    i = 1;
    cep_limpo = '';

    while (i <= 8) do
    begin
      if (
         (Substring( :cep from :i for 1) = '0') or
         (Substring( :cep from :i for 1) = '1') or
         (Substring( :cep from :i for 1) = '2') or
         (Substring( :cep from :i for 1) = '3') or
         (Substring( :cep from :i for 1) = '4') or
         (Substring( :cep from :i for 1) = '5') or
         (Substring( :cep from :i for 1) = '6') or
         (Substring( :cep from :i for 1) = '7') or
         (Substring( :cep from :i for 1) = '8') or
         (Substring( :cep from :i for 1) = '9') )
      then
        cep_limpo = :cep_limpo || Substring( :cep from :i for 1);

      i = :i + 1;
    end 

    if ( :Cep_limpo <> '' ) then
      cep_limpo  = cast(:Cep_limpo || '0' as varchar(8));

    if ( :fone_limpo <> '') then
      fone_limpo = '91' || :fone_limpo;

    --Suspend;

    Update TBFORNECEDOR Set fone = :Fone_limpo, cep = :Cep_limpo where CODFORN = :codigo;

  end 
end
*/