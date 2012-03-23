


/*------ 09/02/2012 10:23:41: Creating domain DMN_MONEY_DESCONTO... --------*/

CREATE DOMAIN DMN_MONEY_DESCONTO AS
  NUMERIC(15, 3)
  DEFAULT 0;



/*------ 09/02/2012 12:54:22: Executing statement... --------*/

ALTER TABLE TVENDASITENS
ALTER COLUMN DESCONTO_VALOR
POSITION 11;



/*------ 09/02/2012 12:54:22: Executing statement... --------*/

ALTER TABLE TVENDASITENS
ALTER COLUMN PFINAL
POSITION 12;



/*------ 09/02/2012 12:54:22: Executing statement... --------*/

ALTER TABLE TVENDASITENS
ALTER COLUMN QTDEFINAL
POSITION 13;



/*------ 09/02/2012 12:54:22: Executing statement... --------*/

ALTER TABLE TVENDASITENS
ALTER COLUMN UNID_COD
POSITION 14;



/*------ 09/02/2012 12:54:22: Executing statement... --------*/

ALTER TABLE TVENDASITENS
ALTER COLUMN CFOP_COD
POSITION 15;



/*------ 09/02/2012 12:54:22: Executing statement... --------*/

ALTER TABLE TVENDASITENS
ALTER COLUMN ALIQUOTA
POSITION 16;



/*------ 09/02/2012 12:54:22: Executing statement... --------*/

ALTER TABLE TVENDASITENS
ALTER COLUMN ALIQUOTA_CSOSN
POSITION 17;



/*------ 09/02/2012 12:54:22: Executing statement... --------*/

ALTER TABLE TVENDASITENS
ALTER COLUMN VALOR_IPI
POSITION 18;



/*------ 09/02/2012 12:54:56: Setting description for DESCONTO_VALOR... --------*/

update RDB$RELATION_FIELDS set
RDB$FIELD_SOURCE = 'DMN_MONEY_DESCONTO'
where (RDB$FIELD_NAME = 'DESCONTO') and
(RDB$RELATION_NAME = 'TVENDASITENS');


/*------ 09/02/2012 13:22:35: Changing domain for field DESCONTO_VALOR... --------*/

ALTER TABLE TVENDASITENS
ALTER COLUMN DESCONTO_VALOR
TYPE DMN_MONEY;


