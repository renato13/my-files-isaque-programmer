ALTER TABLE TBCLIENTE
    ADD CODIGO INTEGER NOT NULL,
    ADD PESSOA_FISICA DMN_LOGICO,
    ADD COMPLEMENTO VARCHAR(50),
    ADD TLG_TIPO SMALLINT,
    ADD LOG_COD INTEGER,
    ADD BAI_COD INTEGER,
    ADD CID_COD INTEGER,
    ADD EST_COD SMALLINT,
    ADD NUMERO_END VARCHAR(10),
    ADD PAIS_ID VARCHAR(5),
    ADD INSCMUN VARCHAR(20);

alter table TBCLIENTE alter CODIGO position 1;

alter table TBCLIENTE alter PESSOA_FISICA position 2;

alter table TBCLIENTE alter CNPJ position 3;

alter table TBCLIENTE alter NOME position 4;

alter table TBCLIENTE alter INSCEST position 5;

alter table TBCLIENTE alter INSCMUN position 6;

alter table TBCLIENTE alter ENDER position 7;

alter table TBCLIENTE alter COMPLEMENTO position 8;

alter table TBCLIENTE alter BAIRRO position 9;

alter table TBCLIENTE alter CEP position 10;

alter table TBCLIENTE alter CIDADE position 11;

alter table TBCLIENTE alter UF position 12;

alter table TBCLIENTE alter FONE position 13;

alter table TBCLIENTE alter EMAIL position 14;

alter table TBCLIENTE alter SITE position 15;

alter table TBCLIENTE alter TLG_TIPO position 16;

alter table TBCLIENTE alter LOG_COD position 17;

alter table TBCLIENTE alter BAI_COD position 18;

alter table TBCLIENTE alter CID_COD position 19;

alter table TBCLIENTE alter EST_COD position 20;

alter table TBCLIENTE alter NUMERO_END position 21;

alter table TBCLIENTE alter PAIS_ID position 22;

CREATE SEQUENCE GEN_CLIENTE_ID;

Create Trigger Tg_CLIENTE_cod For TbCLIENTE
Active Before Insert Position 0
As
Begin
  If (New.Codigo Is Null) Then
    New.Codigo = Gen_id(Gen_CLIENTE_id, 1);
End;

alter table TBCLIENTE
add constraint FK_TBCLIENTE_TIPO_LOG
foreign key (TLG_TIPO)
references TBTIPO_LOGRADOURO(TLG_COD)
on update CASCADE;

alter table TBCLIENTE
add constraint FK_TBCLIENTE_LOG
foreign key (LOG_COD)
references TBLOGRADOURO(LOG_COD)
on update CASCADE;

alter table TBCLIENTE
add constraint FK_TBCLIENTE_BAI
foreign key (BAI_COD)
references TBBAIRRO(BAI_COD)
on update CASCADE;

alter table TBCLIENTE
add constraint FK_TBCLIENTE_CID
foreign key (CID_COD)
references TBCIDADE(CID_COD)
on update CASCADE;

alter table TBCLIENTE
add constraint FK_TBCLIENTE_EST
foreign key (EST_COD)
references TBESTADO(EST_COD)
on update CASCADE;

alter table TBCLIENTE
add constraint FK_TBCLIENTE_PAIS
foreign key (PAIS_ID)
references TBPAIS(PAIS_ID)
on update CASCADE;

execute block
as
  declare variable id integer;
  declare variable cnpj varchar(18);
begin 
  id = 0;
  for
    Select
      c.cnpj
    from TBCLIENTE c
    into
      cnpj
  do
  begin
    id = :id + 1;
    Update TBCLIENTE Set codigo = :id where cnpj = :cnpj;
  end
end;
    
alter table TBCLIENTE
add constraint UNQ_TBCLIENTE_CODIGO
unique (CODIGO);  

execute block
returns (
  cnpj varchar(18),
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
        c.Cnpj
      , trim(coalesce(c.Fone, ''))
      , trim(coalesce(c.Cep, ''))
    from TBCLIENTE c
    into
        Cnpj
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

    Update TBCLIENTE Set fone = :Fone_limpo, cep = :Cep_limpo where cnpj = :Cnpj;

  end 
end   

        