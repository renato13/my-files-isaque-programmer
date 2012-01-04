ALTER TABLE TBPRODUTO
    ADD CODIGO INTEGER,
    ADD CODSECAO SMALLINT,
    ADD CODORIGEM DMN_VCHAR_01,
    ADD CODTRIBUTACAO DMN_VCHAR_02,
    ADD CST DMN_VCHAR_03,
    ADD CODCFOP INTEGER,
    ADD CODBARRA_EAN VARCHAR(15),
    ADD CODUNIDADE SMALLINT,
    ADD ALIQUOTA_TIPO SMALLINT DEFAULT 0,
    ADD ALIQUOTA DECIMAL(15,2),
    ADD VALOR_IPI NUMERIC(10,2);
    
alter table TBPRODUTO
alter CODIGO position 1;

alter table TBPRODUTO
alter COD position 2;

alter table TBPRODUTO
alter DESCRI position 3;

alter table TBPRODUTO
alter MODELO position 4;

alter table TBPRODUTO
alter PRECO position 5;

alter table TBPRODUTO
alter REFERENCIA position 6;

alter table TBPRODUTO
alter SECAO position 7;

alter table TBPRODUTO
alter QTDE position 8;

alter table TBPRODUTO
alter UNIDADE position 9;

alter table TBPRODUTO
alter ESTOQMIN position 10;

alter table TBPRODUTO
alter CODGRUPO position 11;

alter table TBPRODUTO
alter CUSTOMEDIO position 12;

alter table TBPRODUTO
alter CODEMP position 13;

alter table TBPRODUTO
alter CODSECAO position 14;

alter table TBPRODUTO
alter CODORIGEM position 15;

alter table TBPRODUTO
alter CODTRIBUTACAO position 16;

alter table TBPRODUTO
alter CST position 17;

alter table TBPRODUTO
alter CODCFOP position 18;

alter table TBPRODUTO
alter CODBARRA_EAN position 19;

alter table TBPRODUTO
alter CODUNIDADE position 20;

alter table TBPRODUTO
alter ALIQUOTA_TIPO position 21;

alter table TBPRODUTO
alter ALIQUOTA position 22;

alter table TBPRODUTO
alter VALOR_IPI position 23;

CREATE SEQUENCE GEN_PRODUTO_ID;

Create Trigger TG_PRODUTO_COD For Tbproduto
Active Before Insert Position 0
As
Begin
  If (New.Codigo Is Null) Then
    New.Codigo = Gen_id(Gen_produto_id,1);
End;

Execute block
as
  declare variable id integer;
  declare variable cod varchar(10);
begin
  id = 1;
  for
    Select
      p.Cod
    from Tbproduto p
    into
      cod
  do
  begin

  Update Tbproduto Set Codigo = :Id, Valor_IPI = 0, Aliquota_Tipo = 0, Aliquota = 0 where Cod = :Cod;

  id = :id + 1;
  end 
end

alter table TBPRODUTO
add constraint UNQ_PRODUTO_CODIGO
unique (CODIGO);

alter table TBPRODUTO
add constraint FK_TBPRODUTO_ORIGEM
foreign key (CODORIGEM)
references TBORIGEMPROD(ORP_COD)
on update CASCADE;

alter table TBPRODUTO
add constraint FK_TBPRODUTO_SECAO
foreign key (CODSECAO)
references TBSECAOPROD(SCP_COD)
on update CASCADE;

alter table TBPRODUTO
add constraint FK_TBPRODUTO_CFOP
foreign key (CODCFOP)
references TBCFOP(CFOP_COD)
on update CASCADE;

alter table TBPRODUTO
add constraint FK_TBPRODUTO_UNIDADE
foreign key (CODUNIDADE)
references TBUNIDADEPROD(UNP_COD)
on update CASCADE;



    