SET STATISTICS INDEX FK_TBAJUSTESTOQ_1;
SET STATISTICS INDEX FK_TBAJUSTESTOQ_2;
SET STATISTICS INDEX FK_TBBAIRRO_CID;
SET STATISTICS INDEX FK_TBBAIRRO_DIS;
SET STATISTICS INDEX FK_TBCIDADE_UF;
SET STATISTICS INDEX FK_TBCLIENTE_BAI;
SET STATISTICS INDEX FK_TBCLIENTE_CID;
SET STATISTICS INDEX FK_TBCLIENTE_EST;
SET STATISTICS INDEX FK_TBCLIENTE_LOG;
SET STATISTICS INDEX FK_TBCLIENTE_PAIS;
SET STATISTICS INDEX FK_TBCLIENTE_TIPO_LOG;
SET STATISTICS INDEX FK_TBCOMPRASITENS_COMPRA;
SET STATISTICS INDEX FK_TBCOMPRASITENS_EMPRESA;
SET STATISTICS INDEX FK_TBCOMPRASITENS_FORNECEDOR;
SET STATISTICS INDEX FK_TBCOMPRASITENS_PRODUTO;
SET STATISTICS INDEX FK_TBCOMPRASITENS_UNID;
SET STATISTICS INDEX FK_TBCOMPRAS_EMPRESA;
SET STATISTICS INDEX FK_TBCOMPRAS_FORNECEDOR;
SET STATISTICS INDEX FK_TBCONTPAG_1;
SET STATISTICS INDEX FK_TBCONTPAG_BAIXA_BANCO;
SET STATISTICS INDEX FK_TBCONTPAG_BAIXA_CPAG;
SET STATISTICS INDEX FK_TBCONTPAG_BAIXA_FPAGTO;
SET STATISTICS INDEX FK_TBCONTPAG_BANCO;
SET STATISTICS INDEX FK_TBCONTPAG_COND_PAGTO;
SET STATISTICS INDEX FK_TBCONTPAG_FORMA_PAGTO;
SET STATISTICS INDEX FK_TBCONTPAG_FORNECEDOR;
SET STATISTICS INDEX FK_TBCONTREC_1;
SET STATISTICS INDEX FK_TBCONTREC_BAIXA_BANCO;
SET STATISTICS INDEX FK_TBCONTREC_BAIXA_CREC;
SET STATISTICS INDEX FK_TBCONTREC_BAIXA_FPAGTO;
SET STATISTICS INDEX FK_TBCONTREC_BANCO;
SET STATISTICS INDEX FK_TBCONTREC_FORMA_PGTO;
SET STATISTICS INDEX FK_TBCONTREC_VND;
SET STATISTICS INDEX FK_TBEMPRESA_BAI;
SET STATISTICS INDEX FK_TBEMPRESA_CID;
SET STATISTICS INDEX FK_TBEMPRESA_EST;
SET STATISTICS INDEX FK_TBEMPRESA_LOG;
SET STATISTICS INDEX FK_TBEMPRESA_PAIS;
SET STATISTICS INDEX FK_TBEMPRESA_TIPO_LOG;
SET STATISTICS INDEX FK_TBFORNECEDOR_BAI;
SET STATISTICS INDEX FK_TBFORNECEDOR_CID;
SET STATISTICS INDEX FK_TBFORNECEDOR_EST;
SET STATISTICS INDEX FK_TBFORNECEDOR_GRUPO;
SET STATISTICS INDEX FK_TBFORNECEDOR_LOG;
SET STATISTICS INDEX FK_TBFORNECEDOR_PAIS;
SET STATISTICS INDEX FK_TBFORNECEDOR_TIPO_LOG;
SET STATISTICS INDEX FK_TBLANCDEPOS_1;
SET STATISTICS INDEX FK_TBLOGRADOURO_CID;
SET STATISTICS INDEX FK_TBLOGRADOURO_TIP;
SET STATISTICS INDEX FK_TBPEDIDOITENS_1;
SET STATISTICS INDEX FK_TBPEDIDOS_1;
SET STATISTICS INDEX FK_TBPEDIDOS_2;
SET STATISTICS INDEX FK_TBPEDIDOS_3;
SET STATISTICS INDEX FK_TBPRODHIST_1;
SET STATISTICS INDEX FK_TBPRODHIST_EMP;
SET STATISTICS INDEX FK_TBPRODUTO_1;
SET STATISTICS INDEX FK_TBPRODUTO_2;
SET STATISTICS INDEX FK_TBPRODUTO_CFOP;
SET STATISTICS INDEX FK_TBPRODUTO_ORIGEM;
SET STATISTICS INDEX FK_TBPRODUTO_SECAO;
SET STATISTICS INDEX FK_TBPRODUTO_UNIDADE;
SET STATISTICS INDEX FK_TBUSERS_1;
SET STATISTICS INDEX FK_TBVENDAS_CFOP;
SET STATISTICS INDEX FK_TBVENDAS_CLIENTE;
SET STATISTICS INDEX FK_TBVENDAS_CONDPGTO;
SET STATISTICS INDEX FK_TBVENDAS_EMPRESA;
SET STATISTICS INDEX FK_TBVENDAS_FORMAPGTO;
SET STATISTICS INDEX FK_TBVENDAS_VENDEDOR;
SET STATISTICS INDEX FK_TVENDASITENS_CLIENTE;
SET STATISTICS INDEX FK_TVENDASITENS_EMPRESA;
SET STATISTICS INDEX FK_TVENDASITENS_PRODUTO;
SET STATISTICS INDEX FK_TVENDASITENS_VENDA;
SET STATISTICS INDEX IDX_TBCONTREC_NOSSONUMERO;
SET STATISTICS INDEX PK_TBBAIRRO;
SET STATISTICS INDEX PK_TBBANCO;
SET STATISTICS INDEX PK_TBBANCO_BOLETO;
SET STATISTICS INDEX PK_TBCFOP;
SET STATISTICS INDEX PK_TBCIDADE;
SET STATISTICS INDEX PK_TBCLIENTE;
SET STATISTICS INDEX PK_TBCOMPRAS;
SET STATISTICS INDEX PK_TBCOMPRASITENS;
SET STATISTICS INDEX PK_TBCONDICAOPAGTO;
SET STATISTICS INDEX PK_TBCONTPAG;
SET STATISTICS INDEX PK_TBCONTPAG_BAIXA;
SET STATISTICS INDEX PK_TBCONTREC;
SET STATISTICS INDEX PK_TBCONTREC_BAIXA;
SET STATISTICS INDEX PK_TBDISTRITO;
SET STATISTICS INDEX PK_TBEMPRESA;
SET STATISTICS INDEX PK_TBESTADO;
SET STATISTICS INDEX PK_TBFORMPAGTO;
SET STATISTICS INDEX PK_TBFORNECEDOR;
SET STATISTICS INDEX PK_TBFORNECEDOR_GRUPO;
SET STATISTICS INDEX PK_TBFUNCAO;
SET STATISTICS INDEX PK_TBGRUPOPROD;
SET STATISTICS INDEX PK_TBLANCDEPOS;
SET STATISTICS INDEX PK_TBLOGRADOURO;
SET STATISTICS INDEX PK_TBNFE_ENVIADA;
SET STATISTICS INDEX PK_TBORIGEMPROD;
SET STATISTICS INDEX PK_TBPAIS;
SET STATISTICS INDEX PK_TBPEDIDOITENS;
SET STATISTICS INDEX PK_TBPEDIDOS;
SET STATISTICS INDEX PK_TBPRODUTO;
SET STATISTICS INDEX PK_TBSECAOPROD;
SET STATISTICS INDEX PK_TBSENHA_AUTORIZACAO;
SET STATISTICS INDEX PK_TBTIPO_LOGRADOURO;
SET STATISTICS INDEX PK_TBTPDESPESA;
SET STATISTICS INDEX PK_TBTRIBUTACAO_TIPO;
SET STATISTICS INDEX PK_TBUNIDADEPROD;
SET STATISTICS INDEX PK_TBUSERS;
SET STATISTICS INDEX PK_TBVENDAS;
SET STATISTICS INDEX PK_TBVENDEDOR;
SET STATISTICS INDEX PK_TB_TESTE;
SET STATISTICS INDEX RDB$INDEX_0;
SET STATISTICS INDEX RDB$INDEX_1;
SET STATISTICS INDEX RDB$INDEX_10;
SET STATISTICS INDEX RDB$INDEX_11;
SET STATISTICS INDEX RDB$INDEX_12;
SET STATISTICS INDEX RDB$INDEX_13;
SET STATISTICS INDEX RDB$INDEX_14;
SET STATISTICS INDEX RDB$INDEX_15;
SET STATISTICS INDEX RDB$INDEX_16;
SET STATISTICS INDEX RDB$INDEX_17;
SET STATISTICS INDEX RDB$INDEX_18;
SET STATISTICS INDEX RDB$INDEX_19;
SET STATISTICS INDEX RDB$INDEX_2;
SET STATISTICS INDEX RDB$INDEX_20;
SET STATISTICS INDEX RDB$INDEX_21;
SET STATISTICS INDEX RDB$INDEX_22;
SET STATISTICS INDEX RDB$INDEX_23;
SET STATISTICS INDEX RDB$INDEX_24;
SET STATISTICS INDEX RDB$INDEX_25;
SET STATISTICS INDEX RDB$INDEX_26;
SET STATISTICS INDEX RDB$INDEX_27;
SET STATISTICS INDEX RDB$INDEX_28;
SET STATISTICS INDEX RDB$INDEX_29;
SET STATISTICS INDEX RDB$INDEX_3;
SET STATISTICS INDEX RDB$INDEX_30;
SET STATISTICS INDEX RDB$INDEX_31;
SET STATISTICS INDEX RDB$INDEX_32;
SET STATISTICS INDEX RDB$INDEX_33;
SET STATISTICS INDEX RDB$INDEX_34;
SET STATISTICS INDEX RDB$INDEX_35;
SET STATISTICS INDEX RDB$INDEX_36;
SET STATISTICS INDEX RDB$INDEX_37;
SET STATISTICS INDEX RDB$INDEX_38;
SET STATISTICS INDEX RDB$INDEX_39;
SET STATISTICS INDEX RDB$INDEX_4;
SET STATISTICS INDEX RDB$INDEX_40;
SET STATISTICS INDEX RDB$INDEX_41;
SET STATISTICS INDEX RDB$INDEX_42;
SET STATISTICS INDEX RDB$INDEX_43;
SET STATISTICS INDEX RDB$INDEX_44;
SET STATISTICS INDEX RDB$INDEX_45;
SET STATISTICS INDEX RDB$INDEX_5;
SET STATISTICS INDEX RDB$INDEX_6;
SET STATISTICS INDEX RDB$INDEX_7;
SET STATISTICS INDEX RDB$INDEX_8;
SET STATISTICS INDEX RDB$INDEX_9;
SET STATISTICS INDEX UNQ1_TBFUNCAO;
SET STATISTICS INDEX UNQ_PRODUTO_CODIGO;
SET STATISTICS INDEX UNQ_TBCLIENTE_CODIGO;
SET STATISTICS INDEX UNQ_TBEMPRESA_CODIGO;
SET STATISTICS INDEX UNQ_TBVENDAS_NFE;


