object DMNFe: TDMNFe
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 598
  Top = 180
  Height = 429
  Width = 419
  object ACBrNFe: TACBrNFe
    Configuracoes.Geral.PathSalvar = '..\Bin\'
    Configuracoes.WebServices.UF = 'PA'
    Configuracoes.WebServices.AguardarConsultaRet = 0
    Configuracoes.WebServices.IntervaloTentativas = 0
    Configuracoes.WebServices.AjustaAguardaConsultaRet = False
    DANFE = rvDANFE
    Left = 24
    Top = 24
  end
  object rvDANFE: TACBrNFeDANFERave
    ACBrNFe = ACBrNFe
    Sistema = 'Masterdados - Contatos: (91) 8717-1057/8129-1567'
    PathPDF = '..\Bin\'
    MostrarPreview = True
    MostrarStatus = True
    TipoDANFE = tiRetrato
    NumCopias = 1
    ImprimirDescPorc = False
    ImprimirTotalLiquido = False
    MargemInferior = 0.800000000000000000
    MargemSuperior = 0.800000000000000000
    MargemEsquerda = 0.600000000000000000
    MargemDireita = 0.510000000000000000
    CasasDecimais._qCom = 2
    CasasDecimais._vUnCom = 2
    ExibirResumoCanhoto = False
    FormularioContinuo = False
    TamanhoFonte_DemaisCampos = 10
    ProdutosPorPagina = 0
    ImprimirDetalhamentoEspecifico = True
    NFeCancelada = False
    EspessuraBorda = 1
    TamanhoFonte_RazaoSocial = 12
    TamanhoFonte_ANTT = 10
    Left = 24
    Top = 72
  end
  object qryDestinatario: TIBQuery
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select'
      '    c.Codigo'
      '  , c.Pessoa_fisica'
      '  , c.Cnpj'
      '  , c.Nome'
      '  , c.Inscest'
      '  , c.Inscmun'
      ''
      '  , c.Fone'
      '  , c.Email'
      '  , c.Site'
      ''
      '  , c.Tlg_tipo'
      '  , tl.Tlg_descricao'
      '  , tl.Tlg_sigla'
      '  , c.Log_cod'
      '  , lg.Log_nome'
      '  , c.Complemento'
      '  , c.Numero_end'
      '  , c.Cep'
      ''
      '  , c.Bai_cod'
      '  , br.Bai_nome'
      ''
      '  , c.Cid_cod'
      '  , cd.Cid_nome'
      '  , cd.Cid_siafi'
      '  , cd.Cid_ibge'
      '  , cd.Cid_ddd'
      ''
      '  , c.Est_cod'
      '  , uf.Est_nome'
      '  , uf.Est_sigla'
      '  , uf.Est_siafi'
      ''
      '  , c.Pais_id'
      '  , pa.Pais_nome'
      'from TBCLIENTE c'
      '  left join TBESTADO uf on (uf.Est_cod = c.Est_cod)'
      '  left join TBCIDADE cd on (cd.Cid_cod = c.Cid_cod)'
      '  left join TBBAIRRO br on (br.Bai_cod = c.Bai_cod)'
      '  left join TBLOGRADOURO lg on (lg.Log_cod = c.Log_cod)'
      '  left join TBTIPO_LoGRADOURO tl on (tl.Tlg_cod = c.Tlg_tipo)'
      '  left Join TBPAIS pa on (pa.Pais_id = c.Pais_id)'
      'where c.Cnpj = :Cnpj')
    Left = 144
    Top = 72
    ParamData = <
      item
        DataType = ftString
        Name = 'Cnpj'
        ParamType = ptInput
        Value = ''
      end>
    object qryDestinatarioCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'TBCLIENTE.CODIGO'
      Required = True
    end
    object qryDestinatarioPESSOA_FISICA: TSmallintField
      FieldName = 'PESSOA_FISICA'
      Origin = 'TBCLIENTE.PESSOA_FISICA'
      Required = True
    end
    object qryDestinatarioCNPJ: TIBStringField
      FieldName = 'CNPJ'
      Origin = 'TBCLIENTE.CNPJ'
      Required = True
      Size = 18
    end
    object qryDestinatarioNOME: TIBStringField
      FieldName = 'NOME'
      Origin = 'TBCLIENTE.NOME'
      Size = 60
    end
    object qryDestinatarioINSCEST: TIBStringField
      FieldName = 'INSCEST'
      Origin = 'TBCLIENTE.INSCEST'
    end
    object qryDestinatarioINSCMUN: TIBStringField
      FieldName = 'INSCMUN'
      Origin = 'TBCLIENTE.INSCMUN'
    end
    object qryDestinatarioFONE: TIBStringField
      FieldName = 'FONE'
      Origin = 'TBCLIENTE.FONE'
      Size = 11
    end
    object qryDestinatarioEMAIL: TIBStringField
      FieldName = 'EMAIL'
      Origin = 'TBCLIENTE.EMAIL'
      Size = 60
    end
    object qryDestinatarioSITE: TIBStringField
      FieldName = 'SITE'
      Origin = 'TBCLIENTE.SITE'
      Size = 40
    end
    object qryDestinatarioTLG_TIPO: TSmallintField
      FieldName = 'TLG_TIPO'
      Origin = 'TBCLIENTE.TLG_TIPO'
    end
    object qryDestinatarioTLG_DESCRICAO: TIBStringField
      FieldName = 'TLG_DESCRICAO'
      Origin = 'TBTIPO_LOGRADOURO.TLG_DESCRICAO'
      Size = 50
    end
    object qryDestinatarioTLG_SIGLA: TIBStringField
      FieldName = 'TLG_SIGLA'
      Origin = 'TBTIPO_LOGRADOURO.TLG_SIGLA'
      Size = 10
    end
    object qryDestinatarioLOG_COD: TIntegerField
      FieldName = 'LOG_COD'
      Origin = 'TBCLIENTE.LOG_COD'
    end
    object qryDestinatarioLOG_NOME: TIBStringField
      FieldName = 'LOG_NOME'
      Origin = 'TBLOGRADOURO.LOG_NOME'
      Size = 250
    end
    object qryDestinatarioCOMPLEMENTO: TIBStringField
      FieldName = 'COMPLEMENTO'
      Origin = 'TBCLIENTE.COMPLEMENTO'
      Size = 50
    end
    object qryDestinatarioNUMERO_END: TIBStringField
      FieldName = 'NUMERO_END'
      Origin = 'TBCLIENTE.NUMERO_END'
      Size = 10
    end
    object qryDestinatarioCEP: TIBStringField
      FieldName = 'CEP'
      Origin = 'TBCLIENTE.CEP'
      Size = 8
    end
    object qryDestinatarioBAI_COD: TIntegerField
      FieldName = 'BAI_COD'
      Origin = 'TBCLIENTE.BAI_COD'
    end
    object qryDestinatarioBAI_NOME: TIBStringField
      FieldName = 'BAI_NOME'
      Origin = 'TBBAIRRO.BAI_NOME'
      Size = 100
    end
    object qryDestinatarioCID_COD: TIntegerField
      FieldName = 'CID_COD'
      Origin = 'TBCLIENTE.CID_COD'
    end
    object qryDestinatarioCID_NOME: TIBStringField
      FieldName = 'CID_NOME'
      Origin = 'TBCIDADE.CID_NOME'
      Size = 100
    end
    object qryDestinatarioCID_SIAFI: TIntegerField
      FieldName = 'CID_SIAFI'
      Origin = 'TBCIDADE.CID_SIAFI'
    end
    object qryDestinatarioCID_IBGE: TIntegerField
      FieldName = 'CID_IBGE'
      Origin = 'TBCIDADE.CID_IBGE'
    end
    object qryDestinatarioCID_DDD: TSmallintField
      FieldName = 'CID_DDD'
      Origin = 'TBCIDADE.CID_DDD'
    end
    object qryDestinatarioEST_COD: TSmallintField
      FieldName = 'EST_COD'
      Origin = 'TBCLIENTE.EST_COD'
    end
    object qryDestinatarioEST_NOME: TIBStringField
      FieldName = 'EST_NOME'
      Origin = 'TBESTADO.EST_NOME'
      Size = 100
    end
    object qryDestinatarioEST_SIGLA: TIBStringField
      FieldName = 'EST_SIGLA'
      Origin = 'TBESTADO.EST_SIGLA'
      Size = 2
    end
    object qryDestinatarioEST_SIAFI: TIntegerField
      FieldName = 'EST_SIAFI'
      Origin = 'TBESTADO.EST_SIAFI'
    end
    object qryDestinatarioPAIS_ID: TIBStringField
      FieldName = 'PAIS_ID'
      Origin = 'TBCLIENTE.PAIS_ID'
      Size = 5
    end
    object qryDestinatarioPAIS_NOME: TIBStringField
      FieldName = 'PAIS_NOME'
      Origin = 'TBPAIS.PAIS_NOME'
      Size = 150
    end
  end
  object qryDuplicatas: TIBQuery
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select'
      '    r.Anolanc'
      '  , r.Numlanc'
      '  , r.Parcela'
      '  , r.Dtemiss'
      '  , r.Dtvenc'
      '  , r.Valorrec'
      '  , r.Valormulta'
      '  , r.Percentdesconto'
      'from TBCONTREC r'
      'where r.Anovenda = :AnoVenda'
      '  and r.Numvenda = :NumVenda')
    Left = 144
    Top = 216
    ParamData = <
      item
        DataType = ftInteger
        Name = 'AnoVenda'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'NumVenda'
        ParamType = ptInput
        Value = 0
      end>
    object qryDuplicatasANOLANC: TSmallintField
      FieldName = 'ANOLANC'
      Origin = 'TBCONTREC.ANOLANC'
      Required = True
    end
    object qryDuplicatasNUMLANC: TIntegerField
      FieldName = 'NUMLANC'
      Origin = 'TBCONTREC.NUMLANC'
      Required = True
    end
    object qryDuplicatasPARCELA: TSmallintField
      FieldName = 'PARCELA'
      Origin = 'TBCONTREC.PARCELA'
    end
    object qryDuplicatasDTEMISS: TDateField
      FieldName = 'DTEMISS'
      Origin = 'TBCONTREC.DTEMISS'
    end
    object qryDuplicatasDTVENC: TDateField
      FieldName = 'DTVENC'
      Origin = 'TBCONTREC.DTVENC'
    end
    object qryDuplicatasVALORREC: TIBBCDField
      FieldName = 'VALORREC'
      Origin = 'TBCONTREC.VALORREC'
      Precision = 18
      Size = 2
    end
    object qryDuplicatasVALORMULTA: TIBBCDField
      FieldName = 'VALORMULTA'
      Origin = 'TBCONTREC.VALORMULTA'
      Precision = 18
      Size = 2
    end
    object qryDuplicatasPERCENTDESCONTO: TIBBCDField
      FieldName = 'PERCENTDESCONTO'
      Origin = 'TBCONTREC.PERCENTDESCONTO'
      Precision = 9
      Size = 2
    end
  end
  object qryDadosProduto: TIBQuery
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select'
      '    i.Ano'
      '  , i.Codcontrol'
      '  , i.Seq'
      '  , i.Codprod'
      '  , p.Codbarra_ean'
      '  , p.Descri'
      '  , p.Referencia'
      '  , p.Ncm_sh'
      '  , p.Codorigem'
      '  , p.Codtributacao'
      '  , p.Cst'
      '  , p.Csosn'
      '  , i.Codemp'
      '  , i.Codcli'
      '  , i.Dtvenda'
      '  , i.Qtde'
      '  , i.Punit'
      '  , i.Punit_promocao'
      '  , i.Desconto'
      '  , i.Desconto_valor'
      '  , i.Pfinal'
      '  , i.Qtdefinal'
      '  , i.Unid_cod'
      '  , u.Unp_descricao'
      '  , u.Unp_sigla'
      '  , i.Cfop_cod'
      '  , i.Aliquota'
      '  , i.Aliquota_csosn'
      '  , i.Valor_ipi'
      '  , i.Qtde * i.Punit as Total_bruto'
      '  , i.Qtde * i.Pfinal as Total_liquido'
      '  , i.Qtde * i.Desconto_valor as Total_desconto'
      '  , p.Qtde as Estoque'
      '  , p.Reserva'
      '  , coalesce(p.Qtde, 0) - coalesce(p.Reserva, 0) as Disponivel'
      'from TVENDASITENS i'
      '  inner join TBPRODUTO p on (p.Cod = i.Codprod)'
      '  inner join TBUNIDADEPROD u on (u.Unp_cod = i.Unid_cod)'
      'where i.Ano = :anovenda'
      '  and i.Codcontrol = :numvenda')
    Left = 144
    Top = 168
    ParamData = <
      item
        DataType = ftInteger
        Name = 'anovenda'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'numvenda'
        ParamType = ptInput
        Value = 0
      end>
    object qryDadosProdutoANO: TSmallintField
      FieldName = 'ANO'
      Origin = 'TVENDASITENS.ANO'
      Required = True
    end
    object qryDadosProdutoCODCONTROL: TIntegerField
      FieldName = 'CODCONTROL'
      Origin = 'TVENDASITENS.CODCONTROL'
      Required = True
    end
    object qryDadosProdutoSEQ: TSmallintField
      FieldName = 'SEQ'
      Origin = 'TVENDASITENS.SEQ'
      Required = True
    end
    object qryDadosProdutoCODPROD: TIBStringField
      FieldName = 'CODPROD'
      Origin = 'TVENDASITENS.CODPROD'
      Required = True
      Size = 10
    end
    object qryDadosProdutoCODBARRA_EAN: TIBStringField
      FieldName = 'CODBARRA_EAN'
      Origin = 'TBPRODUTO.CODBARRA_EAN'
      Size = 15
    end
    object qryDadosProdutoDESCRI: TIBStringField
      FieldName = 'DESCRI'
      Origin = 'TBPRODUTO.DESCRI'
      Size = 50
    end
    object qryDadosProdutoREFERENCIA: TIBStringField
      FieldName = 'REFERENCIA'
      Origin = 'TBPRODUTO.REFERENCIA'
      Size = 15
    end
    object qryDadosProdutoNCM_SH: TIBStringField
      FieldName = 'NCM_SH'
      Origin = 'TBPRODUTO.NCM_SH'
      Size = 10
    end
    object qryDadosProdutoCODORIGEM: TIBStringField
      FieldName = 'CODORIGEM'
      Origin = 'TBPRODUTO.CODORIGEM'
      Size = 1
    end
    object qryDadosProdutoCODTRIBUTACAO: TIBStringField
      FieldName = 'CODTRIBUTACAO'
      Origin = 'TBPRODUTO.CODTRIBUTACAO'
      Size = 2
    end
    object qryDadosProdutoCST: TIBStringField
      FieldName = 'CST'
      Origin = 'TBPRODUTO.CST'
      Size = 3
    end
    object qryDadosProdutoCSOSN: TIBStringField
      FieldName = 'CSOSN'
      Origin = 'TBPRODUTO.CSOSN'
      Size = 3
    end
    object qryDadosProdutoCODEMP: TIBStringField
      FieldName = 'CODEMP'
      Origin = 'TVENDASITENS.CODEMP'
      Size = 18
    end
    object qryDadosProdutoCODCLI: TIBStringField
      FieldName = 'CODCLI'
      Origin = 'TVENDASITENS.CODCLI'
      Size = 18
    end
    object qryDadosProdutoDTVENDA: TDateTimeField
      FieldName = 'DTVENDA'
      Origin = 'TVENDASITENS.DTVENDA'
    end
    object qryDadosProdutoQTDE: TIntegerField
      FieldName = 'QTDE'
      Origin = 'TVENDASITENS.QTDE'
    end
    object qryDadosProdutoPUNIT: TIBBCDField
      FieldName = 'PUNIT'
      Origin = 'TVENDASITENS.PUNIT'
      Precision = 18
      Size = 2
    end
    object qryDadosProdutoPUNIT_PROMOCAO: TIBBCDField
      FieldName = 'PUNIT_PROMOCAO'
      Origin = 'TVENDASITENS.PUNIT_PROMOCAO'
      Precision = 18
      Size = 2
    end
    object qryDadosProdutoDESCONTO: TIBBCDField
      FieldName = 'DESCONTO'
      Origin = 'TVENDASITENS.DESCONTO'
      Precision = 18
      Size = 3
    end
    object qryDadosProdutoDESCONTO_VALOR: TIBBCDField
      FieldName = 'DESCONTO_VALOR'
      Origin = 'TVENDASITENS.DESCONTO_VALOR'
      Precision = 18
      Size = 2
    end
    object qryDadosProdutoPFINAL: TIBBCDField
      FieldName = 'PFINAL'
      Origin = 'TVENDASITENS.PFINAL'
      Precision = 18
      Size = 2
    end
    object qryDadosProdutoQTDEFINAL: TIntegerField
      FieldName = 'QTDEFINAL'
      Origin = 'TVENDASITENS.QTDEFINAL'
    end
    object qryDadosProdutoUNID_COD: TSmallintField
      FieldName = 'UNID_COD'
      Origin = 'TVENDASITENS.UNID_COD'
    end
    object qryDadosProdutoUNP_DESCRICAO: TIBStringField
      FieldName = 'UNP_DESCRICAO'
      Origin = 'TBUNIDADEPROD.UNP_DESCRICAO'
      Size = 50
    end
    object qryDadosProdutoUNP_SIGLA: TIBStringField
      FieldName = 'UNP_SIGLA'
      Origin = 'TBUNIDADEPROD.UNP_SIGLA'
      Size = 5
    end
    object qryDadosProdutoCFOP_COD: TIntegerField
      FieldName = 'CFOP_COD'
      Origin = 'TVENDASITENS.CFOP_COD'
    end
    object qryDadosProdutoALIQUOTA: TIBBCDField
      FieldName = 'ALIQUOTA'
      Origin = 'TVENDASITENS.ALIQUOTA'
      Precision = 18
      Size = 2
    end
    object qryDadosProdutoALIQUOTA_CSOSN: TIBBCDField
      FieldName = 'ALIQUOTA_CSOSN'
      Origin = 'TVENDASITENS.ALIQUOTA_CSOSN'
      Precision = 18
      Size = 2
    end
    object qryDadosProdutoVALOR_IPI: TIBBCDField
      FieldName = 'VALOR_IPI'
      Origin = 'TVENDASITENS.VALOR_IPI'
      Precision = 18
      Size = 2
    end
    object qryDadosProdutoTOTAL_BRUTO: TIBBCDField
      FieldName = 'TOTAL_BRUTO'
      Precision = 18
      Size = 2
    end
    object qryDadosProdutoTOTAL_LIQUIDO: TIBBCDField
      FieldName = 'TOTAL_LIQUIDO'
      Precision = 18
      Size = 2
    end
    object qryDadosProdutoTOTAL_DESCONTO: TIBBCDField
      FieldName = 'TOTAL_DESCONTO'
      Precision = 18
      Size = 2
    end
    object qryDadosProdutoESTOQUE: TIntegerField
      FieldName = 'ESTOQUE'
      Origin = 'TBPRODUTO.QTDE'
    end
    object qryDadosProdutoRESERVA: TIntegerField
      FieldName = 'RESERVA'
      Origin = 'TBPRODUTO.RESERVA'
    end
    object qryDadosProdutoDISPONIVEL: TLargeintField
      FieldName = 'DISPONIVEL'
    end
  end
  object frdEmpresa: TfrxDBDataset
    UserName = 'frdEmpresa'
    CloseDataSource = False
    FieldAliases.Strings = (
      'CODIGO=CODIGO'
      'PESSOA_FISICA=PESSOA_FISICA'
      'CNPJ=CNPJ'
      'RZSOC=RZSOC'
      'NMFANT=NMFANT'
      'IE=IE'
      'IM=IM'
      'FONE=FONE'
      'LOGO=LOGO'
      'TLG_TIPO=TLG_TIPO'
      'TLG_DESCRICAO=TLG_DESCRICAO'
      'TLG_SIGLA=TLG_SIGLA'
      'LOG_COD=LOG_COD'
      'LOG_NOME=LOG_NOME'
      'COMPLEMENTO=COMPLEMENTO'
      'NUMERO_END=NUMERO_END'
      'CEP=CEP'
      'BAI_COD=BAI_COD'
      'BAI_NOME=BAI_NOME'
      'CID_COD=CID_COD'
      'CID_NOME=CID_NOME'
      'CID_SIAFI=CID_SIAFI'
      'CID_IBGE=CID_IBGE'
      'CID_DDD=CID_DDD'
      'EST_COD=EST_COD'
      'EST_NOME=EST_NOME'
      'EST_SIGLA=EST_SIGLA'
      'EST_SIAFI=EST_SIAFI'
      'EMAIL=EMAIL'
      'HOME_PAGE=HOME_PAGE'
      'CHAVE_ACESSO_NFE=CHAVE_ACESSO_NFE'
      'PAIS_ID=PAIS_ID'
      'PAIS_NOME=PAIS_NOME')
    DataSet = qryEmitente
    Left = 184
    Top = 24
  end
  object frdCliente: TfrxDBDataset
    UserName = 'frdCliente'
    CloseDataSource = False
    FieldAliases.Strings = (
      'CODIGO=CODIGO'
      'PESSOA_FISICA=PESSOA_FISICA'
      'CNPJ=CNPJ'
      'NOME=NOME'
      'INSCEST=INSCEST'
      'INSCMUN=INSCMUN'
      'FONE=FONE'
      'EMAIL=EMAIL'
      'SITE=SITE'
      'TLG_TIPO=TLG_TIPO'
      'TLG_DESCRICAO=TLG_DESCRICAO'
      'TLG_SIGLA=TLG_SIGLA'
      'LOG_COD=LOG_COD'
      'LOG_NOME=LOG_NOME'
      'COMPLEMENTO=COMPLEMENTO'
      'NUMERO_END=NUMERO_END'
      'CEP=CEP'
      'BAI_COD=BAI_COD'
      'BAI_NOME=BAI_NOME'
      'CID_COD=CID_COD'
      'CID_NOME=CID_NOME'
      'CID_SIAFI=CID_SIAFI'
      'CID_IBGE=CID_IBGE'
      'CID_DDD=CID_DDD'
      'EST_COD=EST_COD'
      'EST_NOME=EST_NOME'
      'EST_SIGLA=EST_SIGLA'
      'EST_SIAFI=EST_SIAFI'
      'PAIS_ID=PAIS_ID'
      'PAIS_NOME=PAIS_NOME')
    DataSet = qryDestinatario
    Left = 184
    Top = 72
  end
  object frrVenda: TfrxReport
    Version = '4.6.32'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 40928.407150601900000000
    ReportOptions.LastChange = 41177.660600069440000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 20
    Top = 121
    Datasets = <
      item
        DataSet = frdCliente
        DataSetName = 'frdCliente'
      end
      item
        DataSet = frdEmpresa
        DataSetName = 'frdEmpresa'
      end
      item
        DataSet = frdItens
        DataSetName = 'frdItens'
      end
      item
        DataSet = frdTitulo
        DataSetName = 'frdTitulo'
      end
      item
        DataSet = frdVenda
        DataSetName = 'frdVenda'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Lucida Console'
      Font.Style = []
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object bndReportTitle: TfrxReportTitle
        Height = 75.590600000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object frdEmpresaRZSOC: TfrxMemoView
          Left = 145.740260000000000000
          Top = 3.000000000000000000
          Width = 411.968770000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdCliente
          DataSetName = 'frdCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            '[frdEmpresa."RZSOC"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frdEmpresaNMFANT: TfrxMemoView
          Left = 145.740260000000000000
          Top = 21.897650000000000000
          Width = 226.771800000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdCliente
          DataSetName = 'frdCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Lucida Console'
          Font.Style = []
          Memo.UTF8 = (
            'CNPJ.: [frdEmpresa."CNPJ"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frdVendaCODCONTROL: TfrxMemoView
          Left = 559.370440000000000000
          Top = 18.897650000000000000
          Width = 158.740260000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdVenda
          DataSetName = 'frdVenda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haCenter
          Memo.UTF8 = (
            
              '[frdVenda."ANO"]/[FormatFloat('#39'0000000'#39',<frdVenda."CODCONTROL">)' +
              ']')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          Left = 559.370440000000000000
          Width = 158.740260000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            'N '#195#186' m e r o   C o n t r o l e :')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 559.370440000000000000
          Top = 37.795300000000000000
          Width = 158.740260000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataSet = frdVenda
          DataSetName = 'frdVenda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            
              '[IIF(<frdVenda."STATUS">=1,'#39'Or'#195#167'amento'#39',IIF(<frdVenda."STATUS">=' +
              '2,'#39'Or'#195#167'amento'#39',IIF(<frdVenda."STATUS">=3,'#39'Finalizada'#39',IIF(<frdVe' +
              'nda."STATUS">=4,'#39'Gerada NF-e'#39','#39'Cancelada'#39'))))]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          Left = 145.740260000000000000
          Top = 54.590600000000000000
          Width = 559.370440000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataSet = frdCliente
          DataSetName = 'frdCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = []
          Memo.UTF8 = (
            
              '[frdEmpresa."TLG_SIGLA"] [frdEmpresa."LOG_NOME"], [frdEmpresa."N' +
              'UMERO_END"], [frdEmpresa."BAI_NOME"] - [frdEmpresa."CID_NOME"]/[' +
              'frdEmpresa."EST_SIGLA"] CEP.: [frdEmpresa."CEP"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Line1: TfrxLineView
          Left = 3.779530000000000000
          Top = 71.504020000000000000
          Width = 718.110700000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
        object frdFone: TfrxMemoView
          Left = 145.740260000000000000
          Top = 41.795300000000000000
          Width = 226.771800000000000000
          Height = 11.338590000000000000
          ShowHint = False
          DataSet = frdCliente
          DataSetName = 'frdCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = []
          Memo.UTF8 = (
            'FONE: [frdEmpresa."Fone"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Picture1: TfrxPictureView
          Left = 1.000000000000000000
          Width = 139.842610000000000000
          Height = 64.252010000000000000
          ShowHint = False
          Picture.Data = {
            07544269746D6170D68C0000424DD68C0000000000003600000028000000A000
            00004B0000000100180000000000A08C0000232E0000232E0000000000000000
            0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF111111000000000000
            000000DEDEDEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFEFEFEFE
            FEFEFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFEFEFEFFFFFF
            FFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFEFEFEFFFF
            FFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFF
            FFFFFFFFFFFFFFFFFEFEFEFEFEFEFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFEFEFE
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFEFEFEFEFE
            FEFEFEFEFEFEFEFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFE
            FEFEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFFFFFF
            FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFEFEFEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFEFEFEFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFEFEFEFEFEFEFEFEFEFFFFFF
            FFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFEFE
            FEFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFE
            FEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF101010000000000000
            000000E1E1E1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0F0F0FFEFEFE22222230
            3030FFFFFF101010EEEEEEFFFFFFFFFFFF6666660000004D4D4D111111CECECE
            FFFFFFFFFFFF8282820000009D9D9DFFFFFFFFFFFF8C8C8C010101050505A5A5
            A5FFFFFFFFFFFFEBEBEB101010EAEAEAFFFFFFFFFFFFFFFFFF2F2F2F6E6E6EFF
            FFFFFFFFFFBCBCBC020202101010555555505050FFFFFFFFFFFF8D8D8D202020
            FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFB1111111010101010
            10101010111111F9F9F9FFFFFFFCFCFC101010E8E8E8FFFFFFFFFFFFC7C7C70A
            0A0A010101666666FFFFFFFFFFFFFFFFFF727272000000A2A2A2FFFFFFF7F7F7
            101010DCDCDCFFFFFFFFFFFFFFFFFF4343434D4D4DFFFFFFFFFFFFFFFFFF5A5A
            5A000000111111DBDBDBFFFFFFFFFFFFFFFFFF606060000000141414CDCDCDFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFBABABA101010101010101010101010CDCDCD
            FFFFFFFFFFFF353535000000D3D3D3FFFFFFFFFFFF5E5E5E0000005454541010
            10E8E8E8FFFFFFFFFFFF5A5A5A000000565656101010D9D9D9FFFFFFFFFFFF11
            1111FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0E0E0E000000000000
            000000E5E5E5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFF01010106
            0606FEFEFE000000EDEDEDFFFFFFF6F6F6000000D4D4D4E0E0E0000000E9E9E9
            FFFFFFFFFFFF1C1C1C737373FCFCFCFFFFFFEFEFEF000000F4F4F4D6D6D64E4E
            4EFEFEFEFFFFFFEAEAEA000000E9E9E9FFFFFFFFFFFFFFFFFF212121656565FF
            FFFFFFFFFF151515565656FFFFFF1313137F7F7FFFFFFFFFFFFF878787141414
            FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFAFA0101019B9B9BD5D5
            D5D5D5D5D6D6D6FEFEFEFFFFFFFBFBFB000000E7E7E7FFFFFFFFFFFF010101B9
            B9B9F6F6F6444444E7E7E7FFFFFFFFFFFF1A1A1A7C7C7CFCFCFCFFFFFFF6F6F6
            010101DBDBDBFFFFFFFFFFFFFFFFFF3A3A3A424242FFFFFFFFFFFF9D9D9D0707
            07F5F5F57575751A1A1AFEFEFEFFFFFF7A7A7A080808FBFBFB969696030303F8
            F8F8FFFFFFFFFFFFFFFFFFFFFFFFB7B7B7000000D5D5D5D5D5D5D5D5D5F6F6F6
            FFFFFFFFFFFF010101CECECEFDFDFDFFFFFFC3C3C3010101EDEDEDC7C7C70000
            00E7E7E7FFFFFFF1F1F1000000E1E1E1D4D4D4000000EDEDEDFFFFFFFFFFFF8C
            8C8CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0D0D0D000000000000
            000000E8E8E8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000D8D8D80B0B0B08
            0808D8D8D8000000EDEDEDFFFFFFFFFFFF5D5D5D111111505050000000E9E9E9
            FFFFFFFFFFFF1B1B1B7C7C7CFFFFFFFFFFFFB7B7B70000001818181818181414
            14F2F2F2FFFFFFEAEAEA000000E5E5E5FFFFFFFFFFFFFFFFFF212121656565FF
            FFFFFFFFFFBFBFBF1212122B2B2B1717177E7E7EFFFFFFFFFFFF878787141414
            FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFAFA010101B9B9B9FEFE
            FEFEFEFEFEFEFEFFFFFFFFFFFFFBFBFB000000E7E7E7FFFFFFFFFFFF00000018
            1818181818161616B6B6B6FFFFFFFFFFFF191919858585FFFFFFFFFFFFF6F6F6
            010101D7D7D7FFFFFFFFFFFFFFFFFF3A3A3A424242FFFFFFFFFFFF4C4C4C2121
            21FFFFFFFDFDFDFEFEFEFFFFFFFFFFFF3636365B5B5BFFFFFFF6F6F6010101D3
            D3D3FFFFFFFFFFFFFFFFFFFFFFFFB7B7B7000000FEFEFEFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFF010101D4D4D4FFFFFFFFFFFF8E8E8E191919FEFEFEFFFFFF0000
            00E7E7E7FFFFFFFFFFFF515151111111525252000000EDEDEDFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0C0C0C000000000000
            000000ECECECFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000009292923838382E
            2E2E9B9B9B000000EDEDEDFFFFFFFFFFFFD5D5D5E7E7E7DBDBDB000000E9E9E9
            FFFFFFFDFDFD1B1B1B7B7B7BFDFDFDFFFFFFE0E0E0000000F6F6F6DFDFDF0000
            00FEFEFEFFFFFFEAEAEA000000BFBFBFF9F9F9FFFFFFFFFFFF212121656565FF
            FFFFFFFFFFEAEAEAC0C0C0ECECEC2525257D7D7DFFFFFFFFFFFF878787141414
            FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFAFA0101010E0E0E1414
            141414143A3A3AFFFFFFFFFFFFFBFBFB000000E7E7E7FFFFFFFFFFFF010101E5
            E5E5F6F6F6050505D7D7D7FFFFFFFDFDFD1A1A1A888888FDFDFDFFFFFFF6F6F6
            010101ADADADF7F7F7FFFFFFFFFFFF3A3A3A424242FFFFFFFFFFFF8181811414
            14FCFCFCB0B0B0919191FFFFFFFFFFFF5F5F5F181818FBFBFBCCCCCC000000EC
            ECECFFFFFFFFFFFFFFFFFFFFFFFFB7B7B7000000FEFEFEFFFFFFFFFFFFFFFFFF
            FFFFFFFDFDFD010101D6D6D6FFFFFFFFFFFFACACAC070707F9F9F9F9F9F90000
            00E7E7E7FFFFFFFFFFFFD1D1D1EEEEEED5D5D5000000EDEDEDFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0C0C0C000000000000
            000000EFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000343434A5A5A5A4
            A4A4262626000000EDEDEDFFFFFFFFFFFF717171040404080808111111FAFAFA
            FFFFFFB4B4B4000000000000B6B6B6FFFFFFFFFFFF4444440404040202028A8A
            8AFFFFFFFFFFFFE9E9E9030303171717080808FEFEFEFFFFFF212121626262FF
            FFFFFFFFFFD2D2D2020202121212000000D1D1D1FFFFFFFFFFFF878787141414
            FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFAFA0101019B9B9BD2D2
            D2D2D2D2DADADAFFFFFFFFFFFFFBFBFB000000E7E7E7FFFFFFFFFFFF94949402
            02020707073B3B3BFFFFFFFFFFFFB1B1B1000000000000AFAFAFFFFFFFF5F5F5
            010101191919000000FEFEFEFFFFFF3232323D3D3DFFFFFFFFFFFFF6F6F61313
            13080808000000A6A6A6FFFFFFFFFFFFFFFFFF1717170202020000008C8C8CFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFB7B7B7000000FEFEFEFFFFFFFFFFFFFFFFFF
            FFFFFF6B6B6B000000000000DEDEDEFFFFFFFDFDFD1010100606061414140000
            00E7E7E7FFFFFFFFFFFF636363050505080808151515FCFCFCFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0B0B0B000000000000
            000000F2F2F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000FCFCFCEB
            EBEB000000000000EDEDEDFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFFFFFFFFFFFF
            FFFFFFFFFFFF1818187E7E7EFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFC4C4C4D6D6D6FF
            FFFFFFFFFFFFFFFFFFFFFFFCFCFCFFFFFFFFFFFFFFFFFFFFFFFF878787141414
            FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFAFA010101979797CECE
            CECECECECFCFCFFFFFFFFFFFFFFBFBFB000000E7E7E7FFFFFFFFFFFFFFFFFFD8
            D8D8E6E6E6FFFFFFFFFFFFFFFFFFFFFFFF1A1A1A8A8A8AFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFEFEFEFFFFFFFFFFFFCBCBCBCDCDCDFFFFFFFFFFFFFFFFFFFFFF
            FFFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFB7B7B7000000FEFEFEFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFF010101D9D9D9FFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFFFFFF0000
            00E7E7E7FFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0B0B0B000000000000
            000000F6F6F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1515151A1A1AFEFEFEFE
            FEFE222222141414EDEDEDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFF4F4F49C9C9CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3232326F6F6FFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8D8D8D232323
            FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFAFA1616161515151515
            151515151F1F1FFEFEFEFFFFFFFBFBFB151515E7E7E7FFFFFFFFFFFFFFFFFFEE
            EEEE060606E1E1E1FFFFFFFFFFFFFFFFFFF6F6F6A8A8A8FFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4545454E4E4EFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFBCBCBC212121FEFEFEFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFDCDCDCDCDCDCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1515
            15E8E8E8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFE0A0A0A000000000000
            000000F9F9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFEFEFEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFE0A0A0A000000000000
            030303FBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFE0A0A0A000000000000
            070707FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFEFEFFFEFEFEFEFEFFFEFEFFFEFEFFFEFEFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFE090909000000000000
            0D0D0DFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFEFEFEE29494CC2D2DCB0000CF0000D30000D80000DE1717EC6969FCE3E3
            FFFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE
            FEFFFEFEFFFEFEFFFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFEFEFFFEFEFFFEFEFFFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFEFEFFFCFCFFE8E8FFECECFFFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFEFEFFF7F7FFC7C7FFAEAEFFB7B7FFDDDDFFFEFEFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFFFEFE
            FFFEFEFFFEFEFFFEFEFFFEFEFFFEFEFFFEFEFFFEFEFFFEFEFFFEFEFFFEFEFFFE
            FEFFFEFEFFFEFEFFFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FEFEFFF4F4FFBFBFFFADADFFC7C7FFFAFAFFFEFEFFFFFFFFFFFFFFFEFEFFFEFE
            FFFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFFFEFEFFFEFEFFFEFEFFFEFEFFFE
            FEFFFEFEFFFEFEFFFEFEFFFEFEFFFEFEFFFEFEFFFEFEFFFEFEFFFEFEFFFEFEFF
            FEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFE090909000000000000
            131313FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFAFAD2
            6969BE0000CA0000D30000DB0000E00000E50000EA0000EC0000ED0000ED0000
            EE1F1FFDE2E2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF55
            55FF0000FF0000FF3B3BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFB6B6FF0000FF0000FF0000FFFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFDADAFF0D0DFF0000FF0000FF0000FF0000FFEEEEFFFFFFFFFFFFFFFFFFFFFF
            FFFFFEFEFF9393FF0606FF0000FF0000FF0000FF0000FF0000FF0000FF3B3BFF
            E0E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAEAFF0000FF0000
            FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
            00FF0000FF0000FF0000FFF2F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB2B2FF
            0909FF0000FF0000FF0000FF0000FF0000FF2525FFE2E2FFFFFFFF6C6CFF0000
            FF0000FFBABAFFFFFFFFFFFFFFDEDEFF0000FF0000FF0000FF0000FF0000FF00
            00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
            5C5CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFE080808000000000000
            191919FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7E6E6B50202C3
            0000CE0000D70000E10000E90000F00000F50000FA0000FC0101FD0101FD0101
            FB0101F80000FB9A9AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5E
            5EFF0000FF0000FF3D3DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFBABAFF0000FF0000FF0000FFFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFBFB
            FF0101FF0000FF0000FF0000FF0000FF0000FFFDFDFFFFFFFFFFFFFFFFFFFFF0
            F0FF0404FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
            0000FF6C6CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEBEBFF0000FF0000
            FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
            00FF0000FF0000FF0000FFF3F3FFFFFFFFFFFFFFFFFFFFFFFFFF4E4EFF0000FF
            0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FFBEBEFF7272FF0000
            FF0000FFBDBDFFFFFFFFFFFFFFE0E0FF0000FF0000FF0000FF0000FF0000FF00
            00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
            5F5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFD080808000000000000
            1F1F1FFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8EAEAB40404C20000CE
            0000D90000E40000EE0000F70000FD0101FF0909FF1111FF1616FF1818FF1818
            FF1515FF0E0EFF0505FE8E8EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5E
            5EFF0000FF0000FF3D3DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFBABAFF0000FF0000FF0000FFFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFA9A9
            FF0000FF0000FF0000FF0808FF1A1AFF1313FFFEFEFFFFFFFFFFFFFFF9F9FF0A
            0AFF0000FF0000FF0000FF2020FFA8A8FFE0E0FFD4D4FF7676FF0909FF0000FF
            0000FF0000FF5252FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEBEBFF0000FF0000
            FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
            00FF0000FF0000FF0000FFF3F3FFFFFFFFFFFFFFFFFFFFC0C0FF0000FF0000FF
            0000FF0101FF4646FFB0B0FFB3B3FF6060FF0A0AFF0000FF0101FF5656FF0000
            FF0000FFBDBDFFFFFFFFFFFFFFE6E6FF0000FF0000FF0000FF0E0EFF3838FF21
            21FF1D1DFF1B1BFF1A1AFF1A1AFF1A1AFF1A1AFF1A1AFF1A1AFF1A1AFF1A1AFF
            6D6DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFE070707000000000000
            252525FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB20C0CBF0000CC0000D9
            0000E50000F00000FB0000FF0909FF1616FF2121FF2A2AFF2F2FFF3131FF3131
            FF2D2DFF2626FF1C1CFF0D0DFFC9C9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5E
            5EFF0000FF0000FF3D3DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFBABAFF0000FF0000FF0000FFFEFEFFFFFFFFFFFFFFFFFFFFFFFFFF7373
            FF0000FF0000FF0E0EFFF8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4040FF00
            00FF0000FF0000FF9E9EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9FF2727FF
            0000FF0000FF0000FFB8B8FFFFFFFFFFFFFFFFFFFFFFFFFFEBEBFF0000FF0000
            FF0000FFBDBDFFE9E9FFE9E9FFE9E9FFE9E9FFE9E9FFE9E9FFE9E9FFE9E9FFE9
            E9FFE9E9FFE9E9FFE9E9FFFEFEFFFFFFFFFFFFFFFFFFFF2929FF0000FF0000FF
            0000FFD9D9FFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFF4343FF0000FF0000FF0000
            FF0000FFBDBDFFFFFFFFFFFFFFFFFFFF6D6DFF0000FF0000FF0000FF9999FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFE070707000000000000
            2C2C2CFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC45151BA0000C80000D60000E2
            0000EF0000FB0101FF0E0EFF1F1FFF2D2DFF3939FF4343FF4949FF4C4CFF4B4B
            FF4747FF3E3EFF3333FF2626FF1515FFF9F9FFFFFFFFFFFFFFFFFFFFFFFFFF5E
            5EFF0000FF0000FF3D3DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFBABAFF0000FF0000FF0000FFFEFEFFFFFFFFFFFFFFFFFFFFFFFFFF5B5B
            FF0000FF0000FF3C3CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0F0FF0000FF00
            00FF0000FF9494FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFF
            0606FF0000FF0000FF0606FFFEFEFFFFFFFFFFFFFFFFFFFFEBEBFF0000FF0000
            FF0000FFCDCDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0101FF0000FF0000FF
            7979FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1C1CFF0000FF0000
            FF0000FFBDBDFFFFFFFFFFFFFFFFFFFFFFFFFF4242FF0000FF0000FF0000FFBA
            BAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFD060606000000000000
            333333FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8EBEBB10000C20000D00000DE0000EC
            0000F90000FF0D0DFF2121FF3333FF4343FF5151FF5C5CFF6363FF6666FF6565
            FF6161FF5757FF4B4BFF3B3BFF2A2AFF8484FFFFFFFFFFFFFFFFFFFFFFFFFF5E
            5EFF0000FF0000FF3D3DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFBABAFF0000FF0000FF0000FFFEFEFFFFFFFFFFFFFFFFFFFFFFFFFF5656
            FF0000FF0000FF4747FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5252FF0000FF00
            00FF1414FFFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            C6C6FF0000FF0000FF0000FFE4E4FFFFFFFFFFFFFFFFFFFFEBEBFF0000FF0000
            FF0000FFCDCDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0101FF0000FF0000FF
            D6D6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFFF0000FF0000
            FF0000FFBDBDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1F1FFF0000FF0000FF00
            00FFDADAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFD050505000000000000
            393939FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC95E5EBA0000C80000D80000E70000F4
            0000FF0606FF1D1DFF3232FF4646FF5757FF6767FF7474FF7D7DFF8181FF8080
            FF7A7AFF6F6FFF5F5FFF4F4FFF3C3CFF1B1BFFFEFEFFFFFFFFFFFFFFFFFFFF5E
            5EFF0000FF0000FF3D3DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFBABAFF0000FF0000FF0000FFFEFEFFFFFFFFFFFFFFFFFFFFFFFFFF5656
            FF0000FF0000FF4747FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1414FF0000FF00
            00FF7979FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFF0A0AFF0000FF0000FF8888FFFFFFFFFFFFFFFFFFFFEBEBFF0000FF0000
            FF0000FFCDCDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF0000FF0000FF
            E8E8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9FF0303FF0000
            FF0000FFBDBDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFF1414FF0000FF00
            00FF0000FFF5F5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F9030303000000000000
            424242FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB01212BE0000CD0000DD0000EC0000FB
            0000FF1111FF2828FF3F3FFF5656FF6969FF7B7BFF8A8AFF9696FF9A9AFF9999
            FF9191FF8484FF7373FF6060FF4B4BFF3535FFE5E5FFFFFFFFFFFFFFFFFFFF5E
            5EFF0000FF0000FF3D3DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFBABAFF0000FF0000FF0000FFFEFEFFFFFFFFFFFFFFFFFFFFFFFFFF5656
            FF0000FF0000FF4747FFFFFFFFFFFFFFFFFFFFFFFFFFF8F8FF0101FF0000FF00
            00FFDBDBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFF2020FF0000FF0000FF5050FFFFFFFFFFFFFFFFFFFFEBEBFF0000FF0000
            FF0000FFCDCDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF0000FF0000FF
            EEEEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0B0BFF0000
            FF0000FFBDBDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0F0FF0909FF00
            00FF0000FF1515FFF9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD7D7D7000000000000000000
            000000CDCDCDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFDFBFBB20404C20000D20000E20000F10000FE
            0404FF1B1BFF3333FF4C4CFF6363FF7979FF8D8DFF9F9FFFADADFFB3B3FFB1B1
            FFA8A8FF9898FF8484FF6E6EFF5858FF4141FFBABAFFFFFFFFFFFFFFFFFFFF5E
            5EFF0000FF0000FF3D3DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFBABAFF0000FF0000FF0000FFFEFEFFFFFFFFFFFFFFFFFFFFFFFFFF5656
            FF0000FF0000FF4747FFFFFFFFFFFFFFFFFFFFFFFFFFEFEFFF0000FF0000FF00
            00FFFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFF4343FF0000FF0000FF3838FFFEFEFFFFFFFFFFFFFFEBEBFF0000FF0000
            FF0000FFCDCDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF0000FF0000FF
            F0F0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0F0FFF0000
            FF0000FFBDBDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE8E8FF01
            01FF0000FF0000FF2B2BFFFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCDCDCD020202000000000000000000
            0000007B7B7BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFF8EBEBB40101C40000D50000E50000F50000FF
            0909FF2121FF3B3BFF5555FF6E6EFF8686FF9C9CFFB2B2FFC3C3FFCDCDFFCACA
            FFBCBCFFA8A8FF9292FF7979FF6262FF4A4AFFA2A2FFFFFFFFFFFFFFFFFFFF5E
            5EFF0000FF0000FF3D3DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFBABAFF0000FF0000FF0000FFFEFEFFFFFFFFFFFFFFFFFFFFFFFFFF5656
            FF0000FF0000FF4747FFFFFFFFFFFFFFFFFFFFFFFFFFEBEBFF0000FF0000FF00
            00FFFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFF5555FF0000FF0000FF2D2DFFFEFEFFFFFFFFFFFFFFEBEBFF0000FF0000
            FF0000FFCDCDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF0000FF0000FF
            F0F0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0F0FFF0000
            FF0000FFBDBDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBD
            BDFF0000FF0000FF0000FF4B4BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0D0D0D000000000000000000000000
            000000000000F4F4F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFF8EBEBB50101C50000D60000E70000F70000FF
            0E0EFF2525FF4141FF5B5BFF7575FF8D8DFFA5A5FFBFBFFFD7D7FFE7E7FFE1E1
            FFCDCDFFB4B4FF9A9AFF8181FF6868FF5050FFA3A3FFFFFFFFFFFFFFFFFFFF5E
            5EFF0000FF0000FF3C3CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFBABAFF0000FF0000FF0000FFFEFEFFFFFFFFFFFFFFFFFFFFFFFFFF5656
            FF0000FF0000FF4747FFFFFFFFFFFFFFFFFFFFFFFFFFEEEEFF0000FF0000FF00
            00FFFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFF4B4BFF0000FF0000FF3131FFFEFEFFFFFFFFFFFFFFEBEBFF0000FF0000
            FF0000FFCDCDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF0000FF0000FF
            F0F0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0F0FFF0000
            FF0000FFBDBDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFF9292FF0000FF0000FF0000FF8282FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7D7D7D000000000000000000000000
            000000101010FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFDFAFAB70303C60000D70000E80000F80000FF
            0E0EFF2626FF4242FF5C5CFF7777FF8F8FFFA8A8FFC2C2FFDCDCFFF4F4FFE9E9
            FFD1D1FFB7B7FF9D9DFF8282FF6969FF5151FFBEBEFFFFFFFFFFFFFFFFFFFF5E
            5EFF0000FF0000FF3535FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFBABAFF0000FF0000FF0000FFFEFEFFFFFFFFFFFFFFFFFFFFFFFFFF5656
            FF0000FF0000FF4747FFFFFFFFFFFFFFFFFFFFFFFFFFF6F6FF0101FF0000FF00
            00FFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFF2424FF0000FF0000FF4848FFFFFFFFFFFFFFFFFFFFEBEBFF0000FF0000
            FF0000FFCDCDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF0000FF0000FF
            F0F0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0F0FFF0000
            FF0000FFBDBDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFF6262FF0000FF0000FF0000FFB1B1FFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F6F6F000000000000000000
            000000E8E8E8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB81414C50000D60000E70000F70000FF
            0C0CFF2424FF3F3FFF5959FF7373FF8A8AFFA2A2FFBABAFFD0D0FFDADAFFD8D8
            FFC7C7FFAFAFFF9797FF7E7EFF6666FF4D4DFFE7E7FFFFFFFFFFFFFFFFFFFF5E
            5EFF0000FF0000FF1C1CFFFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFB4B4FF0000FF0000FF0000FFFEFEFFFFFFFFFFFFFFFFFFFFFFFFFF5656
            FF0000FF0000FF4747FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1111FF0000FF00
            00FF8181FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFF0D0DFF0000FF0000FF8282FFFFFFFFFFFFFFFFFFFFEBEBFF0000FF0000
            FF0000FFCDCDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF0000FF0000FF
            F0F0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0F0FFF0000
            FF0000FFBDBDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFEFEFF3F3FFF0000FF0000FF0000FFE2E2FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA2A2A20A0A0A000000000000
            505050FCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCF5E5EC30000D40000E40000F30000FF
            0707FF1F1FFF3737FF5252FF6A6AFF8181FF9696FFABABFFBBBBFFC3C3FFC1C1
            FFB5B5FFA2A2FF8D8DFF7575FF5E5EFF3B3BFFFEFEFFFFFFFFFFFFFFFFFFFF5E
            5EFF0000FF0000FF0000FFF4F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFF9595FF0000FF0000FF0000FFFEFEFFFFFFFFFFFFFFFFFFFFFFFFFF5656
            FF0000FF0000FF4747FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4848FF0000FF00
            00FF1B1BFFFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            D1D1FF0000FF0000FF0000FFE2E2FFFFFFFFFFFFFFFFFFFFEBEBFF0000FF0000
            FF0000FFCDCDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF0000FF0000FF
            F0F0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0F0FFF0000
            FF0000FFBDBDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFCFCFF2525FF0000FF0000FF0505FFEDEDFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFABABAB000000000000
            B3B3B3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8E7E7BF0000D00000E00000F00000FD
            0202FF1616FF3030FF4747FF5F5FFF7474FF8686FF9797FFA4A4FFAAAAFFA8A8
            FFA0A0FF9191FF7E7EFF6969FF5454FF9090FFFFFFFFFFFFFFFFFFFFFFFFFF5E
            5EFF0000FF0000FF0000FF8D8DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFF3737FF0000FF0000FF0202FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5656
            FF0000FF0000FF4747FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE4E4FF0000FF00
            00FF0000FFB3B3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFF
            1515FF0000FF0000FF0707FFFEFEFFFFFFFFFFFFFFFFFFFFEBEBFF0000FF0000
            FF0000FFCDCDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF0000FF0000FF
            F0F0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0F0FFF0000
            FF0000FFBDBDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFDFDFF0A0AFF0000FF0000FF1313FFFBFBFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF999999000000000000
            AAAAAAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCD4848CB0000DB0000EA0000F8
            0000FF0D0DFF2424FF3A3AFF5050FF6262FF7373FF8181FF8B8BFF8F8FFF8E8E
            FF8888FF7B7BFF6B6BFF5959FF4242FFF8F8FFFFFFFFFFFFFFFFFFFFFFFFFF5E
            5EFF0000FF0000FF0000FF0101FFA7A7FFFEFEFFFFFFFFFFFFFFFFFFFFFFFFFF
            B4B4FF0000FF0000FF0000FF6363FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5656
            FF0000FF0000FF4747FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2B2BFF00
            00FF0000FF0101FFBABAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFF4040FF
            0000FF0000FF0000FFBBBBFFFFFFFFFFFFFFFFFFFFFFFFFFEBEBFF0000FF0000
            FF0000FFCDCDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF0000FF0000FF
            F0F0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0F0FFF0000
            FF0000FFBDBDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFEEEEFF0101FF0000FF0000FF2121FFFDFDFF
            FFFFFFFFFFFEFEFEECECECEFEFEFFFFFFFFFFFFFFFFFFF898989000000000000
            A5A5A5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC50A0AD40000E30000F1
            0000FE0202FF1616FF2A2AFF3D3DFF4E4EFF5D5DFF6969FF7171FF7575FF7474
            FF6F6FFF6565FF5757FF4444FFC9C9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5E
            5EFF0000FF0000FF3E3EFF0000FF0000FF1717FF9090FFB7B7FFA4A4FF3A3AFF
            0000FF0000FF0000FF0101FFE8E8FFFFFFFFFFFFFFFEFEFF9B9BFF9999FF3333
            FF0000FF0000FF2B2BFF9999FF9999FF9B9BFFFEFEFFFFFFFFFFFFFFFAFAFF06
            06FF0000FF0000FF0000FF3939FFBBBBFFE4E4FFD9D9FF9696FF0808FF0000FF
            0000FF0000FF5B5BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEBEBFF0000FF0000
            FF0000FFCDCDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF0000FF0000FF
            F0F0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0F0FFF0000
            FF0000FFBDBDFFFFFFFFFFFFFFFFFFFFA5A5FF6F6FFF6F6FFF6F6FFF6F6FFF6F
            6FFF6F6FFF6F6FFF7070FF7676FF8383FF7272FF0000FF0000FF0000FF4A4AFF
            FFFFFAFAFA292929818181636363616161FFFFFFFFFFFF7A7A7A000000000000
            A5A5A5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAEAEACB0202DA0000E9
            0000F50000FF0606FF1919FF2A2AFF3939FF4545FF5151FF5757FF5A5AFF5959
            FF5454FF4C4CFF3E3EFFA0A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5E
            5EFF0000FF0000FFCFCFFF4242FF0000FF0000FF0000FF0000FF0000FF0000FF
            0000FF0000FF0000FF8E8EFFFFFFFFFFFFFFFFFFFFFEFEFF0505FF0000FF0000
            FF0000FF0000FF0000FF0000FF0000FF0606FFFEFEFFFFFFFFFFFFFFFFFFFFF5
            F5FF1515FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
            0000FF7272FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEBEBFF0000FF0000
            FF0000FFCDCDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF0000FF0000FF
            F0F0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0F0FFF0000
            FF0000FFBDBDFFFFFFFFFFFFFFFFFFFF6161FF0000FF0000FF0000FF0000FF00
            00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
            FEFE767676EBEBEBFFFFFFE6E6E6959595F9F9F9FFFFFF6C6C6C000000000000
            A9A9A9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9E2E2D20C0CDF
            0000EB0000F60000FF0606FF1616FF2424FF3030FF3838FF3F3FFF4141FF4141
            FF3D3DFF3131FFA6A6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5D
            5DFF0202FF0202FFCFCFFFFEFEFF9D9DFF0B0BFF0000FF0000FF0000FF0000FF
            0000FF1313FFC4C4FFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFF0707FF0202FF0000
            FF0000FF0000FF0000FF0202FF0202FF0606FFFEFEFFFFFFFFFFFFFFFFFFFFFF
            FFFFFCFCFF8989FF0F0FFF0000FF0000FF0000FF0000FF0000FF0101FF2424FF
            DEDEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEBEBFF0000FF0000
            FF0000FFCDCDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0202FF0202FF0101FF
            EFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1111FF0202
            FF0202FFBDBDFFFFFFFFFFFFFFFFFFFF6060FF0202FF0202FF0202FF0202FF02
            02FF0202FF0202FF0202FF0202FF0202FF0202FF0202FF0202FF0202FF0101FF
            FEFE2D2D2DEEEEEEBEBEBE969696ECECECB6B6B6FFFFFF5E5E5E000000000000
            B0B0B0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEF9F9E2
            5555DF0202EC0000F50000FE0202FF0E0EFF1717FF2020FF2525FF2727FF2727
            FF2828FFE2E2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA
            FAFFF8F8FFF8F8FFFEFEFFFFFFFFFFFFFFFEFEFFD3D3FFA3A3FF9292FFAFAFFF
            DEDEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8FFF8F8FF5656
            FF0000FF0000FF4646FFF8F8FFF8F8FFF9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFDDDDFFB4B4FF9393FF9B9BFFC4C4FFEDEDFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEBEBFF0000FF0000
            FF0000FFCDCDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8FFF8F8FFF8F8FF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9FFF8F8
            FFF8F8FFFDFDFFFFFFFFFFFFFFFFFFFFFAFAFFF8F8FFF8F8FFF8F8FFF8F8FFF8
            F8FFF8F8FFF8F8FFF8F8FFF8F8FFF8F8FFF8F8FFF8F8FFF8F8FFF8F8FFF8F8FF
            FFFFC1C1C18C8C8CFFFFFF666666535353FDFDFDFFFFFF4F4F4F000000000000
            B9B9B9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFDF5F5F08A8AEA1818F00101F90000FD0202FF0505FF0C0CFF6161FFD6D6
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5656
            FF0000FF0000FF4747FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEBEBFF0000FF0000
            FF0000FFCDCDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFEFEFE131313E3E3E3FFFFFFFFFFFFFFFFFFFFFFFF3F3F3F000000000000
            C1C1C1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFE7D9D9CD0C0CFDB2B2FE6C6CFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5656
            FF0000FF0000FF4747FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEBEBFF0000FF0000
            FF0000FFCDCDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFEBEBEB070707A3A3A3F1F1F1FCFCFC9C9C9C5F5F5F000000000000
            C5C5C5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFC8C2C27A6E6EFEFEFEFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5656
            FF0000FF0000FF4747FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEBEBFF0000FF0000
            FF0000FFCDCDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFF8F8F86868681E1E1E212121919191FEFEFE000000000000
            C7C7C7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFC4C4C56F6F6FFEFEFEFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6161
            FF0000FF0000FF4747FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEBEBFF0000FF0000
            FF0000FFCDCDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000
            C3C3C3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFC4C4C56F6F6FFEFEFEFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FF9E9EFF0505FF4747FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEBEBFF0000FF0000
            FF0000FFCDCDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000
            BCBCBCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFC4C4C56F6F6FFEFEFEFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFF7F7FF8D8DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEBEBFF0000FF0000
            FF0000FFCDCDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFE000000000000
            B1B1B1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFCECECE4040401C1C1C3F3F3FAFAFAFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFC4C4C56F6F6FFEFEFEFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFFD8D8FFD8D8
            FFD8D8FFF7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFD000000000000
            616161FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCBCB
            CB262626EBEBEBFFFFFFE0E0E0565656090909E2E2E2FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFC4C4C56F6F6FFEFEFEFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFD000000010101
            1A1A1AFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2B2B
            2BE1E1E1F8F8F8F3F3F3FFFFFFFFFFFFEFEFEF0D0D0DEDEDEDFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFC4C4C56F6F6FFEFEFEFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFD000000181818
            000000EBEBEBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0909
            09E5E5E55252522B2B2BFEFEFEFFFFFFFFFFFFF4F4F4313131FFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFF6565655A5A5B707070FEFEFEFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000141414
            4D4D4D787878FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9191
            91767676FDFDFD1B1B1BFEFEFEFFFFFFFFFFFFFFFFFF545454FCFCFCFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFF010101111111717171FEFEFEFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000161616
            E2E2E2070707FAFAFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FF757575353535D8D8D8FFFFFFFFFFFFFFFFFFFFFFFFBBBBBBBEBEBEFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFF010101111111717171FEFEFEFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000161616
            FEFEFE3F3F3F6A6A6AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE0E0E0919191FFFFFFFF
            FFFFFEFEFEF1F1F1CCCCCC0101010F0F0F6C6C6CFEFEFEFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000131313
            FEFEFEF5F5F5050505D7D7D7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCBCBCB939393FDFDFD94
            9494020202000000000000000000000000000000000000494949D5D5D5FEFEFE
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000101010
            FEFEFEFFFFFFB9B9B9050505F4F4F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFE7B7B7BC6C6C61A1A1A00
            0000060606424242999999010101000000000000000000000000000000191919
            CFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000A0A0A
            FEFEFEFFFFFFFFFFFF737373101010FBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFB1414140A0A0A4141410000003E
            3E3EF7F7F7FFFFFFFFFFFF010101000000000000E8E8E84D4D4D000000000000
            000000565656FCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000060606
            FEFEFEFFFFFFFFFFFFFFFFFF7F7F7F0B0B0BE2E2E2FFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFC090909060606000000010101E3
            E3E3FFFFFFFFFFFFFFFFFF010101000000000000FFFFFFFFFFFFE3E3E3161616
            000000000000202020FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000
            FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFBABABA050505676767FAFAFAFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA5A5A5474747010101000000000000EA
            EAEAFFFFFFFFFFFFFFFFFF010101000000000000FFFFFFFFFFFFFFFFFFFEFEFE
            666666000000000000272727FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF010101000000
            FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFD5B5B5B0000004B4B4BC1C1
            C1ECECECFEFEFEF2F2F2BEBEBE212121919191FFFFFF020202313131F4F4F4FF
            FFFFFFFFFFFFFFFFFFFFFF010101000000000000FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFF8686860000000000004D4D4DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF010101000000
            FCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7A2A2A23838
            382222222222223232329F9F9FF8F8F8FFFFFFFFFFFF000000323232FEFEFEFF
            FFFFFFFFFFFFFFFFFFFFFF010101000000000000FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFF7272720000000000009F9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0E0E0E000000
            C5C5C5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000B0B0BFEFEFEFF
            FFFFFFFFFFFFFFFFFFFFFF010101000000000000FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFF262626000000000000F1F1F1FFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3D3D3D000000
            525252FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF010101000000FAFAFAFF
            FFFFFFFFFFFFFFFFFFFFFF010101000000000000FCFCFCFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFF5F5F50707070000003A3A3AFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8C8C8C000000
            0E0E0EFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5B5B5B0000003D3D3DFE
            FEFEFFFFFFFFFFFFFFFFFF020202000000000000818181FFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFABABAB000000000000E8E8E8FFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4F4F4000000
            000000D2D2D2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0404040000006A
            6A6AFEFEFEFFFFFFFFFFFFFFFFFFB3B3B30606061B1B1BFEFEFEFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFEFEFE1414140000004D4D4DFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF131313
            000000232323FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDCDCDC01010100
            0000090909B5B5B5EDEDEDFAFAFAE8E8E82B2B2B161616FEFEFEFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9A9A9A000000010101FEFEFEFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAEAEAE
            000000000000D0D0D0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDEDEDE12
            1212000000000000000000020202000000000000919191FFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000FDFDFDFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            0202020000000B0B0BFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC
            FCFC939393050505010101010101020202808080FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF090909000000DEDEDEFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            CCCCCC0000000000007A7A7AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2F2F2F000000C0C0C0FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFF606060000000000000CBCBCBFFFFFFFFFFFFA9A9A9DEDEDEFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F3F3F000000BCBCBCFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFEFEFE262626000000000000EDEDEDFFFFFF454545E5E5E5FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF343434000000D6D6D6FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFEBEBEB0A0A0A0000000C0C0CF2F2F23D3D3DC3C3C3FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF101010000000FAFAFAFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFF5252521616161E1E1E000000000000161616676767474747FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF010101000000FEFEFEFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFF0F0F0FFFFFFFFFFFF282828000000000000000000000000B0B0B0FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBDBDBD000000222222FEFEFEFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF323232000000000000000000000000C4C4
            C4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF202020000000A0A0A0FFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6161610000000000000000000000
            00AAAAAAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FEFEFEFFFFFFFFFFFFFFFFFFB7B7B7000000060606FEFEFEFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA9A9A90101010000000000
            00000000656565FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            626262E7E7E7FFFFFFF0F0F0050505000000C0C0C0FFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDF0A0A0A0000
            000000000000001B1B1BECECECFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            1A1A1AE2E2E2F8F8F80E0E0E0000005E5E5EFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFAFA4B4B
            4B000000000000000000000000565656F7F7F7FEFEFEDFDFDF4B4B4BE7E7E7FF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB8B8B8
            000000E1E1E10D0D0D0000004E4E4EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFD6D6D61E1E1E0000000000000000000000003030300000000000000B0B0BE0
            E0E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEADADAD010101
            0909090000000000008C8C8CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFD3D3D340404001010100000000000000000000000000000031
            31318B8B8BC0C0C0DEDEDEEBEBEBE9E9E9D2D2D2969696141414000000000000
            0000002F2F2FBDBDBD7B7B7B686868BEBEBEFEFEFEFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFAFAFA09090900000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            030303000000000000252525373737000000515151FFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9E9E9000000000000141414A4
            A4A4242424060606000000000000000000000000000000000000000000040404
            171717808080E8E8E8FFFFFFFFFFFF9E9E9E333333FFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF656565BBBBBBFFFFFFFF
            FFFFFFFFFFFCFCFCD8D8D8B3B3B36E6E6E545454707070B4B4B4D8D8D8FBFBFB
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFCFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFF}
          HightQuality = False
        end
      end
      object bndMasterData: TfrxMasterData
        Height = 18.897650000000000000
        Top = 260.787570000000000000
        Width = 718.110700000000000000
        DataSet = frdItens
        DataSetName = 'frdItens'
        RowCount = 0
        object frdItensCODPROD: TfrxMemoView
          Left = 22.677180000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdItens
          DataSetName = 'frdItens'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Memo.UTF8 = (
            ' [frdItens."CODPROD"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object frdItensSEQ: TfrxMemoView
          Width = 22.677180000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'SEQ'
          DataSet = frdItens
          DataSetName = 'frdItens'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[frdItens."SEQ"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object frdItensDESCRI: TfrxMemoView
          Left = 75.590600000000000000
          Width = 291.023639130000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdItens
          DataSetName = 'frdItens'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Memo.UTF8 = (
            ' [frdItens."DESCRI"] (Ref.: [frdItens."REFERENCIA"])')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          Left = 366.614410000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdItens
          DataSetName = 'frdItens'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[FormatFloat('#39'###,###,##0'#39',<frdItens."QTDE">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Left = 642.520100000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdItens
          DataSetName = 'frdItens'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[FormatFloat('#39',0.00'#39',<frdItens."TOTAL_LIQUIDO">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          Left = 411.968770000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdItens
          DataSetName = 'frdItens'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Memo.UTF8 = (
            ' [frdItens."UNP_SIGLA"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Left = 449.764070000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdItens
          DataSetName = 'frdItens'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[FormatFloat('#39',0.00'#39',<frdItens."PUNIT">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Left = 514.016080000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdItens
          DataSetName = 'frdItens'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[FormatFloat('#39',0.00'#39',<frdItens."DESCONTO_VALOR">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          Left = 578.268090000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdItens
          DataSetName = 'frdItens'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[FormatFloat('#39',0.00'#39',<frdItens."PFINAL">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object bndPageFooter: TfrxPageFooter
        Height = 22.677180000000000000
        Top = 668.976810000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Left = 566.929500000000000000
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            'P '#195#161' g i n a :  [Page#]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object bndHeader: TfrxHeader
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Lucida Console'
        Font.Style = []
        Height = 83.149660000000000000
        ParentFont = False
        Top = 154.960730000000000000
        Width = 718.110700000000000000
        object frdVendaNOME: TfrxMemoView
          Top = 11.338590000000000000
          Width = 415.748300000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdVenda
          DataSetName = 'frdVenda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Lucida Console'
          Font.Style = []
          Memo.UTF8 = (
            ' [frdCliente."NOME"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo2: TfrxMemoView
          Width = 415.748300000000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            ' Cliente:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Left = 415.748300000000000000
          Width = 207.874150000000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            ' CPF/CNPJ.:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 415.748300000000000000
          Top = 11.338590000000000000
          Width = 207.874150000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdVenda
          DataSetName = 'frdVenda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Lucida Console'
          Font.Style = []
          Memo.UTF8 = (
            ' [frdCliente."CNPJ"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Left = 623.622450000000000000
          Width = 94.488250000000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            'Data: ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Left = 623.622450000000000000
          Top = 11.338590000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdVenda
          DataSetName = 'frdVenda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Lucida Console'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            ' [FormatDateTime('#39'dd/mm/yyyy'#39',<frdVenda."DTVENDA">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 642.520100000000000000
          Top = 64.252010000000000000
          Width = 75.590600000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            'T O T A L ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Left = 366.614410000000000000
          Top = 64.252010000000000000
          Width = 45.354323390000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            'Qtde.')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Line2: TfrxLineView
          Top = 79.370130000000000000
          Width = 718.110700000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
        object Memo23: TfrxMemoView
          Top = 64.252010000000000000
          Width = 22.677180000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            '#')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo24: TfrxMemoView
          Left = 22.677180000000000000
          Top = 64.252010000000000000
          Width = 52.913420000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            ' C'#195#179'digo')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo25: TfrxMemoView
          Left = 75.590600000000000000
          Top = 64.252010000000000000
          Width = 291.023639130000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            ' Descri'#195#167#195#163'o')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          Top = 41.574830000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdVenda
          DataSetName = 'frdVenda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Lucida Console'
          Font.Style = []
          Memo.UTF8 = (
            
              ' [frdCliente."TLG_SIGLA"] [frdCliente."LOG_NOME"], [frdCliente."' +
              'NUMERO_END"], [frdCliente."BAI_NOME"] - [frdCliente."CID_NOME"]/' +
              '[frdCliente."EST_SIGLA"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          Top = 30.236240000000000000
          Width = 718.110700000000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            ' Endere'#195#167'o:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          Left = 411.968770000000000000
          Top = 64.252010000000000000
          Width = 37.795300000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            ' Und.')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          Left = 449.764070000000000000
          Top = 64.252010000000000000
          Width = 64.252010000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            'V. Bruto ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          Left = 514.016080000000000000
          Top = 64.252010000000000000
          Width = 64.252010000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            'V. Desc. ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          Left = 578.268090000000000000
          Top = 64.252010000000000000
          Width = 64.252010000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            'V. L'#195#173'quido ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object bndReportSummary: TfrxReportSummary
        Height = 306.141930000000000000
        Top = 340.157700000000000000
        Width = 718.110700000000000000
        object SysMemo1: TfrxSysMemoView
          Left = 623.622450000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39',0.00'#39',SUM(<frdItens."TOTAL_LIQUIDO">,bndMasterDat' +
              'a,2))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object Memo14: TfrxMemoView
          Left = 480.000310000000000000
          Width = 143.622140000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          HAlign = haRight
          Memo.UTF8 = (
            'T O T A L    G E R A L :')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo28: TfrxMemoView
          Top = 68.031540000000000000
          Width = 366.614410000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdVenda
          DataSetName = 'frdVenda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            ' [frdVenda."VENDEDOR_NOME"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo29: TfrxMemoView
          Top = 56.692950000000000000
          Width = 366.614410000000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            ' Vendedor:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line3: TfrxLineView
          Top = 22.677180000000000000
          Width = 718.110700000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
        object Memo30: TfrxMemoView
          Top = 37.795300000000000000
          Width = 226.771800000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdVenda
          DataSetName = 'frdVenda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            ' [frdVenda."DESCRI"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo31: TfrxMemoView
          Top = 26.456710000000000000
          Width = 226.771800000000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            ' Forma de Pagamento:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo32: TfrxMemoView
          Left = 226.771800000000000000
          Top = 37.795300000000000000
          Width = 491.338900000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdVenda
          DataSetName = 'frdVenda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            ' [frdVenda."COND_DESCRICAO_FULL"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo33: TfrxMemoView
          Left = 226.771800000000000000
          Top = 26.456710000000000000
          Width = 491.338900000000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            ' Condi'#195#167#195#163'o de Pagamento:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo34: TfrxMemoView
          Left = 366.614410000000000000
          Top = 68.031540000000000000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdVenda
          DataSetName = 'frdVenda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[FormatFloat('#39',0.00'#39',<frdVenda."TOTALVENDABRUTA">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo35: TfrxMemoView
          Left = 366.614410000000000000
          Top = 56.692950000000000000
          Width = 128.504020000000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            ' Total Venda: ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo36: TfrxMemoView
          Left = 495.118430000000000000
          Top = 68.031540000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdVenda
          DataSetName = 'frdVenda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[FormatFloat('#39',0.00'#39',<frdVenda."DESCONTO">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo37: TfrxMemoView
          Left = 495.118430000000000000
          Top = 56.692950000000000000
          Width = 94.488250000000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            ' Desconto: ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo38: TfrxMemoView
          Left = 589.606680000000000000
          Top = 68.031540000000000000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdVenda
          DataSetName = 'frdVenda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[FormatFloat('#39',0.00'#39',<frdVenda."TOTALVENDA">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo39: TfrxMemoView
          Left = 589.606680000000000000
          Top = 56.692950000000000000
          Width = 128.504020000000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            ' Total L'#195#173'quido: ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo40: TfrxMemoView
          Top = 102.047310000000000000
          Width = 718.110700000000000000
          Height = 45.354360000000000000
          ShowHint = False
          DataSet = frdVenda
          DataSetName = 'frdVenda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frdVenda."OBS"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo41: TfrxMemoView
          Top = 86.929190000000000000
          Width = 718.110700000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop]
          Memo.UTF8 = (
            ' Observa'#195#167#195#163'o:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo42: TfrxMemoView
          Left = 234.330860000000000000
          Top = 278.685220000000000000
          Width = 249.448980000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            'Assinatura do Cliente')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo43: TfrxMemoView
          Left = 37.795300000000000000
          Top = 162.519790000000000000
          Width = 623.622450000000000000
          Height = 45.354360000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial Narrow'
          Font.Style = []
          HAlign = haBlock
          Memo.UTF8 = (
            
              '                 Autorizamos a [frdEmpresa."NMFANT"] executar o ' +
              'presente or'#195#167'amento, na sua totalidade, e na forma/condi'#195#167#195#163'o de' +
              ' pagamentos estabelecida.')
          ParentFont = False
        end
      end
    end
  end
  object frdVenda: TfrxDBDataset
    UserName = 'frdVenda'
    CloseDataSource = False
    FieldAliases.Strings = (
      'ANO=ANO'
      'CODCONTROL=CODCONTROL'
      'CODEMP=CODEMP'
      'CODCLI=CODCLI'
      'DTVENDA=DTVENDA'
      'STATUS=STATUS'
      'DESCONTO=DESCONTO'
      'TOTALVENDA=TOTALVENDA'
      'TOTALVENDABRUTA=TOTALVENDABRUTA'
      'DTFINALIZACAO_VENDA=DTFINALIZACAO_VENDA'
      'OBS=OBS'
      'FORMAPAG=FORMAPAG'
      'FATDIAS=FATDIAS'
      'SERIE=SERIE'
      'NFE=NFE'
      'LOTE_NFE_ANO=LOTE_NFE_ANO'
      'LOTE_NFE_NUMERO=LOTE_NFE_NUMERO'
      'NFE_ENVIADA=NFE_ENVIADA'
      'DATAEMISSAO=DATAEMISSAO'
      'HORAEMISSAO=HORAEMISSAO'
      'CANCEL_USUARIO=CANCEL_USUARIO'
      'CANCEL_DATAHORA=CANCEL_DATAHORA'
      'CANCEL_MOTIVO=CANCEL_MOTIVO'
      'CFOP=CFOP'
      'CFOP_DESCRICAO=CFOP_DESCRICAO'
      'VERIFICADOR_NFE=VERIFICADOR_NFE'
      'XML_NFE_FILENAME=XML_NFE_FILENAME'
      'XML_NFE=XML_NFE'
      'VENDEDOR_COD=VENDEDOR_COD'
      'VENDEDOR_NOME=VENDEDOR_NOME'
      'VENDEDOR_CPF=VENDEDOR_CPF'
      'USUARIO=USUARIO'
      'FORMAPAGTO_COD=FORMAPAGTO_COD'
      'DESCRI=DESCRI'
      'ACRESCIMO=ACRESCIMO'
      'CONDICAOPAGTO_COD=CONDICAOPAGTO_COD'
      'COND_DESCRICAO=COND_DESCRICAO'
      'COND_DESCRICAO_FULL=COND_DESCRICAO_FULL'
      'VENDA_PRAZO=VENDA_PRAZO'
      'PRAZO_01=PRAZO_01'
      'PRAZO_02=PRAZO_02'
      'PRAZO_03=PRAZO_03'
      'PRAZO_04=PRAZO_04'
      'PRAZO_05=PRAZO_05'
      'PRAZO_06=PRAZO_06'
      'PRAZO_07=PRAZO_07'
      'PRAZO_08=PRAZO_08'
      'PRAZO_09=PRAZO_09'
      'PRAZO_10=PRAZO_10'
      'PRAZO_11=PRAZO_11'
      'PRAZO_12=PRAZO_12'
      'NFE_VALOR_BASE_ICMS=NFE_VALOR_BASE_ICMS'
      'NFE_VALOR_ICMS=NFE_VALOR_ICMS'
      'NFE_VALOR_BASE_ICMS_SUBST=NFE_VALOR_BASE_ICMS_SUBST'
      'NFE_VALOR_ICMS_SUBST=NFE_VALOR_ICMS_SUBST'
      'NFE_VALOR_TOTAL_PRODUTO=NFE_VALOR_TOTAL_PRODUTO'
      'NFE_VALOR_FRETE=NFE_VALOR_FRETE'
      'NFE_VALOR_SEGURO=NFE_VALOR_SEGURO'
      'NFE_VALOR_DESCONTO=NFE_VALOR_DESCONTO'
      'NFE_VALOR_TOTAL_II=NFE_VALOR_TOTAL_II'
      'NFE_VALOR_TOTAL_IPI=NFE_VALOR_TOTAL_IPI'
      'NFE_VALOR_PIS=NFE_VALOR_PIS'
      'NFE_VALOR_COFINS=NFE_VALOR_COFINS'
      'NFE_VALOR_OUTROS=NFE_VALOR_OUTROS'
      'NFE_VALOR_TOTAL_NOTA=NFE_VALOR_TOTAL_NOTA')
    DataSet = qryCalculoImporto
    Left = 184
    Top = 120
  end
  object frdItens: TfrxDBDataset
    UserName = 'frdItens'
    CloseDataSource = False
    FieldAliases.Strings = (
      'ANO=ANO'
      'CODCONTROL=CODCONTROL'
      'SEQ=SEQ'
      'CODPROD=CODPROD'
      'CODBARRA_EAN=CODBARRA_EAN'
      'DESCRI=DESCRI'
      'REFERENCIA=REFERENCIA'
      'NCM_SH=NCM_SH'
      'CODORIGEM=CODORIGEM'
      'CODTRIBUTACAO=CODTRIBUTACAO'
      'CST=CST'
      'CSOSN=CSOSN'
      'CODEMP=CODEMP'
      'CODCLI=CODCLI'
      'DTVENDA=DTVENDA'
      'QTDE=QTDE'
      'PUNIT=PUNIT'
      'PUNIT_PROMOCAO=PUNIT_PROMOCAO'
      'DESCONTO=DESCONTO'
      'DESCONTO_VALOR=DESCONTO_VALOR'
      'PFINAL=PFINAL'
      'QTDEFINAL=QTDEFINAL'
      'UNID_COD=UNID_COD'
      'UNP_DESCRICAO=UNP_DESCRICAO'
      'UNP_SIGLA=UNP_SIGLA'
      'CFOP_COD=CFOP_COD'
      'ALIQUOTA=ALIQUOTA'
      'ALIQUOTA_CSOSN=ALIQUOTA_CSOSN'
      'VALOR_IPI=VALOR_IPI'
      'TOTAL_BRUTO=TOTAL_BRUTO'
      'TOTAL_LIQUIDO=TOTAL_LIQUIDO'
      'TOTAL_DESCONTO=TOTAL_DESCONTO'
      'ESTOQUE=ESTOQUE'
      'RESERVA=RESERVA'
      'DISPONIVEL=DISPONIVEL')
    DataSet = qryDadosProduto
    Left = 180
    Top = 169
  end
  object frdTitulo: TfrxDBDataset
    UserName = 'frdTitulo'
    CloseDataSource = False
    FieldAliases.Strings = (
      'ANOLANC=ANOLANC'
      'NUMLANC=NUMLANC'
      'PARCELA=PARCELA'
      'DTEMISS=DTEMISS'
      'DTVENC=DTVENC'
      'VALORREC=VALORREC'
      'VALORMULTA=VALORMULTA'
      'PERCENTDESCONTO=PERCENTDESCONTO')
    DataSet = qryDuplicatas
    Left = 180
    Top = 217
  end
  object frxPDF: TfrxPDFExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    PrintOptimized = False
    Outline = False
    Background = False
    HTMLTags = True
    Author = 'FastReport'
    Subject = 'FastReport PDF export'
    ProtectionFlags = [ePrint, eModify, eCopy, eAnnot]
    HideToolbar = False
    HideMenubar = False
    HideWindowUI = False
    FitWindow = False
    CenterWindow = False
    PrintScaling = False
    Left = 24
    Top = 168
  end
  object frxXLS: TfrxXLSExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    ExportEMF = True
    AsText = False
    Background = True
    FastExport = True
    PageBreaks = True
    EmptyLines = True
    SuppressPageHeadersFooters = False
    Left = 24
    Top = 216
  end
  object frxRTF: TfrxRTFExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    ExportEMF = True
    Wysiwyg = True
    Creator = 'FastReport'
    SuppressPageHeadersFooters = False
    HeaderFooterMode = hfText
    AutoSize = False
    Left = 24
    Top = 264
  end
  object frxMailExport: TfrxMailExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    ShowExportDialog = True
    SmtpPort = 25
    UseIniFile = True
    Left = 24
    Top = 312
  end
  object qryEmitente: TIBDataSet
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    ForcedRefresh = True
    BufferChunks = 1000
    CachedUpdates = True
    RefreshSQL.Strings = (
      '')
    SelectSQL.Strings = (
      'Select'
      '    e.Codigo'
      '  , e.Pessoa_fisica'
      '  , e.Cnpj'
      '  , e.Rzsoc'
      '  , e.Nmfant'
      '  , e.Ie'
      '  , e.Im'
      '  , e.Cnae'
      ''
      '  , e.Fone'
      '  , e.Logo'
      ''
      '  , e.Tlg_tipo'
      '  , tl.Tlg_descricao'
      '  , tl.Tlg_sigla'
      '  , e.Log_cod'
      '  , lg.Log_nome'
      '  , e.Complemento'
      '  , e.Numero_end'
      '  , e.Cep'
      ''
      '  , e.Bai_cod'
      '  , br.Bai_nome'
      ''
      '  , e.Cid_cod'
      '  , cd.Cid_nome'
      '  , cd.Cid_siafi'
      '  , cd.Cid_ibge'
      '  , cd.Cid_ddd'
      ''
      '  , e.Est_cod'
      '  , uf.Est_nome'
      '  , uf.Est_sigla'
      '  , uf.Est_siafi'
      ''
      '  , e.Email'
      '  , e.Home_page'
      '  , e.Chave_acesso_nfe'
      '  , e.Tipo_Regime_nfe'
      '  , e.Serie_nfe'
      '  , e.Numero_nfe'
      '  , e.Lote_Ano_nfe'
      '  , e.Lote_Num_nfe'
      '  , e.Pais_id'
      '  , pa.Pais_nome'
      'from TBEMPRESA e'
      '  left join TBESTADO uf on (uf.Est_cod = e.Est_cod)'
      '  left join TBCIDADE cd on (cd.Cid_cod = e.Cid_cod)'
      '  left join TBBAIRRO br on (br.Bai_cod = e.Bai_cod)'
      '  left join TBLOGRADOURO lg on (lg.Log_cod = e.Log_cod)'
      '  left join TBTIPO_LoGRADOURO tl on (tl.Tlg_cod = e.Tlg_tipo)'
      '  left Join TBPAIS pa on (pa.Pais_id = e.Pais_id)'
      'where e.Cnpj = :Cnpj')
    ModifySQL.Strings = (
      '')
    GeneratorField.ApplyEvent = gamOnPost
    Left = 144
    Top = 24
    object qryEmitenteCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'TBEMPRESA.CODIGO'
    end
    object qryEmitentePESSOA_FISICA: TSmallintField
      FieldName = 'PESSOA_FISICA'
      Origin = 'TBEMPRESA.PESSOA_FISICA'
    end
    object qryEmitenteCNPJ: TIBStringField
      FieldName = 'CNPJ'
      Origin = 'TBEMPRESA.CNPJ'
      Size = 18
    end
    object qryEmitenteRZSOC: TIBStringField
      FieldName = 'RZSOC'
      Origin = 'TBEMPRESA.RZSOC'
      Size = 60
    end
    object qryEmitenteNMFANT: TIBStringField
      FieldName = 'NMFANT'
      Origin = 'TBEMPRESA.NMFANT'
      Size = 25
    end
    object qryEmitenteIE: TIBStringField
      FieldName = 'IE'
      Origin = 'TBEMPRESA.IE'
      Size = 11
    end
    object qryEmitenteIM: TIBStringField
      FieldName = 'IM'
      Origin = 'TBEMPRESA.IM'
      Size = 12
    end
    object qryEmitenteCNAE: TIBStringField
      FieldName = 'CNAE'
      Origin = 'TBEMPRESA.CNAE'
      Size = 11
    end
    object qryEmitenteFONE: TIBStringField
      FieldName = 'FONE'
      Origin = 'TBEMPRESA.FONE'
      Size = 11
    end
    object qryEmitenteLOGO: TBlobField
      FieldName = 'LOGO'
      Origin = 'TBEMPRESA.LOGO'
      Size = 8
    end
    object qryEmitenteTLG_TIPO: TSmallintField
      FieldName = 'TLG_TIPO'
      Origin = 'TBEMPRESA.TLG_TIPO'
    end
    object qryEmitenteTLG_DESCRICAO: TIBStringField
      FieldName = 'TLG_DESCRICAO'
      Origin = 'TBTIPO_LOGRADOURO.TLG_DESCRICAO'
      Size = 50
    end
    object qryEmitenteTLG_SIGLA: TIBStringField
      FieldName = 'TLG_SIGLA'
      Origin = 'TBTIPO_LOGRADOURO.TLG_SIGLA'
      Size = 10
    end
    object qryEmitenteLOG_COD: TIntegerField
      FieldName = 'LOG_COD'
      Origin = 'TBEMPRESA.LOG_COD'
    end
    object qryEmitenteLOG_NOME: TIBStringField
      FieldName = 'LOG_NOME'
      Origin = 'TBLOGRADOURO.LOG_NOME'
      Size = 250
    end
    object qryEmitenteCOMPLEMENTO: TIBStringField
      FieldName = 'COMPLEMENTO'
      Origin = 'TBEMPRESA.COMPLEMENTO'
      Size = 50
    end
    object qryEmitenteNUMERO_END: TIBStringField
      FieldName = 'NUMERO_END'
      Origin = 'TBEMPRESA.NUMERO_END'
      Size = 10
    end
    object qryEmitenteCEP: TIBStringField
      FieldName = 'CEP'
      Origin = 'TBEMPRESA.CEP'
      Size = 8
    end
    object qryEmitenteBAI_COD: TIntegerField
      FieldName = 'BAI_COD'
      Origin = 'TBEMPRESA.BAI_COD'
    end
    object qryEmitenteBAI_NOME: TIBStringField
      FieldName = 'BAI_NOME'
      Origin = 'TBBAIRRO.BAI_NOME'
      Size = 100
    end
    object qryEmitenteCID_COD: TIntegerField
      FieldName = 'CID_COD'
      Origin = 'TBEMPRESA.CID_COD'
    end
    object qryEmitenteCID_NOME: TIBStringField
      FieldName = 'CID_NOME'
      Origin = 'TBCIDADE.CID_NOME'
      Size = 100
    end
    object qryEmitenteCID_SIAFI: TIntegerField
      FieldName = 'CID_SIAFI'
      Origin = 'TBCIDADE.CID_SIAFI'
    end
    object qryEmitenteCID_IBGE: TIntegerField
      FieldName = 'CID_IBGE'
      Origin = 'TBCIDADE.CID_IBGE'
    end
    object qryEmitenteCID_DDD: TSmallintField
      FieldName = 'CID_DDD'
      Origin = 'TBCIDADE.CID_DDD'
    end
    object qryEmitenteEST_COD: TSmallintField
      FieldName = 'EST_COD'
      Origin = 'TBEMPRESA.EST_COD'
    end
    object qryEmitenteEST_NOME: TIBStringField
      FieldName = 'EST_NOME'
      Origin = 'TBESTADO.EST_NOME'
      Size = 100
    end
    object qryEmitenteEST_SIGLA: TIBStringField
      FieldName = 'EST_SIGLA'
      Origin = 'TBESTADO.EST_SIGLA'
      Size = 2
    end
    object qryEmitenteEST_SIAFI: TIntegerField
      FieldName = 'EST_SIAFI'
      Origin = 'TBESTADO.EST_SIAFI'
    end
    object qryEmitenteEMAIL: TIBStringField
      FieldName = 'EMAIL'
      Origin = 'TBEMPRESA.EMAIL'
      Size = 100
    end
    object qryEmitenteHOME_PAGE: TIBStringField
      FieldName = 'HOME_PAGE'
      Origin = 'TBEMPRESA.HOME_PAGE'
      Size = 100
    end
    object qryEmitenteCHAVE_ACESSO_NFE: TIBStringField
      FieldName = 'CHAVE_ACESSO_NFE'
      Origin = 'TBEMPRESA.CHAVE_ACESSO_NFE'
      Size = 250
    end
    object qryEmitenteTIPO_REGIME_NFE: TSmallintField
      FieldName = 'TIPO_REGIME_NFE'
      Origin = 'TBEMPRESA.TIPO_REGIME_NFE'
    end
    object qryEmitenteSERIE_NFE: TSmallintField
      FieldName = 'SERIE_NFE'
      Origin = 'TBEMPRESA.SERIE_NFE'
    end
    object qryEmitenteNUMERO_NFE: TIntegerField
      FieldName = 'NUMERO_NFE'
      Origin = 'TBEMPRESA.NUMERO_NFE'
    end
    object qryEmitenteLOTE_ANO_NFE: TSmallintField
      FieldName = 'LOTE_ANO_NFE'
      Origin = 'TBEMPRESA.LOTE_ANO_NFE'
    end
    object qryEmitenteLOTE_NUM_NFE: TIntegerField
      FieldName = 'LOTE_NUM_NFE'
      Origin = 'TBEMPRESA.LOTE_NUM_NFE'
    end
    object qryEmitentePAIS_ID: TIBStringField
      FieldName = 'PAIS_ID'
      Origin = 'TBEMPRESA.PAIS_ID'
      Size = 5
    end
    object qryEmitentePAIS_NOME: TIBStringField
      FieldName = 'PAIS_NOME'
      Origin = 'TBPAIS.PAIS_NOME'
      Size = 150
    end
  end
  object qryCalculoImporto: TIBDataSet
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    ForcedRefresh = True
    BufferChunks = 1000
    CachedUpdates = True
    RefreshSQL.Strings = (
      '')
    SelectSQL.Strings = (
      'Select'
      '    v.Ano'
      '  , v.Codcontrol'
      '  , v.Codemp'
      '  , v.Codcli'
      '  , v.Dtvenda'
      '  , v.Status'
      '  , v.Desconto'
      '  , v.Totalvenda'
      
        '  , ( coalesce(v.Desconto, 0) + coalesce(v.Totalvenda, 0) ) as T' +
        'otalvendaBruta'
      '  , v.Dtfinalizacao_venda'
      '  , v.Obs'
      '  , v.Formapag'
      '  , v.Fatdias'
      '  , v.Serie'
      '  , v.Nfe'
      '  , v.Lote_nfe_ano'
      '  , v.Lote_nfe_numero'
      '  , v.Nfe_enviada'
      '  , v.Dataemissao'
      '  , v.Horaemissao'
      '  , v.Cancel_usuario'
      '  , v.Cancel_datahora'
      '  , v.Cancel_motivo'
      '  , v.Cfop'
      '  , cf.Cfop_descricao'
      '  , v.Verificador_nfe'
      '  , v.Xml_nfe_filename'
      '  , v.Xml_nfe'
      '  , v.Vendedor_cod'
      '  , vd.Nome as vendedor_nome'
      '  , vd.Cpf as vendedor_cpf'
      '  , v.Usuario'
      '  , v.Formapagto_cod'
      '  , fp.Descri'
      '  , fp.Acrescimo'
      '  , v.Condicaopagto_cod'
      '  , cp.Cond_descricao'
      '  , cp.Cond_descricao_full'
      '  , v.Venda_prazo'
      '  , v.Prazo_01'
      '  , v.Prazo_02'
      '  , v.Prazo_03'
      '  , v.Prazo_04'
      '  , v.Prazo_05'
      '  , v.Prazo_06'
      '  , v.Prazo_07'
      '  , v.Prazo_08'
      '  , v.Prazo_09'
      '  , v.Prazo_10'
      '  , v.Prazo_11'
      '  , v.Prazo_12'
      '  , v.Nfe_valor_base_icms'
      '  , v.Nfe_valor_icms'
      '  , v.Nfe_valor_base_icms_subst'
      '  , v.Nfe_valor_icms_subst'
      '  , v.Nfe_valor_total_produto'
      '  , v.Nfe_valor_frete'
      '  , v.Nfe_valor_seguro'
      '  , v.Nfe_valor_desconto'
      '  , v.Nfe_valor_total_ii'
      '  , v.Nfe_valor_total_ipi'
      '  , v.Nfe_valor_pis'
      '  , v.Nfe_valor_cofins'
      '  , v.Nfe_valor_outros'
      '  , v.Nfe_valor_total_nota'
      ''
      'from TBVENDAS v'
      '  inner join TBCFOP cf on (cf.Cfop_cod = v.Cfop)'
      '  inner join TBVENDEDOR vd on (vd.Cod = v.Vendedor_cod)'
      '  inner join TBFORMPAGTO fp on (fp.Cod = v.Formapagto_cod)'
      
        '  inner join VW_CONDICAOPAGTO cp on (cp.Cond_cod = v.Condicaopag' +
        'to_cod)'
      'where v.Ano = :anovenda'
      '  and v.Codcontrol = :numvenda'
      '')
    ModifySQL.Strings = (
      '')
    GeneratorField.ApplyEvent = gamOnPost
    Left = 144
    Top = 120
    object qryCalculoImportoANO: TSmallintField
      FieldName = 'ANO'
      Origin = 'TBVENDAS.ANO'
    end
    object qryCalculoImportoCODCONTROL: TIntegerField
      FieldName = 'CODCONTROL'
      Origin = 'TBVENDAS.CODCONTROL'
    end
    object qryCalculoImportoCODEMP: TIBStringField
      FieldName = 'CODEMP'
      Origin = 'TBVENDAS.CODEMP'
      Size = 18
    end
    object qryCalculoImportoCODCLI: TIBStringField
      FieldName = 'CODCLI'
      Origin = 'TBVENDAS.CODCLI'
      Size = 18
    end
    object qryCalculoImportoDTVENDA: TDateTimeField
      FieldName = 'DTVENDA'
      Origin = 'TBVENDAS.DTVENDA'
    end
    object qryCalculoImportoSTATUS: TSmallintField
      FieldName = 'STATUS'
      Origin = 'TBVENDAS.STATUS'
    end
    object qryCalculoImportoDESCONTO: TIBBCDField
      FieldName = 'DESCONTO'
      Origin = 'TBVENDAS.DESCONTO'
      Precision = 18
      Size = 2
    end
    object qryCalculoImportoTOTALVENDA: TIBBCDField
      FieldName = 'TOTALVENDA'
      Origin = 'TBVENDAS.TOTALVENDA'
      Precision = 18
      Size = 2
    end
    object qryCalculoImportoTOTALVENDABRUTA: TIBBCDField
      FieldName = 'TOTALVENDABRUTA'
      Precision = 18
      Size = 2
    end
    object qryCalculoImportoDTFINALIZACAO_VENDA: TDateField
      FieldName = 'DTFINALIZACAO_VENDA'
      Origin = 'TBVENDAS.DTFINALIZACAO_VENDA'
    end
    object qryCalculoImportoOBS: TMemoField
      FieldName = 'OBS'
      Origin = 'TBVENDAS.OBS'
      BlobType = ftMemo
      Size = 8
    end
    object qryCalculoImportoFORMAPAG: TIBStringField
      FieldName = 'FORMAPAG'
      Origin = 'TBVENDAS.FORMAPAG'
      Size = 35
    end
    object qryCalculoImportoFATDIAS: TSmallintField
      FieldName = 'FATDIAS'
      Origin = 'TBVENDAS.FATDIAS'
    end
    object qryCalculoImportoSERIE: TIBStringField
      FieldName = 'SERIE'
      Origin = 'TBVENDAS.SERIE'
      Size = 4
    end
    object qryCalculoImportoNFE: TLargeintField
      FieldName = 'NFE'
      Origin = 'TBVENDAS.NFE'
    end
    object qryCalculoImportoLOTE_NFE_ANO: TSmallintField
      FieldName = 'LOTE_NFE_ANO'
      Origin = 'TBVENDAS.LOTE_NFE_ANO'
    end
    object qryCalculoImportoLOTE_NFE_NUMERO: TIntegerField
      FieldName = 'LOTE_NFE_NUMERO'
      Origin = 'TBVENDAS.LOTE_NFE_NUMERO'
    end
    object qryCalculoImportoNFE_ENVIADA: TSmallintField
      FieldName = 'NFE_ENVIADA'
      Origin = 'TBVENDAS.NFE_ENVIADA'
    end
    object qryCalculoImportoDATAEMISSAO: TDateField
      FieldName = 'DATAEMISSAO'
      Origin = 'TBVENDAS.DATAEMISSAO'
    end
    object qryCalculoImportoHORAEMISSAO: TTimeField
      FieldName = 'HORAEMISSAO'
      Origin = 'TBVENDAS.HORAEMISSAO'
    end
    object qryCalculoImportoCANCEL_USUARIO: TIBStringField
      FieldName = 'CANCEL_USUARIO'
      Origin = 'TBVENDAS.CANCEL_USUARIO'
      Size = 50
    end
    object qryCalculoImportoCANCEL_DATAHORA: TDateTimeField
      FieldName = 'CANCEL_DATAHORA'
      Origin = 'TBVENDAS.CANCEL_DATAHORA'
    end
    object qryCalculoImportoCANCEL_MOTIVO: TMemoField
      FieldName = 'CANCEL_MOTIVO'
      Origin = 'TBVENDAS.CANCEL_MOTIVO'
      BlobType = ftMemo
      Size = 8
    end
    object qryCalculoImportoCFOP: TIntegerField
      FieldName = 'CFOP'
      Origin = 'TBVENDAS.CFOP'
    end
    object qryCalculoImportoCFOP_DESCRICAO: TIBStringField
      FieldName = 'CFOP_DESCRICAO'
      Origin = 'TBCFOP.CFOP_DESCRICAO'
      Size = 250
    end
    object qryCalculoImportoVERIFICADOR_NFE: TIBStringField
      FieldName = 'VERIFICADOR_NFE'
      Origin = 'TBVENDAS.VERIFICADOR_NFE'
      Size = 250
    end
    object qryCalculoImportoXML_NFE_FILENAME: TIBStringField
      FieldName = 'XML_NFE_FILENAME'
      Origin = 'TBVENDAS.XML_NFE_FILENAME'
      Size = 250
    end
    object qryCalculoImportoXML_NFE: TMemoField
      FieldName = 'XML_NFE'
      Origin = 'TBVENDAS.XML_NFE'
      BlobType = ftMemo
      Size = 8
    end
    object qryCalculoImportoVENDEDOR_COD: TIntegerField
      FieldName = 'VENDEDOR_COD'
      Origin = 'TBVENDAS.VENDEDOR_COD'
    end
    object qryCalculoImportoVENDEDOR_NOME: TIBStringField
      FieldName = 'VENDEDOR_NOME'
      Origin = 'TBVENDEDOR.NOME'
      Size = 60
    end
    object qryCalculoImportoVENDEDOR_CPF: TIBStringField
      FieldName = 'VENDEDOR_CPF'
      Origin = 'TBVENDEDOR.CPF'
      Size = 12
    end
    object qryCalculoImportoUSUARIO: TIBStringField
      FieldName = 'USUARIO'
      Origin = 'TBVENDAS.USUARIO'
      Size = 50
    end
    object qryCalculoImportoFORMAPAGTO_COD: TSmallintField
      FieldName = 'FORMAPAGTO_COD'
      Origin = 'TBVENDAS.FORMAPAGTO_COD'
    end
    object qryCalculoImportoDESCRI: TIBStringField
      FieldName = 'DESCRI'
      Origin = 'TBFORMPAGTO.DESCRI'
      Size = 30
    end
    object qryCalculoImportoACRESCIMO: TFloatField
      FieldName = 'ACRESCIMO'
      Origin = 'TBFORMPAGTO.ACRESCIMO'
    end
    object qryCalculoImportoCONDICAOPAGTO_COD: TSmallintField
      FieldName = 'CONDICAOPAGTO_COD'
      Origin = 'TBVENDAS.CONDICAOPAGTO_COD'
    end
    object qryCalculoImportoCOND_DESCRICAO: TIBStringField
      FieldName = 'COND_DESCRICAO'
      Origin = 'VW_CONDICAOPAGTO.COND_DESCRICAO'
      Size = 80
    end
    object qryCalculoImportoCOND_DESCRICAO_FULL: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'COND_DESCRICAO_FULL'
      Origin = 'VW_CONDICAOPAGTO.COND_DESCRICAO_FULL'
      ReadOnly = True
      Size = 177
    end
    object qryCalculoImportoVENDA_PRAZO: TSmallintField
      FieldName = 'VENDA_PRAZO'
      Origin = 'TBVENDAS.VENDA_PRAZO'
    end
    object qryCalculoImportoPRAZO_01: TSmallintField
      FieldName = 'PRAZO_01'
      Origin = 'TBVENDAS.PRAZO_01'
    end
    object qryCalculoImportoPRAZO_02: TSmallintField
      FieldName = 'PRAZO_02'
      Origin = 'TBVENDAS.PRAZO_02'
    end
    object qryCalculoImportoPRAZO_03: TSmallintField
      FieldName = 'PRAZO_03'
      Origin = 'TBVENDAS.PRAZO_03'
    end
    object qryCalculoImportoPRAZO_04: TSmallintField
      FieldName = 'PRAZO_04'
      Origin = 'TBVENDAS.PRAZO_04'
    end
    object qryCalculoImportoPRAZO_05: TSmallintField
      FieldName = 'PRAZO_05'
      Origin = 'TBVENDAS.PRAZO_05'
    end
    object qryCalculoImportoPRAZO_06: TSmallintField
      FieldName = 'PRAZO_06'
      Origin = 'TBVENDAS.PRAZO_06'
    end
    object qryCalculoImportoPRAZO_07: TSmallintField
      FieldName = 'PRAZO_07'
      Origin = 'TBVENDAS.PRAZO_07'
    end
    object qryCalculoImportoPRAZO_08: TSmallintField
      FieldName = 'PRAZO_08'
      Origin = 'TBVENDAS.PRAZO_08'
    end
    object qryCalculoImportoPRAZO_09: TSmallintField
      FieldName = 'PRAZO_09'
      Origin = 'TBVENDAS.PRAZO_09'
    end
    object qryCalculoImportoPRAZO_10: TSmallintField
      FieldName = 'PRAZO_10'
      Origin = 'TBVENDAS.PRAZO_10'
    end
    object qryCalculoImportoPRAZO_11: TSmallintField
      FieldName = 'PRAZO_11'
      Origin = 'TBVENDAS.PRAZO_11'
    end
    object qryCalculoImportoPRAZO_12: TSmallintField
      FieldName = 'PRAZO_12'
      Origin = 'TBVENDAS.PRAZO_12'
    end
    object qryCalculoImportoNFE_VALOR_BASE_ICMS: TIBBCDField
      FieldName = 'NFE_VALOR_BASE_ICMS'
      Origin = 'TBVENDAS.NFE_VALOR_BASE_ICMS'
      Precision = 18
      Size = 2
    end
    object qryCalculoImportoNFE_VALOR_ICMS: TIBBCDField
      FieldName = 'NFE_VALOR_ICMS'
      Origin = 'TBVENDAS.NFE_VALOR_ICMS'
      Precision = 18
      Size = 2
    end
    object qryCalculoImportoNFE_VALOR_BASE_ICMS_SUBST: TIBBCDField
      FieldName = 'NFE_VALOR_BASE_ICMS_SUBST'
      Origin = 'TBVENDAS.NFE_VALOR_BASE_ICMS_SUBST'
      Precision = 18
      Size = 2
    end
    object qryCalculoImportoNFE_VALOR_ICMS_SUBST: TIBBCDField
      FieldName = 'NFE_VALOR_ICMS_SUBST'
      Origin = 'TBVENDAS.NFE_VALOR_ICMS_SUBST'
      Precision = 18
      Size = 2
    end
    object qryCalculoImportoNFE_VALOR_TOTAL_PRODUTO: TIBBCDField
      FieldName = 'NFE_VALOR_TOTAL_PRODUTO'
      Origin = 'TBVENDAS.NFE_VALOR_TOTAL_PRODUTO'
      Precision = 18
      Size = 2
    end
    object qryCalculoImportoNFE_VALOR_FRETE: TIBBCDField
      FieldName = 'NFE_VALOR_FRETE'
      Origin = 'TBVENDAS.NFE_VALOR_FRETE'
      Precision = 18
      Size = 2
    end
    object qryCalculoImportoNFE_VALOR_SEGURO: TIBBCDField
      FieldName = 'NFE_VALOR_SEGURO'
      Origin = 'TBVENDAS.NFE_VALOR_SEGURO'
      Precision = 18
      Size = 2
    end
    object qryCalculoImportoNFE_VALOR_DESCONTO: TIBBCDField
      FieldName = 'NFE_VALOR_DESCONTO'
      Origin = 'TBVENDAS.NFE_VALOR_DESCONTO'
      Precision = 18
      Size = 2
    end
    object qryCalculoImportoNFE_VALOR_TOTAL_II: TIBBCDField
      FieldName = 'NFE_VALOR_TOTAL_II'
      Origin = 'TBVENDAS.NFE_VALOR_TOTAL_II'
      Precision = 18
      Size = 2
    end
    object qryCalculoImportoNFE_VALOR_TOTAL_IPI: TIBBCDField
      FieldName = 'NFE_VALOR_TOTAL_IPI'
      Origin = 'TBVENDAS.NFE_VALOR_TOTAL_IPI'
      Precision = 18
      Size = 2
    end
    object qryCalculoImportoNFE_VALOR_PIS: TIBBCDField
      FieldName = 'NFE_VALOR_PIS'
      Origin = 'TBVENDAS.NFE_VALOR_PIS'
      Precision = 18
      Size = 2
    end
    object qryCalculoImportoNFE_VALOR_COFINS: TIBBCDField
      FieldName = 'NFE_VALOR_COFINS'
      Origin = 'TBVENDAS.NFE_VALOR_COFINS'
      Precision = 18
      Size = 2
    end
    object qryCalculoImportoNFE_VALOR_OUTROS: TIBBCDField
      FieldName = 'NFE_VALOR_OUTROS'
      Origin = 'TBVENDAS.NFE_VALOR_OUTROS'
      Precision = 18
      Size = 2
    end
    object qryCalculoImportoNFE_VALOR_TOTAL_NOTA: TIBBCDField
      FieldName = 'NFE_VALOR_TOTAL_NOTA'
      Origin = 'TBVENDAS.NFE_VALOR_TOTAL_NOTA'
      Precision = 18
      Size = 2
    end
  end
  object IBSQL: TIBSQL
    Database = DMBusiness.ibdtbsBusiness
    ParamCheck = True
    Transaction = DMBusiness.ibtrnsctnBusiness
    Left = 304
    Top = 248
  end
  object FrECFPooler: TfrxReport
    Version = '4.6.32'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 40958.629806064810000000
    ReportOptions.LastChange = 40960.806519317130000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    OnGetValue = FrECFPoolerGetValue
    Left = 56
    Top = 120
    Datasets = <
      item
        DataSet = frdCliente
        DataSetName = 'frdCliente'
      end
      item
        DataSet = frdEmpresa
        DataSetName = 'frdEmpresa'
      end
      item
        DataSet = frdItens
        DataSetName = 'frdItens'
      end
      item
        DataSet = frdTitulo
        DataSetName = 'frdTitulo'
      end
      item
        DataSet = frdVenda
        DataSetName = 'frdVenda'
      end>
    Variables = <
      item
        Name = ' Local'
        Value = Null
      end
      item
        Name = 'CEPEmissor'
        Value = #39'00.000-000'#39
      end
      item
        Name = 'CNPJEmissor'
        Value = #39'00.000.000/0000-00'#39
      end
      item
        Name = 'FONEEmissor'
        Value = #39'(91)0000-0000'#39
      end
      item
        Name = 'CNPJCliente'
        Value = #39'00.000.000/0000-00'#39
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Lucida Console'
      Font.Style = []
      PaperWidth = 74.000000000000000000
      PaperHeight = 306.000000000000000000
      PaperSize = 161
      LeftMargin = 4.000000000000000000
      RightMargin = 4.000000000000000000
      TopMargin = 4.000000000000000000
      BottomMargin = 4.000000000000000000
      object bndReportTitle: TfrxReportTitle
        Height = 98.267780000000000000
        Top = 18.897650000000000000
        Width = 249.448980000000000000
        object frdEmpresaNMFANT: TfrxMemoView
          Width = 249.448980000000000000
          Height = 30.236240000000000000
          ShowHint = False
          DataField = 'NMFANT'
          DataSet = frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frdEmpresa."NMFANT"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo1: TfrxMemoView
          Top = 30.236240000000000000
          Width = 249.448980000000000000
          Height = 45.354360000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Lucida Console'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            
              '[frdEmpresa."TLG_SIGLA"] [frdEmpresa."LOG_NOME"], [frdEmpresa."N' +
              'UMERO_END"], [frdEmpresa."BAI_NOME"] [frdEmpresa."CID_NOME"]/[fr' +
              'dEmpresa."EST_SIGLA"] CEP.: [CEPEmissor]'
            'Fone: [FONEEmissor]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          Top = 75.590600000000000000
          Width = 249.448980000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            'CNPJ: [CNPJEmissor] IE: [frdEmpresa."IE"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object bndMasterData: TfrxMasterData
        Height = 30.236240000000000000
        Top = 374.173470000000000000
        Width = 249.448980000000000000
        DataSet = frdItens
        DataSetName = 'frdItens'
        RowCount = 0
        object Memo7: TfrxMemoView
          Width = 22.677180000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Memo.UTF8 = (
            '[FormatFloat('#39'#00'#39',<frdItens."SEQ">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Left = 22.677180000000000000
          Width = 37.795300000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Memo.UTF8 = (
            '[frdItens."CODPROD"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 60.472480000000000000
          Width = 188.976500000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Memo.UTF8 = (
            '[frdItens."DESCRI"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 192.756030000000000000
          Top = 15.118120000000000000
          Width = 56.692950000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[FormatFloat('#39',0.00'#39',<frdItens."TOTAL_LIQUIDO">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          Left = 136.063080000000000000
          Top = 15.118120000000000000
          Width = 56.692950000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[FormatFloat('#39',0.00'#39',<frdItens."PFINAL">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Left = 79.370130000000000000
          Top = 15.118120000000000000
          Width = 56.692950000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[FormatFloat('#39',0.##'#39',<frdItens."QTDE">)]   x ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object bndHeader: TfrxHeader
        Height = 147.401670000000000000
        Top = 181.417440000000000000
        Width = 249.448980000000000000
        object Memo13: TfrxMemoView
          Top = 75.590600000000000000
          Width = 249.448980000000000000
          Height = 30.236240000000000000
          ShowHint = False
          DataSet = frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Lucida Console'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            
              '[IIF(<frdVenda."STATUS">=1,'#39'ORCAMENTO'#39',IIF(<frdVenda."STATUS">=2' +
              ','#39'ORCAMENTO'#39',IIF(<frdVenda."STATUS">=3,'#39'CUPOM NAO FISCAL'#39',IIF(<f' +
              'rdVenda."STATUS">=4,'#39'CUPOM NAO FISCAL'#39','#39'CUPOM CANCELADO'#39'))))]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo2: TfrxMemoView
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'Data/Hora:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          Left = 52.913420000000000000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Memo.UTF8 = (
            '[frdVenda."DTVENDA"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          Left = 143.622140000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'Controle:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Left = 185.196970000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            
              '[frdItens."ANO"][FormatFloat('#39'"/"###0000000'#39',<frdVenda."CODCONTR' +
              'OL">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          Top = 18.897650000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            'Vendedor:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Left = 52.913420000000000000
          Top = 18.897650000000000000
          Width = 196.535560000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '[frdVenda."VENDEDOR_NOME"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Top = 37.795300000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'Cliente:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          Left = 52.913420000000000000
          Top = 37.795300000000000000
          Width = 196.535560000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Memo.UTF8 = (
            '[frdCliente."NOME"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo24: TfrxMemoView
          Top = 105.826840000000000000
          Width = 22.677180000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            '#')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo25: TfrxMemoView
          Left = 22.677180000000000000
          Top = 105.826840000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'C'#195#179'digo')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          Left = 60.472480000000000000
          Top = 105.826840000000000000
          Width = 188.976500000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'Descri'#195#167#195#163'o')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          Top = 124.724490000000000000
          Width = 136.063080000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            'Quant. ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo28: TfrxMemoView
          Left = 136.063080000000000000
          Top = 124.724490000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            'Valor Un. ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo29: TfrxMemoView
          Left = 192.756030000000000000
          Top = 124.724490000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            'Total ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo35: TfrxMemoView
          Top = 56.692950000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'CPF/CNPJ:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo36: TfrxMemoView
          Left = 52.913420000000000000
          Top = 56.692950000000000000
          Width = 196.535560000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Memo.UTF8 = (
            '[CNPJCliente]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object bndReportSummary: TfrxReportSummary
        Height = 117.165430000000000000
        Top = 438.425480000000000000
        Width = 249.448980000000000000
        object Memo17: TfrxMemoView
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = [ftTop]
          Memo.UTF8 = (
            'TOTAL')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          Left = 132.283550000000000000
          Width = 117.165430000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = [ftTop]
          HAlign = haRight
          Memo.UTF8 = (
            '[FormatFloat('#39',0.00'#39',<frdVenda."TOTALVENDABRUTA">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          Top = 18.897650000000000000
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Lucida Console'
          Font.Style = []
          Memo.UTF8 = (
            'TOTAL DESCONTO')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          Left = 132.283550000000000000
          Top = 18.897650000000000000
          Width = 117.165430000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Lucida Console'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[FormatFloat('#39',0.00'#39',<frdVenda."DESCONTO">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          Top = 37.795300000000000000
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '[IIF(<frdVenda."STATUS">>2,'#39'TOTAL PAGO'#39','#39'TOTAL A PAGAR'#39')]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          Left = 132.283550000000000000
          Top = 37.795300000000000000
          Width = 117.165430000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[FormatFloat('#39',0.00'#39',<frdVenda."TOTALVENDA">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo30: TfrxMemoView
          Top = 56.692950000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'Forma Pagto.:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo31: TfrxMemoView
          Left = 64.252010000000000000
          Top = 56.692950000000000000
          Width = 185.196970000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Memo.UTF8 = (
            '[frdVenda."FORMAPAG"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo32: TfrxMemoView
          Top = 75.590600000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            'Cond. Pagto.:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo33: TfrxMemoView
          Left = 64.252010000000000000
          Top = 75.590600000000000000
          Width = 185.196970000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '[frdVenda."COND_DESCRICAO"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo34: TfrxMemoView
          Top = 94.488250000000000000
          Width = 249.448980000000000000
          Height = 22.677180000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            'Impresso em [Date] '#195#160's [Time]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
    end
  end
end