SET TERM ^ ;

ALTER PROCEDURE GET_DIA_UTIL(
    DATA DATE,
    DIAS INTEGER)
RETURNS (
    DIA_UTIL DATE)
AS
begin
  Dia_util = :Data + :Dias;
  if ( Extract(Weekday from :Dia_util) = 0 ) then /* Caso seja domingo */
    Dia_util = :Dia_util + 1;
  else
  if ( Extract(Weekday from :Dia_util) = 6 ) then /* Caso seja sábado */
    Dia_util = :Dia_util + 2;

  suspend;
end

^

SET TERM ; ^

SET TERM ^ ;

ALTER PROCEDURE SET_DUPLICATA_PAGAR(
    ANOCOMPRA SMALLINT,
    NUMCOMPRA INTEGER,
    FORNECEDOR INTEGER,
    NF INTEGER,
    FORMA_PAGTO SMALLINT,
    CONDICAO_PAGTO SMALLINT,
    EMISSAO DATE,
    VENCIMENTO DATE,
    VALOR_DOCUMENTO NUMERIC(15,2),
    PARCELA SMALLINT)
RETURNS (
    ANOLANCAMENTO SMALLINT,
    NUMLANCAMENTO INTEGER)
AS
declare variable FORMA_PAGTO_DESC varchar(30);
begin
  if ( Exists(
    Select
      p.Numlanc
    from TBCONTPAG p
    where p.Anocompra = :Anocompra
      and p.Numcompra = :Numcompra
      and p.Parcela  = :Parcela
  ) ) then
    Exit;

  Select
    f.Descri
  from TBFORMPAGTO f
  where f.Cod = :Forma_pagto
  into
    Forma_pagto_desc;

  Anolancamento = :Anocompra;

  if ( :Anolancamento = 2011 ) then
    Numlancamento = gen_id(Gen_contapag_num_2011, 1);
  else
  if ( :Anolancamento = 2012 ) then
    Numlancamento = gen_id(Gen_contapag_num_2012, 1);
  else
  if ( :Anolancamento = 2013 ) then
    Numlancamento = gen_id(Gen_contapag_num_2013, 1);
  else
  if ( :Anolancamento = 2014 ) then
    Numlancamento = gen_id(Gen_contapag_num_2014, 1);
  else
  if ( :Anolancamento = 2015 ) then
    Numlancamento = gen_id(Gen_contapag_num_2015, 1);
  else
  if ( :Anolancamento = 2016 ) then
    Numlancamento = gen_id(Gen_contapag_num_2016, 1);
  else
  if ( :Anolancamento = 2017 ) then
    Numlancamento = gen_id(Gen_contapag_num_2017, 1);
  else
  if ( :Anolancamento = 2018 ) then
    Numlancamento = gen_id(Gen_contapag_num_2018, 1);
  else
  if ( :Anolancamento = 2019 ) then
    Numlancamento = gen_id(Gen_contapag_num_2019, 1);
  else
  if ( :Anolancamento = 2020 ) then
    Numlancamento = gen_id(Gen_contapag_num_2020, 1);

  Insert Into TBCONTPAG (
      Anolanc
    , Numlanc
    , Anocompra
    , Numcompra
    , Parcela
    , Codforn
    , Tippag
    , Forma_pagto
    , Condicao_pagto
    , Notfisc
    , Dtemiss
    , Dtvenc
    , Valorpag
    , Quitado
  ) values (
      :Anolancamento
    , :Numlancamento
    , :Anocompra
    , :Numcompra
    , :Parcela
    , :Fornecedor
    , :Forma_pagto_desc
    , :Forma_pagto
    , :Condicao_pagto
    , :Nf
    , :Emissao
    , :Vencimento
    , :Valor_documento
    , 0
  );

  suspend;
end

^

SET TERM ; ^

SET TERM ^ ;

ALTER PROCEDURE SET_GERAR_DUPLICATAS(
    ANOCOMPRA SMALLINT,
    NUMCOMPRA INTEGER)
RETURNS (
    FORNECEDOR INTEGER,
    NOTAFISCAL INTEGER,
    PARCELAS SMALLINT,
    VALOR_TOTAL NUMERIC(15,2),
    PARCELA SMALLINT,
    EMISSAO DATE,
    VENCIMENTO DATE,
    VALOR_DOCUMENTO NUMERIC(15,2),
    FORMA_PAGTO SMALLINT,
    CONDICAO_PAGTO SMALLINT,
    DATA_ENTRADA DATE,
    ANO_LANC SMALLINT,
    NUM_LANC INTEGER)
AS
declare variable P01 smallint;
declare variable P02 smallint;
declare variable P03 smallint;
declare variable P04 smallint;
declare variable P05 smallint;
declare variable P06 smallint;
declare variable P07 smallint;
declare variable P08 smallint;
declare variable P09 smallint;
declare variable P10 smallint;
declare variable P11 smallint;
declare variable P12 smallint;
declare variable valor_total_parcelas numeric(15,2);
begin
  for
    Select
        c.Codforn
      , c.Nf
      , coalesce(c.Prazo_01, 0)
      , c.Prazo_02
      , c.Prazo_03
      , c.Prazo_04
      , c.Prazo_05
      , c.Prazo_06
      , c.Prazo_07
      , c.Prazo_08
      , c.Prazo_09
      , c.Prazo_10
      , c.Prazo_11
      , c.Prazo_12
      , case when coalesce(c.Prazo_01, 0) is not null then 1 else 0 end +
        case when c.Prazo_02 is not null then 1 else 0 end +
        case when c.Prazo_03 is not null then 1 else 0 end +
        case when c.Prazo_04 is not null then 1 else 0 end +
        case when c.Prazo_05 is not null then 1 else 0 end +
        case when c.Prazo_06 is not null then 1 else 0 end +
        case when c.Prazo_07 is not null then 1 else 0 end +
        case when c.Prazo_08 is not null then 1 else 0 end +
        case when c.Prazo_09 is not null then 1 else 0 end +
        case when c.Prazo_10 is not null then 1 else 0 end +
        case when c.Prazo_11 is not null then 1 else 0 end +
        case when c.Prazo_12 is not null then 1 else 0 end as parcelas
      , c.Totalnf
      , c.Formapagto_cod
      , c.Condicaopagto_cod
      , c.Dtent
    from TBCOMPRAS c
    where c.Ano        = :Anocompra
      and c.Codcontrol = :Numcompra
    into
        Fornecedor
      , NotaFiscal
      , p01
      , p02
      , p03
      , p04
      , p05
      , p06
      , p07
      , p08
      , p09
      , p10
      , p11
      , p12
      , parcelas
      , valor_total
      , forma_pagto
      , Condicao_pagto
      , Data_entrada
  do
  begin

    parcela = 0;
    emissao = :Data_entrada;
    valor_documento = :Valor_total / :Parcelas;

    -- Parcela 1
    if ( :P01 is not null ) then
    begin
      if ( :P01 = 0 ) then
        parcela = 0;
      else
      if ( :P01 > 0 ) then
        parcela = 1;

      Select d.Dia_util from Get_dia_util(:Emissao, :P01) d into vencimento;

      Select
          d.Anolancamento
        , d.Numlancamento
      from SET_DUPLICATA_PAGAR (
          :Anocompra
        , :Numcompra
        , :Fornecedor
        , :Notafiscal
        , :Forma_pagto
        , :Condicao_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela) d
      into
          Ano_lanc
        , Num_lanc;
    end

    -- Parcela 2
    if ( :P02 is not null ) then
    begin
      parcela = :Parcela + 1;

      Select d.Dia_util from Get_dia_util(:Emissao, :P02) d into vencimento;

      Select
          d.Anolancamento
        , d.Numlancamento
      from SET_DUPLICATA_PAGAR (
          :Anocompra
        , :Numcompra
        , :Fornecedor
        , :Notafiscal
        , :Forma_pagto
        , :Condicao_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela) d
      into
          Ano_lanc
        , Num_lanc;
    end

    -- Parcela 3
    if ( :P03 is not null ) then
    begin
      parcela = :Parcela + 1;

      Select d.Dia_util from Get_dia_util(:Emissao, :P03) d into vencimento;

      Select
          d.Anolancamento
        , d.Numlancamento
      from SET_DUPLICATA_PAGAR (
          :Anocompra
        , :Numcompra
        , :Fornecedor
        , :Notafiscal
        , :Forma_pagto
        , :Condicao_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela) d
      into
          Ano_lanc
        , Num_lanc;
    end

    -- Parcela 4
    if ( :P04 is not null ) then
    begin
      parcela = :Parcela + 1;

      Select d.Dia_util from Get_dia_util(:Emissao, :P04) d into vencimento;

      Select
          d.Anolancamento
        , d.Numlancamento
      from SET_DUPLICATA_PAGAR (
          :Anocompra
        , :Numcompra
        , :Fornecedor
        , :Notafiscal
        , :Forma_pagto
        , :Condicao_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela) d
      into
          Ano_lanc
        , Num_lanc;
    end

    -- Parcela 5
    if ( :P05 is not null ) then
    begin
      parcela = :Parcela + 1;

      Select d.Dia_util from Get_dia_util(:Emissao, :P05) d into vencimento;

      Select
          d.Anolancamento
        , d.Numlancamento
      from SET_DUPLICATA_PAGAR (
          :Anocompra
        , :Numcompra
        , :Fornecedor
        , :Notafiscal
        , :Forma_pagto
        , :Condicao_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela) d
      into
          Ano_lanc
        , Num_lanc;
    end

    -- Parcela 6
    if ( :P06 is not null ) then
    begin
      parcela = :Parcela + 1;

      Select d.Dia_util from Get_dia_util(:Emissao, :P06) d into vencimento;

      Select
          d.Anolancamento
        , d.Numlancamento
      from SET_DUPLICATA_PAGAR (
          :Anocompra
        , :Numcompra
        , :Fornecedor
        , :Notafiscal
        , :Forma_pagto
        , :Condicao_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela) d
      into
          Ano_lanc
        , Num_lanc;
    end

    -- Parcela 7
    if ( :P07 is not null ) then
    begin
      parcela = :Parcela + 1;

      Select d.Dia_util from Get_dia_util(:Emissao, :P07) d into vencimento;

      Select
          d.Anolancamento
        , d.Numlancamento
      from SET_DUPLICATA_PAGAR (
          :Anocompra
        , :Numcompra
        , :Fornecedor
        , :Notafiscal
        , :Forma_pagto
        , :Condicao_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela) d
      into
          Ano_lanc
        , Num_lanc;
    end

    -- Parcela 8
    if ( :P08 is not null ) then
    begin
      parcela = :Parcela + 1;

      Select d.Dia_util from Get_dia_util(:Emissao, :P08) d into vencimento;

      Select
          d.Anolancamento
        , d.Numlancamento
      from SET_DUPLICATA_PAGAR (
          :Anocompra
        , :Numcompra
        , :Fornecedor
        , :Notafiscal
        , :Forma_pagto
        , :Condicao_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela) d
      into
          Ano_lanc
        , Num_lanc;
    end

    -- Parcela 9
    if ( :P09 is not null ) then
    begin
      parcela = :Parcela + 1;

      Select d.Dia_util from Get_dia_util(:Emissao, :P09) d into vencimento;

      Select
          d.Anolancamento
        , d.Numlancamento
      from SET_DUPLICATA_PAGAR (
          :Anocompra
        , :Numcompra
        , :Fornecedor
        , :Notafiscal
        , :Forma_pagto
        , :Condicao_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela) d
      into
          Ano_lanc
        , Num_lanc;
    end

    -- Parcela 10
    if ( :P10 is not null ) then
    begin
      parcela = :Parcela + 1;

      Select d.Dia_util from Get_dia_util(:Emissao, :P10) d into vencimento;

      Select
          d.Anolancamento
        , d.Numlancamento
      from SET_DUPLICATA_PAGAR (
          :Anocompra
        , :Numcompra
        , :Fornecedor
        , :Notafiscal
        , :Forma_pagto
        , :Condicao_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela) d
      into
          Ano_lanc
        , Num_lanc;
    end

    -- Parcela 11
    if ( :P11 is not null ) then
    begin
      parcela = :Parcela + 1;

      Select d.Dia_util from Get_dia_util(:Emissao, :P11) d into vencimento;

      Select
          d.Anolancamento
        , d.Numlancamento
      from SET_DUPLICATA_PAGAR (
          :Anocompra
        , :Numcompra
        , :Fornecedor
        , :Notafiscal
        , :Forma_pagto
        , :Condicao_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela) d
      into
          Ano_lanc
        , Num_lanc;
    end

    -- Parcela 12
    if ( :P12 is not null ) then
    begin
      parcela = :Parcela + 1;

      Select d.Dia_util from Get_dia_util(:Emissao, :P12) d into vencimento;

      Select
          d.Anolancamento
        , d.Numlancamento
      from SET_DUPLICATA_PAGAR (
          :Anocompra
        , :Numcompra
        , :Fornecedor
        , :Notafiscal
        , :Forma_pagto
        , :Condicao_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela) d
      into
          Ano_lanc
        , Num_lanc;
    end

    -- Verificar ao valor total das parcelas
    if ( :Parcelas > 1 ) then
    begin
      Select
          sum( coalesce(d.Valorpag, 0) )
      from TBCONTPAG d
      where d.Anocompra = :Anocompra
        and d.Numcompra = :Numcompra
      into
          valor_total_parcelas;

      -- Atualizar o valor da ultima parcela
      if ( :Valor_total_parcelas < :Valor_total ) then
      begin
        Update TBCONTPAG d Set
            d.Valorpag = :Valor_documento + (:Valor_total - :Valor_total_parcelas)
        where d.Anocompra = :Anocompra
          and d.Numcompra = :Numcompra
          and d.Parcela   = :Parcela;
      end 
    end 

  end
end

^

SET TERM ; ^

SET TERM ^ ;

ALTER PROCEDURE SET_GERAR_TITULOS(
    ANOVENDA SMALLINT,
    NUMVENDA INTEGER)
RETURNS (
    CLIENTE VARCHAR(18),
    PARCELAS SMALLINT,
    VALOR_TOTAL NUMERIC(15,2),
    PARCELA SMALLINT,
    EMISSAO DATE,
    VENCIMENTO DATE,
    VALOR_DOCUMENTO NUMERIC(15,2),
    FORMA_PAGTO SMALLINT,
    DATA_FINALIZ_VENDA DATE,
    ANO_LANC SMALLINT,
    NUM_LANC INTEGER)
AS
declare variable P01 smallint;
declare variable P02 smallint;
declare variable P03 smallint;
declare variable P04 smallint;
declare variable P05 smallint;
declare variable P06 smallint;
declare variable P07 smallint;
declare variable P08 smallint;
declare variable P09 smallint;
declare variable P10 smallint;
declare variable P11 smallint;
declare variable P12 smallint;
declare variable VALOR_TOTAL_PARCELAS numeric(15,2);
begin
  for
    Select
        v.Codcli
      , coalesce(v.Prazo_01, 0)
      , v.Prazo_02
      , v.Prazo_03
      , v.Prazo_04
      , v.Prazo_05
      , v.Prazo_06
      , v.Prazo_07
      , v.Prazo_08
      , v.Prazo_09
      , v.Prazo_10
      , v.Prazo_11
      , v.Prazo_12
      , case when coalesce(v.Prazo_01, 0) is not null then 1 else 0 end +
        case when v.Prazo_02 is not null then 1 else 0 end +
        case when v.Prazo_03 is not null then 1 else 0 end +
        case when v.Prazo_04 is not null then 1 else 0 end +
        case when v.Prazo_05 is not null then 1 else 0 end +
        case when v.Prazo_06 is not null then 1 else 0 end +
        case when v.Prazo_07 is not null then 1 else 0 end +
        case when v.Prazo_08 is not null then 1 else 0 end +
        case when v.Prazo_09 is not null then 1 else 0 end +
        case when v.Prazo_10 is not null then 1 else 0 end +
        case when v.Prazo_11 is not null then 1 else 0 end +
        case when v.Prazo_12 is not null then 1 else 0 end as parcelas
      , v.Totalvenda
      , v.Formapagto_cod
      , v.Dtfinalizacao_venda
    from TBVENDAS v
    where v.Ano        = :Anovenda
      and v.Codcontrol = :Numvenda
    into
        cliente
      , p01
      , p02
      , p03
      , p04
      , p05
      , p06
      , p07
      , p08
      , p09
      , p10
      , p11
      , p12
      , parcelas
      , valor_total
      , forma_pagto
      , data_finaliz_venda
  do
  begin

    parcela = 0;
    emissao = :Data_finaliz_venda;
    valor_documento = :Valor_total / :Parcelas;

    -- Parcela 1
    if ( :P01 is not null ) then
    begin
      if ( :P01 = 0 ) then
        parcela = 0;
      else
      if ( :P01 > 0 ) then
        parcela = 1;

      Select d.Dia_util from Get_dia_util(:Emissao, :P01) d into vencimento;

      Select
          t.Anolancamento
        , t.Numlancamento
      from SET_TITULO_RECEBER (
          :Anovenda
        , :Numvenda
        , :Cliente
        , :Forma_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela) t
      into
          Ano_lanc
        , Num_lanc;
    end

    -- Parcela 2
    if ( :P02 is not null ) then
    begin
      parcela = :Parcela + 1;

      Select d.Dia_util from Get_dia_util(:Emissao, :P02) d into vencimento;

      Select
          t.Anolancamento
        , t.Numlancamento
      from SET_TITULO_RECEBER (
          :Anovenda
        , :Numvenda
        , :Cliente
        , :Forma_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela) t
      into
          Ano_lanc
        , Num_lanc;
    end

    -- Parcela 3
    if ( :P03 is not null ) then
    begin
      parcela = :Parcela + 1;

      Select d.Dia_util from Get_dia_util(:Emissao, :P03) d into vencimento;

      Select
          t.Anolancamento
        , t.Numlancamento
      from SET_TITULO_RECEBER (
          :Anovenda
        , :Numvenda
        , :Cliente
        , :Forma_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela) t
      into
          Ano_lanc
        , Num_lanc;
    end

    -- Parcela 4
    if ( :P04 is not null ) then
    begin
      parcela = :Parcela + 1;

      Select d.Dia_util from Get_dia_util(:Emissao, :P04) d into vencimento;

      Select
          t.Anolancamento
        , t.Numlancamento
      from SET_TITULO_RECEBER (
          :Anovenda
        , :Numvenda
        , :Cliente
        , :Forma_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela) t
      into
          Ano_lanc
        , Num_lanc;
    end

    -- Parcela 5
    if ( :P05 is not null ) then
    begin
      parcela = :Parcela + 1;

      Select d.Dia_util from Get_dia_util(:Emissao, :P05) d into vencimento;

      Select
          t.Anolancamento
        , t.Numlancamento
      from SET_TITULO_RECEBER (
          :Anovenda
        , :Numvenda
        , :Cliente
        , :Forma_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela) t
      into
          Ano_lanc
        , Num_lanc;
    end

    -- Parcela 6
    if ( :P06 is not null ) then
    begin
      parcela = :Parcela + 1;

      Select d.Dia_util from Get_dia_util(:Emissao, :P06) d into vencimento;

      Select
          t.Anolancamento
        , t.Numlancamento
      from SET_TITULO_RECEBER (
          :Anovenda
        , :Numvenda
        , :Cliente
        , :Forma_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela) t
      into
          Ano_lanc
        , Num_lanc;
    end

    -- Parcela 7
    if ( :P07 is not null ) then
    begin
      parcela = :Parcela + 1;

      Select d.Dia_util from Get_dia_util(:Emissao, :P07) d into vencimento;

      Select
          t.Anolancamento
        , t.Numlancamento
      from SET_TITULO_RECEBER (
          :Anovenda
        , :Numvenda
        , :Cliente
        , :Forma_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela) t
      into
          Ano_lanc
        , Num_lanc;
    end

    -- Parcela 8
    if ( :P08 is not null ) then
    begin
      parcela = :Parcela + 1;

      Select d.Dia_util from Get_dia_util(:Emissao, :P08) d into vencimento;

      Select
          t.Anolancamento
        , t.Numlancamento
      from SET_TITULO_RECEBER (
          :Anovenda
        , :Numvenda
        , :Cliente
        , :Forma_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela) t
      into
          Ano_lanc
        , Num_lanc;
    end

    -- Parcela 9
    if ( :P09 is not null ) then
    begin
      parcela = :Parcela + 1;

      Select d.Dia_util from Get_dia_util(:Emissao, :P09) d into vencimento;

      Select
          t.Anolancamento
        , t.Numlancamento
      from SET_TITULO_RECEBER (
          :Anovenda
        , :Numvenda
        , :Cliente
        , :Forma_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela) t
      into
          Ano_lanc
        , Num_lanc;
    end

    -- Parcela 10
    if ( :P10 is not null ) then
    begin
      parcela = :Parcela + 1;

      Select d.Dia_util from Get_dia_util(:Emissao, :P10) d into vencimento;

      Select
          t.Anolancamento
        , t.Numlancamento
      from SET_TITULO_RECEBER (
          :Anovenda
        , :Numvenda
        , :Cliente
        , :Forma_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela) t
      into
          Ano_lanc
        , Num_lanc;
    end

    -- Parcela 11
    if ( :P11 is not null ) then
    begin
      parcela = :Parcela + 1;

      Select d.Dia_util from Get_dia_util(:Emissao, :P11) d into vencimento;

      Select
          t.Anolancamento
        , t.Numlancamento
      from SET_TITULO_RECEBER (
          :Anovenda
        , :Numvenda
        , :Cliente
        , :Forma_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela) t
      into
          Ano_lanc
        , Num_lanc;
    end

    -- Parcela 12
    if ( :P12 is not null ) then
    begin
      parcela = :Parcela + 1;

      Select d.Dia_util from Get_dia_util(:Emissao, :P12) d into vencimento;

      Select
          t.Anolancamento
        , t.Numlancamento
      from SET_TITULO_RECEBER (
          :Anovenda
        , :Numvenda
        , :Cliente
        , :Forma_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela) t
      into
          Ano_lanc
        , Num_lanc;
    end

    -- Verificar ao valor total das parcelas
    if ( :Parcelas > 1 ) then
    begin
      Select
          sum( coalesce(r.Valorrec, 0) )
      from TBCONTREC r
      where r.Anovenda = :Anovenda
        and r.Numvenda = :Numvenda
      into
          valor_total_parcelas;

      -- Atualizar o valor da ultima parcela
      if ( :Valor_total_parcelas < :Valor_total ) then
      begin
        Update TBCONTREC r Set
            r.Valorrec = :Valor_documento + (:Valor_total - :Valor_total_parcelas)
        where r.Anovenda = :Anovenda
          and r.Numvenda = :Numvenda
          and r.Parcela  = :Parcela;
      end 
    end 

  end
end

^

SET TERM ; ^

SET TERM ^ ;

ALTER PROCEDURE SET_TITULO_RECEBER(
    ANOVENDA SMALLINT,
    NUMVENDA INTEGER,
    CLIENTE VARCHAR(18),
    FORMA_PAGTO SMALLINT,
    EMISSAO DATE,
    VENCIMENTO DATE,
    VALOR_DOCUMENTO NUMERIC(15,2),
    PARCELA SMALLINT)
RETURNS (
    ANOLANCAMENTO SMALLINT,
    NUMLANCAMENTO INTEGER)
AS
declare variable FORMA_PAGTO_DESC varchar(30);
begin
  if ( Exists(
    Select
      r.Numlanc
    from TBCONTREC r
    where r.Anovenda = :Anovenda
      and r.Numvenda = :Numvenda
      and r.Parcela  = :Parcela
  ) ) then
    Exit;

  Select
    f.Descri
  from TBFORMPAGTO f
  where f.Cod = :Forma_pagto
  into
    Forma_pagto_desc;

  Anolancamento = :Anovenda;

  if ( :Anolancamento = 2011 ) then
    Numlancamento = gen_id(Gen_contarec_num_2011, 1);
  else
  if ( :Anolancamento = 2012 ) then
    Numlancamento = gen_id(Gen_contarec_num_2012, 1);
  else
  if ( :Anolancamento = 2013 ) then
    Numlancamento = gen_id(Gen_contarec_num_2013, 1);
  else
  if ( :Anolancamento = 2014 ) then
    Numlancamento = gen_id(Gen_contarec_num_2014, 1);
  else
  if ( :Anolancamento = 2015 ) then
    Numlancamento = gen_id(Gen_contarec_num_2015, 1);
  else
  if ( :Anolancamento = 2016 ) then
    Numlancamento = gen_id(Gen_contarec_num_2016, 1);
  else
  if ( :Anolancamento = 2017 ) then
    Numlancamento = gen_id(Gen_contarec_num_2017, 1);
  else
  if ( :Anolancamento = 2018 ) then
    Numlancamento = gen_id(Gen_contarec_num_2018, 1);
  else
  if ( :Anolancamento = 2019 ) then
    Numlancamento = gen_id(Gen_contarec_num_2019, 1);
  else
  if ( :Anolancamento = 2020 ) then
    Numlancamento = gen_id(Gen_contarec_num_2020, 1);

  Insert Into TBCONTREC (
      Anolanc
    , numlanc
    , Anovenda
    , Numvenda
    , Cnpj
    , Tippag
    , Forma_pagto
    , Dtemiss
    , Dtvenc
    , Valorrec
    , Parcela
    , Percentjuros
    , Percentmulta
    , Percentdesconto
    , Baixado
    , Enviado
  ) values (
      :Anolancamento
    , :Numlancamento
    , :Anovenda
    , :Numvenda
    , :Cliente
    , :Forma_pagto_desc
    , :Forma_pagto
    , :Emissao
    , :Vencimento
    , :Valor_documento
    , :Parcela
    , 0
    , 0
    , 0
    , 0
    , 0
  );

  suspend;
end

^

SET TERM ; ^

