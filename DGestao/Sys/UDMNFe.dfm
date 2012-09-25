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
    Active = True
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
    ReportOptions.LastChange = 41177.615040925900000000
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
          Left = 158.740260000000000000
          Width = 336.378170000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdCliente
          DataSetName = 'frdCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            '[frdEmpresa."RZSOC"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frdEmpresaNMFANT: TfrxMemoView
          Left = 158.740260000000000000
          Top = 18.897650000000000000
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
          Left = 158.740260000000000000
          Top = 51.590600000000000000
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
          Left = 158.740260000000000000
          Top = 38.795300000000000000
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
          Width = 154.960730000000000000
          Height = 64.252010000000000000
          ShowHint = False
          Picture.Data = {
            07544269746D6170B6ED0000424DB6ED0000000000003600000028000000D500
            00005F000000010018000000000080ED00000000000000000000000000000000
            0000016759045D5101665B0931911233BC0016C1000DBB0813BE0B18B80A16BF
            000EBF0314BE0717BD1925BA4D61C39BBDDABBDBDFB3D4CFA9CBD4B7DBD8B7DB
            D8B6DAD7B5D9D6B6DAD7B5D9D6B4D8D5B5D9D6B3D6D6B2D5D5B3D6D6B2D5D5B2
            D5D5B2D5D5B3D4D4B3D4D4AED3D3AED3D3AED3D3AED3D3ADD2D1ADD2D1ADD2D1
            ADD2D1A8CBD0A8CBD0A7CACFA6C9CEA7CACFA7CACFA7CACFA6C9CE9FC6CC9FC6
            CC9FC6CC9FC5CE9FC5CE9EC4CD9EC4CD9EC4CD96BDCA96BDCA96BDCA96BDCA96
            BDCA95BCC995BCC995BCC985A9C887A9C889ADC68BAEC98DB2C98EB4C88FB5C8
            8DB4C48AADC888ABC68AADCA86A8C786A9C487A8C788A8C289A9C385ACC383A9
            C282A6C57FA5C67B9EC77598C77395C86F8FC85578D25472D24A65CE3E55CA33
            46C72A39C3232FC2212CC20B1AC20A19C10A19C10A1AC00919BF0919BF0817BF
            0817BF0C1BBB0B1ABA091ABC0818BE0513BD0312BE0311BF0311BF0514BE0514
            BE0514BE0514BE0514BE0514BE0514BE0514BE0513BD0513BD0513BD0513BD05
            13BD0513BD0513BD0513BD0513BD0513BD0513BD0513BD0513BD0513BD0513BD
            0513BD0413BF0413BF0413BF0413BF0413BF0413BF0413BF0413BF0513BD0513
            BD0513BD0513BD0513BD0513BD0513BD0513BD0413BF0413BF0413BF0413BF04
            13BF0413BF0413BF0413BF0513BD0513BD0513BD0513BD0513BD0513BD0513BD
            0513BD0513BD0513BD0513BD0513BD0513BD0513BD0513BD0513BD0513BD0513
            BD0513BD0513BD0513BD0513BD0513BD0513BD0615BF0615BF0615BF0514BE05
            14BE0514BE0514BE0514C00616BE0515BD0616BE0616BE0616BE0616BE0717BF
            0717BF0513BD0513BD0513BD0513BD0513BD0513BD0513BD0513BD0412BF0412
            BF00006456015F550B7C700217B6071AC00614BE0310C10611BE0712BD0412BC
            0112BE0014C50512B92433B54A65AD698BAA7094A3698BA66284A94F6DAD4F6D
            AD4E6BAD4E6BAD4E6BAD4E6BAD4C69AB4D6AAC4B68AF4B68AF4C69B04C69B04B
            68B04B68B04A67AF4966AE445DB0435CAF435CAF435CAF435CAF425BAE425BAE
            425BAE4E6CAC4E6CAC4F6DAD4E6CAC4E6CAC4D6BAB4D6BAB4D6BAB4E69B04D68
            AF4D68AF4D68AF4D68AF4C67AE4B66AD4C67AE4762B04762B04762B04661AF45
            60AE445FAD445FAD445FAD425CB24058AE4159B04058AF415AAD435BB14660AB
            4660AB3D50B43D51B33E56B23D55B03F59AF405AB0415BB1415BB13B52B13B50
            B03B4FB13B50B23A52B13951B23753B53854B53652B63652B53852BA324BBA2E
            46B92B45B52B44B6293EB61B33B51B33B51933B21D32B61A32B41A31B51731B2
            1B2FB5172CBA162EBB132ABA1224BB0C1DBA0919BD0515BB0313BA041BBE041B
            BE041ABE061ABE041ABD051BBF051BBF061ABE0718BD0416BC0415BC0414BB04
            13BB0513BD0513BD0513BD0513BD0513BD0513BD0513BD0513BD0513BD0513BD
            0513BD0413BF0413BF0413BF0413BF0413BF0413BF0413BF0413BF0513BD0513
            BD0513BD0513BD0513BD0513BD0513BD0513BD0413BF0413BF0413BF0413BF04
            13BF0413BF0413BF0413BF0513BD0513BD0513BD0513BD0513BD0513BD0513BD
            0513BD0513BD0513BD0513BD0513BD0513BD0513BD0513BD0513BD0513BD0513
            BD0513BD0513BD0513BD0513BD0513BD0513BD0514BE0514BE0514BE0514BE04
            13BD0413BD0514BE0413BD0412BE0311BD0412BE0412BE0412BC0412BC0412BC
            0412BC0513BD0513BD0513BD0513BD0513BD0513BD0513BD0513BD0412BF0412
            BF0000625703665C208C84000BC2010DB10811BC0516B9030EB90410C4000FC0
            0211BB000FB91722C2526ED08CBDE28AB2DE87AED987B1DD82ADDB87B0D888B1
            D986AFD986AFD986AFD986AFD985AED885AED683ADD983ADD982ACD880A9D780
            A9D781AAD880A9D77FA8D67BA5D77BA5D77BA5D77BA5D77BA5D77AA4D67AA4D6
            7AA4D677A3D976A2D876A2D876A2D876A2D974A0D7749FD9749FD96D94D66D94
            D66D94D66C93D56C93D56C93D56C93D56C93D5648DD5648DD5638CD3638BD364
            8AD2678CD3658DD3658DD36588D26587D3648ACF6788D56787D56585D56587D3
            6385D15E83D25E84D05F85D06188CD6387CF6387CF6384CF6281CE5C87D25E88
            D75A85D25D86D45E8AD2618DD1608FD26292D25E7FCE6183CF6387D06286D162
            87D36489D46284D36382D76084D65D83D55C83D35E82D35B7FD1597DCF587CD1
            597BD24063D14062D33A58CF334DCD2E44CA293EC72336C61F32C61A31C61731
            C61531C51731C41630C1132FBF132EC0142BC11429BF1027C10F26C10D24C00E
            22C0091EBC091EBD0B1EBE091FBE0B1EBE0B1DBD0B1EBB0B1EBB0C1FBC0C1EBE
            0E1EBE0C1DBF0C1EC1091DC0091DC0081CBF041BBF031ABF0418BE0417BD0415
            BB0414BB0413BB0413BB0513BD0513BD0513BD0413BF0413BF0413BF0413BF04
            13BF0413BF0413BF0413BF0513BD0513BD0513BD0513BD0513BD0513BD0513BD
            0513BD0513BD0513BD0513BD0513BD0513BD0513BD0513BD0513BD0513BD0513
            BD0513BD0513BD0513BD0513BD0513BD0513BD0515BD0515BD0616BE0615BF06
            15BF0615BF0615BF0716C00514BE0514BE0514BE0413BD0413BD0413BD0312BC
            0413BD0513BD0513BD0513BD0513BD0513BD0513BD0513BD0513BD0412BF0412
            BF00025E5000376C142FB50204B70413C5091CBB0E22BE0119BE0011BB0512C0
            0612BB212DAC576ECDA1CBE1C1E8E2D3EDE4E3F6EBE2F6EED6F0E7DCF3F2DAF1
            F0DBF3F0D7F2EED8F3EFD6F3EFD5F1EFD4F1EFD0EDE8D0EDE8CFECE7CFECE7CF
            ECE7CEEBE6CEEBE6CEEBE6C5E5E2C6E6E3C6E6E3C6E7E2C5E6E1C5E5E2C5E5E2
            C5E5E2C4E6E3C4E6E3C4E6E3C4E6E3C4E6E3C3E5E2C3E5E2C3E5E2B7DDE0B7DD
            E0B6DCDDB7DDDCB7DCDAB0DCD7AEDDD9ADDCDAA9D8D9ACD9DCAFD7D9B2D7D9AF
            D3D5ADD4D8A9D0D7AED4DDA3CCD4A5CFD3A4CED4A4CED5A3CDD4A1CAD69FC9DA
            A1C9DBA1C9DB9EC9DA9DCBD99BCBD49CCAD599CAD898C8DA98C8DA95C1D894C0
            D797C0D897C0D899C3D998C3D697C4D798C5D699C8D69BC8D698C8D597C8D69A
            C8D69AC8D79BC7D79CC9D999C5D997C5D794C4D795C5D791C4D48DC4D38EC3D8
            8CC2D78ABED68DBED993BFD994BCD994BBD793BDD590BCD48DBAD77FAADC7FAE
            DD7CADDD7BADD77CABD37EACD27EAAD380A9D3779ED2779DD4779DD5749BD471
            99D27197CF7396CE7496CF749ACE759BCB759ACB759BCC7498CA7799CE7597CF
            6F92CD7698CE7495CE7396CD7295CD6C92C96A93CC6892CA6991CA6488C96386
            C96287C76386C66284C65D83C55E82C75E81C75D7EC6607EC7617DC75E79C560
            7CC7617CC9627DCA627DCA6785C96785C96684C86583C76684C86683CA6582C9
            6481C85E77CA5E77CA5C75C85C74CA5A74C95B75CA5973C85872C7546CC8546C
            C84F65C64F66C54B62C54961C24960C34860C14055C54055C54055C53F54C43F
            54C43E52C43D51C33C50C23448C33448C33347C23347C23347C23246C13347C2
            3347C22E40C42F41C52E40C42E40C42E40C42E40C42D3FC32C3EC22B3CC12B3C
            C1000365660E44901329BC0007BA0211BD081EBB0C23BC0115BE0312C30714C2
            0613BA364BB05973C483A7CE97BECBA8CBCBB6D8D5BBE0DFB4DBE1C2E0DBC1DF
            DAC0DED9BFE0DBBDDED9BCDEDBB8DAD7B9DADAB7D8D8B7D8D8B6D7D7B6D7D7B6
            D7D7B6D7D7B6D7D7B5D6D6B1D6D5B1D6D5B0D5D4B0D5D4B0D5D4B0D5D4AFD4D3
            B0D5D4AACED1A9CDD0A9CDD0A9CDD0A9CDD0A6CBD0A6CBCEA3C8CB9DC4CEA0C7
            CEA0C7CDA1C8CE9CC9CD99CACC97CACE98CAD299C8D39CC9D4A1C8D6A5CCD6A4
            CAD5A0C9D29CC7D19FCAD2A0CECFA1CED0A1CECDA1D0CDA1CFCEA1CFCFA1CFD3
            9ECCD69DCAD29BCBD29BCBCF9ACBCA9BCACE9BCAD298CBD397CAD394C7D491C7
            D594C8D891C7DB92CADE91CCDF91CEE08ECFE187CEE289D0E387D1E388D1E385
            D0E388D1E385CFE384D1E37FCCE381CEE380CFE380CFE37DCFE379CEE377CEE2
            78CEE27BCEE27DCDE27FCBE280CAE283CAE181CCE180CCE17FCCE077C5E178C5
            E176C5E178C4E079C3E07EC3DF7EC2DF83C1DF80BDDD7FBBDC7CB7DB76B1D978
            ADD880AFD683ACD581AAD57599D97599D9759AD97498DA7498D97296D97596DA
            7693DA7998DA7594D97092D86E93D76891D46690D4658FD3688FD3668AD46688
            D36687D16385CF6283CC5F81CE5D7FCE5B7CCD5673CB546FC9526DC9536DC751
            6DC74E6CC54E6DC5526AC55061C54F60C54E61C54D60C44D60C44C5FC34C5FC3
            4C5FC34960C34960C5475DC4465BC54358C34357C44255C54055C53D50C03E50
            C23C4EC2394CC23749C13547C13547C13547C13042C63042C63042C62F41C52F
            41C52E40C42E40C42D3FC32C3CC62C3CC62B3BC52B3BC52B3BC52A3AC4283BC4
            283BC4283AC5283AC52739C4283AC52739C42638C32638C32638C32434C72333
            C6000661771B46B2071CC3000BBD000EBA0A1FBE081EC30011BD000DBE010DBE
            0713B64663AA5674B2678BB26689AC688BA66990A7648BA9648CA65D7BAB5D7B
            AB5C7AAC5C79AD5877AD5876AE5373AC5372AE5775AD5775AD5775AD5674AC56
            74AC5674AC5674AC5573AB4F6FAD4E6EAC4E6EAC506EAC506EAC506EAE4E6CAC
            4E6CAC4E69B04D6AAE516CAE526CAC556EB14E70B24F72B25475B45377B8587B
            BC577EBC5B83BF5681BB618BC2658EC46993C66B92C66E94C96F96CA6F96CD70
            99CC73A0C976A3C87BA5C885AEC78AB1C38AB1C08FB3C191B5BF8FB7BD8FB8BC
            8FB9BE8EB8BF8EB9BE8EB8BE8DB7BD8DB7BD8AB6BD8CB4C189B4C284B2C87EB5
            CC7BB7D675BDDC6CC0DD65C0E361C1E461C6EF5CC8F159C9F15BCBF459CBF553
            CAF24FCBF04AC8EF47C7F145C5F142C4EF43C5F044C4EF44C4ED48C9F045C6ED
            44C5EC45C5ED43C4F041C3EF44C3F144C6F240C5EE42C5EC44C8EA44C8E646C7
            E347C6E24EC6E752C6E952C1E555BFE559BEE85DBAE863B9ED61B5E961AFE56C
            B0E173A2DF7BA0DE789CDD7A9CDC799BDC7B9DDD7A9BDE7C9BDE7E9ADD7E9ADE
            7D97DF7E98DE7995DD7495DC7498DA7197DA688FD96A8ED7688CD66488D36385
            D16185D06283CE5C7FC95C7DC95779C75273C64F6FC84B6AC34765C14360C03E
            5CBD3A52BA354CBA2E47B72F45B72F43B73345B72E42B42D40B22B3EB12C3DB3
            2C3DB32737B62635B62433B42433B52331B62331B6222FB61F2FB52031B52131
            B72030B61E2CB81D2CB61A27B71926B61724B71726BA1625B91625B91625B916
            25B91625B91625B91726BA1726BA1726BA1726BA1625B91625BA1625BA1625BA
            1625BA1020BD1020BD0F1FBC0F1FBC0F1FBC0F1FBC0F1FBC0D1DBB0F1DBD101B
            BD0015578F193CC1000DBE0511C50311BB0A1EC10216BF000FB9000CBD0C16BA
            2434C69DCAE2A3D0E2A4CDE5A2CAE49BC5DF9AC3E19DC6DE97BFD98CB7DF8BB6
            DE89B6DE88B5DD88B5DD86B3DD84B4DD83B3DC81A9DB81A9DB81A9DB80A8DA7F
            A7D980A8DA7FA7D97FA7D97BA3DB7AA2DA7AA2DA7AA2DA7AA2DA7AA2DA769FD5
            74A0D5709DD2739ED379A0D577A1D376A2D378A5D87AA9DA7EADDC7CAED87FB2
            D782B7D78ABCD98BC0D592C4D596C7D29BCBD09DCDCFA1CFD1A4D2D1A3D6CBA4
            D8C7A0D6BB9BD1AD95C9A191C39586B68182B37985B67A7EAF7079AA6878A967
            77A86775A56673A36671A2626F9F606F9F606E9F6276A67074AB7271A96E6DAB
            736CB38064B38A5DB38D60BFA160C6AE5ECDBB5ACFC256D0C755D3CD51D1CD4B
            CECC47D4D143D3D53ED2D93AD1DD37D0E131CFE62ECCE72BCCEA2BCCEF27C9F0
            25C8F225C6F426C6F827C5FC25C3FB27C0FC30C1FF34C1FF3AC5FF3FC5FE42C3
            FA40BAF53FB1EF3EAAEA3FA6E73C9DDF3B97D73B8FCE3C88CB3C7FC53D7BC84A
            7BCD5977CC6076CC5F74D35E74D55268C54F64C24D62C14F62C65463C95463CC
            5462CD5363CE5567CD5A6FD26079D7637DD86479DB6B81E8748BED8095F487A1
            F089A3EF8CA6EE8EA9EA86A1E7829FE57F9DE47C9DE37495E16C8CDF6687DB5F
            81D95E7DD75876D55371D34A68D04661CC425BCA3D55C73952C4344EC2344BC2
            3448C13347C43446C73344C83142C62F3FC52E3EC62E3DC72D3DC72E3EC82D3D
            C72D3EC62C3CC62C3CC62C3BC72B3AC62938C42737C92737C92738C72738C727
            38C72738C72738C72738C72634C42735C52735C52735C52435C42435C42435C4
            2434C62031C62031C62031C61F30C51E2FC41F30C51F30C51D2EC31C2BC71A29
            C5001648AA0C27C2000ABB0615C10616BE041CBA0112BE000EC2020EBF1B26BB
            5670D1AED6E4ABD1E4A3C8DFA1C7E0A7CFE3B1D9E6B7DDE6BEE3E9BDE2E2BCE1
            E1BCE0E3BCE0E3BCDFE4B7DCE2B6DBE1B6DAE3B8DDE2B8DDE2B8DDE2B7DCE1B7
            DCE2B7DCE2B7DCE2B7DCE2AFD9DEAFD9DEB1D8DEAFD6DDAFD7DDABD5DDA7D4D8
            A8D6DCA8D7E2A6D7E0A1D5DAA3DADCAADEE3B2E0E9AFDFE4ACE2E3AFE7E0B5E9
            DDB6ECD4B4EFC1A3E7A093D4838CCA7387C86E7FBF627FBB6278B45671AB4B6F
            A8446CA63E6CA63D68A33869A53766A33566A33467A233649E33609A31609932
            5F97335D92305B902D5A902C578E28538D264E89264F8B284E8B244F8D244E8D
            214E92254C94254A962745972841992A419E3241A33A41A64042A94745AD5041
            AD5842B36642B97548C48649CD9B48D4AC41D8BC3ADACB32DAD924D0DE21D0EF
            21CFFB21CBFF23C6FF28C4FF2CC0FF34B9FF3DA7FF3C97FF3386FF2973F02365
            E51E57DA1C4CD11A45C9153DBD1336B4112FAD0F29A81225A6111FA4161FA81A
            1FAD191BAD1E1DB21E1FB42325B52125B52427B92428BB292BC32A2AC7292ACA
            2A28CE2828D0262AD1272ED12831D12A31D03333D63534D43334CE3437CB363A
            C8383EC83E47CD4651D5505BD95762DD5F6DE16E7DE68393F68AA0F08BA2EC86
            A4E7769EE3739EE16C94DD688FDC648AD96083D4587BD15074CC4A6CCB4767CA
            4861CA4461CA415DC73F5AC83E57C73D55C83D54C93C53C83C52C9384DC6384D
            C6384CC7394EC7374AC8374AC83548C93447C83146C93146C93146C93146C931
            46C93146C93146C93146C93042C63042C63042C62F41C52F41C52F41C52E40C4
            2D3FC3293CC5283BC4283BC4293CC5283BC42739C4283AC5283AC52839C52738
            C5001534BD0014BD010EBF0413BD091DBF061BC20415C1000BC20918B22B3FAC
            617CC38BAFBD87ABBA83AAB888ACBA8FB0C19BBDC6A3C6C7A6C7C8A8CDCDA8CD
            CDA4C9C9A5CACAA1C7CAA2C8CBA1C6CBA0C5CAA4C8CBA3C7CAA3C7CAA3C7CAA3
            C6CBA2C5CAA2C5CAA3C6CB9CC3CA9EC3C99FC6C89DC4C89CC6C99CC7CA9DCBCD
            A4CED19ACCCD9DD0CA9FD4C7A3D8C8A8DCC6ADDFC6B1E3C6AEE6BBA1D9A38EC5
            8678AF6779AF6075AD5370AD4B6FAE476AAD4167AD3E67AD3E64AF3C63AE3863
            AC3665AC3762A9345EA6325EA6315AA12F589F2E559C2E52982C53942D51922C
            52912D518E2B518B28518C284E8A244A8922488C22488C214B8D1B4B8E154F92
            14519612559A1156A0105AA70F56A90E52A90C4FA90D4CA50F46A31146A21643
            A11E37972432942E288D361C883F158652118869108E860E93A01EA6C823ACE2
            28AEF822A3FC158DF40878E90064DA0051D4003CD20332D3042CD00727D00A23
            CF0E1ECC0F1AC71015BF1518BD1617B71916B61B17B41E17B51F15B62015B722
            16BD1E12BF1B14BF1C19BE1E1DC01E20BF1C20BF1D23C31E23C71F25CC1F25D0
            2128D6212CDA1F2EDE2030E1202FE2202FE2242EE12931E12B36E32C37E42B36
            E02836DE2936DF2F3CDF2E3ADB333FDB3A43D63942CB3A41C13D45B94A54C258
            66C96E85DC819DEF91ACEE8FADE685A3E27596DD6A8ED96387D55D80D15476CC
            4E6CC84A63C6435CC03956BC324EBC334ABC3449BE3047BB2F44BD3448BC3448
            BC3447BD3447BD2E42BD2F43BE2E40C02E40C02D40BE2D40BE2D40BE2D40BE2D
            40BE2D40BE2D40BE2D40BE2C3EBE2C3EBE2C3EBE2C3EBE2C3EBE2C3EBE2C3EBE
            2B3DBD283ABE2739BD2638BC2739BD2739BD2739BD2638BC2638BC2335BE2335
            BE000D21C3040CBB0B18BF0413BD0B1FC2061AC50516C20412BE1B2AB65370BC
            80A5B983ABB885ADBB86ADBB83AAB781A4B581A5B37CA3B0779DAD6E91AC6F92
            AF6D8FAE6B8FAE688BAD698CAF6789AE6587AC678DAE678DAE668CAD668CAD66
            8CAD668CAE678AAE6889AF6482B06786B06A8EB06C93B06F98B5729EBC77A5C1
            7EABC386B4C493BDBD99C9B191D19181C26D7CBA6177B25373AB4876AD4477B1
            4179B44279B54374B34271B04170AF456BAC4765A9475EA74857A4474EA2474B
            A047499C494798474699494396493D90473A8C463989453786423884413B8340
            3A813C3B7E3B3B7D393B7D39387B36367B32397E2C3880233E85214088184990
            154D9614539D1258A51159A81057AB0F54AC0E52AC0C4EA80B4AA50B45A20B40
            9B113E97213B912E37883D2F7C4B286F5E1F6271195582154C94093C9C0B3BAE
            0C38BD0930C40528C70725CD0A25D10F23D61925E01821DE1821DC191FDB191D
            D91C1BD61C1CD21D19CD1A14C21B14BB1D15B71B14B21A15AE1712AA1511A713
            11A81212A91012A81218A70E19A30F1FA60A1FA40C22A80B24AC0C29B00D2EB1
            1036B60F39B70E38BA0F3BBF103CC6113DCA123ECB1340CC1644D0143FCD163E
            CF183FD3183CD21B3AD2263EDA2638D62D39D7343BD83D3EDD433FDD423CDB44
            3FD84544D34346CB4649C7535ACF6871DE7D88E98B99EE8CA0E47A94DD698AD5
            5A7ED04C71C44266C03A5BBE2F50BD2B48BB2B40BB2A39B92737B9283AB9293B
            BB283ABA293BBB2739BA2638B92436BA2436BA2637BB2536BA2535BB2434BA24
            34BA2333B92333B92333B92030BA2131BB2131BB2030BA1F2FB91F2FB91F2FB9
            1F2FB91A2ABC1A2ABC1A2ABC1929BB1827BB1928BC1928BC1928BC1725BB1725
            BB000712BF000AB90F1DBA0819BF0517BF0218BD0012B9040FBA3A4EC99CCBE2
            BEE2E5B1D9E3B7DCE7BDE2E8B5DBE4AED4E4A7D4E1A0CEE49CCBE2A5CEDEA3CE
            E0A3CEE0A2CFE1A2CFE29ECBDE9FCCDF9FCCDF9ECDDF9ECDDF9CCBDD9CCBDD9C
            CBDE9DC8DD9DC7DC9EC9DD97C4DE9CCBDF9FCFDDA2D2D9A3D6D6A5DAD4AADED6
            B2E3D1A6E0B38BC47B6DA84F69A5466AAB4964AD4663AE4763B04663B14764B3
            495FAF495EAF505DAE545FAE5D60B06662B16E63B47661B57C5EB7815ABA8359
            B98753B18352AF8455B18A52AE884DA98748A482479F82489E81459C7D449A7A
            4299774096744195734195733D92713D926C4396664193594795534693484995
            3E4790304D952A4E9723539C25549E24549F28509A294C972E4C953648903A42
            853C3C7C4439724E3067522A595D274D6D213E7A1E2F861D27932125A32021AF
            1F1DBA1F1BC5221ACF241AD5261ADB261BDD281DE1261DDF2A23DF2A26DB2926
            D12526C62525BC2325B12525A92324A221239D1D22981A219514219212219211
            2591132C961432991A3A9D183E9E1E47A61E4BA92756B7285DBD2761BD2B6AC3
            3278CC377FD23381D53786E03B89E93C8DF14193F54396F8459BFF3E93FB3D90
            FE4194FF3B8AFE3983FA387DF73370EE3469EE2E5DE52751DE2549DA2644D929
            46DA2A44D72A42D22F46D43548D23748C93E49C24A52BE5C63C2828EE293A4F3
            90ACEB799FE46590DF5986DB4D76D7476CD3405BCE3F51CF394ACF3A4ACA3646
            CA3044C62E42C92E42C92D40C92D40C92D3FCA293CCA283BC9273AC82639C726
            39C72738C72738C72738C72032CA2032CA1F31C91E30C81E30C81F31C91F31C9
            1E30C81E2FC91D2EC81C2DC71B2CC61C2DC71B2CC61A2BC51B2CC61A28C81A28
            C800061DC40012BF0008C1020BBE0012BA0215C20015BA1420C35A80D698C7E4
            B5E0E5A2CFE2A3CEE1A7D2E5A9D1E4ACD4E2AFD6E3AFD6E3B0D4E2B8DFE5B7DE
            E4B8DEE7B6DCE5B2DAE4B2DAE4B2DAE4B1D9E3ACD3E1ACD3E1ACD3E1AAD2DDAC
            D3DCADD4DFA9D5DEA5D5DFA4D5DDA9DCE3ABDFE1B2E3E0AFE5CEA3E6A886C673
            79B3536AA03670A83A6FAC3C66AC405BAA4752A9564AA9624CB27552BE8B52C4
            9E55CAAC59CEB85ACEBD5FCFC461CFC65CCAC556C2BF53BFBD4DB8B648B4B044
            B0AC40ABA93EA4A43A9D9E399C9C36959936969932929933949B31969B2C969A
            2C9B9C2D9E9F32A5A535A7AB37A9AE3EADB14AB2B056B9B35DBCB26EC6BA7ECF
            C08BD5C09ADCC1A3E4C6A1DEBE9DD8BD8CC4AF72A29B4A717B375A77314F802D
            48852841861F35811B2F80182B821925841A2389181C8A191A8F1918951D199E
            1B17A61D18B11E18BB1D17C12018C6231CCE251DD2241ECE2522C82627BC2930
            AD2E3B9E33468E354C8140587F6580AA809FD18AACE789B0EE8BB6F57DABE76D
            A2D75A9BCB4A91B93D84AB347EA32D79A02677A02275A32178A7207AA91F7EAC
            1C81AC1E87B01F8DB82293C12695C92B9DD02EA2D630A7DD31AEE533B6EF30B8
            F431BDFC31C2FF34C6FF38C9FF3CC9FF3FC6FF41C5FF3DBBFF3DB5FF3AAFFF37
            A4FA3396EF2F87E82671DB275DD12850CD2E49CD3B47CF4448CE494BC84D50C0
            5D66C97684D78FA6F289A9E6739BDF648CD85B80D05573CD4B66C8435CC93F54
            C63C51C53B51C6394FC6394FC63A4FC63A4FC63245C63346C73346C73245C631
            44C53144C53144C53144C5293CCA283BC9273AC8273AC8273AC8273AC82639C8
            2639C82B3BC52B3BC52B3BC52A3AC42A39C52A39C52A39C52A39C52230C42230
            C4000216C10114C1000BBC0007BC000BBD020EC00011BC232EBB4C65BD6E90AF
            729CAA678AAD698CAE6E91B37297B4799CB77DA1BA7DA2B97DA2B97CA2BB799E
            B9779CB7779CB9759DB9749CB8739AB8719AB87497B97397B77197B57399B46C
            9AB06F9DB576A6BC81B0C089B9C394C4C49DCFC08BCB9879B76F5F9E4561A441
            62A53E62AA435DAB4A58B0565AB86A60C78865D4A863D7B862DDC95CDBD452D4
            D948CFDB44C7DA42C2D842BCD33FB4CD3CAEC83AAAC438A6BF34A0B6329BAF31
            97AA308DA22F8CA22E8DA12D8DA22B899F2B8AA12C8CA22D8EA42D92A6329BAC
            39A4B137A5B13CA9B841B0BF4EBBCF5DC7E06DD2EF79D7F482DAF189DAEE93D8
            EE9AD7EEA1D5EEA2D1EE98C2F088AADA6A8ABE4A62A0304190293796242D9E1E
            219C1E1E9C1C1C9B1A1C9416168C100F8213108014107D15117F161280131282
            14148717188D181C90181D911B2193202895212C952735962D3C9333488B3D57
            843E5F7040655F446F5242724754865A6A9E7D84BAA593CFC49DD5DB97D5DB96
            D5E18CD5E685D5E77ED3E26FC6D765BCD257B0CA419AB22F8AA02582971C7D90
            13788A127B8F127D921380981685A0198CA81791AC1999B41BA1BE1BA8C819AF
            D11AB5D71BBADE1DBFE41EC5E91FCAEE22CBF127CFF62CD0FA31D3FF35D6FF3A
            D5FF45D3FF4CCDFF4DC4FF4EB6FF48A0FF3E86F7346BE5335CDA3252D0324AC7
            3D53C74558BF495AAF6B7CC78EA1F0869FE56788DB5478D34867CB3F55C83146
            C0293CBF2133B92134BA2130B92332BC2231BB2536BA2435B92435B92334B823
            34B82334B82334B82233B71E2CBC1E2CBC1D2BBB1D2BBB1D2BBB1C2ABA1B29B9
            1B29B91D2EBC1D2EBC1E2FBD1D2EBC1D2EBC1C2DBB1B2CBA1B2CBA1A28BC1927
            BB000017BD0619BF050EB91324B90B19BC0715B92238B86382C89BC1C4ADCCC4
            B2CFCBADCFCCADCECEADCECEAACDCDA7CACAA2C7C79EC3C398BEC196BAC395B9
            C290B5C08FB4BF8DB1BF8EB2C08BB2C08AB1BF85ADBB84AEBC83B0BE83B1BE8E
            B8C686BFCB93C7D19DD1CAACDAC08FCF826DAF4C63A63A61A73561A73960AB4B
            5DB26A65C69862D3B958D6C954D8D352D9DE48D1E147D1E545CCE13EC5DA3EC2
            D63BBDD339B6CD3BB1C93DAAC43EA4BC3F9EB63A98AE3691A7358EA4348CA032
            889C318AA23089A02F889E2E8CA0308FA23091A33A98AA429BAD54A9B968BAC7
            7FCCD793DFE79CE7F19CE6F19EE6EFA0E6EF9EE1F09CDCF0A1D9EFA5D4EF99BE
            F17895EB5568C73D4BB0333EA72C36A028329B262E96232C9420278F1C218D1B
            1D8A1A1886171580110F7517137119146D150F64120D5F1611620D0D5E0D1260
            0F1A610D1E581328521D385129464D294B422A563C295932326432396C303C70
            2A41792748832844831D458A19488F18469017478F1943881B498D2A5E9D4A7B
            BB7D94D8AD9DDACCA2DADB9DD9E39AD9EA9AD9EE95D8EE8FD2ED8FD4ED88CEE8
            74BDD55CA4BB438BA3317C922C768E24768E197C9218869D198DA6198FA91B9A
            B61CA3C21FACCC22B2D520B5DB26BEE328C2E82AC6EC2BCBEF2BCDF12ACEF32E
            D0F933CDFE36CEFF38CEFF39CFFF3CD0FF41CFFF45CAFF4EC4FF4BB0FF4697EF
            306BCF3257C33C52C3464EC24A4BBC5B5FBF7F8DDB849EE56A8EDB5377D34665
            CF3653C7304AC62641BF263CBB2739BE2838C02839BF2738BE2637BD2637BD26
            37BD2738BE2738BE2738BE2536BE2637BF2536BE2536BE2536BE2536BE2435BD
            2435BD1F30BE1F30BE1F30BE1F30BE1E2FBD1E2FBE1E2FBE1F30BF1B29BF1A28
            BE000014BF0A1CBF0813BA1425B40C1FBC0D1BB84556C69CC7DAC6E7E2D1ECE7
            C8EDE8E2F0E6E1F2E7E3F4E9E2F5EADFF4E9DCF2E9D9F1E8D5EFE6D3EEE1D2ED
            E0D0EBDFCFEDE0CCE9DFCCE8E0C8E6DEC6E7DCC5E9DFBFE8DDBEE8E1C2EBE5BF
            EEE2BFF2E0BFF5D5B0E9B07CB76E569C404AA03749A83E4DAF4D5BBC686FD598
            73E1BF67DFD850D6E643D0EE3ACDF035C7EE34C4EE32BEE82FB6DC2FB1D332AE
            CC33A9C3339FB7339AB13593AB368EA6388BA0398B9E38899B36859735859637
            8B9D3785993F8A9E4290A14999A957AABA6CBFCD85D6E596E4F2A8F0F4AFF1F3
            B2F0F2B2EBF3B8ECF3BAEAF3BEEAF4BAE4F5B2D9F6A0C1F57E99D75767B63E48
            A6383CA83434AB2F2CAC2A27A82725A325249D1E1E8E1D1E861D1E811B1C7B19
            1A7517136F1613691513611213591514530F104A15184D1D2256303B6F4F6292
            7E98C355728C2C4E51234938183F1C1F4D161F55092560052B6805306E023A77
            063877003878003F85023E89003F90014293034796044C980750970E4F8F124E
            8D1C4B892A5D9B4E7AB87A94D1A6A7E3C7AEE2D9AFE2DFAFDFE7A6DBE5A1D9EA
            9CD6ED9AD3EE9AD2EE93CEEF83BDD86AABC14591A52B7F911F78891D7C902286
            9C1D87A11E8EAC2299B9269FC428A8CD2BB1D72FBBE030C3E82DC8E92DCCED31
            D0F431D0F930D1FC2ED2FF2BD3FF2CD6FF2DD8FF2ED6FD35D5FE45D4FF55CFFF
            5FC2FF5DAAFF467CE73B62D73D53CE4151C14959AE6B7BC189A0E781A3E56C93
            DD5E86D64B75D03D65C43B5FC03B59BE3F56C13041C73041C73041C73041C72F
            40C62F40C62F40C62F40C63042C63042C62F41C52F41C52F41C52F41C52E3FC5
            2D3EC42435C32435C32435C32435C32435C32334C32334C32334C3202FC51F2E
            C4000518BE0519BC0712BD000FB90009C4020BBD3F4ACC84B5DE92BADC8CB3DC
            86B1E1C6E5DDC7E5E0C2E3DDBFE2DDBDE1DEBADFDEB9DEDEB8DFDFBDDED9BCDF
            DAB9DCD7B8DAD7B4D7D7B6D9D9B1D7D5ACD4D3ABD7D7ABDADAAFDDDDB3E2E1B6
            E8D5AFF0B47FC2695EA13654A23445A54838A86346C5A150D7C951DED84DDBE0
            47D5E740D0E939CCED34C4EA34BEE731B6DE32B3D430ADCB30A6C62FA0BE2F98
            B43091AA3289A133879C3383993584983684983885983984963D8998438D9847
            909860A4AD7FC1CA99DBE3A5E6EFA7E6F0A9E5EEADE5EEABE3EDA9E0EEADE3EF
            AFE3EFB4E1F1B8DDF4AFCDF48EA3EE6370C74A54B83C44AC393DAA383AA93A36
            AC3631A72F289F2B26992F299526228825227F2421772521721F1A671D16631C
            175F1B195A14144E13184C1A255241527B667DA193B2D99CBFE79DC2E89FC8E7
            94BEE695C1E69DCBE799C7D88EBDBC64907C40704823531D1D4E0D1F52062256
            002D6202336B033370013377023B8203418805428C05458E074D930D51931152
            96144F95154D96174B921B4990214F923061A34F84C3879EDAB5ACDAD4A6D4DF
            A1CFE799CAE998C8EA94C6EA93C6E98FC5EA91C8EB90C9E98BC6E26DADC15195
            AB357F932D7D95277F9C2C89A92E92B52F9DC02AA1C52AACD02CB7DB2CC0E22A
            C2E533CBF032CEF52FCEF82CCFFB2DD1FD2ED3FF32D5FF36D6FF39D7FF3BD4FF
            40D1FF4BD0FF56CAFF5BC1FF4B9EEB3876CA3A58BA4452B64A53B16571C486A1
            EC7299DF5C87D65076CF4366CA3D5AC53D55BF2F40C22E3DC42D3EC62D3EC62C
            3DC52C3DC52C3DC52C3DC52C3DC32D3EC42D3EC42C3DC32C3DC32B3CC22B3CC2
            2A3BC32434C62434C62535C72434C62434C62333C52333C52232C41E2CC51E2C
            C500081CBF0418BA0614C0000BBF0510BD1F2EB04663AB6486B35F86AA5679AA
            5678AB6080AA5E81AA5D80A95C7FA85A7FAA5A7EAB5C80AD5A80AD5B7CAD5B7C
            AD597AAB5A7AAD5578A95277A75277AB537DB05B88B66495BB76A9BE8CBDBC91
            CEA065AA554EA03A48A73C3FAC504AC58B53DEC43FD5E134D4F42DD0F42BCDF4
            2ACBF32AC3EB2CBFE52CB6DC31AFD630A6CA31A1BB2F9BB22C91AB2D88A22E83
            9C2F8199307F97327E92348093337E913882934188984D8F9D65A5B17EBCCA8D
            CADE94CEE892C9E490C5E38FC0E294C1E195BEE39ABFE49DBEE6A4C5E7A4C3EB
            9FBCF18EA8EC6C7FCD4E59AF4348AB3E3FAE3836AF3834B13A35AF322DA12C27
            982E27942C278F2A2685242178211F6E2020652020601F1F581B1B4F1F1F5223
            2554313860515C838294C392ABE28EADDC7B9DD67397D2658CCA6088CA5A82C7
            6084C75C83C85C84C9638BC96D94CB779ECA84A9C887B1BA7CA59D527C5B3660
            2F275417215008275C0A2B65092C6904316F0537790641820947870B4A8B0B4F
            910C4F970B4F990C509B0D539C12549E1A549B2053952C538F386AA36281B890
            98CCB89BC8CF91BDD386B5D581AFD87FABDA80A8DC80A7DE7CA8DF7BA9E082B3
            E682B8E96EA8CF508EAA3C809B337F972F859F2D8FAD2C9BB928A0C12BACCE2F
            B8DA2FBDDC30C4E635CBEE37D0F634D2FB35D3FF35D3FE35D4FF35D7FF33D6FC
            34D8FE36D8FF3CD4FF48D3FF56D2FF60C5FF5499F13D6BD13551BB3A51B1465B
            A27992E07294DD4E71D23B5EC92E4BC2273EBC2136B5202EB61E2CB61C2BB61C
            2BB71C2BB71C2BB71C2BB71B29B91A28B81A28B81A28B81A28B81927B71826B6
            1927B71527B91527B91527B91425B91425B91425B91425B91425B91321BA1320
            BC000E21BE0719BC000BBF0010BD263BB67C9DC0B4D5D5B3D7D4B4D7D8C0E1DB
            C4DFDA90B5DE90B6DD91B8DC93B8DC91B6DA94B6DB96B9DC97B8DB89ADDA8AAE
            DB88AAD987ABD485ABD584ACD481ACD587B2DF8CB9DF96C7D8A9D6CE83C47856
            9F3C499C3A389C4B43C1944DDDCE3CDAE433D7F232D1F72DCBF725C6F324C5F0
            22C1E823B8DA24B0CC2AA7C22D9DBB2F94B02E8CA32B86992B80952C7A922D78
            912E79922F768D30798D397E8F47889764A3B28EC9DA9FD7EFA3D7F1A2D3EFA6
            D1EEA2CDEDA0CAECA2CDECA3CEEEA5CEEFA9D0F0AAC8F2ACC2F68B99F1686FCF
            4D52B84749B64648B54042B0393EAB3738A73835A2332D98302B90302E8B2F2E
            832A28792424702022681D1F622125611D24591B23502A365B5765878799BF9D
            B5E0A6C3EB98B8E990B0E586A7E282A3E07899DD7596DC7291D96C8ED86085D3
            5E82D25D7FD46384D46586D36B8AD2728FD47A95D57E9DD485A7DA8BB2DA93BB
            DB95BFD07CA59F5480632A56262555152A590C2D6208386E0940780A447E0A46
            830B4C8C10529213539813539911529912549A1655991E589B23589C27539624
            5293285E9E4183C0819BD6B59EC8D597BFDD8FB8DF8AB1E085ADE184ACE683AC
            E680AEE785B4E888BAEA8DC2EE7FB9D964A6BE3C87992C84992D8EA92D99B92A
            9FBE30ACC934B5D136BFDB37C7E237CBEB39D0F23AD2F93BD5FE33D0FC34D4FF
            35D5FF37D6FE3BD8FF41D9FF42D7FF43D0FD4CCFFF4BBBFE4899EE325EBE344E
            B3414EA66976C3879EE86485DE4F72D43E5ECE3954CA3248C83041C72B3AC229
            39C12938C32938C42938C42433C72332C62231C52130C42231C52130C42130C4
            2130C41F31C31F31C31F31C31E30C21E30C21E30C21E30C21E30C21D2EC51D2E
            C5001021BB0416BE000ABB030CB32C40BEA2C5D6DFF7EECEECE7CBEEE9DDF6EA
            E6F3E3C5E7E4C8E9E4CBEDE4CDECE4CFEEE4D2F0E3D5F0E3D7F0E3B9DBE1B9DB
            E2B7DADFB8DDDEB1DBDAB1DCE0B2DEE7AEE0EBB5EAE5BDF1CC89CA82489B3B39
            9D3C3DAE6356D6AC46DEDC2BD2ED20CDF81DC9FD26C7F827C0EF26BEE91FB6DC
            21ADCF22A8C5239EB42493A825849D278196287B8C2977872974882B75893075
            8B36788B4180925895A47EB9C7A3DFEDADE7F3ABE4F0ACE1EFAFE0EDB1DFEDB3
            DDEEB8DCEEB7DBEFBADCF0B8DAF2B4D2F5A7C0F9798BD5525DB55052BD4946BC
            4742BC433CB73D38AE3A37A63537A035349835308C332E84302B7C2B29712829
            68262A62242B5E1E28551C2852303D6656678D8CA4C7A7C6EAAACEEBA6CBE89C
            C3E195C0DB92BCD98DB6DA84ABDA81A4D87FA0D77998D37897D37898D37597D3
            7095D26E90D17293D27292D07493CC7496CD7497CE759BD1789ED57FA6DA80AA
            DD83ADDA92BBE197C4D99FCCD184AE9E6188633C662E2C57132D5C0C34680C38
            6F0D3F750F457E114C87114F8F11559514569A175A9E195AA0185AA1155BA316
            5DA51B5A9F1F5698275190346FAA6996CCA4A5D6C4A8CDD69DC5D996BDDB90B9
            DE8EB6E18EB4E18EB5E38FB8E58DBBE790C4E988C2ED76B9D94E97AF38899F37
            90A7379BB037A5BA38B0C638BAD139C0DB3AC7E63ACBEE3ACFF63CD4FC39D4FF
            37D5FF38D8FF39D8FD38D8FC36D6FC37D8FE34D6FC3BD1FF4FC7FF50ABFE346E
            D22F52B74051A96878C689A9EC6F9AE35986DA4771D54261D13D57CC354EC630
            47C52A43C22B42C42C40C72233C82334C92233C82132C72132C72131C92131C9
            2030C82434C62434C62434C62332C62332C62332C62332C62332C61C2CC51C2C
            C5000516BC0819BF0412C00E1DB23547CB5776D16687CE779BD37699D46988CE
            6886D0A0C3C88EB0C47391C35C77C54F66C94E66C74F69C8536BC6586FBD637C
            C4728EC68AA9CB9BC0D0A4CCD8A6DADCA6E6DFABEAD176B9624D9F3A2B974937
            BC8C45DDD231D7E32BD5EB25D0F121C8F522C2F226BDE927B6DD25AECE20A4C0
            1F9AB62191A8228599237C8F24788B25748426768128778229768732788A4181
            9272ABBC9CD3E2AAE0ECA7DAE6A4D3E1A1D0E1A0D0E39ECFE29FCEE3A5D4E5A6
            D1E7ACD3EAB1D2EE9BB0F67987E1565DC54A50C2484EC34449BE4345B94240B2
            3F3BA73F39A13C359639338D363088322F7E363076352D6F2C28652F2D65282B
            5A272E563C4C6C7890AE90AFCDA0C4E89BC4E494BBDF8DB4DA89AED584A6D07F
            A2CB789EC7749AC67196C56B8CC76787C56582C3627FC1607EC1607DC0617EC0
            607CC15975C15674C05574BF5373C05373C05777C4587AC55A7BC66182C76389
            C8678EC86A95CD6E9ACF78A4D584AED592B8D59BC4D48EB7B678A18C42734626
            581C315C183C6917417614467F124883134F8C14569514599B155B9D1665A71E
            60A11D61A4215FA4215CA2235B9F2858972D5F963C76A86190C295A0CBC795BF
            D38AB6D587AEE082A9E07FA4DE7FA3DE82A9E083ABE185B3E38DBDE78CC1E37E
            BACF4E95A23D919E399CAE34A4BC32B0CB34B9D73AC5E33CCCEB3AD1F13AD4F9
            38D6FC38D5FD37D7FF36D8FE35D6FD37D8FF33D3FD32D1FD3AD0FF45CCFF4CC1
            FF398EE42D53BC384BB3516FC388B0F36EA5E45F93DD5A79D4526ACD3F5BC432
            50BC2A46BB2940BD293ABF2334BF2332BE2332BE2332BE2332BE2231BD2231BD
            2231BD1B2ABF1C2BC01B2ABF1B29C11826C31725C21424C21424C11A29BF1A29
            BF000414BC0413BF000EB81928AA3B4EBE5069C15675B15C7FB06081B25B7BB3
            5C7AB85672B65E7CBA607FBB6484BC637FBD6480BE5D7CC16281BF7491C47295
            C3749CC475A2CA72A8CF7ABCD88AD1DC98E2CA65B679419A382E983D3EC7993F
            DDD728D4EF1BD0F91CCCF41FC8F120C1EC21B7E322B0D623A5C6229CB62192A9
            1F869C1F7A8F217589227385236C7D26717F25717B3079804F939F76B4C591CB
            E09DD3E29ACBDE98C5D899C1D699BFD498C1D699BFDA9DC3DC9FC4E0A4C6E5A0
            BEF08DA5E76D7DCF535ABF4C4EC54D4BCD4846CA3E3FBC4041B73D3DA83D3C9E
            403C973F398D3A358337327A32317332326E33326530315D32335D4B50796870
            9492A3C9A2BAE298BADC86ACD57DA7D175A0CD6E97C76C91C4678BC06483BC63
            80B95E7CB85877B55673B6526DB4516BB4516AB4506AB34F69B34F69B34D67B2
            4C66B1485FB3455DB1445CB1445BB0425BB14159B13F58B1455CB14963B14865
            B0496AB24C6EB94F73C05277C2577CC56287C76D91CD789CD387ACD886B2C483
            B0A6698E714D7345335F1C37671740751C467D194B8516538E17599518599719
            609D1F61A12160A61F61A91E5DA71E64AD2662A4285F9E2E5B963668A05585BB
            8896C9B095BEC98BB2CF87A9D482A1D87799D17194CF7499D3789FD580A7DA85
            B2E087BEE576B8D358A4B94199AD3DA2B838AAC33BB6CE3ABED93AC7E439CDED
            38D1F337D5FB37D7FE35D5FC38D8FF34D2FD35D5FF34D6FF33D6FE32D1FC36D0
            FF49C6FF4C99FB2A58C6294AB2476CBF76AAE678B2E971A6E25A8BD94875C93E
            62C43352BD2845BA233CB81B33BC1B30BD1A2BBB1B2BBD1B2BBD1B2BBD1B2BBD
            1C2DBC1A27BA1926B91926B91827BC1725BD1423BD1524BE1325BD1827BD1827
            BD000312BE010DC1000BBD88B0BAB1D7DACDEEE9D2EBE4D5EBE2DAF0E7D4EBE4
            D0E8E49FCCDFB0DAE2C8EBE6DBF2E8E1F1E8D8F1E4D3F2EACCF1E6C6F0E7BDEC
            E9ADE9EA9AEAED8BEBF26ADFF066D7CB5AB46D3C96392A9D5343CEA136D9DA24
            D2EF1FCDF41CCAF61BC3F21BBBE91BB2DA1BA8CC199ABD1A8FAF1C829F1C768F
            1E74891F71841F6E83216E8329748631768453919B8ECAD6A9E3F3A5DBEFA7D7
            ECA7D3EBA1CEEBA2CFE9A1CFE3A9D4E9ADD7EEB5DAF0B4D0F39BADF5737BD753
            58BF5155C54F4FC55651CB5049C34941B94841B24843A942409942418F3F3D86
            3C3B7E37337535336F32346B2C346229335B374468697A9CA0B5DABAD3EEADCA
            EBA4C1E79CBAE490B1E18EB0E083ABDD7AA1D77CA3D57B9FD3789BD27997D377
            95D07594D17492D17491D3708BD36C89D26C89D16C89D26B87D46885D26885D1
            6684D1627CD1617BD16079D25F79D25D77D15C76D15C76D05D77D05F79CD5E77
            CD5A78CB5B7ACE5C7ED16083D36184D56586D66B8AD5708FD97A9CDD82A5DE88
            AFD990B9D6A3C6DD9BC4C06C957A3E6B383463203C701A4278184C8419558F1A
            54911B58981C5EA2215BA11E5FA8215EA62061AA2163AB2462A7295FA22B5F9F
            305C98336EA65393C692A4CDCA99BED690B5DD89ABE681A6E379A2E07BA3E478
            A2E27EABE67FB2E78BBFEC8BC5EB68ADC14998A940A0B53CADC639B8D439C3E2
            3DCCED3ACEF237CEF23BD5FD36D2FE39D6FF39D7FF36D5FF31D2FE30D5FF2CD2
            FD35D1FF44C9FF47A7FB2B57C82949BB3770CB59A4E454A9D161B8E464A7E658
            8DD84F77D54562D13353CA2444C3273BC52A37C82633C62535C72333C52232C4
            2232C42130C42130C42231C52031C52031C61D30C52033C71D33C62030C31F2E
            C4000513C1010EC0010CC3A9CCCCC5E6E1D3F1E9D7F1E1DBF0E5DFF3EBDCF0E8
            DAF1E5BCE3E9C5E8E8CDEBE5D9EBE8E0F1EAE2F6EDD2F2E5CFF4EBB1EBE9A3EB
            EE96F2F378E6FA54D2DF48D8D63FC8A431994130993D36C1953BDBD924D1EF18
            CCF919C7F11AC0EC19B5E617A9D8169FC51795B41888A5197C981A718D1C6F87
            1C677D226E802670842D73845093A182C0CFA1DDEDAAE2F0A4D9ECA6D6EAA5D1
            EAA4CFEAAAD1EBAAD1EEB0D9EFB3D7F1ABC8F792A7E46873C35559BD4F4FC34D
            49C94F48C94C44C44940B84D43B24F45AB483F9B433D8E413E833B3B78393B72
            38386D3637693238643B456C596D8B839AB8ACC8EEB0D0EEA4C8EB9DBFE597B9
            E18FB3DB8AAEDB8BACE082A4DB7DA1D97C9FD8779DD7789BD57598D37795D577
            96D77595D67393D47293D36E8DD56F8ED56C8ED56A8CD3688AD2688AD36887D3
            6685D1647ED3647ED3637DD3627CD2617CD1607BD15F7AD0607AD05D78D15E7B
            D15E79D15B77CD5A75D05A73CF5A78D05E7BCF607AD0637FD56582D66B89D86F
            90D7799CDD7EA5DC88B0DE94BADD95C0C77EA9915B87593F6F2C3D6F1D40761B
            4B861F4D8A1D51911F599A225EA02560A42464AB2365AC2465AF2466AF2567AF
            2864AA285EA02C619A37699B5290BE92A0CBBA9DC3D192B6D884AEDC7DA6DF7D
            A3E27AA2E37DA5E284ABE58DB4E990C0ED89C2E66AAEC64DA3B83EA6BE40B5D2
            38B8D73EC7E841D0F33ACFF735D0FC32D0FC32D1FC32D4FF2FD5FD2CD4FD2BD6
            FE29D1FA2FCFFF4DCDFF5199FF2651CA244FC44893F349B3EC3CACC956B0C971
            BBE6629FE55787DE426FD63B5DD1304BC92F41C72B39C62836C52535C52536C5
            2536C52B39C82B39C82839C82536C52536C52134C32336C52336C52030C32030
            C300000EBA0414BA0F1EBE495FC6536AC95169C5536BC15873C15974C25A76C1
            5871C47292BC6785B95D76B95670BB5573BC5F7FBF6893C66BA8CE6BC0DA5FD1
            EC43C8F531CCF836D2E74BD9B81F9E5E22924137B4773DD9D920CDEE1CCBF215
            C2ED17BFE418B4DB16A3D01495C2148AAE157F9C17768D186F82196C811A697F
            1B6F852773873F7E8F84BDCD9AD3E59BCDE097C5DA92BFD893BED591BAD496BD
            D9A0C4DCA4C4E1A8C3E69CACF36C75D95155C74D4FC94749C44A4AC54A4AC34B
            47BD4B44B34C44AA4B41A14C449B48408C464085423F7E3C3C76373B72363C6D
            313B654A587D778CABA4C1E2A7CAE397BEDE92B7D98BADD483A4CE80A1CA7C9A
            C67695C27290C06B8ABC6582BA6582BE6680C1637BC1637BC0627AC06178C160
            78C16078BF5E76BE5C75BC5A70BF566DBD566CBC556BBC546BBD5369BB5168BB
            5067BB4F69B74D67B74E68B84F69B84D67B64C67B74D67B64C66B64B63B84A62
            BA4A60BC4A60BB4B61BC4B61BC4A5FBB495EB94B5FB94D62BC4F65BF546CC157
            70C35773C25D7DC76686CB6F92CF779FCD85ACD193B9D596C3C578A48A4B7847
            396D24477D264A8421518A21568D22619A29619F2662A52466AB2563AE2664AF
            2866B02C69AF3367A93367A434669F3664993B7AA96099C6A3A0C0D08EB2DB80
            A7DC7D9DDA7C9ADB7A98DB7A97DA809EDE8AACE38AB7E789C3EA67AEC548A1B7
            47B1CB3BB6D439C0E235C7EC35D0F731D3FB2ED3FB2CD5FE2ED7FF2BD4FA2DD6
            FE30D7FF32D3FF38CBFF4CC4FF2F84EA2344C9295AD840AAFA32B7E930B1D534
            A6BF58B0CD5EA8E5528CDB456ED43E5ACC3448C62632BF202CBE1D29BD1927BB
            1625B92031B72031B91F2FB91B2CBA1B2CBB1929BB1728BC1627BB1726BC1726
            BC000513B71B2DB8405AC6607BC85E79C75E7BC36380C86484C25E7DBF5C7EB7
            5A7DB3789AB17495B26E8EB86F96BB709EC476AEC878BFD272D0E15DD2EF38CC
            F91DC9FF12CBFE2DD7E53CC2861B903B1E9E6140D2BA28D1EC16C7F913C0EC13
            B9E017B2D313A3C51193B81283A814789714708A156B7E176A7B1C6F81257587
            317D9163AABE8ECCE68FC3DE86B3D87AA6D080A8D37BA2D283A8D48AAED595B5
            DD9AB4E695A5F37178D84E52C74746CC4442D34644D54241C93F3EBD3E3DB142
            3FA9433F9E423B92423C8D44408843407F46467B3E427039426C3A466E5B6B94
            7C90B99DB8E798B8E087AAD97A9DD07597CC6C8EC66585C1637EC25B76C05972
            BD596FBB576BBA5569BB586BBF546ABD5166BA5166B95165B95065B94F65B74D
            62B64C62B54C62B54B60B5495EB5495EB6475DB54559B44459B44459B44358B4
            4055B13B4DB53B4CB53A4BB43B4CB43B4DB5394AB3394AB3394BB33345B33446
            B23547B33546B33646B23546B33748B4384AB33C4CB93C4DB93C4DB93D4EBB3D
            4FBA4357BC465EBE4963C04462C74B6CC65579CB6485D27092D580A5D790BACE
            76A38B598B5849783549792A4F80285286255B92295C98265E9F2763A82866AD
            2D66AD2B68AF2E6AB02E70B42F6FB02E6EAA3068A13464984278A86C8FBDA098
            C2C399B6D290ABD383A0D1819BD87F99D77A97D583A1DC86ADE185B9E67BBBDB
            56A6BE43A6BD3EB4D13CC0E134C8EB31CFF430D4FC2DD4FC2FD5FC2ED6FD2CD3
            FC2BD1FB2ED5FF31D2FF39D1FF4ABEFF3164E72042CB2687EB3DC0FF29BCF023
            B2D833AAC445A4BD64B2DA5F9DDE4D7CD33F60C73C52C3293EBA2434BA1E2EB6
            1B2CB31A2ABC1828BA1827BB1828BA1729BB172AB9172AB91528B71725BE1725
            BE000E1CBA344DB983ABD7E3F7EFDBF3EAD8F3E7D0EEE6CEECE8CEEDE3CCE6E0
            CDE4DAB5D9DBABDADCA2D5E0A1D6E695D5E98AE1EE73E0F845D0EF29CCF411C8
            F909C9FB0DCCF82ED3D134A4532A973B2ABEA12ED7E41CCAF014C1F113B9E113
            AED1129DBE118FAF0F809F117692127187146E80146F811E75862C7B8E5196A9
            95D7EC99D7F192CDEA8BC3E296CCE49AC8E797C4EA9BC5EBA4C8EEA5C3F3879D
            FA515ACA4548C94443CF4342D04241CC4041C63A3DBA3B3DB43E3FAD3D3CA13D
            3D963F409140418D3C3D893D3F833D427A39426F465676788DABA7C5EBA7CAEF
            9DC2EC95BDE88DB4E38BAEDF89A8E086A4DF7D9DDA7897D97593D97C9ADA7E9A
            DA839EDD7A93D7728AD47289D5738CD37A95D87087D67087D76E85D66D84D56C
            83D56B82D46B81D36C82D4687ED2677DD2667DD1657BD1657BD16379D06178CF
            6075CF5C72CF5C73CF5C73CE5C72CE5B70CE5A71CF596FCE5A70CD566ACE556A
            CF566AD1576BD1576BD1596DD1586BD1576AD05263CD5363CD5465CE5364CD54
            64CD5465CA5567CB546ACC5974D15B79D05E7FD46486D76B8FDD7696DF7CA1DD
            89AEDA99BADC9DC5C5769F7E487437487A2C4E822B568E2D5E98325F9B31629F
            2F67A72F6BAE306CB02D6DB02E71B42F71B4316FAF346DA93A6CA54069A1456A
            9E528CB789A4CBC5A1BCDC8CACD983A2DF7F9DE27B9AE2799BDF80A5E388B2E9
            8DC2EE77BCD84AA2B740B1C935BCDB30C6E92FC8F231CFFA30D0FA31D4FC30D6
            FF2AD5FE28D6FA25D1F929D2FF40C9FF4D9FFF204CC91F64D34BB6FF30BEFF26
            C1F024B5DA28ABC732A0B947A2C167ACEB6292E04D73D7415FD1314CC8263FC2
            2138BF1D32BF1F2EC21D2CC01D2CC01E2DC11E2DC11D2CC01A2BBF1C2CC51C2C
            C500111EB84862BDA9D8DFDBEFE7DAEDE7D7EBE7D1E9E5D5EDEAD7F0EDD8EFEE
            DBEFEBC5ECE7BBEDE7B1F0ECA6EFF18FEBF469DFF73DCEED1DCCF60ACBFB04CD
            FD08CFF718D5ED27C3AF2592372B9A412ECFCA14CCF110C0EC0DB4E20FACD20B
            9BBD0D8DAB0E80990F768F0F70851170811272831D788831849377BCCDA6E6F5
            B0E8EEADE4EDA7E2E9A2D6E9AEE3EFABD6EAB4DAF0ACC8F78EA4F15360C4454B
            CB4042D33D3CD63D3AD43D3ACA3939BD393AB13739A6383A9F3837983B39933B
            3C8E383D853941813B438239447B52618D859ABBB5D3EEBADEEFB3DCECADD8E9
            A8D4E69CC8E19DC3DD9BC0DB9EBDDD98B7D799B8D899B6D898B5D88EAAD98CA9
            D692AEDB91ACD994AFDD94AFDD8CA8D78AA5D789A9D989A9D987A7D786A6D785
            A6D785A5D682A3D581A2D3819DCF809ECD7B9DCE7A9CCF799BCE7A9CCC799ACC
            7A98CD7793CE7792D07792D07692CF7591CF7691CF7692CF7591CE7189D0728B
            D2708BD2708BCF728CCF728CCF738CD0738CCF738BD0728AD0728AD0738BD074
            8BD0748BD0758BD1748ACF6D85CA718CCD6C85CD6E87D0768FD77794D77C9ED5
            84A8DB84ABDF92B7E19FC3DB9ECABF81AD855A894F4A79344D7E32578A345E95
            31649E3068A62D6CAD2E6DB02F6FB23071B43171B43272B33571B1366EAC356E
            A93E6A9D48729F5D90BD92A2CCC0A0C1DA93B5DD86AADB80A3DB81A3DB84A5DF
            8CB1E68CBEEA7EC0E359B0C943B0CA39BAD938C5ED32C9F336D0FA2FD1FA2AD1
            FB26D4FB25D4F927D7FC25D4FF32CDFF4BBDFF1E68D41D4AC5459BFF3CC5FF22
            C8F921C4EE23BDE120ADCD29A1BC3D99B35EA9D6609CE44F7FD73D65CB334FC6
            2B43C32136C51E33C51C2DC71C2EC62030C82030C81E2EC61C2DC72132C81F30
            C6000512B9344AB75570AA465EB4495FB5465DB6475FB5536ABF5A72C0617AC7
            6684C58AB7CC8DC4D586D4E073E1EC4DD2F229CAF317CCFA0ACFFA05D0FA03D0
            FA10D2EB2DDBD811A67C1A90383BB76E27D0D707C2EE09B8E108A9D2099AC10A
            8BAA0B7F960C778A0E72860F75890F758A1D7F8F449DA78DD9E3A5E0E8A4D5E2
            A8D6E1A5D2DDA3D4DFA2D4E2A2D1E69EC2EF7F92F4464DC34345CA4342CF3F3C
            CF3E3CCE3837C53839BE3737B33636A537359B34339038348A3A388C38358A39
            3B8A3841853A498056679393ACCEB9D8EDB5D8E7AED5E2A7CEDEA1CAD99CC6D6
            97C3D290B9CE92B6CE90B4CB92B1CA93B2CC8EB0CA8DB0CB8BAFC983A4CC82A4
            CB83A2CB829ECA809CCB7E9AC87D99C87B97C77D98C77D98C87C97C87B95C677
            93C6738FC37190C27090C06F91BF7093C37093C57193C96F91CA6E90CA6B8DC7
            6B8EC36C8BC16B89C06987C06B86C26884C16A84C26A84C26781C35E7AC45E7D
            C65F7CC05C77BF5B76BE6076C26077C35D75C0617CC26079C0657DC4657DC165
            7EC1667EC6647CC5627BC25D72C65E73C95A6EC55D71C96073CB607BCD6382CF
            698AD26D92D57499D97DA5DC8BB0DC99BDDBA8CBD98FB5A55C85574D79365786
            325D922E60992E65A22F6BAB306CAC3173B33772B33573B53573B53573B33671
            AF3872AC4271A9466A9E41679A4783B5779ACBB295BCD185ADD57CA3D97D9DDF
            7F9CDE81A3E187B2E686C0EC72BCDB4AABC43DB9D933C4E92EC8EF2FD0FA27CF
            F927D2FC2AD4FF27D3FF27D2FF2DCFFF3CCFFF2493EA1C41C62E6FED3FC8FF22
            CFFC21CCF91CC3ED1ABCE41BB0D41FA1BD2490A356A9C565A5E25985D7456AC8
            3553C02E42BF273ABA2436BC2031BF2031BF2031C01B2DBF1B2DBF1625C21625
            C2002D3EC27D9ED4A0C5D984A9D486A7D684A8D581A7D27696C47A9AC8759EC7
            77A2CC71AAD270BDDC6AD0EE42C9E829CEF611CBFC06CCFE03CEF804D0F703D0
            FA17D5E936D8BE0B985E14914241C99322CADB05B7E705AED6079DC0088EB109
            809E0A7F940B7A8D0E7C8D177E90298B9E53AEC07DCDE77BBDDD7EAFD783ACD3
            81A5D488AAD890B2DE88A9ED6985E44457CA363FC73C3CD13E39D23F37CE4037
            C93C35BC3B37B33433A42C2D9332328F32328533317D32317834357A393B813B
            42825B6AA4899FD3A4C2EA9DC0E593B6E089AED983A4D57FA1D3799BCF7797CE
            7595CF718FCF6F8DCD718CCD738ACD6C86C86C86CA6783C86480C56785C4627F
            C15E7ABF5A73BF586FBF5569BA5469BB5265BA5568BA5566BB5264BA5064B84D
            61B54D64BA4E67BA4F6AB85E75C05E7AC2607CC7617AC95D77C95D75C85F76C7
            5A70C64E66BA4A62B8485DBB4055B53F53B44256B74057B7435ABA4460BD4865
            BD4964BE4C65B74D64BB4B61BD495FBC4F61C0465CC2475CBF475DBC4B60BC4D
            62C04B5EC24A5CC44C5FC4495AC04858C14B5AC24D5BC24A5BC34C63C5546EC9
            5775CC5E80D06587D36C8CD67393D87899D882A1DB8FB0D7A1C0D28FB49E6D98
            64527E345B8B36619635669E3369A5346BA83372B13772B13778B73B79BA397B
            BB3D74B43A71B03971B0386CA93669A33B679F4978AF798FC2B88BB0D67BA1D6
            7A96DA7691DB7393DC779FE17CAFE779BFE54BB0C93CBBD734C6EB2ACBF32DD8
            FF23D2FC24CFFB27D0FF26D3FF23D0FC2BD4FF2FB2FA1A48D02154DE3DBFFF22
            CEFF1CCAFC1CCCFB1CC6F515BBE31AB5D618A1BA2894A53B8EA360A1DB5484D4
            4366CA2F4DBE263BB82234B81C2CB91828BA1627BB1526BA1627BB1723BF1723
            BF004D68C7AED7E1CCEDE7D0F1EBD2F0EBCEEFE5CEEDE7CEECE1CDEFE9CBF4EC
            C2F1F286D6EE63DCF83BD1EB24CFF413CCF60DCBFD09CCFD0CCCF80BCDF904CD
            FE1BD5EB3AD0A9088C4710945445D4B41EC0D806ABDA08A1C30593AD0784A008
            7E99097A930A7B931283972B8D9C69BBCD93DCF28FCFEE8FC7EB8EC5E596C6EC
            A0C7EE9FC0F37283F1414ACD373DD13437D23A3BD4393ACE3B37C23A34B73A31
            AC372E9E392F952F29853431812E30782A2E702C326E30386E313A6C4E5D8990
            A5D4B1CFF2A6C9F0A0C9EE9BC3ED95C0E797BFE799BBE997B9E79BB7E995B5E8
            93B4E790B5E58FB4E58CB0E58BB0E58CB0E68CB0E48AAEE287ABE085A9DF85A5
            E0819FDF7B99DD768EDB758BDA6F85D66D80D76980D2687CD36579D26279D362
            7DD35F7DD16B88D8758FDB7390D97E9AE186A3E38AA4E589A2E588A0E6819BE3
            7B96E0718FDC6C88D86480D55C78D35B74D25473CD5977D15B7ED6688AD76B8B
            DA6D8DD96F8FD56E8CD3708BD66F89D86E8ADA6080D66985D96988D66B87D470
            8BDC6D89DE6D88DD6883DC6D86D9657ED6647DD6617BD46A85D96E8DDC7393DE
            789AE17A9EE27E9FE282A2E281A2E084A4E281A0E086A5E28CABDF94B4DDA5C1
            DE93B4AD678B64537D3E5B8C38649A3768A0366DA63875AF4072AF3A76B63974
            B73875B93673B83575B83470B2336DAC326AA631669F3B5C92437EAF859CCCCB
            91B5DB7FA4DC799CDF7C9EE380A5E585B6E983C8ED56B8CF36BBDE25C5EC21C9
            F220D2FC26D2FF25D2FF1ED2FD1DD5FB1DD5FA3AC5FF2459E01840CF30ABFF29
            CDFF1ECBFF1CCCFE1CCCFC1BC7F11ABEE519B2D3129BB81D8FA7378EA666A7E5
            5B8ADC496CD23954CB2B42C22739C52332C22031C51F30C51E2EC61D2BC41C2A
            C300637CC9A1C1DBB0D4D1BCDAD5BBDAD0BADAD4B7D9D1C3E8DDC3ECE4B5EFEC
            A5F5F075E2F931C9E917CDF20FCEF707CCF807CBFD0ACDFF0ECDFD0DCBFD05C9
            FF1ED4E93CCB9B0C8C42119B6339CEB817B6CF05A5D00497B7058FA805849E07
            86A10883A2188EAA329AAF76D0DEA1EBF3A3E0EEA7DDEEA9D8EDABDAEFA7CEF3
            7D96DF4F5EC73E41D33835DC352EDA3732DA322FC93432BE3532B1332F9F362F
            95342C87342A7C352F772B2968292C63252B5D27345D4F61868CA2C6AFCEF1B0
            D5EDAFD5EBABD4EAA8D2EBA7D1EDADD6EEAFD4EFB6D5EFBAD4F0B3CCF1B6CFF1
            B5D1F1B0CEF1ADCDF0AACBEFAAC9EFABCAEFA9C8EFAFCEEDA9CBECA7C8EDA5C6
            EB9EC1E99CBBE795B3E492B0E288A6DD85A3D9819FD67C9DD57B9CD5789DCF7B
            A1D683A7DC8DAEE092AFE4A3BEE89BB3EA91A6DD7486BB7184B9778ABE869DD6
            96AFEA99B4E68BA8E482A2E07A9CDB7195D47196D77199D9759CDD82A5DE87A8
            E28FAEE395B5E595B4E690ACE487A6E384A5E282A4E27E9FE287A6E48EACE58B
            A8E68CAAE689A8E584A2E37C99E0829EDD7A99DD82A0DD85A3E08BA9E392AEE7
            8CA4E6899FE48BA0E48EA6E498B3EB97B5E792B2E48BABE288A9E186A4DF8FAD
            E49BB8E2A5C4D999BAA7739D6A58853C63943F679A3E6A9F3C73AC3E75B33773
            B53671B6356DB43471B73371B63172B43072B03070AB3369A137639A43619351
            7EAE889BC8C894B7DA89ADDA87A9DD89AFE487BCEA7DC8EE4CB9DA36C2E427CB
            EE1FCDF422D1FD1DCFFA1CD3F91DD6F919D3F936C6FF2E62EC173CD0249AFD2B
            CDFF1ECCFF16CAFD1ACBFB1ECCFA18C2EE18BCE616B1D9119BBE1785A0288098
            67A6E15C8BDE456AD13952CC2A3FC72231C51E2EC41E2EC61E2EC61F2CC41F2C
            C4004B66B4688BAE6F96A65670AD5872AE5478AE587EB36792C06FA3CD69BADC
            54D4F22DCCEF19CCFA05C9F809CFFA05D0FB00CBFF03CCFF07CAFF08CAFF0ACC
            FF24D3E439C5930D8D43109C6931C7B112B0C501A0C70295B40490AC058CA90C
            90AE1594B6319EBE77CEE19EE7EEA2E0E6AADEE6A8D7E7A8CFEA8BA4F54E5BD0
            3A3ECA3A38D4352DD5382ED73930D0332AC1342EB82E2BA82B2A9A2E2E8F2D2B
            7D2A286F2E29692D28622A2C5C232B542E3C5B7893A8B5D7E9ADD3E2A6CCDC9E
            C6DA99C7D79DC9DB94B4E67085CA6374C66470C46B74C2666EB3575B9B535690
            50578E545B90535B92555D95565C9B53599C555DA9616BBC6571C07786D48797
            E094AAEDA5BEE8A7C4E299B8DC90AFD687A6D183A2C97C9CC77898C77A9AC982
            A3D18CACD697B4DE99AFE56A76AD3C45822D347A2F37802E367F2D357C2D3678
            36417D6473AD8CA1DE90ACDD82A3D77B9FD2729AD07398D4758DE26271CD6675
            CE7A88DB7483CC7483C96C7BC45A66AD6375C1889FE47180E24F5AAF6978C779
            8AD0768ECB748BCA6C7FC5697AC2768BCD88A2DF8EA9E092AAE57A84CD5559A8
            4B4AA94847AC4645A745479C4B54957082B790ABE18EAEE280A1DC7F9AD97A94
            D6819ADA8BA7DB9AB3DBA7C5D68FB49B5D86515D8A46669843699F3A6DA43672
            AD3573B3376CB1336CB23371B63675B73874B33570AD316FA9316DA635629B32
            5D96365E94468EC29A98C2CC8BB5D77EAFDB83B2E187BDE986D5F158C1DC34C5
            E027CFF01DCBF51DD4FF1DD6F91BD3F61CD0FB3DC6FF2D63F51538D31E91F72B
            CBFF1CCBFF1ACFFF1ACCFC1BCCFB1BCAF817C2F115BAE80FA8D30B94B90D829C
            277C955F9FDD5581DA3F5DCD2C48C71E36C11627BD1220BC1321BF1826BC1826
            BC0090BCE29AC4DEABD5E28EC2E291C1E18FC5E28FCBE27AB4E27BC5E76AD3F5
            2DC8EC0DC8F606C9FE06D0FF00C9F402D0FB01CCFF01CAFF01C8FF04CAFF0ACE
            FF24D5E13AC38D0C8A400B98682EC8B50EAEC3009FC60199BC0295B7069ABA14
            9CBC2DA2C365C7EA8FDDEB97D1E59DCAE49EC2E686A1F35B6BDB323BC62F32D2
            302DDA332BDB372CD6392BCD352BBC342BAE30279F2B27932926861F21731E21
            65252B61262959232750313B5D7E90B09AB4D797B8DC8DB1D57B9ECA799BC978
            9BC8789CC97BA1CE5F6FAB4852A44951B7474CB94041A6403F99403F8E3F3E86
            3F408141418142468443478642458A45489343469C484BA8494CAD4A4FB0474F
            AE4851A75B65AD6E7DBA8DA4D893B2DA82A1D17696CA7190C76C8DC47495C984
            A1D090A8DA7D8ECD4249862E357D2C31812830832732832B378427347E29367C
            222E71212C682734635465967A94D26F8FD06D8FCE6D8DD5434E8C3F4598383D
            98262C862C3283272D7C262E782A357C2D3B7F6072CA3C48A03C44A0323B922B
            368629397E2B3B7D2E397E323E793C4E6F899FE78CA1E85864A03D42924241A5
            3E3DAC4342B14443B04243A53E4093363E7B4253777F95C5839BDE6D85D4637B
            D06279D1667CD46C84D47F99DA8DABD89ABFC786AF8E5F8B4D5D8D3B689A376D
            A33668A6326CAF356CB23569AF326CAD2F6EB03174B03076B1306CA92A6BA92A
            66A72C5C9C2C569337639F5F81BA9E8FBBD286B1D87FB1DB83BAE87BCBEF51C8
            E034C7E428D2F91ACDF81AD4FB19D3FA1ACEFB3FC7FF2F64FA1434CF188DF22C
            CCFF19CAFF17CFFE19D0FF16CCFB16CCFC12C8F80FC0F10EB5E40CA6D00B91B2
            0F779327768F6DA4E55A82D8385ACF2944C81F33C1192ABC1829BD1A2ABD1B2B
            BE00BBE5EABFE3E6CAF3F1B7E0E5BFE3E6BAE4E7B5E8EDAAF4F187F2F942CDEF
            22CBFC0DC9FF09CDFF00CBFC07D4FF00CCF702CCFF01C9FF01C8FF00C9FF02CE
            FE21D7E140C88F0E893E0894662DC8BB0EB3CB00A6CF00A3CD02A1CA0BA8CF23
            ACCD6BD2ED95EAF69FE5F69FD7F6A3C5F86F7FF43639CA3331D73132DD3030DC
            2F2DD7312DD23229C52E24B22E24A22E26942C258628217824227323246B232A
            631C244F1E2C4A4F637C9BB7D4A8CAECA4C5EA9ABBE695B5E28FB1E08BADDD8D
            AFDD8CB1DD94B6E48097D1525DA4464DA94448AD4442A5403D96413D863D3B77
            3B3C6E464C79545E8C5F6B9A5C689B515E914C548E474B90474C9D484BAC474A
            B7474ABC464AB54349A84750998799DCA4BFEB94B5E68AAFE38BADE390B3E59E
            B9EB8694DA34388431328A31358C2C32882A37842A3E7D3F5A8E4C669B475F94
            2D417928377128336B2932653B48787F9DE4799EE17EA1E3677DB9455495363F
            8F2C348A272B80262B7A2A3178313D7B50689E8CABF16C84CA415299353F942D
            338E2B31832C337D2F39794C5B8E7A96BFA0C1EE7E93D5353F8734389A3A41A6
            4352A46E80D07685D5525AA644469B3A3B89393E743D486895ABE3849EE2708A
            D96480D55F7BD86683DB6D8ADE7797DE87A6DF9BB9DDA2C8C5769D715A843C5E
            8E35669C3169A6306AAB306DAF316FB33171B32E70B02A73B22C70B02C6CB02B
            64AC2761A9285AA028569A2E4E8E2E6FAC6C99D4C29AC5DE95C5EA93D1F17DD3
            F456C9E12BC7EE19CFFF18CFFF17D4FF16D1FE37C6FF2E61F41234CD1C93F429
            CFFF1ACCFF11CCFB11D0FF0CCEFD0BCCFA0BCDFB0DCAF810C0EC0DAFDA0F9EC3
            1087A90E6C893B83A4679EE55881D83E5DCE3449C72B3BC32334BF2230C42331
            C500A9CCCDB0C8C5BDD4CFA3CFC9ABD1CDA8D7D6A1DEDF91EBF246D0EE20CBF6
            11C9FD0BCBFF03C9FF01CBFF02CCFA05CFFD02CCFF01C9FF04CCFF01C9FF00CB
            FC1FD8E442CB9C128B460E936231C6B410B9D000AEDC00AAD90DB0DA20B4DA4C
            C5E792E8F7A3E2F69FD5F7749AF13D4CCB2F30CF2F28DF2F25E32B24D92C28D3
            2C26CA2822BC2A23AF2B239F2B248C25207A22206E2020651D1F5E1B22581A23
            4E42567588A5BCB4D9EFAAD3EAA7CCE7A1C3E19CBDDF98B6DB98B4DB98B4D696
            B5D59AB9DD9CBCE3A1C1E8A4BAF1A0B2F86B75CA403F9A3F38903D367C3C3B6F
            7A82ABBED0F6C3D9F3B7CFF1B6D1EFB3CDF0B0C6F19EAEE496A3E5707AC94E53
            B24A4EBD4547C24546C04347B2444BA27885CEA8C2EEA0C2EA9DC2E9A2C3EA9E
            B5EC4549973737953435942C328B303C866A7FBF9CBBF3A4CCF0A1CAEFA3CAEF
            96B6F27791CD435488273664313F677A97E082A4E183A9E28DB2E7A0BBEF7685
            D32E3686292E7D232974343D7D9FB2F2A5C4EF97BCEC9CBDEDA7C4F3636EC52E
            328D2C2F842C317B4E5C9AB1CAF3A7CAEEA4C6ED7C90D7343D91373DA34350B0
            9AB7F6ADD0F4B1D1F4A1B7F64B509E3B3B8B383977373B65707E9E96AFE47D9A
            D86A8AD26784D56783D66A89D86F8EDB7797DE82A0DC95B0D9A5C2D39BBEA675
            9C635C8B3761983364A03166A72E69AB2B6DB12D6EB12A6EB1286EB32A6AB127
            69B32763AF2461AC235DA72259A12253972A5191417CB589ACD8D3A6D4E596D3
            EE75D1F341C9EC24CCFB18CEFF16CDFF19D2FF37C2FF2154E9113BD325A5FE21
            CFFF14CCFF10D1FF0CCEFC0BD0FC0AD0FE08CDFC09CAF80CC5F111BBE60EA8D2
            0E94BC0B7C9F06607A4388AB699BE2587AD6415BCE354CC92A40C32131C31F2F
            C2007799AD799AAA749BB47098B479A4B877B4C874CADC5FD4F724CCF209CEF9
            06CCFE06CAFF06CAFF06CAFF06CCFE04CDFE01CBFF02CCFF07CBFD09CDFF05CA
            FF1DD1EC45D2B80F895211874D40C9A515C1D400B9E902BBEC1ABBE64DC5E181
            DEEF97D1ED8FB3F03F54D12531CB2A2DDD2C28E32C25DD2F26D72F25CE2E21C4
            2E20BA2B20AC221C96201D841F1E721D1F67161E5D1822591721501B294E6075
            93A8C6E59DBFDD92B5D487ABCB80A1C57A9AC1738DC3738AC17389BF738BBF74
            8DBE7693C27A99C789A8D39DBDDDAECDEA8EA1D841408F3E368B3D367A383969
            9FB2D3B4D3EBA3C1E395B6DD92B4DA93B3DA9AB6DCA2BBDEA5BEE1ABC3E6A0B4
            F2636EC04B50C14746C94543C64844C14A49B97A84DFA5C1EAA0C1E8A9C4EC5B
            67AB3E3F993C399C37389637408B859ED7B1D2EEA1C8E892BDE28FBDE08FBDE2
            93BBE299C1E299BCE4708FB77797C77EA1D5779CD07AA0D281AAD998BCE58BA3
            E32B3A7E27347726326E3D4B79B4CAEE9BB5E38AA6E08FAFE2A0BCEA7383D02D
            35842F33812A31745A6FA4AAC9EE9DC2E896B6E6626EBB3D419A3C429F6A7ACF
            A0C4EEA2CDEEABD2F1AFCDF16A79BA393F80383B743A3D6A4E577292A4E1778C
            D56378CB596DC75969C7576ACB586ECC5C72CE677FCF738CD2839BD497ADD7A9
            C3D282A98354823D5A90365C9A3060A22B64AA2969AE2A6AB1286AB2266AB225
            68B02567AE2366B12364AF205FA8205FA624589E2855962E689E519CCEAEA7D0
            DD88CFEF60CFF73BCBF523D0FE14CEFF1ED0FF31B8FF1345DE1042DA2CB7FF15
            D0FF0DCFFF0CD0FE10D0F90ECFF90AD0FD09CEFD08CCFC0CC8F90FC1F20DB2E2
            079FCB0285AD006C890A5D705D9BCD537EDA3654CE1F34C61224BE0C17BD0A17
            C100B0D8E6A8D3DFA7D6E3AADEE9A6E1E59CEAF176E5FA36C8ED0FCEF700CFFC
            01CDFD04CCFF08CAFF08CAFF08CBFF04CCFF02CDFE02CDFD06CDFC08CCFD08CA
            FF18CEF339D4CE10966A1B8B4244C28A1ECDD802C6F508C0F428BEF273D5F398
            D3EF5373D93641C8272BD22C2AE5211BE12620E22925D62722C62C22BD2A1FAF
            251AA01E158C1F1B7F1D1E71161A5D161E56141C4E141D474256799EB9DCA5C8
            E29ABFDA8DB3D184ABCA7FA5C77B9FC37B9BC27796C47894C37997C37B98C27E
            9AC27C9CC581A2C989AFD097BCDBA9CFE78BA2CA40418B3C3589393377343864
            9FB9D3A7CDE694B9DA8AADD685A6CF88A6CF8BA9D08CABD095B3D897B6DEA0BE
            E5ADC6EF808DEA4A4EC14E4AD44A42D24940C94D4FBB90A5EDB3CDF0899AE83E
            45993F3EA13D3C9E3D45947E93D4B5D4F0ACD1EBA0C7E796C0E38EB9E191BBE2
            96BFE496BEE596BBE497BBE48CB0E185A7DC7F9FD77A9DD87FA6DA94BFE28AA6
            DD2E417F26337727336F41517CADC5E995B2DE86A5DB86A7DA99B9E57789C929
            337C2A30792B357159729DA4C8EA97BFE494B6E16A78BD43499348549C90A7EF
            A0C8E9A1CDECAAD2F0B6D5F16070A5394178363A703539644A536E9EB1E28295
            D47085CC6278C46273C76173C65F74C75F75C8576ACD5E70CE687AD07488D581
            9BD398B0D399C2B5729F6B51843358943161A33262A62A65AC2667B1266AB324
            69B2236AB32364AE2061AC2064AD1E5EA81D5CA51C5DA21F5F9E285D943679AC
            6F98D7CA7DD1EF55D2EA2ACEF11ACEFF25CAFF209BFC1036CC1956E52ABEFF10
            D2FE0BCFFF0ACFFE0CD0FA0DCFF90CD0FD09CEFD06CBFE08C9FB0BC5F707B8E7
            09AAD80291BB0078990161761F6473689CDB486ED23451CB253BC11E2EC01B29
            C100B0D9E9AFD8E5B0DCE7C0EDE9BEF2EFA3F7F64DD6EF1BCEF206CEF900CEFD
            02CDFE06CCFE09CBFF09CBFF06CBFF04CDFE03CEFE02CEFC01CEFC01CCFC07CC
            FF11CEF625D5E316AF8E23903337AC5923D4D404C9F51AC7FD4AC9FE80C1FB40
            55D6232CCB2223D62621DC2822DF2B24DE2B25D6221EC32725BB1F1CA21F1C94
            211C85201D78171864101656141F561119461220467489A7BDDDF2BAE0E9B2DE
            E3ABD9D9ADDADDA8D6D4A9D3D5AED2D5B0D2D6B2D4DAB1D4D9B2D4D9B2D4D9B3
            D3DAB1D1D9B3D4DBB3DADEAFD7E5B6E2EE8BA7CB3C408A3735873233742F3860
            A8C6D7B3DFE6A9D6DBA5CED7A3CAD3A5CAD5A6CBDAA9CCDCACCFDEAACFE0AFD5
            E5B3D5ECBAD8F45E6CBA4A4AC54A44D34E49D14447B86879C5BED5F4737DD43D
            40A2413FA53C3F964F5E9AC1DFF3BFE0F3B6DBEFAFD7ECB0D8ECADD5EBAED3EC
            AFD3EEB0D3EFB5D7EFB5D5F0ADCDEDA1C2E899BBE496BCE395C3E49FC8EA91AB
            E435468C2E36852D347D435184ADC7EC98BAE38BB2DD8DB7DF9EC4E87D92C934
            3E812C30782B37705E799AA8CFEC97C0E695B9E489A1E16474A5778CBEA8C9ED
            ABD0EEB1D6F3BBD8F58396C83F467A3B3F75383D6E3B43686A7591A6BEE894AC
            E1839DD88097D87F94D77E93D77E93D77B92D67994D57B97D47D99D5829ED886
            A6D690B1D59FBFD8A9D0D18AB391578543538C32589A2A5DA42661AA2462AC22
            62AF2165B12068B32068B22064AE1D67B11E64AC1B62AA195EA41A64A7245F9C
            2168A94889D4B174DDDF34D0E524D0FF3DCAFF137BE50F3AC32E7AF830CAFF0B
            CEFC0ACEFF09CDFF08CDFC08CFFC09CFFC0ACDFD08CAFF08C9FE09C9FC08C0EE
            0AAFDD0B9EC70683A70469860151614A87A36B96DF4F6ED43C56C92E42C5293A
            C3007FA0AF8BADB88FBBBB6FA1CD79BCDB6FD3ED2DCFEB0AD1F701CFFA00CEFD
            04CDFE08CCFE09CCFE08CCFE02CCFF02CDFE05CEFE04CEFC00CEFD01CDFD09CC
            FF0DCDFA14D3F224C9B72697362494372ACBCA22CBFF30B7FF1C76E61331C723
            22D3221FE02722EA2821E3261ED7271FCC251FBF1F1EB01E1DA018198C181A7E
            1213690F1159101751121C4E0F1A453B4C70A5BFD8BCDEEAB2DCE3ADD4DEA6D0
            DBA3CCD69DC9CFA2C8D1A3C7D2A4C6D3A6C7D4AACBD3AACCD4AACCD4ABCCD4AB
            CCD4ABCCD3AACBD5ADD1D9A6CFDCAFDAE88AA7CC3840873435853335742F3961
            A2C0D2AEDAE0A5CDD59FC5CE9FC0CFA0BFCEA0BDCE9EBFCF9DC1D097BDD0A0C8
            D9A7CFE1B4DAEAA2BAEF4D50BC4844CB4945CA4A4CBF4856A9A7B8F66A70D342
            42AC4140A63C41948AA2D4B1D0F36F88B5647BAC697EB16A7FB77284C37384C6
            7181C46B7DBA6A7EB05E729F6372A66675A5879FCD9EC2E398C3E39AC3E88AA3
            E438448F363A92353A8C4C5991A4C2EB90B5E082AADD87AEDE95BAE6798DC433
            3E7F32377B30397261789BA1C6EA8EB3E386A8E08EABE094B1E49DBAE9A6C1ED
            B3CFF195AADD5B699E444B8440437C3C3F7339416B37415F94A6CB98B1E2849E
            DA7992D37289D07386CF7285CF7185CF7184CF758BCD738BCA718ACA738ECC78
            93D07F9AD187A5D695B3D99BBBD99AC5B4679860548C3456972B5CA3255EAB20
            66B42064B21F63AD1E65AF2064AE1B60AC1A62AC1964AE1865B01D5EA91763AC
            1560A61C57993766C29049D8C93CD2E942B4FF0E56CB0D44C2389BFF2ACBFF0D
            CEFD0BCEFE09CDFF07CCFF06CDFD08CDFD06CDFD03CCFF03CBFF07CAFB0CC6F4
            08B4E00AA3CD098BB1057291045D71185A6C78A9E6567BD6405DCD263CC12131
            BD0093BCC19FC5C6A5CBC975A6D76EC4E359D3ED1BCDEE03D0FA01CDFD02CDFE
            08CBFF09CCFE09CCFD06CCFD01CDFE01CCFF06CCFE08CCFD04CDFE05CEFF0ACB
            FF0ACCFF07CCFB29DBD825A64C24953D36B3B940B1FF0E55DB0024CE262AEC24
            1AE72320EB1D1BE2221ADA271ED0231BBB1D19A41D1F9714188313177610156B
            0F125B1218550D15460C183E3E507595B0E389A2D57392CA6081BD5578B94D72
            B3506EB64F6AB45169B65168B75269B85369B8556DB9576EBA586EBA576EB957
            6EB9586FB95E72BC6781C37698CD8BB2DD829ECA3540863235823137722F3961
            8CA6CC89ABD97593CB657FC16278BF6377BF6377C06579C26679C06579C56683
            C67896D08CB0DDA6C1EC5C63BD4849C14547C0454BBA4A55AD8794F66467D243
            42AD3F3EA33B41928CA1DE7E96C937488336438F3B43984448A74545B14847B5
            4747B24244A73E43963E4491363A8B3C3F8950598D879FE486ACDF97BEE28FA4
            EB444BA24240A43B3C984A58949AB6E67FA0D86C92D37298D38BADDE7F91CD32
            3A7C37397F363C776173A08EADE27B9CD87293D47291D484A1DB9BB3E4A2B3F0
            676FB9494C9B42439340418E4040834143773A456664769195AFE17F99D56A84
            CB5D75C55A6BC05A6AC25969C15868C15768C14C58C34B57C34957C14855C147
            57C34959C45365C95D71C9708ACE84A1D19EBCD06D9B715086365599265BA520
            5BA71F5EAA1E61A91E60A91D65AF1E62AE1960B0185DAF175AA9165CAB155DAE
            145BAA145EA421489E2E2EA84B5DD4B653A4F60D42C30C61D23BBDFF18C6FF0E
            CEFE0FCDFD0ECDFE0ACAFF04C9FF04CBFF02CCFF01CCFF01CCFF06CAF90CC6F4
            0DBCEB08A9D40B94B9047795005D76064B5D5A8CB55980D83454C71F3BC41228
            BD00B5DBE9BCE5EAC3E8EBC2F6F18AF1F83ECFEE16CDF601CCFC04CDFE06CBFF
            09CBFF09CCFE08CDFC04CEFC01CDFE01CCFF08CCFE08CCFE04CDFE05CEFF08CB
            FF07CCFF01CBFF26D8EE3DB89324816419689E0D46BE0C26CE1E24EA2118E82A
            1EF1241EE8201EDD211BD0211AC0231EAD1B189214167B12176E0D1363080E56
            0D15500913421321448098BBADCFEE9CC1E78FB6E384AFDD85AADE749FD3739E
            D1759CD5789BD8789BD7789BD7789AD9799BD97999D87A99D87B9AD97A99D779
            98D67A99D77E9BD882A5DA88ABE296BEEA829ECC343F853336832D32702E3761
            97B0D698B9E889A4DE7F98DA7B8ED77C8FD87C8FD97C8FD97D90D9798BD57E94
            DA86A2DD92B5E1AFCBF07580CF494DB1484CB8444BB34752AA7A86E56466CE4A
            4AB24947AD3F4699889DDC9FB8F043568F3A498B424D99444BA24C4EB14A4BB4
            494BAD484CAA40439C393D953D3B993F4095474F8F9EB3F19ABFEC9EC1ED91A2
            ED474AA5443FAB433FA35460A4B0C8F196B6E986AEE589B1E598B9EA8696D33F
            4589383981373C796676A698B4EB85A4E47D9EE181A2E396B3E98797D75057A1
            4B4BA74744A74747A24548964145833C43717889ADA9C3EE8FADE57592D86882
            D55E73CF5F6FD15F6CD15E6CD05D6BD05C6AD05864D15763D15460CF535FCF53
            60D05764CF5664CF5B6ED15A73D16B86D97999D795B2D88DB99D508932519222
            5BA1235EA72161A92164AC2262AC1E60AE1B5FAF1B5BAE165BAE185DB01A59AE
            1357AA115EAC1553A61C40A52F3992682A5EB80B39BE1889E330C9FF16CAFF0A
            C9FD0ECDFE0DCDFE0BCAFF06CAFF02CAFF01CCFF00CCFF01CDFE08CCFD0AC8F5
            0CBFED0BB0DA0B98BC057C9B005E79044E612B61736996E14469D52845CE142F
            C60094C0DBA2CEE4AFD6E5B2F0F265E3FB29CDF313CAFB08CAFF08CAFF08CBFF
            09CBFF08CCFE04CFFA02CFFA02CDFE04CDFE06CCFD04CDFD01CDFE00CDFC03CF
            FD04CEFC07D0FF20C5FB4CAFEB1D52AC1A33C11E23D52725E42A26E92521E421
            1EDD211FDA1F1CCD1D1AC01716AB10128E11127C0D106A090B590A0E55050D48
            07103E1E31509AB8CDB8DDEDAFD3E8A6CAE2A6CADEA2C6DB99BFD09BBDD59CBD
            D89EBDDA9DBCD99DBCD99EBDD99FBDD99FBEDA9AB9DA9AB9DA9BB9DA9CBADA9C
            BADB9CBADB9ABCD89EC1DBA1C9E6A9D5ED88A3CF353C873233842F30722E3461
            A3BBDBADD0E9A2C3E09EBBDB9BB5D799B4DA9AB5DA9BB5DB9BB5DB96AFD993B2
            D79DBDE1A7CBE7B4D1F08594D3444C9D4246A4434AA8424E9F8391E57279D44B
            4EAC4340A94549A36E81BCBEDDF4B5D8F59CBFE099BAE399B7E89DB9F2A3BCF6
            A5BFF6A4BCF66875B9373E8B4141994244964F5999A6C0F0A7CEEDA9CCF099A9
            F14C4DA84941B14842AC5862ADB5CDF4A6C9EF9BC5ED9CC6EAB0D2EF8B9AD836
            3A82393982373C7A6A79A8A3BDEC8DABE486A6E391B1E696ADED4B529E4649A9
            4648A94449A74049993D4B894E5E8D98ACD8B7CFF2A1BDEC8AABE27797DA6E87
            D8687DD66576D46676D46576D46475D46374D46B7ED06A7DD0687CCF677ACE68
            7BCF6477CC6277C9617CC75572C85D7BD26586D1799AD68FB0D693BDAD5B8B49
            4D8A23589B2159A31D5BA71A5BA8195EAB1C60AA1B5DAC195AB01557AE1259AB
            1359AB1258AC1051A41A4C963D41786F2E48AD1845C13AADE433D3F017CCFC11
            D0FF0CCAFF0BCAFF0ACBFF06CBFF02CAFF02CCFF04CDFD04CEFC03CFFF04CAFB
            07BFEC0EB3DB0B9ABE07809F036781004E600C454F6496C45480D9365BD02343
            C7005C7DBB6486C07D9CC773B7DB46D1F217CAF812CAFF0EC9FF09CAFF08CAFF
            08CBFF06CCFE02CFFA02CFFA06CCFE08CBFF06CCFE03CEFF00CEFE00CBFA03CE
            FE09CAFF20CAFF2AAAFF1157D8132CCE2622E52E1DED2A1CE7261DE1251FDF23
            20D71E1AC91D1AC01516AB1113960C107D090D690A0B5C070C50040C4505113B
            415773A9CDDCAEDAE0A5CFD69DC4D098BECC99BBC992B8C194BAC38FB5C291B6
            C592B6C593B7C592B6C592B6C593B7C594B7C68FB1C88EB0C78FB1C78FB1C791
            B3C991B2C88EB4C393BACB93BAD7A2CBE186A1CF373C8C302E873230792E3366
            9DB3D6A6C6E197B7D68BAAC88AA6C88AA6CA8BA6CB8BA6CA8BA7CB849FC989A6
            CE90B1D59BBEDFB5D2EB7D8CC2444C93404897414998414E9391A2EA8695DE48
            4F9E4D4CAF4545A44A5698AEC9F3BBDEF1AEDAECA6D3E7A2CFE7A5D0E8ADD6EC
            B7DBF2B8D6F3606FA93C428A3F4092454993707EB9A8C6ECA5CAE9ACCEEC9AA9
            EF4B4BA34A42AD4943AD5159AA7385C58199C8ACCDEEB0D1EEBBD6F18A97D639
            3C81393A7F3B407C6A7BA69DBBE68DABDF8BA9DD95B3E27687BF484FA6464AB1
            444BAB414F9F4E62A08BA5DDADCAF3B9D4F2849BC17F98C08BABDE7392D26781
            CD5E75C86071C96071CA5F6FC95E6FC95D6EC95362C95261C9525FCA505EC94F
            5DC94E5BC84D5BC84B5CC3546CC35671C65D78CD637FCE7490D28AA8D39FC5C5
            6F9F604F8A25579A2058A3185AA71A5AA91960AA1E5FAA1A59AC1257AC1159AD
            1457AA1055AC0E57A2294F825E43648535499F2E5CA627918E36CBB32FD6E217
            CCF20FCBFD09CBFF0ACDFF09CDFF04CCFF04CCFF08CDFC06CEFA00CCFD01CAFA
            08C2EF0BB2DA0C9CC20780A100648100506304414B51849D5C8AD73A60CA2546
            C300BFDAD7C2DEDEB7E0E189D9EB37CDF00BCBFD0AC7FF0ACAFF0ACBFF0BCFFF
            04C9FE03CEFF02CFFA01CCF708CBFD0ACBFF03C9FF02CCFF03D2FF01CDFE06CA
            FF20C8FF2492FF003DD20628D61B23E4261DED291AEF261EEC241EE6261BDF22
            18D31F17C11C17AF1313960D1481060D6B040A5B040850060C46041339455B77
            9CC1E087AED2739AC76588BC637EBE5F77B85871B45B72B55A74B75873B75873
            B75A75B95A74BA5B75BA5A73B95A74B95C75B95A70BC5A71BC5B72BC5C72BC5D
            73BD5D72BE5E77BC6884C57898D08CB1DE839DD1383C93352F94312C812F326E
            95A8D891ACDA7893CB6F87C6667CC0687BC2687CC2697EC16980BF6780C26E8A
            C87D9CD392AFDEB1CAEB6169A041458843488E41498A4253859FB6EEAAC3F351
            61984C4FA34D4DAA464C9F6A79BEB5D0F1A5C9EC9CC3E794BEDF97C0E2A5CBEA
            B4D5F09FB8E83C48853D438D414590444C8B93A9DD9BBCE99EC2E7AAC6EC98A3
            ED4547994A43A64842A44649A1434C9B48519B6A79BDA8BBF2B3C6F0848ED13A
            3F7D3B3C7D3840736677A091AEE6829FDE809DDE89A4E35765A0474EA9444BAD
            4450A45F73B9A3C2F3ACD1F2AFD1F290ACD434446133435C758FCA6F8CD45F78
            CB5268C45263C45260C35160C34F5EC24D5DC14757C44858C44757C44555C344
            54C44252C44150C34150C34153BF4055BB4059BE485FC44F66C5637CCE7B95CE
            94B5C87BA9784F8C24529D1855A51657A9165DA8185AA6125BAA105BAD1055AF
            1053AC0E5AAC1159973D46658F364CA2385C85427C6D3A933F279C3C34C08D3A
            DBD41BD2EF0ACEFD09CBF80ACFFB06CCFE04CDFE03CCFC05CFFD05CDF906CBF6
            06C1EF06B3DD0A9CC20581A100648100506302424D4A7D965786D93155CA1D36
            C300DAF0E6D4F4EBC5F1EFA0F6F52DCCF005CEFF06C9FF06C9FF05C6FF00C4FB
            03CBFF03CEFF03CFFD07D1FF0BCFFF06C8FF03CBFF00C9FF01C5FC11C8FF23C0
            FF097DF10034D00C27DF1621E61F1EED261DEF261AED231CEA211BE32319D922
            17C91F17B30F0E920A0D7D040B6A050D5E020A4F000642000B3859728DB0DAEF
            A1CFE78EC0D98CB9DC89B3DB87ACD887A9D688ACD988ABD889ADD987ABDB88AC
            DB88ACDB88ABDA88ABD989ABDC89ABDC89ABDC87A8DB87A8DA87A7DA87A7DA88
            A8DA87A7D986A9D88DB1DB93B9E3A1C9EB88A1D7373A9A352F9E322D8C333479
            9EB5E1A1C4EA97B6E288A6DD86A3DB89A2DC89A4DC86A0D784A4D489ADD893B6
            E09BC0E5B5D3EDACC1E64B5185464A874145833E477D55688EBCD9F6BADAF59E
            B8E34C539447499D4C4EA649519D7284BEB1CDF5ADD3F1AAD1EFADD4EFB0D5F2
            B5D1F65A6D9D3D47853E44893F45857280B4AECDF1A2C6EEA5C8EEABC3F47D89
            CB464894423F92484698535AA95E68B5464D99454E944F5B967482BE50579137
            3D75373B73363C6C6376969CBEEA8CB0E488ABE398B5EB58679C464CA2434AA8
            454E9DA2B7F7B3D4F5B5D9F5B7D8F4637C9C334364323A577086B3809AE07187
            DA6779D66071D1616FD35F6ED25E6DD25E6DD2596CD2596BD25669D05467CF55
            67D15365D05264D05164CF5164CE4F62CD4F63CD5165CF5669D25A71D36E83D9
            7D99D897B6CE7FB278478A1F4E9B1955A6165BA8145EAC1161AE115AAD0F51AC
            0D4FA815559B2952815D3C4DA63243A349767050923E4F9D1A42A0172D9E3B2B
            B57A37DACE1ED5E812D3F607CDF903CCFC01CCFD06D1FF01CCFC06CEFA09CBF7
            06C1EF05B1DD099BC1067FA000648100506501414C3F72886491E13D62D42540
            C90085ABD88BB5DD8FC2E593F0F028CBEE01CDFE02CBFF04CAFF0BCDFF09CCFF
            06CFFF03CEFE05CEFE02CBFB00CAFE01CCFF01CEFF08CBFF17CAFF2FBDFF2277
            FF002AD11021DD1F24EA2020ED2420ED281EE9281DE6221CE81E1ADD1E18CD1C
            17B71413971113810E117104095D030A51030C4605133E68809FAFD7EFA1D0E4
            97C4DE97C3DC90BAD696BCDB95B9D994B8DA93B8D994B7DA94B8DA8DAFDA8EB0
            DB8FB0DB8EAFDA8EAEDA91B0DB92B0DC92B0DC8FAFDA8FAED98FAFD990AFDA8F
            AFD98FAED88FAFDB93B6DD98BEE3A1CCEB88A1D9393BA4352FAB37339D363B87
            9EB9E3A9CFEA96B9E18EB1DD8CADDD8CADDC8DAFDA8FAFDB95B4E096BAE19CC2
            E1ACCFEDB9D4F36C79A041487944478044467F474F7C869AB8B7D8F1B1D5EFB1
            D1EF8293C64E57934C4D9B46499A494E9555609F889CD39FB8E898B1DD869AC7
            515F92424B8440488541498257628EA5BCEBA5C6ECA0C2EB899ED5515C914148
            86404288454889404681566495B0C4F56270A6434E854148873F45833B427740
            4678383D6F3D456D7084A394B4E78BA8E090ACE49AB7E87487B3444C93464AA1
            4146955E69AE95A9E197AEDB687AA535426731395F37415F8599D07F99E07186
            D86579D16474D26272D26071D05F70D26071D3596BD2596BD25769D15668D156
            68D15366CF5265CF5164CE5264CF5063CE4F62CE4E60CB4D63C85268CF566ECB
            6782D57797D391B3D188BC92478A244E9D1559A9105CAD1057AA0E57AC0D50AB
            0C50A126508262415E883443A5425798598B4F599D1B539E104EA00E3D980C2E
            9A2634B56D3CDAC017D2E800CCFC02CDFF02D0FF00CCFF02CEFF05CEFF08C8FA
            05BFED05AED90897BB037D9A00617E004D63023F4D3B6C806994E14365D52841
            C8005580B2608CB972A2C86CC5DE27C8EB01CCFC04CCFF04CBFF08CAFF0ACDFF
            03CCFD03CCFC06CBFF04CCFF01CCFF02CCFF01C7FF13C5FF29B4FF025DDF0224
            D22022E9221FEA2019E72420ED2421EA2820E6281FE3221DE21C1AD51818C115
            17A81213880C107204085E090C570006420008357B92B4A1C8DE90C0D07EB0BF
            7CA9BB729AB77799B77397B57397B57497B67598B67698B67598B67393B77394
            B77595B87494B77494B77595B87696B87796B97395B97495B97696BB7796BC76
            96BB7796BB7899BD7FA2C38BADD099C0DD859FDB3C3CAD3933B53732A4363C8C
            9EB8E39AC0E294B4D785A6CE799CC67FA0CB7CA0C684A6CC8AABCF98B7D9A4C4
            E1B6D1EB7585AC3F487741477C43467D464A7B626B92ABC6E8A0C3E096BBDD98
            BDDEA2BEE395A9DC4F578F4A4F904A4F92494F8E48538647538047547E45507D
            404780424A82444C7F5C69939EB3E2A0BDE498BCE093B4E15161893F487A3F46
            7C41477C424876455076526482BBD5EFB1C9EE7182B0454D803D46793F46723B
            436A3E456C3F4A6893ABD688A6D97F9CD47E9CD287A5D899B1E5545E9142488D
            44488E3D43823B47743A476B323A63343D64323B5E36405B859BD2738BD56278
            CB5B6CC95262C45262C65261C65160C6505FC64B5AC44A59C34957C34856C447
            55C44654C34553C34452C34353C54151C44050C33E4FC33D4EBE3E51C03E53C0
            465DC75672CB6989CF85A9CB8DC5945196294F9E1254A90E57A90D54A70F53A3
            1B51914844668C31489D39529550777A58942D59A40555A20754A60854A80342
            A00A2F9A2325AA612CD4C514D6ED06D1FC00CBFE00CBFF03CEFF05CBFD07C5F7
            05BAE807AAD20892B4047793005D7600495C013C4B3E6D83638FDD3E5ED2283F
            C800C6EAE2C3ECE4C3F0E88CE3F02FC7E709CAFA08CCFD06CCFE07CAFF07CBFD
            03CCFC05CEFF04C8FF07CDFF03CDFF00C5FE13CAFF29B8FF1D69F90625D61B22
            E5231DE9261EEE2520EF1F20E91E21E52520E5251EE0221DD91C1CCB141BB50E
            199B0E11810C0F6E080C5C000646030F3C647899A5CBE093C0D382B0C87EA8C0
            7BA2BB779BBA7597B77698BA7699BA7699BA7698BA7496B87595B97396BB7395
            BB7396BB7695BC7795BD7795BD7795BC7795BC7798BC7798BC7899BC7999BE78
            98BD7999BE799CBE80A5C48EB3D09BC4DE89A1DE3C3CB03C35B93734A73C4398
            A4BEEFADD1E99BBEE094B6DA8DB1D687AED493B5D894BBD89EC0E0A9C5E5A9BD
            EA6976A53F47793F467F42468443457E545B86A7BAE5A6C2E190B5D888AFD18F
            B4D599BCDCA4C5E2A3BDE2778BAE58668F4C578346517D47527E424E7949557D
            4D5782616E978091B8A7BEEAA5C1E399B8DE96B7DA98B7E08AA2D065769F6A7A
            A18595BD7381A4667694839BBBA4C2E5A7C3E5AAC6E68DA4C86675935765835A
            668467709397A5D494ABDB829AD67A92D07A93D17E99D390ABDD91A6D86676A1
            41487C3E43773A426E364066363E63373F5F4D57767D8DBB849DD86D85D06176
            CD5668C65463C65464C85363C75262C65161C64D5CC44C5CC44B5BC34A59C24A
            59C24858C34757C34656C34355C34254C24153C24052C43F4FC33B4EC03D50C0
            3E54C5435EC55171CB668ACC87A9CB86B98A54992951A01357A810559F1D5792
            474872743246A83048A746766E4E9038569D1358A60250A8014DAA0049A70049
            A906419E0E28942029B06336D9BB10D1EA00CCFF04CAFB0DCEFE08CAF709C4F1
            06B6E207A5CC098CAD06708C04586B034755033A47426F87668CDB4160D02940
            C700CAF3ECC7F4EFCAF7F2A8F7F33FCBEB14C9F70BCDFA03CCFC08CEFF08CEFF
            06CFFF05CEFF04CAFF05C7FF07C8FF1DCEFF2BB9FF015FDE0223D41E1DE82B23
            F3251CEC241BED221BE91F1FE61E20E2221EE1221DDB211DD11A1BC0151BAC10
            18981213830C0D6C080E58051043647A9DBBE1F2AAD8ECA0D2E89DCDE496C4DE
            96C2DB9AC2DC9AC4DE9AC4DE9CC5DF9BC5DE9BC5DE9AC3DE9CC4E096BFDF96BE
            DF95BDDE97BFDF98BFDF97BFDF97BFDF97BEDE93BADD94BADD94BADD94BADE94
            B9DE94B9DD91BBDC96C1DE9EC9E7A8D2EF8CA4E13C3DAA3833B33833A6323791
            7188C1BDDCF6B5D5F2AFD0EEABCEECABCEEDADD0F0B4D7F1ADC6F37685B4454C
            843F46813B437E3B417B3F447C585F8FA5B9E1B3D1EEA2C7EB9FC4E69FC3E59E
            C4E3A2CAE5ACD0EAAFD3ECB3D5F0B2CFF2A4BCE69CB2DF8598C491A3D2A0B5E2
            A8C1EAB5D0EFB0CDEEAACAEBA7C9E8A5C7E3A0C5DBA2C7E2AACAECA9C8EEADCD
            EFADCBEFB1CCEEA9C7ECA2C4EA9CC1E89CC0E79FC0E8A5C5EBADCBECAFCAEEAD
            C5EDADC1EBA1B8E795B0E285A3DC87A1DE86A2DE8CA8E092B2E39EC0E9A7C5ED
            A2B6E98896C88090BC7C8CB88898C798ABE2A0B7E890ABE47F9EDC7390D86C86
            D5697FD6667DD5657CD5637AD56179D46077D35B70D25A6FD15A6FD2596ED157
            6CD0556BD1556BD1556AD1526BD05169CF5068CE4F68CF4E66D04C64CF4861CC
            4662CC4865CE4C6DCE6381D77396D393B7D180BC7D4D932A4D96225493404B71
            763752912B42A13B61924B8E4650A01352A30554A8004EAB004BAC004AA7004C
            A8004FA70446A4112F9B2224A95C2CD3C71BD5EF15D2FA0ACAF70BC9F608C1EB
            07B1D8069DC00784A2056A8204546405454F053946497392698FDF4763D43044
            CB005F88C76E9ACC7BABD495E3E34EC9E81FC5F10ACCF800CEFB00CBFB01CCFC
            02CCFA02CBFC05CCFF08C7FF19C9FF2CB7FF1B64ED0725D31921E02320EB1C17
            E8271EF22A1FEE281EEB261CE7231BE1211ADC1B1BD11819C41719B51B16A91A
            149918108A1412750914574B628ABCE1ECA6D3DF99C4D291BCCB8DB3C38DAFC0
            8CAEC188ADC088ADC088ADC088ADC186AAC186A8C186A7C286A7C386A8C287A9
            C386A8C287A8C287A9C388A9C389AAC389AAC388A9C289A9C28AAAC38AAAC38A
            AAC58AAAC486ADC68DB5CA93B8D3A0C5E0899ED93A3A9F3530A5342E9B343493
            313D895162A67987CE8A98E48E9DF2828FE37A89DB5F6BBF474BA04042953F41
            8E3B3F843D457F4049786B7A9EA9BFE5ACCAE49DBFDE96B9D593B5CF99B5D99C
            B9DC9CBADD9FC0E0A4C5E2A8CAE5ABC9E5ACC8E6A7C3E7ADC8E7ACC6E7AECAE6
            AACAE5A3C2E39EBCE49CBAE098B8D1708B827D989BA1C1DCA1C0E2A8C7E6A0C3
            E5A1C1E49AB9E299B8E093B4DE90B1DC91B1DC8CAADD93AFE095B2E29AB5E29A
            B1E29AAEDF90A3D88B9DD88092D67A8ECF788ECE7992D4829EDA8CAAE099B9E3
            A1BCE7A7C0EAA5C0EAA3BEE998B4E58DA9E07F99DA7089D46681CD5B74C8596D
            CB5766CA5465C85466C95465C95263C75062C64B5DC84B5DC84A5CC84A5ACA48
            59C94657C84657C84556C84455C74354C64253C64151C74050C63F50C63C4DC4
            3B4EC5354AC43954C94161CC5B79D67198D397C0D469A58546854D40746C2F48
            A82B40AB37647C4685514C992053A80950A6044FA60050A80051A70057AB0352
            A60051A9004DA70446A10D3096202DAC663DD3BD1ED1E808C7F707C4F407BBE4
            07A9CA0593AD007992006175024E5C03414B073846527BA2587BDA3652CF2236
            C7005C78BD6687C17097CA6AAFD65BC8ED2AC0E60ECAF401CEFC02CEFE02CDFD
            02CDFD04CCFF05C8FF16C5FF31BCFF0660DA0A25D1231EE62422E92320EB231D
            F0241BEF2519EA281CE92A1CE7261BDF2219D51D19C81819B91817AC1E15A31E
            12971E128919186F465B87ADD0EB97BFE075A1CB5F87C04D73B54867B14761AE
            445FAD4560AE445EAF445EAF425BAE415BAF4159B04058B13F57B14259B2435A
            B2435BB2435AB2445BB2455CB2465DB3475EB3475DB6495EB7485EB64A5FB74A
            5FB74B60B74966B95574BE6987CC83A1DB8094D2373795342D99332D902A2A84
            27307F283580323B883C42963F45A54046AF4349B54548B74643B44240A83D41
            943C468552619596ABD9A5C0E694B1DD84A4D4809DCF7F9CCA869ECD8EA2D390
            A4D58DA3CF8BA4CA8AA5CA8EABD194AED892ADD992ADDD91ABDC92ADDC90ADD6
            90ACCE92ACCF8CA9D88DA9D98FACC460786189A2ABA2B9D59AB5C990ADC88AA8
            C987A5D3859FD9819AD97C97D67993D37993CB7D94D47993D47F97D7819AD384
            99D38295CD7C8ECD6F82CB6C7ECA6A7BC86A7DC97287D17A92D4839ED688A7D4
            88A6CA8AA8CB8CADD487A7D77F9CDA6F8AD5617AD2576DCC4A60C54656C5414E
            C2414CC43F4BC33E4AC23C49C23C48C23B47C13746C33645C33544C33443C232
            41C1323EC0323EC0303DBF2C3AC12B39C02B38C02A37C02836BF2735BE2433BC
            2635BE2A40BE2944BE3150C04563C56385D382ADDF9BC8EE57849F2C5384253B
            AA2F4D9E4482584A982150A30A50A50050A8054EA60353A80154A60053A50055
            A70051A70050A80051A4034AA11231962028A35A37D7C91ECFE70FC1E90BB5DE
            0AA0C00587A1016E8400586A004758023B480A3744668CC75574D52F47CA1F32
            C300E4F4F1E0F3F1D7F2F0A2E2EC7EE2F438BED917C4F303C8FD04CDFD03CEFF
            00C7FD06C9FF0DC8FF2CC0FF1665F30725D91C22E5241EEA2120E92120EB201D
            EE221CEF261CF0281CED251BE6251BDB2519CE1F13BB1811A9130F9C1B13981B
            138D1C177B212A6135564A84B29AA6D6E391C1E878ADE06C9FDA6693D7668DD8
            688BD86886D66585D56484D46483D56483D56383D76282D56181D46586D56484
            D66484D56585D66685D66484D46585D66585D5617AD56179D6637AD6627AD665
            7CD7637BD45F80D46C8DD97C9DE191B3E98295CF36338932298D2E287D2A2D76
            202E6F2335702C3A78354189353F9B3F46B04344B94947BF4A44B64443A8424D
            97899FDEB8D8F5B0D3F29FC0EC92B2E487ABDE8AA8DE8EADDF99B5DC879BA672
            817A5D6D5D5B6E5E586D5D62796A778D878FAABE95B1DE92B0E193B2E07B9A9F
            6E876D76907E95B6DA9AB9E4A3BEDA80988D859D8C758E735B724F5E76515C76
            50748E858BA6C891A9E390A6E38EA4D265786A6B81808DA6D98FA7DF7F94AB66
            776C65766E7E94B87F96DA788FD97289D3798FD5829AD98AA3D3718A94576D5C
            4A61474961494C645060787C7D98C7768FD4697ED75D72D35669D25062CD4E5D
            CE4E5CD14C5BD04C5BD14B5ACF495ACF495ACF4454CF4353CE4151CD3E50CD3F
            4FCC3D4CCD3E4DCE3C4BCD3949CB3747CA3645C93541CA3440C93140C93140C9
            2F3FC9344CC83453CC3F61CD5374CA6A90D488ACE8809EE53849AC2B3E9A3256
            814277614A952E4DA10A53A50355A70050A70150A70155A70055A70052A60150
            A60353A70252A5034EA5064AA40647A40A359E202AA9633DCFBA1FBFD60BA8D1
            0791B6057A98086377034E5F0143570338493A62767295DF4B68D43048CD1C32
            C600DEF1EADEF2EBD8F2EEADE7E998ECF159CEE41EC1EB08C8FB06CCFD02CCFF
            05CDFF10C9FF2AC7FF0A77E90024D41F1EED251DED241DEB201FEA2120EB201D
            EE231DF0251CF0251CEC271EE7231AD62215C41F15B318119F171294100A8413
            137C1B236E263C572A522829581987B69BA7DBD9A0D2DF92C7DD91C0DD8DB9D9
            8DB3D68BACD48CADD58CADD58BAED789ACD588ABD688ABD688ABD58BADD58DAC
            D58EADD68DACD58EADD58DACD48EACD48FAED689A9D58AA9D78AA9D78BAAD789
            AAD88AABD886ADD58DB1DA98BAE2A4C8EA8498CA3330822E268129276F222762
            3E55847794C197AFE198B0EF8CA2EE7687DC5D69C64549AD4948B24648AA3E49
            9651659D8FAFD6B8DEF2A5CCEA98BDE19CBDE3A1BEDFA5C5DA6D837B5C6B545C
            6B5291A4A4A0B9C29BB8C291B0B874897565765B95B2C5A2BDE29DBFDB8FAFB2
            6B815685A186A5C8DDA8CAE5BACFE38DA69662785261784F869F8491AB988CA7
            9770877364776A98B2D3A1B9E082949D627259889FA09DB7DE9FB7E19BB6CD62
            745B6D827594ADD18EA6DC89A1DE87A0DD89A3D897B0D763776F4E6047576E58
            85A1A58AA8B5819EAB576D634051418099C7778ED66D83D66579D35D71CE5B6D
            CF5A6BCD5869CC5769CE5768CE5667CD5567CD5063CC4F62CC4D61CC4C60CB4A
            5ECA4A5DC9495DCB495CCA4357C84356C84254C94153C84052C84051C6404FC6
            3A4EC63B57CC4263CF496ED15F87D27B9DE36E86CF2B388921279C2D40974472
            6B478C384CA0154FA70055A70055A70050A70150A80057A60057A60050A6034E
            A60452A50351A40250A6044FA70450A800409F0631992B2CA3662DB7B40F9BB7
            0581A3016A8A055569014453003B4E0032406A90B96687DC405CCE2540C61B33
            C4005A77B85C79B86184BE90C3CD8AD2D971D8E726C1E00BC7F100C8F802CCFF
            02C9FF1BC1FF2189FF0035D21525E3221EEB251EEC241DEB221DEC201DEC211E
            EF231EED251EEC251EE8251CE02319D4201AC41813AB0F0F920B0C8116147D12
            18696C8BBA92BFC52853272855132D5B1E74A67CA3D4CB96C9CF87BDC786B7C7
            87B1C285A9C083A6BC82A5BD83A5C081A4BF80A3BE80A3C081A3C082A4C182A4
            C182A4C183A5C184A5C284A6C285A5C185A6C17B9BBF7C9BC17D9CC17C9CBF7C
            9CBE7C9CBE7BA1BD83A9C590B7D29EC6E08298C72D2E7E27227923266526365E
            ACCCEBB3D9EDACD1E6A2C5E299C0E2A1C6E6ABCEED829DD7505AAE4649A94247
            A13F48954557909DB9E6A1C8E59EC2DF9DBED7A3C1D380968B58684F6F8071A3
            BBC1A7C2D7A3BDD89FBDD7A0BBD89FBACF6E8170849FA19CBCD6A0C0DA9AB9BC
            6B7F598CA290AAC7DEABC8E1ACC6C76D846469825E6E876BBCD6D9B9CEE0A8C2
            D9A8BCDF7F99A38FABBBA5BFD771877C657969A1B9D59DB8DD9CB7DD9FB7D567
            7B69748B8593ABD38AA2D6829ADA8298DA88A1D57087865064486D848492AED0
            8BA8D587A4D486A1D485A0D25769685163686F85CC657CD15A70CA5467C54F60
            C2505FC44E5EC34E5EC34D5DC34C5CC34B5BC24557C54557C54456C54355C543
            55C54353C44252C44150C33D4EC43C4DC43B4BC33A4BC3384CBF3C4DC23A4FC3
            3F57C3405CCC4568CD5C7FD87191E05B70BE1F277A1D27882A39937DA0E37AB5
            A04A942C47A00B4DAA0052A70053A7004EA80050A80053A60155A60153A50452
            A50453A80152A70053A60153A6044FA503459F07399312228729259A711E9595
            0E7A90005B79004C62004150003744245564779FE14E6ECD324DC51C31C11426
            BB006584CB6683C86A8CCC88B9C787C4CE7CD5DF3EC4DB18C4E60ED0FD05C8FF
            15C5FF20A3FF0036D51424E21E1FE8241CEC261FED241DEB241CEC221DEE231E
            EF231EED251FE9241FE4261DE1231BD51E1BC21516AB1316970C107D0B0F6B1B
            2A6C9EC9ECA4DAE287B9A12E5D252B591426521261906F8DBCC179AAC0679ABB
            658DBB577DB25675B15673B1536CAD516EB0506CB04F6BAF4C6AAE4E6CAF4E6C
            AF4F6CAF4F6CAF506EB0516DB2516DB1526DB2536DB8536DB7536DB7546EB755
            6FB8566FB85473B46080BD7194CD87ADDC7B92C6292D7F25247A242866283760
            AFCEEF9AC2E08CB1D183A5CA82A4CB86ACD191BDDCA2C7E7A0B2F34B51A54848
            A541439D40469359689E9FC1E796BBDC9CBAD99DB6C35B6D5265765BA8BFCDA2
            BAD79CB0D98EA7D08AA7D18BA2D191A1D075868A859DB892ABD496B2D893ADBB
            677A58899D8EA7BFDFA7C0E08CA49B627956A7C2BC829A8C798E88A6BFDA9CB2
            DD90A9D891ADD994B1D69CB7D36B81726A7F6F99B1D695AEDD93ADDB96ACD269
            7E6D6F83828C9FD38398D77C92DB7C8FDA849AD353694E5B725D92A4DA8197D7
            778FD67389D7768AD8798ED47B92C93F4D446377BA5A6FD0495BC84253C83C49
            C33C48C53C49C33C48C33A46C23945C23845C23443C33342C33342C4303FC22F
            3FC12E3EC12D3DC12C3CC12B37C02A36C02A35C12734BE2637BC2538BC2D43C0
            3750C54967CC5F7FD46C86DC4A59A4121B681118762934907691EE9AC7EE95CA
            CB529A404CA30F4CA80050A80050A8004CA8004EA80052A60153A60155A50355
            A60152A70053A90055A70055A60150A2044EA1084B9B0A35891414742D238466
            136E7403566D004257003D4C00363E5786A65F86D93A5CC92742C3182DC21425
            BB00E0F6EDDDF2ECDBF2EAADDBE6AADAE798E0ED75DCF33CC8E214CAF114C8FF
            30B5FF0052DF0B23DE201BEC231AEC251CEE261EEE241DEB241CEC241CEC251D
            EF251DED251FE9241FE4251EE2261FDB1F1DC61A1CB317199C12198506186675
            98D2B1E3F6A6E1F2A2DCE78FC6B637632B325B143456105A834C99D0BE93C9D4
            89BED883B1DC7EA8DA7EA0D87B9ED9789AD97798D87498D77295D67397D67395
            D67496D67497D67497D67496D67596D77696D76E90D47091D57191D77292D871
            90D8718FD66E92D3789DD780A9E192BDEA7A96CA2A3086252483262A71323E6E
            A9C7F29EC2E78FB0E087A6DA85A1D983A6D88EB2E09FC1ECB1CCF36574B84444
            9B4642A049469C474C8E97AFDAA9CFF0AACEE786A29B5A6F5098B0A8B1CCE7AB
            C4EC9EB4E39CB1E39AAFE48FABE294ACDF93ADDE95B1E49AB6E79DBCE597B3C4
            677B598AA390B1CFE6B0CDE7819B8B768E77B7D1E2AEC7D86D847694ADB4A5BE
            E39FBAE69EB9E9A0BDE5A9C2DC6E87706E846EA4C1DAA4BFE4A3BEE3A5BDDB69
            7F6A778D879AB5DB93ADE08FA8E48BA8E289A5CF546C52809DA38DA8D889A2E3
            7D96E0798FDF7C94E07E99DC86A1D94154526982B96881DA5871D55268D44B5F
            D04A5DD04A5CD0495BD0485AD04759D04857D04253CF4052CE3F51CD3F50CD3E
            4FCD3C4DCD3B4CCD3B4BCD3446CB3347C93348C73548C73A4EC93C57CA4565CF
            5077D56589DF7389E64A52A317156A14156E2A3581728CEC7FA5E77CADE899C8
            E386C79B4A97154DA3004CA6034BA7034BA8014CA8004EA80052A70055A80055
            A90050A60053A90053A80055A70054A40251A0025199024189062D7310186126
            1D695D054F590145500038422A5D6A6F9CDF4F74D53755CB263DC31F2FC0202E
            C200D7EEE7D6EDEAD3ECE8A9D2DEA8D5DEA0DAE795E5F16CDBF52BC5EF32C7FF
            136CEC0028D21D1EE92C1BF52B1DF5261DEF231EED221EEB241DEB251DEB281C
            EF281CED261FEB241FE7221DE5221FDE201FD01E1FBE1618A40B1987153B8495
            CEF7AAE5F5A3E1EF9FDCECA0D9DFA0D7BC5178403C5F16365A0F416B2E94C9A8
            A6D4D69BC9DA96C1DD92B9DD90B2DB89A9D588A9D685A7D587A9D686A7D685A6
            D585A6D586A7D586A6D485A5D586A6D686A6D681A0D7819FD5809FD4819FD582
            A0D584A0D57FA2D386ABD68FBAE29CCBEA7E9BCC2A2F8B28279027297B333F77
            ADCBF098BFE690B1E187A7D983A2D687A6D88EB2E09DC0E8AFD0F08197CF4649
            9645409B4840984B4990869BC6B4D7F2B4D8E56887725C7552A4C0B5B5D2E7AA
            C9E8A5BEE69EB7E598B1E595AFE498B0E49AB1E499B2E79BB6E6A3C0E99CB6C8
            697C5E8DA493B5D0E4B1CFE47F9689809687B8CFE6B7D1E9A9C5CC6A816E9AB6
            C7A5BFE3A2BFE6A6C3E6AEC9DB6E88706D856DAECBD9AAC7E0A7C5DFAEC4DC69
            806A7A9185ADC1E0A4BCE29CB6E29CB7E199B6D059735794B5BF97B1DD8BA6E0
            87A0DF849EDF8BA4E08AA6DD859FC535453C728BB9718ED7647ED15C71CF5767
            CC5767CD5666CD5565CC5363CB5262CB5161CA4D62CC4A5ECB4B5ECA495CCA48
            5CCC465BCB465ACB455ACB3F53C73F54C54055C4455AC64C64C95473CE5D83D2
            6F94E0718DDC292F6F17176214126B343C94738BEA668AE25F8AE16B9EE27BB7
            E591CED663B75948A31749A5074BA8014CA7014CA8004CA90050AA0053A90055
            A90052A80054AA0053A90055A80057A60055A0005196004888003B7704235F10
            12523211514C0240420A414A76A7DA5C87DD3E60D12845C71E33C11D2AC01C29
            C1005876AE5775AE5471AB5D83AE658DB1709DBF78B6D381D4E961D4FC2A92F4
            0936D51A22E3251FEB2519EA241BED231EEF211EED201FEA241EE8261FEB2B1B
            EC2C1CEF261DED221EEB1F20EB1C1DE11F1DD8201ECB1F1EB90D229B1E5DA431
            80A297DEED92CEDE85BFD587BDD18EC0CE92C5BA4E7748315915325D0B3B661E
            79A38397BFC782AECA76A1C86F96BF6A90BD6589B96184B36082B55878B55977
            B75977B75A78B75B79B85C79B85C79B85E7BB9607FB65F7EB55F7EB55F7BB75D
            7AB75E78B95E7DBA678AC1799FCF8EB8DD7E9ACE2D34932B2A982D2D893C4484
            A2BFE685AAD6789ACC6787BB6A89BE6F8DC1819FCF8FB0D9A4C7E67D96C43D43
            89433F934741904B4A898DA0C8B2D4EBAED2D7628063677F5C677E5D8EACA5A5
            C2D49BB6D493AED58CA8D795B0D894ADD58FA8D395AED89BB5DBA0BCDB9AB3BF
            67765E899B93ADC4E0A9C1E08FA2A377887DAAC1DFAAC5E1A9C6D7839E9B718B
            7899B9CC9DB9DAA0BDDCA8C3D76D88736C836FACC4D9A3C1DB9EBCD99DBECF60
            7963718B80A0BBD2A0B9D898AFC994ADCA98B2CC5971527E9B9B8AA7D082A0D6
            7E9AD77C96D97D97D68198CE4B5D5F3C49426E84C36078CC566AC84B62C04759
            C04556BF4556BF4354BE4254BD4052BC4052BC394BC0394AC0394AC13746C135
            44C03242BF3041BF3242C03241BF3546C23A4DC54058C74C6ACD5D7CD7718DDD
            5E6EBB23286A1616601A1C663D4D9B607BE65778DA5478D7557CD85E91DE70B6
            EA7ED9E161CC932A962D47A20D52A80050A8004EA9004EAB004EAB0052A80052
            A70051A90153A90053A90055A90054A60055A2015399004A8B013A7601245D05
            154916164B310A423A5489A06994E13F64D41E3DC80D26C00B1CC0101EBD0F1D
            BD0082ABD980A8DA7CA2D97DA1CF7BA3CE83AFD18EC5DB93D4E97CCDF11D5BD5
            1325D6261FEB261CE9281EEB251EEC2220ED1E1EEB201FEA2321E8261FE92B1B
            EC2B1AEF261CF0231EEF1E20EE1C20EA2420E52020D6191FC31137B52985CB17
            84A34AA3B18FDCE788CCDB86C2D386C0D092C4CE9ECDC5619461315E11335E10
            32581B628A6699CBC88DBDCD85B1CB79A4C1709BBE6B95BC6792BB6389BA6488
            BA6687BD6786BC6887BA6887BA6988BA6989BB6582BE6380BC6380BC6481BE61
            7DBC607DBD6283C06F93C87DA6D391BBE1809BD430369A2F2BA23230953C448C
            A6C3EB94B9DC81A6CF7D9BCC7795C8809FCF89A6D69BBBE0B0CFEC6E82B03B42
            813F3C85433E8248497E98ACD1AED0EAA8CBD4617E617C9578A2BDAB637E626B
            897584A09F8DA8B597B2CB9AB5D99BB3D79BAFDA9DB3DDA0B8DDA2BCDC9CB4C3
            6876618E9D97AEC6DEA8C1DEAAC0D46D7B7291A8B6ABC6DBB1C9DBACC4D66D88
            6F7E9C8CAAC4DAABC6DCB3CBD86F88716A816BB1CED8ADC9DDA9C5DC9BB9BE59
            6F575B745DA6C4CCA9C4D561776D586D5D95AFB9829D98526A518EADC48FACD2
            8DACD689A8D48BA8CE556C6F39493A5C6E7B7990CE6982CC5B73C44557C04453
            C1414EC2414FC33F4DC23E4CC23D4AC13C4AC04658C14354BD4151BD3F4FBD3E
            4DBE3A4BBC3849BE3F4FBE4256C14B5FC8526CCD5B7CD26C8FDA7E98E1475696
            151859171761181D624758A46D8EDE5F86D75179D34C76D25586D85DA2E165CA
            F054CDD553DAC122A05640A01555A90050A8004EA9004EAB004EAB0050A80050
            A7014FA70051A60054AA0055A90050A40052A2004F9900458B003C7B042E6807
            1F51091341145084818ABCE5608ADB3C60D12743C81B33C41928C01323C31322
            C400DBF3F0DCF4F0DBF3F0D1F1ECCCF0EACAF3EDC5F5F0BDEEF67EA8FC1630C8
            2026E2231DE9271BE6271DE8221FE81F20E91F20EB201FE82220E7241EE82A1C
            ED2A1BF0251BEF221CEF1D1BEE1F1EEF241DEB1F21E10A21C82261DE27A3E80B
            99BA12889D47A9B49DEEEFADEEEBB2EBE5B0E7DBADE8D4B2ECD082B68A326124
            2E5D1033621342753490C999B4E6D6B0E0DCADDCDEA9D7DCA2D0D8A0CFD4A4CF
            D4A3CDCEA5CED1A7CED3A6CDD2A7CDD2A7CDD29DC3D29EC3D39EC2D49BBED29A
            BFD29AC0D49AC2D4A1CCD9A9D5E2B1DCED859FD630339E352FAD3630A3454A9D
            BEDCF4B6E2E9AED8DDA9D2DAACCFDFAFD2E2B5D9E7C1DEEEBAD2F5434F7E3A3E
            773D3F7A424479565F87BBD7EFBBE0EABCDFDD6E87716C8165CBE5D7B1D6C685
            A5956C846E667A61677B6172886E7D937B8DA699B3CFD5BBD6E4BBD6E5ACC5C9
            66766190A39AB6D0E5ACC9E4AFC9E49BB2C06C7D75889E9CA1BAB999B1AB6E84
            6A6A7F64859C96B9D5DC8CA48F667E5D65795B7D9485A8C1CCAAC3D361746358
            6B4F768D7E5F766286A29C748F8148614685A39FA6C1D97B94985067565E786E
            667E77607A70445C46364D355B72738FAACE88A2DA7F98D87990D3758DCF7088
            D26E86D16C83D16B82D06B83D16A81CF6981CF627CD15F79CE5D76CF5B72CE5B
            70CF5A72CF5772CE5B77D25E79D16987D77292DE779FE26888D027347C101260
            1816661E23685875BB729FE2638FDB5B86D95D85D9598ADD62A2E467C6F139CA
            E92AD4E733D9D824B38334991C55A90250A8004EA80051A80250A7014FA9014E
            A80051A70053A80055A70053A70051A60050A4004E9E024793033B8103337105
            295B051A45096A999094BDE4638BD74063CD2A48C5233CC32438C31727C71928
            C500C6E4DCC8E4DCC7E4DAB7DDD8B9E2DCB4E2DFB6E9E9B6DDF34350CF2225D5
            2421E2251FEB2B21EC2821EB2422E91F21E81F20E9201FE8221FE8241EEA251C
            EC261DEF241CEE221CEF201BF1201BF1241BEF1822E3012ECD2F8BFF1AAFF003
            AACD089BBA138DA35ABCC498EBEBA1E3E0A2DFD8A8DDDCABDFDAACE3D494CAA5
            3F6E2A2B5D0C2F6412295D15689C6AAEE4CAABDCD5A1D1D79ECFD99DCDD599C8
            D09DC8D09DC6CC9DC5CB9CC4CB9EC4CD9FC4CD95B6CA94B5C994B5C891B5C594
            B8CA99BBCD98BED2A0C6D9A8CEE2BCDEEE849AD831329B332BA8352EA43C3E99
            BBD5F3BEE1EEB2D8E7B1D5E5AECEE5B5D3E7BFDAECACC1DC5D6694393F743B3E
            733B3E6F3D436B99ABCBB6D7E8B0D6E1B5D4DE88A2975B6F54B6D8C6BBDDDDBE
            DAE1BCDAD9B3D1C7A4C1AF9EB9A6859E8571876D748975AAC3C3BFD8E4ABC3C5
            6675608CA097AFC9E0ABC5E5A6BFE1A5BDDEA2BACE7B8B876C7A6F6E7D6E7C8E
            829DB3BAA9BED0B4CDDB829785657A59617256778B7D98AEBEA7C0E0778A8683
            9898ACC1D9869DA35B6F614E6554667E7792B2CC94AFD890ADD47A94A0556C60
            4259484157464960536F89928FA8D3859DD57C92D37185CF6C7ECB6C83C4697F
            C8667DC6667DC7657CC7637AC76279C56179C45064CA4F64C94E5FCA4B5CC74A
            5FC74F65C7556ECB627AD46D8AD67A96DD84A2E3526EAF0C205C0F1766161A6A
            2429736F80D96B95DF5A8BDC5480D8507DD74E83DB5BA0E25BBDEE45C9EF1DCE
            F20ED2F31AD5EB2DCBB22D9B2D4EA40750A70151A90150A6034EA6034CA7014F
            A90053A80055A70055A60153A6014FA7004FA7004EA002499603438B06357300
            2D6100204C01254B238AB0C46A89D84060CE2742C61C33C31A2EC01625C21524
            C1005676A95979AC597CAA547AAA6084B86B8FC27EA6D57F96EF282AC22A24E4
            241FE7221FEA261FED2620EC2121E82020E7201FE8201FEA221DEC221DEC201D
            EC211FEC221EEB241CEC261CF0251AF1251AF11023E0004AD936B1FF13BCF703
            BEE404AFD40AA0C01591AA42A6B876C2E073ABCF719ACD7194C9749BC97EA6C6
            80AFAD5482582B5D152F65112B640C41773173A38986ABC67199C26089C2567B
            C1486CBB4467B53F60AD3D5CAA3E5AAC415BB0455EB0455DB1415AB0425BB046
            61AD4E67B2647CC57189D17A8ED08395D64955A12A2C902D2898322D9B323190
            5863A87E8FCD8DA0DB8A9CDA8897D97884C16269A13A3D71383A733A3C743A3B
            6F3C3F686D789C9BB3E289A5D8829FD5869ED591A9CD607A60728E7F9EBAD998
            B4DA9FBADE9DB7D6A5BFD698B2B6ACC4CFAEC3D793ACAD718779ADC5DAA8BDCB
            6A7862899994A1B6DB98ABDA90A3D68B9ED28FA3D392A7D298ADD399ABD598AA
            D398ABD698ACD89CB1D7A3B8CA5F725C677967A4B7D698ADDB8FA5DA879DD087
            9ACD879CD48A9ED5859CD0839BCF7F94D0798FCE7A8DCE778CCF748CCA7590CC
            7691CB7B98CE7993CF788FCD7185C65F77BC5B6EC15366BD4D5FB93F4DBF3E4A
            BF3B47BF3945BF3743BD3542BC3340BB323FBB3447BE3447BC3148B73A4EBA43
            57C34962C55671CE607ED67490DC5A71BE2A3B7F0C1664081163111B643A4B8E
            728AE46685D95879D3496DD14E71D14C7BD55399DF51BAEE38CBF51DCDF90FCF
            FB07CFFA09CEF92FD8D72BA048439E124EA40751A9014BA7004AA8004BA6004F
            A80253A70056A80153A50352A60150A9004FA7004FA2004D9A00468C00428100
            336C00245400183D026787786D8DCD405FCC223FC6132AC10F21BE1221BE1221
            BE008CB7DF8AB5DD86B6D681B6D78CBBDF9BC3E8A4C8F05969D72D28D42A20EB
            251FEB211DEA201BEA201EEB1F1EE72020E7201FE8221EEB241CEE221DEE1E1D
            EC1E1FEA221FE8251EEA281CEF2619EE251AF10A22DD0A69EB2ABEFF0DC5FC03
            C6EF05BDEA06B0D90AA1C41493AB4AACBF86D5F198CDEB90BCE788B8E18CBFDF
            93C6DC99CCD171A6832C61182F6A0D2964072B5F165D91619AD0C39AC2DB88B6
            DB7FABDF739EDB7098D66991D6638ECF648BCE617DCE637FD2627DD0647FCD6A
            86CD758FD47F98DD566193283162242E6A252D7427297F2828852B2A872E2F87
            2B307A303A7C303B7E2E3876323A78353B79363977373A7533376E343A6A3B41
            696D779EA4B9ED94AEE48AA5E086A2DE89A2E293ACE0809DA25A745789A5B7AB
            C2ECABC4E8ACC6E4B0CCDE6A7F7162766BA9C3CF8CA29F677B6CAAC3D4849697
            6676608E9E9CA7BAE29DAFE397A7E094A4E093A4DF94A8E098ABE197AAE397A9
            E297ABE297ADE49BB1E39DB4D46F7E79636E659FB3DD98ACE58CA2E0899CDE88
            9BDF8698DF859AE08499DF8196DD7E92DD7A8FDC768CD8728AD5748DDA768FDB
            728ED86D89D67189D96B80D7637ACC6275CF596DCC5367CA5163C94D5ACC4C59
            CC4A57CA4755CA4653C94452C9404FC73E4EC43A50C63D54C8435CC94E66CD53
            6FD06280DC7591E2849BE84D64A50C1F5F0816640D156919226F5C70C17595E4
            6186DE597DDA5073D85278D85386DE54A0E559C6F33CCBEA1ACDF802CBFC03CC
            FC02CDFD00CBFF25D6E231AE663C9A1B4CA20B53A8014DA7004CA8004BA7004E
            A70153A70056A80153A60152A6014EA8004EA90052A600529F00529801448500
            397300295C0022470134512D83A4D45070D32E4ACE1931C81225C51B29C21828
            C100C6EAE7C8EBE6C1EADFAFE1DFB8E0E6BFDFEFA2B9F73038C32C27DE251AE9
            241CEE231DF0211EEF1F1FEC2120EB2320EB201FEA221DEC251BEF241BEF1E1E
            EB1E1FE8221FE8251EE8281DEC281AED271AEF0623D91281F61DC3FF08C6FE03
            C8F706C2F40DC0EF0AB6DF0DA9CD179DBE36A2BF82D3ECA3E2EEA4D7E9A9D7E8
            ADD7E8AAD6E5ABDCDD90CAAB40783A2E66142D680A2E680D42752D78A97CA8D8
            CBA7D3DE9FCAE292BCDE8FBBDD89B6D78CB5D789B1D58AAED08DAFD58FB0D293
            B2D699B6DCA1BBE1434D741E26531B265A1B265F222C6921296A232A6F252C6F
            2D34742E37762C3677313A7B2E37742E376F313C6D343E6E34426B60739694AE
            CCABCCEBA5C5E5A1BEE199B9DC97B7DD9DBAE0A1BFDEA7C7DA86A29E6173667B
            928A9FBEBBABCBC5A8C6BC6F86725C7061ACC7D09AB2B7A1B9C0B2CCE0819598
            687766899C98A8C0E2A0B9E399B1E095ADE198ACE299AFE299ADE29AADE399AD
            E397ACE19AB0E19DB3E0A1B5E09EB3D88592A599ABDB8FA6DF8CA2E08B9CDF83
            97DA8095DC8095DC7E95DA7B91DA778ED9748BD87289D7748AD8748AD7758CD7
            768BD87087D56A81D4677FD4657BD36276D25E72CE5B6ECF5B6DD16276CE6075
            CE5E72CB5C71CA5B70CA5870C85971C85575C54969CC5073CD5D7FD56B8DDA74
            94E1819EE7586CB3293375111B640817690B1C6A34478B6D87D7759AE4638CDC
            5F86DB5B83D95F88DC629AE15AB1E859D2F231CDE918CDF20DCAFA05CBFD04CD
            FE01CCFD00CEFD1FD7E13ABE7E3499234BA20D55A60152A40353A6044CA8004C
            A80050A70152A60153A70052A7004BA9004CA80055A80056A2004F9902458800
            3A75003062002049001638067D9DAC6788D4415ECD2742C71F33C31C2DC41C2C
            C500A8CBCCA8CDCBA2CFC9A6D4CEB2DAD9B5D3E46E7CF02228CD2420E1231BEB
            2319F0221BF12120F11D1CEB2420ED241EEA221EEB221DEE261CF0241BEF201E
            EB1E1FE8241EE8251EE8251EEA251DEB271AEF0623D91388F81ECBFF07C7FF02
            C7FC07C8FF05C1F40AC2EF08B8E40CACDD139EC82898B56CC9DC97E2E792D1DF
            94CBD899CDD798D2D69DD7D0ACDECA5F975E2D64122B64072E650E2D61135182
            4699CEA9A5D5CE9ECDD695C4D589BACF81B5C778A4C3749EC0749BBE7498BD76
            97C1849ECA8CA5CF849BCA4D61884D5F8A566A95566893596D965F6F9D5F6F9E
            5C6C9A5C6C9E5C6CA45D6DA56473A65D6C99617599758EB096B4DBA9CBE69FC5
            E19ABEDB8EB3D287AACD8BACD18DACD18FADD29AB5D7A1BCD6A6BFD79BB6BD71
            877B5E765F5D755A5D72586A7E6A95ACB5A8C4DEA9C2DEA6BEDEA6BDE4A8BFE4
            829395849797A0B9D99AB4D896AFD792A9D493A6D593A8D692A8D590A4D792A3
            D78DA1D58EA5D491A8D692A6D597A9D997A9D890A5D789A1D7839CD47E93CE80
            94D17D93D17D92D07B92D0788ED27289D0738ACF7589CF7086CF6D84CB6C83C8
            6B84C7667BC86378C95F73CA5C70C9596BC5586BC55869C65567C64A58C84A58
            C84553C64452C64157C53F58C1415FC14B67C75C80CC6888D67998DB809DE083
            9BE3344687112064131B69121A69152371475DAB789BE47097DC608DD65C86D3
            5986D55B8ED663A3DF64BEE84ECCE832CFE815CDF209CFFB06CDFC07CDFF06CE
            FF01CCFF00CEFE1DD7E140C88D3099294BA20E56A30257A40454A60450A8004E
            A8004EA70150A60352A70050A8004BA7034CA70153A70052A400479600458E01
            3F7B00356800265202183E064768567999D44D6CCB2E4CC32138BE1524C01625
            C1007096AF6E97AC6D9CB0739EBC81B2C98EB6DC424ED92123DF201FE82320F1
            221CEF211BEE211DF0211CED251DEB271CEB221DEC221DEE261CF0251CEE221F
            EA221FE8251DEB261FEB201FE82320EB2719F10922DB1186F621CCFF0BC7FF03
            C9FF02C8FF06C8FF07C3F507BFF205B7EF08B0E410ACD11BA2BF3EAAC96CC6E7
            7BBBDC79AFD174A8D077A9CF7DB0CD88BAC77BAD9A4B77422E6311326C0B2E6C
            06326C12578A5380B1A285B0CA7EA2D46B91C85C82C0547BBC4F73B94F6FBA55
            71BD6376BF6479C36B8ACB7799CF7EA2D582A6D98EB1DC8FB3DC8FAEDE93B1DE
            95B4DE92B0DE93B1DE95B3E099B4E19DB9E198B9E195B9DF8FB2DD88ABDA83A5
            D7779ACD7C96D07893CF7491CB7692CB8198CF8398D08DA1D68BA4D18FA8CF94
            ACD490AECB8BA7C292A8C497B0D196B0DC92ADDB90ABD993A9DB8FA7DD90A8DB
            94A8D58DA0C98A9DD8869BD78396D68392D57E90D47F91D47E90D37D90D47F90
            D67E90D47C91D27D92D38293D68090D68091D3788CD17289D17087D46E81D46E
            7ED26D7CD06F7ED26A78D06677D06878D26878D06576CE6272CB6475CF6072CD
            5A6EC95A6EC45569C44F61C14D5BC24C5BC14B5BC14958C04757BF3E4FC13E4F
            C13B4EC23D53C3435BC44563C24D70C65A7DCD6C8CD57D97DC7085D645529C15
            1F6710196F0E196F121E6C37478E7086DC7394DE6187DA5580D5567CD3567FD5
            558CDA5AA6E152C4F13AC7E72DD2F419D0F910CDFD09CDFE02CEFC00CDFB03CD
            FF03CCFF00CCFF1DD5E440CB8F2D992649A20E57A50156A60455A60157A60053
            A7004EA8004CA7014DA5034EA6044EA5064EA6044CA6034AA4014BA104438F00
            417D02336601215001143E061F4525799BCA4E6BCC2B43C5192ABE1324BD1224
            BD00A7CFE2A3CEE0A2D2E49ED1E69ED8EB97C0F62A32C9211FE62221EC201DEC
            241BEF241BEF221CEF2520EF271DEA271DEA241CEE241BEF261DEF261DED241E
            EA241EEA251EEA251FEB1E1FE81F20EB281BF00924DA1285F51AC4FF0BC7FF06
            CCFF04CAFF07CBFF0ACAFD0CC9FF06C3FE05C0F603B8E609B0D816A4CA30A5C1
            6FD1E189DDEE8CD4ED90D0EA92CEE899CFE7A7D4E5A9DBD26A9F6C2F68142C6A
            04316F082F681032651F6F9F789ACBC1A0CEDA96C2D98CB8D982AFD57EAAD97F
            A4D880A0D488A8D982ABD683AEDA87B1DF89B3E089B5DF8EB6E090B8E390B8E0
            91B8DF91BCE193BDE599C1E69FC1E69EC2E49DC5E598C1E298C1E495B9E193B7
            E095B5E28DAFDF93B2E394B3DF9BB6E19EB7E1889BB79FB6E1A2BBE59EBCE19F
            BDE39CBCE49FBEE5A4BEE6A4C1E6A1BFE59FBDE5A0BCE49EBAE29DB7E39CB5E5
            A2B9E6A0B6E59EB5E59CB3E59CB1E497ACE094ADE095AEE298AFE197AEE297AF
            E398ADE496ADE097ADE295ABE398ACE395AAE18EA5E08AA4E188A3E089A0E086
            9DDE8AA1E0879EDD899FDF859AE08397DF8196DF7F95DA8297DC7F93DB7B91DA
            778ED87186D46A7CD36778D46472D25C6CD05B6BD0596BCF566AD05069D05269
            D2536DD35B76D45F7FD6698ADA7799DF84A2E5859EEB5F71BA172369121B7111
            1B74161F751A2977576CBD7E9BE9789BE36C95E06092DE5991DD5B97E160A5E6
            63BDEE59CBF136CCEC1ED0F80CCBFB02C8FA09CCFE04C8FA02CEFC01CDFD02C9
            FF04CBFF03CCFF23D7E741C98C2D97234AA30F54A70253A80151A60054A60054
            A8014DA6004BA6004DA50350A60452A50450A6034BA70447A502429900459202
            3D7B003267012353021540040D350B6D909F5C7BD33752CD2237C71A2EC7192B
            C600ABD4E4A6D2E0A3D3E2A9D8EAA9DCEE97B6F92A2BCA261FE92620E8261FEB
            281AF2281AF2251EEC2321E82522E52520E8261DED281BF0261CF0241CEE221E
            EB2320EB251FE9221FE81E1FEA1E1FEA241CEC0424D3057AEA1BC5FF0AC7FF08
            CBFF0BCBFE0CCCFE09C9FC09CBFF06C8FF04C7FC03C3F607BDF00EB9E912ABD5
            1FA4C144B5CA78D6EC95DDF09AD7ECA2D3EA9FD3EA9ED1E1ABDBE19AD2B95E93
            5B2D6111366C0F376D0E356C123B7025659864A3D8C3A3CED89BC6DB92BBDD8F
            B6DD89B0D688AFD485ADD881ABD983AADC85ABDD8BB0DC8CAFDB8AAED789AFD7
            8DB1DB8AB4DD91B6E293B6E49BBBE48EABCA849FBE9EBEE39EC0E48BA7C689A6
            C49FBDE59BB8DE9AB4D7A1BADBA1B7D5ADC2E466717B8699AFA0B8DBA5C1E89D
            BAE09BB8DCA0BFE3A4C1E5A4C3E49FBAD795ADC89EB7D8A2BCE49FB9E59EB7E5
            A0B3DCA3B6E2A3B7E6A3B8E6A1B6E39AAFDC9BB5E39CB7E39EB8E4A0B9E494AA
            CB94A9CBA4BAE59EB4DA9BB0DB9DB0DE9DB0DC9AABE28E9ECB899AC78EA0D293
            A7E093A5D98494BF8B9ECD90A7DE90A8E18298C78398C38C9ED18DA2DB8698D0
            7A87B97786C4798AD96F80D46676D26175D45D71D25C73D25A74D15776D25D7C
            D56182D9688CDD789AE186A7E588A1EA5A69B0212A761C2378161E7C15208117
            27794A5FA27D9EEA7FA3E7719AE26F9AE06B98DC669DDD60A8E45DBAEB58CBF6
            40CBEE28C9F419CBFD09CBFF02C9FF00C9FD05CBFD04C8F908CBFF04C9FE04C8
            FF05CAFF06CAFC2AD7E23AB97836992246A10C4EA80050AA014CA8004BA8014A
            A6024DA50250A60353A70053A70054A90052A8004BA6004AA402479B04448E03
            3F7D023469002654001B42011033035577726485D53958CE223CC71625C31420
            C40087B0B886AFB985B3BF89B8C993C2D787A0F02C2ACD271DEA281FE8281EEB
            281AF2281AF2261FEB2520E82322E62320E9261DED281CEF281BF0251CEE221D
            EC2120EB221FE82220E71E1FEA201FEA241EE80825D10064D723BBFF09BEFA04
            C5F509C7F40DCBF809C9FB09CCFE07CAFF05C9FF07C9FF08C7FD02BEF10CBFEE
            16BBE51BADCE2DA8BE5ABDD280D0E588CCE187C9DC8DC8DA8BC7D796CED3A6D4
            CC79AB7F4C7F39376E153B7514387413366E194578327FAF82A1CEBAA0C3C78E
            B8C187AFC27CA7BB7BA0C26E96C56A8EC36C8DC16B8CBF6B8CBC6A8DBA6B8DBA
            6F90C07292C67698C67D9ECA7A96BB48585F5866778AA1C888A0BF51646D5063
            6987A1BB8AA2BA73849067757D636E75A7B9D55E6A715B68715E6F7A95AED680
            96B38096AE97B3D797B4D799B3D26A798270818D68777B9AB2D79AAFD99CB1DB
            7E8B9C91A2C0A2B7DDA1B6DC91A2BB8899AF9AB1DB99B2D99CB5DA8193A47280
            8A8291A0A7BBDD7887978492A78695AF7C899D9CAFDE788398515B5F8091AF95
            A9D76775856977874E5D618BA3C8849ABA5060674C5A5F62717D92A8D35A697A
            5762744D56656F84CF667BCC5A71C84F68C0516AC4586FCB5876C95F7DD06686
            D46F90DB7E9EDF839EE9697CC52E3A8122277F2427871E23821F2B8430429561
            7DD184AAE574A1E16594DD6397DB5D99D95CA3DE5DB2E561CBF046CAE436CFED
            1ECCF40FC9FA06C8FD00C4FB00C4FB01C6FB00C4F605C8FA04C3F908C7FD09CB
            FF07CBFD0CD1FC2EDAD834AF5D3D9D1849A40A4BA7004DA9004BA90048A70049
            A7034FA50353A50355A70055A80053A90052A9004EA8004CA402499B04458F06
            407E033469002953001B41001132025273686689D33A5BCB223CC20E1FBD0F19
            BD009EC2BF99C1BE99C4C594C1CB9FCBD9829BEC2C2BD0251DEB261EEC261DED
            261CF0261CF0251EEC251FEB231EED231EEF261DED281CED281CEF251CEE221D
            EC201EEB201FEA201FE81D1EE71D1DE4211DE01122CE0040C02DA2FC11B7F103
            C0E805C2EA09C5EF08C8F408C8FA06C8FD07C8FF07C8FF07C7FA0ACCF905C6EF
            05C0EA10BFE91AB7E01FABD12DABC950C0DC75D2EC7FD0E48FCFE298CEE09DD0
            D8A8D5D5A3D7C87BAE863B6F2A3971193F7B133C750D3E78154379226B9C5A99
            D0A897CAC78CBFCD86B5CA79A1C8779DCB7597C86E93C46E8FC36C8DC26F8DC2
            6F8EC16F91C37796C37F9DCA546D786E8BA293AED096AFD36D879A84A3BE819E
            B36E879492A9C16F7C8767717868747CACC0D965757EA6C0E17A92A989A4C481
            98B47D92AC99B2D998B2D99CB3D46B77808494AA6C7881A0B5DAA2B8DEA2B6DE
            7F8B998C9AAD9CAFCAA6BCDC909EB08696A99FB5DBA4B9DFA5BBDF6E797F737F
            8479848EAEBEDB7F8B998491A48B97B07883949FB2DF8FA2CA65768795AEDC93
            ACDA64748276869D59676C94A9C874869C8698B18795AF5F6E7995ADD552646E
            6C829D526377718BD26B83CE677EC9677BCB687ECD6982CD7592D67797DB82A1
            E086A0EA5F72BD2C3B89272C8B22258C27279724288E2C3788667DC689AAEA81
            AAE56DA0DE689FDB6EA2E066A9E25BB5E75CCCF241CDF32ACBEF25D2F717CDF2
            0EC9EF0CC8F005C3EF02BFEF04BCEF04BCF301BBF301BEF405C4F405C6F606CA
            FC08CDFC0AD4F128D7C42AA33847A40A4EA8064FA7004EA8004EA8004DA6004E
            A70152A50353A50355A50355A70053A70052A70050A8004CA402489A03458F06
            3F7D033366012750001B40001233034F70636E90D54163CD2743C41123BE101C
            BC00BBE0E5B5E1E2B4E2E5B8E5EDB6E3F0829AE82A2BD0241CEC251DED251DEF
            251DEF251DEF251EEC251DED231CF2231CF2251DED261EEC281CEF281CEF221D
            EE201DEC201EEB201FEA1F1EE71E1EE0221DDB1920CB0327B32373DB1BAAE501
            B1D702B4DC03B8E104BDE706C0EE0AC3F60CC8FB0BC9FB08C9F906CBF60AD1F9
            05CDF903C7F60BC4F50EBDEC11B6DE20B3D62FABC75CC9E17FE1F689E2F397E3
            F1A1E3F1ACE5F0B4E7E7A6E0BE61985A3C751E42801844831644821646811A47
            7F2875B47C98D6B7ACDADCA2CFDC99C5DB93BDDC90BBDE8BB4DD8AB2E08BB3DD
            8AB1DB8BB1D992B7DC96BDD94B606395B9D1A2C5DEA1C6DD7C9DAD7B9FB37392
            A37793A69BB5CD68767C5660637A8791BAD3EB5E6E7499B4CB778D9D94B0CC8B
            A0B9717F8C93AAC491A4BCADC5E796A5BF7A8696677279ADC4E6ADC5E7AEC6E8
            8795A277838C6E7B80A2B7CB9AACBD727E84A1B8D591A5BAB1C8E979868D95A5
            BA717C81ACBED87F8A987F8B9B6E7B88768391ABC2E98CA1C06779869DBAE59C
            B8E58DA8C96D82934D5D5D99B3D28093AB7E90A5808FA462707FA3BFE986A1C3
            5B72884E647683A6E07EA1DD7D9FD981A1DD82A1E292ACE59BB4E991AAF06D82
            CB3846932B3590262E93272A98292D992730915062B98DABF397BFED8CBDEB7D
            BAE96EB7EA68BAEB6DC3EE6CCEF454CEF03ACAF020C8F50FC7F50AC4F106C1EB
            0BC1E60ABFE404B9E005B6E004B1E102B0E305B6EA00B7EA06C4F004C6F204C7
            F80CCCF319D6E420C49C289D214BA60051A90152A7004FA70050A80052A60053
            A60152A50353A60555A50455A50353A60152A70050A8004DA300489701448C03
            3D7702316302264D001B3F021233044C6D5C7296D74568CF2C49C71A2DC31C29
            C5008DBADD89B9D98BBFDDB6E5E8B8E7EE8BA8F1272ACF231EEF211EEF211EEF
            231EEF231EEF231FEC231EED251BF2231DF0231FEC251FEB281CED281CEF241C
            EE201DEE201DEE201DEC221FE8221EDF231FD9211FCC141AB61441B82394D606
            9BC407A4CF03A7D306AFDA05B3DF07BAE508BEE907C4EC05C6EF06CBF600C8F3
            00CAF801CDFD01CAFA04C9F809C7F30CC1EA13BAE218B3D821B2D341C3DF6EDF
            F18DECF09FEAEDACEBE7B5ECE4BBEFDE9FDAB566A26838762140821A4A8C1547
            8A1144871C428225629C529BD2A1B7DDD4AFD7DBABD1DFA5C8DCA3C5DA9DBFD5
            9FC0D697B3D79AB4D99BB7DB66757E839BAB9DBFD89DC2DB97BED454717A5773
            7CA1C7DC9AB7CA5E6D7267777A899FA6B3D2E16E80875E6E737F93A1ABC3DE99
            ACC375808D6C76829BAFC9ACC0E398A6C0757D8B93A1B8AEC2E3AEC3E3B0C6E5
            7E8C98A9BED994A8BC8598A9A7BEDA8295A56C7B8392A5BAAAC1E094A7BA7482
            888EA0B1ACC3E18C9EB074838E74838F92A5BEA1B8E273849475879A98B1D798
            B3DB98B3DA5D717E6F859A9AB5E193AED6687B8C57646C6677879BB4E388A4C8
            526A797693B08FB3E38DB0E48EB2E491B2E59BB7E98C9DED5E63BA3C3DA03736
            A42F2FA52E2FA92A31A32D399B5E74C693B3F3A3CCEF99CBEC8EC6EA8BCBE97A
            CCEA6ED5ED5BD7F540C8EB33C7ED26C6F31AC1F116C0ED13BDEA13BCE711B8E2
            0EB3DB09ADD304A6CD04A6CD02A2CF02A6D204AED505BADF00C0E703C8F30DCB
            F81ACDEB39DCD61DA56A339C1A4DA70052A70054A90152A80053A80059A60059
            A50153A50353A60555A40655A50453A50352A6014FA7004BA100489701428902
            3A74012E5E02254B01193B020F2F034A6A606E90D64163D02643C61C2EC41929
            C2005E7DAB5B7BAA6186B1749EBE83B2CE7F9CE9262ACC221DEC1F1EEF1F1EEF
            211EEF231EED231FEC231FEC251DEF231EEF211FEC2320EB261EEC281CED251D
            EF221DEE201CEF201DEC251EE8241DDF201DD41F1BCA1F18BE0C20A72373C21E
            92C40689B2008EB40598C1059FC706A8CF04ACD206B5D905BADF03BEE801C1ED
            00C6F200C6F400C7F500CCF702CDF803C9F506C5F20DC2EF0FBFE916BADC28B8
            D342BED563CBE081DAEE89D8EC90D6EC9AD8EC9CD8DA80BF9A55944B44852145
            88174D901851921E4F8D244D852C66975A8EB99B9BC2C49AB5D08BA7CC809DCB
            7792CA7490CE748FCD738ACB6D80B447566453697E6C8EC46E91CD7190CD7492
            CE7B97D07F99D0829CD087A1D1869FCF86A0D0859DCD859CCD8C9DD28D9BD189
            9ACF8898CE879AD0879BD18695D28C98D58B98D38D9AD58C9AD28D9DD490A1D5
            7580946F7A896674807B8CAD8DA2D98A9CD48B9CD48C99D48A9AD3899CD38A9E
            D38DA3D78DA2D88EA2DA889ED5899FD7879ED68096D7768ABB707FA67B8CD27A
            8BD3768BD5708AD36E87D1788FD77F95D88299DA7A8DB25F71878FA6E08BA4E0
            8BA5E28DA9E385A3E38CABE690AAEA839AEC5E6DBF3F46A33B3AAF3933B43632
            B03535AC343CA94B5BBC7693EA94C0ED95CDEC85CBEB78C6EA76CBEB71CDF069
            D0F147C6E435C5E821C4EE15C2F20EBFF10BBAEA10B6E211B2DB12ADD50EA6CE
            079DC30397BD0294B90094B90095BD009EC503A8CA05B7D801C1E809C9F01BCD
            F534D5E246CEA723973B40A1144FA70051A60054A90152A90052A9005AA80059
            A60053A70052A50353A50455A50452A40252A50050A4004A9D00479401408300
            366E002B58002047011637020C2B035270676989D13D5BCC243DC21025BC0F1E
            BB00C1E2DDBCE0DBB9E1DA97C8E0A0D2EA8CACF3272BC7221FEA1F1FEC1F1FEC
            1F1FEC211FEC2320EB2320EB251FEB231FEC1F1FEC2120EB241DEB261EEC261D
            ED241CEE201CEF221DEE261CE9261DE11E1DD61B18C91F17C51016AC1D4BB24A
            9AE02188AB0F849B0983A20585A70990B50897BB0AA0C50DA9CE08ABD509B4DF
            06B9E402BBE503C2EB01C4ED02C4EF06C9F408C7F40DC8F40FC6F210C2EC12BF
            E51BC0E421BCDC25B5D147C4E667D3F584E0F596E1F4A4E1EFABE2DF97D1B66B
            A568538D2C589420599A205A9B205D9A245A932861923A81AC6DA5D2B6A6CCD7
            9AC2DB97C3E295BFE595BDE896B5E4839ED27795C285AADB88ABDC87A1DD89A2
            DE88A0DB88A1DE8AA6DF89A6DD8CA8DF8DA8DC8CA4D894A7DE91A3DA92A2D994
            A5DD93A7E08DA3DC8FA5DD92A6DF93A6DE96A7DE95A8DD96A7DF97A8DE9BABE1
            9AA9D8909FCB91A3CE99AEE294AAE197A9E397A7E294A2DC91A3DF8F9FDF8FA1
            E08CA2DF8AA2DD89A2DE8BA1DF86A0DC87A0DC89A1E17D93C77286B0839ADD7F
            96DA7C94DE7E96DE7B96DE7C97DD7E9ADC86A4E188A4DA8FABDE92B3E996B7EA
            9CB9EC9EB9F09CB1F3707FE04F57C23C41B54346BC3939B73B38C03F3CC03D42
            AE5A69C289A4EF9DC6F295C9F18BD0F176CEF16AD4F458CFF84ACAF03EC3F030
            BCEB2ABFEC1DBCE716BAE50DB4DF05AED906ABD506A3CC039CC10193B8008CB0
            0084A90083A90086AB0089AE0091B5029DC106AAD005B5DD0AC3ED13C8EF2BC7
            E94BD3CF3FB05B3D9E174BA40A53A70250A80050A90051AC0052AA0056AB0055
            A90053A80052A70053A60153A50352A50051A4004FA100499900448E003C7B00
            3267002652001C41001332020D2908627F846584D33C5ACE263EC6172CC01727
            C000DBF5F3DBF7F5D7F8F0C1EEE7BFEEEEA7CBF6292FBF2421E22121E81F20EB
            1F1FEC2120EB2320EB2320E9251FEB2320EB1F1FEC1E1EEB221FEA251FEB261D
            ED241CEE201DEE221DEC261BEA271FE52321DC1D1ED2201ACF1818BA0A1D9B64
            91E88CD9F856AFC72D8CA611758F0C7A95077F9C0887A5088EAF0A96BC079AC3
            07A4CD06ABD301AFD702B6DD04BBE504BCE80AC1ED0EC4F010C5F214C8F511C8
            F60DC6F10EC5EF17C5EC22C0E433BEDF46BFDE69D1EF83DEF694E6F6A2EEF5AA
            EEE495D9A270B15C549730599D275DA2205FA31F639F255F972D5B903D7AAD6E
            9ACEA1A8DFC6ACD8D8ABD6E1AAD2E6A5CDE5A4CBE59BC2E09DBCDF9EBDE19EBA
            E09CB9DF98B8E095B9DE96B9DE97BADC97B8DA9AB5D99CB6D59FB6D69FB6D79F
            B7D99DB7DB9AB6D99EB8DD9AB4DB9FB5DC9EB5DB9DB5DB9DB5DB9EB6DDA3B9E0
            A5B9DFA3B8E1A1B9E0A1B9DFA0B7DD9CB3DB9FB1DBA1B1DD9EB1DD9CAFE096AD
            DB98B0DE96B0DD95B1DC93B0DB93B0DA94B0DD8DA9D78EACDB8CA7DA8AA3DA90
            A7DF8EA6DC8CA7D98EACDB8DACDF92B2E398B7E7A1BFE9A5C1ECA9C5EFA8C3F3
            9AB0F87483DC4E55BD494CC83E3CC74340CE3C3EBF3D43BC3D44BB5164D07999
            F896C9F492D0F389D8F27ED8F46AD3F15BD1EE42C5E134C3E723BBE61CB7EC15
            B4EC11B0E110AED90BA7CF08A2C6039BBF0191B6008CB00084A60081A2007D9C
            007999007C9C007EA00387A80D96B417A3C31DAED226BADF28C1E33CD0EC51D4
            E758CAAB36951F4CA4074FA50352A90351A9004EA70053A90053A90056AB0055
            AA0052A80052A80053A70053A70052A50051A3014E9F014994013F8300387200
            2D6000224C00193D00102F05102C10728FAB607CD73A56CF263DC81829C31928
            C4007296D57196D3719BD297C6CF9DCFDAAAD0E74D58D52023CF1F1FE1211FEC
            2120EB1F1EE92421EC2421EC261FED251EEC211EEF211EED2320EB251FE9251E
            EC241CEC201DEC221DEC241BEB261FEB221FE0201FDC1E1CD91B19C81919B113
            1D907DA2E6A6DEF09DE1F17FCEE0469EAC1475830970870A7893047B9A0785A7
            048CAE0290B60299C104A0CA07A6D10BAED909B0DA0DB7E112BAE711BAE811BC
            EC10BFEE0FC4EF13C8EF17C9EE1AC7EA1EC3E628C1E434BFE240C0DF58CFEB75
            DEF194EAEFA3EAE099E5B96EB66D599D3962A53162A42A62A22661A12B60A02E
            5E9D315D9A3B80BA70A5DCAAB3DBD3A7D4D69ECCD898C4D999BCD897B6D897B4
            D693AED48DAAD387A8D084A7CE86A4CE88A4CE8AA4CC8CA5CB8EA5CB8CA5CC8C
            A5CE8DA6CF8FA6D28FA8D191A8D091A7D192A8D091A8D28FA7D291A8D394A9D4
            96A8D590A3D591A5D791A4D58E9FD18C9DD28D9DD4889BD4899BD5899DD2889D
            D3889ED2889FD0889ED1889FCF869FD1879ED48097D78098D67F98D78098D781
            99D8899DDA8BA1D98EA9DA90AFE094B4E39FBCE8A7BEECA0B1F47B89EF555FD0
            4D53CD4B4DCF4C49D34C45D54A42D44443C83F4AB15D7ACF84AEF490CBF183CE
            F171CAF45DCCF74CC9EE3BC6E22FC2DF28BDDF23B9E11EB5DF16B0DA10ACD40B
            A6CE0AA1C70999BE0A91B5098BAB0483A4037A9A01739100728F00708B00728B
            00738E007B960484A00C8EA81E9DB535ABC54FB8DA62C4ED6BCDF275CDE47AD7
            AF3A9328499D164BA00550A60350A8004EA80050A80053A50357A50159A80057
            A90056AD0053AA0053A90052A70053A50051A1004C99014489003D7900346900
            2654001D4500163A030F2D072B45377E9AD64F66CE2D43C71B2DC01426BF1426
            C1005779B1567AAF577EAF5881B36693C27BA4D26F83EE2129BA2524DD2421EC
            201DE82723F0201BEA251DED251CEC251DED231DF0231EEF251FEB251FE9231F
            EC221EEB221EEB221EEB231BED251DED231EE6221FE21F1CDD1D19D32016C41F
            19AB212A8F7A95E2A0CCEB96D0EB8ED5EB80CFE550A5B72D8698167285076A81
            0570890B7D9B0782A30686AB0990B60996BC0B9CC40DA1C90FA6CF11ABD617B4
            DE17BAE313BBE30FBCE20FBDE210C4E813C6EC16C4EB1FC2EA28C1E932C2E940
            C1E555C5E166CDE078DCDF80E1D378D5AC61BC794FA44D4FA33A56A73159A62A
            60AC2963A92C61A2345B983C71A9648EC4969ACAB39EC3CD97B7CF8CAECD87A3
            D17E9AD07895CE728FCB6E89CA6C84C86C82C86F84C76E83C66D80C36F80C66F
            7EC7707EC9727ECA737ECB717EC9727FC9727DC9727EC9717EC7707DC9707DC9
            757FCA7683CB7284CA7081C76F80C66F7EC86D7BC96E7AC96E7BCA6C77CD6B77
            CC6B76CB6A77CB6B79CB6B7BCC6C7ECB6D7FCC6E82CF7185D27489D4788FD581
            95D78697DB8D9FDD96A8E19DB2E79BB1F0919FF3727ADC5559CB4F54D74C4FDE
            484CDE464CDD3F48D43846CA3F52D0607DF176A5F479B9F37AC8F46ECBED5CC4
            E54BC1DF3ABFE12BBBE01BB4D713B2D512ACD410A6D111A2CC119EC50C9AB80B
            92B00A86A508819F087A98077290056C89046D87036984016681006A8605718A
            0C79901484992593A639A8BE4FB8D764C4EE75C8EE81CAED8CCAD888CDA45099
            26529F0F4E9F0B54A70C50A70150A80050A80050A80053A50354A40256A50056
            A70053A90051A80051A70050A50050A1004C9A00488E02407F02386E00306000
            234E00193F000C2E000D2908617B836C87D4445BCF283CC61B28BE1221BD1221
            BE00DAF0ECDAF0ECD6F0E77FA9D785B3DF8CB8E799BBF13C49B82221CC261FE9
            231CEA221AEA261DF1231AEE271EF0241BEB241BEF251DEF261FEB251FE91F20
            EB1E1EEB221EEB221EEB1F1CED211EEF241DEB241DE7231EE3221BDD2419D821
            19C91A1CAE1523967695EF9DCCF59CD6F394D7ED96D6F091D7EE87D0E46BB3C5
            3E899B15677B0F68800D718B08768E097B961085A50E87AD0D8EB40F97BC14A0
            C115A4C517ABCB17B0D21AB6DE16B6DE17B7DE1BBBE01FBDE322BEE423BFE82B
            C0EA33C2E73BC8E839C7DF3FC9DB4FD5DF5DDFDF59D3C348B98B39A15148A641
            56AA345EAA2C67AD316AA93366A53563A037639C3E78AC6293C38FABD9C4A9CB
            D99BC1DA94B8DD90B1E18BA9E187A4E0849DE0829ADF8097DF8099DE7F96DF7C
            96DD8194E08294DF7F92DE7C92DB7F91D97F90D87E90D88090DA7D8ED97F8FD9
            808FDB8694DA8495DB8093D88193D78292D88091D6808FD98392DA7D8BDD7E8C
            DE7F8DDD7E8EDE7F91DE7F93DB8296DC879CE18AA3E08CA6E290ACE696B1E79A
            B3EBA7BAEDA6B4F3959EF9767BE25D60D35959D95857DA5755DF4E4FDD484EDC
            414CD8344ECD325CC9518EEE64B0F964BFFA58C1F64CBEE541BADA3BBBD532B6
            D22CB2D227ADCF1FA7C71FA8C61BA3C11499BB1190B3108BAC1186A40F7E980C
            76900B728E0A6A8608658108668207687F05677E046882076A89086C8D187B98
            3390AD57AFCD6FC0E678C3ED7ABEEC80C2EC8ACCEB96CDDB88CD95549823569E
            0C57A70651A409499F0250A80052AA0053AA0053A90051A80051A60052A50052
            A50052A70051A70051A60050A3004E9D004A92014485033C7303316100255100
            1B42001336001131051C372087A4D35E78D73B51CD2637C51D2BC11929C21929
            C200E1F6EBE1F6EBDEF4E7AFD7E0ADDAE3AEDDEAB6DFF07C92E11F21B2231CD3
            2720E4251EEA2119EB2920F4241BEB261DED251CEE251CEC261FEB2320E91F20
            EB1F1FEC241EEA241DEB1E1DEE211DF0251CEE271BEC251EE8241EE6241AE521
            1ADC1C1ECE1A21BB132199708BE7B0D6F6B0E1F2ABE1F0A3DEE7A3DEE89FDAE9
            A2E1F095D5EB69ADC04894A32F8290186F7E156E85116F880F759014819C1487
            A3108BA51290AE189AB9159BBE139DC116A3C51AAACC1FB0D11FB2D61DB4DA1D
            B7DE20BAE122BDE524BEE82CC5EF2EC4EC32C3E13FCDD951D7CF58D4B14ABB82
            46AC5E4AA74956A73F5DA83667AD336CAF336EAE376CA73A669E416CA0537FB1
            779DCDA4ABD7BDB1D8D5AFD1DAAACADEA5C5E1A1BEE49CBAE397B5E196B6E196
            B4E493B1E092AFE393B1E394B1E398B0E295ADDF94ACDE95ADDF94ADDF94ABDE
            94ABDD95ADDB93ADDE93AEDD91ACDD93ABDF95ACE093AADF95AAE091A7E18FA6
            E091A7E090A8E091A9E394AEE496B0E69AB4E8A1BBE9A7BFECADC4EEA9BDF5A5
            B6F48590DD696FCD5B5CD05957DB5554E55553E54E4FDE4A52DB3C50D03455CC
            3B65D54781E155A3EE55B5EF4EBAE23FB6D734B4D62BB1D025ACCC22A9C921A3
            C41D9EBF1A98B51994AE168BA61587A114809D127A9511728D106F87106E8411
            6B820F657E0D647B0C667D0D657B106678186C7E2A7A923C8CAC53A4CA5FB0E5
            68B7EB6BB3E972AFE775AEE084B6E390C1DB9BCFD070B97952981D59A30C55A3
            0053A50051A60751A90750A90052AA0055A80055A80052A90050A90052A50351
            A40352A60151A6004FA2004C9D014994024285013C76033465012A5400224700
            183C001433030D2A06526D677593D84B68D23046C82334C51F2DC21C2CC51C2C
            C5005F7BBF5F7BBF5F7ABDA5C6C3A2CAC6A5D0D0A5D3DAADD1E83E47B32121B8
            2521D0251FDF2821EB221AE8261FEB261FEB251DEB251DEB251EEC2320EB211F
            EC231FEC271CEB251DEB211EED211EEF261CF0271BEE261FEB241EE8211EE91D
            1CE5171BDD161CD1181EC3171FAA3A4CB597B3F2A6D1E9A6D7E4A1D3E09ED3DD
            9FD2DD9CD2DF9BD3E09CD7E39DDBE78ECDD768ABB5478B962C727E1F6A7B1B6F
            871A7792137A99127B9B1484A1198CA81D93AF1A95B11898B5189EBA1CA4BF1F
            A7C421ABCD22AED424AFDB25B1DD27B4DB2ABADB2DBFD72FC3D336C6D33FC9CE
            4ACEC548C0A240A874459F5357A54262A93669AA336EAE356FAD3971AC3E72AB
            4470A64970A14E81B16993BF86ADD7B1B9D8D0B3D2D5ABCCD8AACADEA5C6E09F
            BFDD9CBFDE9BBFDD95BBDC97B9DF9BBAE09CB9E099B8DF98B8DE99B8DE9AB8DC
            9CB8DD9AB5DD96B4DD92B2DC94B3DF93B2DD93B3DD90B3DB94B5DD96B7DB97B7
            DE99B8E09EBBE39FBDE3A3BFE6A7C2E7AEC4EBA6B7F3919CED7880DA656ACF5D
            61CE5D61D5585AD55B5ADA5957DB5150D84C50D43F4FCB3656C43673CE4697E1
            4DAEE943AFE041B2DC36ACCF34A8C734AAC9269CBF2298BA2293B52190B01F88
            AC1D83A5197F9B198095187A90167489156F86147086126E81116A7C10657B0F
            637B18687E1967791D6B7A317B8C5397AD72B1D47CB7E877B0E571A7E26EA4E0
            69A0DF639ADF6DA1DC7DACD58FBBD093CFAB5FA746529F1754A40853A70056AA
            0552A80550A30250A30150A90050A80055A50455A50453A80151A90150A6034F
            A50350A3024D9F014A9A02459104408603377502326501285400264B05193A00
            173606122E08203C237897BC5877CE324EC12137BE1A2ABC1826BA1522BE1522
            BE006582BE6582BE6582BE7093AC6F96AE74A0B67FACC38CB7D1839BE9242E9D
            2224B62420CD1F1AD8241FE42822EA231CE6251EE8241EEA241DEB231FEC251E
            EC261EEC2C1DEC291CEB231FEC211EED261BF2271AEF241DEB2320EB1F1EE91F
            1EE91C1DE81A1DE1201FDC2121CE1C20B22832A76E84DE91B2EA96BEDF8CB7D8
            83AFD582AED480ACD182ADCF85B1D480B0D383BBD984BFDD84BED870A9C05593
            AB3E849E2C799420728A25798D1C76891A788D197F9319849B1989A11A8EA11B
            93AA1C95B31D96B9219CC3209FC520A3C722AAC922AECB23B2CD24B2D225B6D4
            31BCD43FC1CB4EC5B655BD9952AF7653A85C52A1495AA44265AC406AAE3B6EAF
            3874B13B73AD3E75AD4775AA4D76A85781B16E96C18DACD2B1AED5C0AFD5D1B0
            D2DCA9D0DBA4CDDE9FCCE299C8E396C4E592C3E690C4E58BC2E489C2E389C2E4
            8EC2E58ABEE587BDE689BCE68DBFE68FBFE78EBDE790BFE796BFE99AC3E89FC3
            E9A3C3EBA7C1EBA5BBF0A1B1F58F9BE47A84D46B70CB6265CF6060D65D5CDD5A
            5AE05559DB4F56D34752CA4252C44058C34262C84975D25190DE4BA3DE3EA8D4
            34AAC92EAAC22DA1B82B9DB32896AF268EAA248BAC2185A72082A01F7E9B207B
            982178941D748A1D72851E70841B6E801B6A7D1D69791D6773216B772D76883D
            839A4F90AB5E9DBA6FAEDA6FABE668A0E26495DF6490DC668DDB648BD5608CD0
            6492D0719FCD82ADCA8BC7B47DBE82559B30509C0F50A20053A8004FA80048A1
            004EA60351A60056AB0350A80050A70153A30755A20853A50452A5034EA4024B
            A2034E9F034A9903448F043D85043578042E67012957012349001D3B01183203
            0C26000D26097A97A56A89CC4262C82A46C51C32BE192ABC1928BC1622BE1622
            BE00DDF5ECDDF5ECDDF5EC96BCDF94B9DE8EBDE093C6E291C8E79FCEEE7490D7
            1C27981C1FB42322CD201BD7201CDF241FE42420E52220E7201EEB231EED281C
            ED2C1CED2F1BED2C1CED251FEB221EEB261CF0241BEF201EEB2120E9221FE824
            1EE82320E92220E71F1CDB2320D72624D22828C82125B92D39B86E87EE98BCF4
            A5D0EF9BC9EC9BCCEA97C6E892C0E596C5E98EC5E68DC5E68FC7E991CAEB96CE
            EC99D4EE98D2F18CC7DF75B0C35292A03B818F2B7686237688227B8D20809121
            859A1E87A41F8AA92091AF2094AF2198B0239DB4249EB5249FB625A4BC27A9C1
            2EACC433B0C53DB7C643BDC446BFC055C6BC56B9A64AA47C4C9E5B59A44A68AD
            3F74B43C7AB74077B43F77B74577B54878B5497BB64F7DB5547BB15B84B86E8A
            C48594D6A493DBB696E1C692DED48FDDE486DAEB7FDAF278DAF373DAF372DAF1
            76DAF276DAF077D9F47BD9F87FD7FB82D4FC8BD6FC8FD2FD93CCFE93C2FE8BAE
            FE7A92F06A78E05E65D16362D56461D5625DD3605BD25F5CD4605DD75D5BD553
            56CE4A54C2465BC04061BA3F70BD498ACC529ED54AA1D1419FC73B9FC4329CBB
            3096AF2E96AC2D91A62B8FA32988A02686A0237F9A227D9620779220778D1F77
            852378852474842A73842B6F832B6D7E3575814B8894669EB17DB1D282B7E582
            B4EA7CADE775A4E6719FE36D97E26B93E16590DD628CDD6590DC6B98DB72A2D1
            85AFD092C4BC7BC17C519D2D4799144BA00D50A50652A8054AA5004DA80251AA
            0450A8004DAA004CA90050A80052A50452A20652A10756A10652A004489D0244
            9B02459700428E013984023276022A6802245900214C001C3E00183400152D06
            142B0E5C75727999D15973D33457C82642C72136C42130C32131C31F2FC21F2F
            C200E2F4F1E2F4F1E1F3F0ADD4E2ADD0E2A8D1E29ED0DFA5D6E8A4D9EBACD9F1
            6E85D51A25961D21B21D1EC4211ED5201DDC2522E12421E4221FE8251EEC281D
            EC2C1CED2D1BED2C1DEC261FE9241EE8261DED241CEE201DEC211FEC241EEA25
            1FEB231CEA2620EA2521E42421DF251FDD2321DB2726DB2226CC232BBB3847BB
            667ED694B2F6A9D1EFA7D1ECA2CCEB9ECCE99DCEE799CEE798CCE796CCE697CB
            E799CDE6A1D0E7A2D3EAA3D7ECA4D9EEA2DBF18DC8E07BB9D072B6CA62A8BA48
            94A7378AA12A82992B859A2C8A9E298EA12892A32896A82A9BAF299BAF299CB1
            2DA1B82EA4BD2EA8C32EABC92DB0CD35B6CD46BBCA59C6C45DC3A95FBD8B61BA
            7159AC535FAE4E69B44E6EB54974BB487BBF447BBD437DBD447CBB487BBA4F72
            B35563AE5D64B5706ABA836CC19671C6AC75D2C374D9D770DCE468DBEC64D7F2
            65D4F867D3FF6CD2FF71D0FF71C6FF6FBAFF63A5F15D96EB5183E24971D94864
            D94C5DDE555CE55C59E85E55E65E54E35F57E05B5AD95459D14B5AC6465DC246
            62BE5174C75282C95591CF549FD148A3C83CA0BE389EB6369CB23497AE3394AA
            3292A7308DA0318A9C2B85982B8497268194267F93287F93297D922C7D8B3382
            89459098549AA967A6BD74AECC7EB6D688C0E487BDEA83B4E782AEE57EA7E17B
            A1DD779EDB769DDB769CDB7598D7719AD3769CD27BA2D183ACD08CB9CA93CCAF
            78B873559C38509E1D4BA00D4DA5084FA70450A7014EA4014CA6034CA6034EA5
            0050A9004FAD004EAC0052A70052A40651A20652A107549E07509C0645980442
            94033E88003A7E003272002965002456001D4A00183F00123400112E04102A0A
            607B767E9DD15C79D03859C72946C91D38C21D31C11D2FC11D2FC11C29C11C29
            C100536EB5536EB5546FB67697B97694B97190B77196BA739BBF7EA7C687B0D0
            9DBDDD6074BC1B258C191EA61F1CC3211DD22420D5211DD7211DE0241EE62720
            EC261FEB2B21EE251EE8251FE72620E82720EA261FED251DED211CED241AF126
            1CF3211CED211DEA2320E82625E62626E42626E22626E12928DF2525D8282BD2
            2629C32931B64A59C9788FED93B5E997BFE192BDDD90BEDA8CBAD884B4D984B2
            D482B1D185B1D289B4D48BB6D68DB8DA8FBADC94C2DE94C2DE95C6E09CCBE298
            CCE691CDEA88C9E47DBBD06EB1C45FA5BA4E9BAD4193A43C96A93897AB3799B1
            339DB532A0B831A4BD31A9C133AFC832B2CA36B6CC3DBDCF44C5D04FCFD157D3
            CA59CEB757C19850AE725AAF5F69B45374BB497BBC437FBE4280BD447EB8467B
            B74A78B84E71B54E71B25072B2576DAF5B65AC6561AF7A60B59766C0BF68C2DC
            72C7FE6AB5FF64A1FF5A8AF95071E84C64E04A5FDF4B5DDE4B5DDE4F5FE3535E
            E5575CE65C59E85D55E65E55E75952DF5152D54758CB435DBE446FBE4489C84C
            9CD259AAD753A8CF4AA4C744A4C33CA0BD3AA0B9389DB5369BB13597AD3795AA
            3995A53892A0388D9B378B96388C973E8E9B5297AA65A5BC6BA9C27AB8D384C4
            E388C3E986BEE580B6E17EB1E07CACDE77A5D7719DD97199D96E95D76E90D56A
            8ED46C90D66E93D57597D4739CCC7FA4CB8EAEC990C1B089C68967A94B589F26
            519E1453A40E56A60C55A50A52A20853A40852A50452A50350A60350A60350A7
            0150A8004EA7004DA6004DA4004EA4024EA2054D9D054B99064592023F8D0139
            82003B7502396B04325F002852002046001A3E001337000F3104092B0940635B
            7898D74D6ED12B4BC91A34C70C23C20718BF0716BE0817BF0817BF101DBF101D
            BF007492D27492D27492D28AB2BC8AB2BC87AEBD89B0BE8AB5C189B5C190BECB
            9AC8D3A2C7DF7287CE1C268B171BA11817B21A17BD211DCC241FD6211CDA231C
            DE211CE1201BE0241EE62520E52621E62722E72720EA271FED251DEF2419F224
            19F2231DEF241FEC2622EC2724EB2725E82725E72827E72926E82E28EC2923E7
            2A25E52F2DDE2B30CC2834BB374BBC566FCE778FDA8FABEF9EBFE89AC0E494BD
            E193BFDE90BBDC8CBADB90BCDB91BDDC93BDDC95BDDD95BEDD97BEDF9AC1E097
            C1E294C4E394C9E498C9E697CDE89BD5EB9BD9EE91D4ED88CFE87BCAE273C7E0
            6BC3DA61BCD459B9CE55B8CD51B7CA4EB9CC49BBD04ABFD649C3DB4BC7DF50CD
            E05CD4DF6DDAD775DBC479D4AB75CA8E6EBB7168AF5C6DAD5672AE5378AF567B
            AE5779AA5A7BAB5E7BA86179A463769F656F9A6C629177548A85488398467FB1
            4075C63E63CE3F58D54255DD5158E65A59ED5955EF5956F05B59EE5758E75758
            E1595CDE5859D8575DD4505ACC5063CC5574D15C89D8609DDD62AFE05CB7DB59
            B9D356B4CB56B3C754B0C34FACBF4FAABB50A8BB51A9BB54A9BC5BAEC162B0C3
            6CB9CD74BED37AC4D87EC7DD82CBE08DD0ED93CDEC93C9E98EC2E783B6E67EB1
            E47BACE17BA9DD78A6DB78A3D77AA0D77A9ED67EA4D17AA1CD7BA2CC80A2CE84
            A6CD86ABCA89B2C696C0C493C8AE86BD8673AE645C9D36539B1F5BA61A54A70A
            56A80856AA0754A70553A60454A40752A40651A40252A60152A60152A6014FA5
            024FA6004EA4014EA10052A4064999004695004693033F8A013A8200367C0034
            7200346201305601284C002042001739001033000D2E03092B09577E79789DD4
            4F77CA365AC92747C91B36C2182BBE1A2DC1192CC1192CC1182BC01323C31323
            C300D6F2EAD6F2EAD6F2EAD6EEEAD6EEEAD5EDE9D3ECE9CFEBE7CCEDE7CCEFEA
            C4ECE8C2EFEFB9E1F389A3DE2D3E92151E8D1819A71C19BA1B18BF201CC9231D
            D1231DD72620E0211ADE251DE3261EE4271FE52520E5261FE9261EEC251CF024
            1BEE281FED2B1FED2A21ED2B22ED2A24EC2A25EA2B25EA2C26EA3029EE2E26EC
            2C24EC2C25E82F2BE42F2FDF3034D63136D23332CB3838C94A4ED06773E58699
            F69FBAF6B0D2F2B7E1EFB3DEEEB4E2EDB3E3ECAFE0ECAFE1ECAFE2EBB0E1EBB0
            E1ECACE0EBADE2ECB0E3EDAFE2EDAFE3EEAFE5EFB1EAF0ACE9F0B2EDF3AFEEF4
            AEEDF5AEEFF5ADEEF5A7EDF5A3E8F39BE6F295E6F38DE2EF8AE0F083DDED7EDB
            EC7DD9EA80DDED80DDE880DFE781DDE284DCDA7ECFC674BBAA6BA68D68987B6D
            937C6E8C876D8591687C9466759C626FA25D69A95663AD5360B34E5EB84858BE
            4859C94959D34C57D94E55DD5154DD5755E65752EA5750EB5A52E85A56E05D5C
            DA5962CD566CC05A80C06AA0D072B6D97BC7E27BCCE376C9DE74C7D972C4D775
            C8D97CC7DA86CCE08AD1E58ACFE092D6E997D9EA9DDDF3A4E2F4A8E3F4ABE3F4
            ABE3F4ABE0F4AADEF3A6DBF2A2D7F09FD4F09DCEEE96C8ED98C9EC98C9EA95C7
            E995C7E896C5E598C5E49AC5E19AC6DB9EC7D79FC6D5A1C7D1A4CACBA1D3BC9C
            D3A791CD8C75B8635FA13D549B2A57A02259A71D57A81559AC1453A60B53A80B
            58AB0D56AA0953A80753A90555A90452A9034EA6014EA6004EA6004DA4004FA2
            004EA1004C9E004A9900449000489202468B033F81013877003772012E67002B
            5D002D5300274800214200193C010F340308300611381A6A929579A0D26182D2
            4868CB3553CB2744C42A40C6263AC32539C42539C42438C32438C31727C71727
            C700D2E9DDD2E9DDD2E9DDC2E0DCC2E0DBC1DFDAC1DFDABEDED9BBDFD7B5E1D6
            B7E2DAA9DCDBB3E2E4B5E0E9ABCEF1556AB0141C851518991B1BA41818AA1C19
            B91C18C2211ACC2720D7241BD9241CDC261EDE231CDE241DE1241FE4261FEA26
            1EEA2922E82922EA2B23EC2A22EC2A23EE2B24EC2C25EB2E27EC2922E73129EE
            342CF4322AF13129F0322BEF332CEC332CEB362EF0342DE93533E13939D8373D
            CA3842BE4452BF5E71D16E86DB7790DD839FE590AFF19EC1F3A2C6F2A9CFEFAD
            D5EDB5DCEDB0D7EDB1D7ECB4DAECB4DBECB5DBEDB5E0EEB4E0F0B7E1F1B8E1F1
            B8E2F3B8E2F3BAE4F3B9E4F3BBE5F3BAE5F3B3E6F3AEE4F4ABE4F4A8E1F4A6E2
            F4A0DDF491D1F689CCF77BC4F76AB3F060A7E15B9CD15A92BD5783A857779455
            6C8D5A6799575E9F5358A65053AE4E4DB34C4AB64B46B94D48BC5049BE514CC2
            4F4BC44E4CC44D4DC65254CC5457CD5255CB5555CE5657CA5C5EC36166BC6671
            B4657BA660879B669D9C69B0A068BDA36AC4A673CEB382DAC48EDFD194E0D8A0
            E3E6A3E3E6A9E3E8ADE3E9ADE1E7B2E1EAB1E1E4B0E1E1B4E0E0B5E0DFB6E0E0
            B7E0E0B7DEE1B6DCE0B4DAE2AFD7DFA7D4DCA9D1E0A4D0DBA4CFDCA4D2D8A6D1
            D7A3D3D0A6D6CCA5D6C1A5D7BA9BCFA78EC38E86BC7F80B77075B06266A2475C
            9D365A9F2C5BA5265EAB225DAD1B59AD1157AD1056AD0F5BB00E58AC0C58AB0C
            57AA0E54A70A53A60853A90755A9054FA7044EA4034BA1014DA0004B9D004A99
            00489700479200448E004287004181013E7A003770003366012C5D0026530026
            4E002140001F3D011031000A2F00032B0536604D7DA6BE6E96D1577AD13C5DC7
            3851CA243AC22034C11C2FBE1D2FC11C2EC01C2EC01D2FC11D2FC11625C21625
            C200516FAF516FAF516FAF516FAF516FAF5270AE5270AE5270B05170AF5073B2
            4D76AE537DB45787BA6594C478A1CE8DB2D97E97DE1F2C7B131C7B171C8E1919
            9D1916A91813B31B16BD1F17C52019CB241CD2241CD6221BD7241FDB2821E027
            23E02525E12426E32524E72724EC2A25EE2A24EF2B26EC2D29EC332EEE302BEB
            2F28EA3129EC342CF0352CF0372BEE352CEE3530F03330ED3433EB3635E73839
            E43B3BE13A3CDC3C3FDA3B3DD63D3FD43D40D13F43CF4249CD494FCD4E56D152
            5CD1606DDC6773E07480ED7E8AF57D8BF47E8FF3899AF691A4F68B9FF68DA2F6
            90A4F68FA2F78A9DF78296F37C8FEF778CEC798CF06D80E2697ADE6274D95F6D
            D25A69CF515FC74857C24455BF4153BC4055BC4155B84556B24654AC4D55AA53
            57AA5251A65150A54B4CA34749A044479E45489F4847A14846A24843A44C46AA
            4A42AA514BB1504DAC4C4EA75157A9535CA05B679B627692668186678A746A93
            676E9D606EA05B6EA35968A45566A55462A64F62A74E65A85164A75367A6576D
            AC646EAB6376B16D7DB77682BD7C8FC9908FCA9090C89191CA9298D09997CF98
            99CF9898D09799D09799D29796CF9492C98E92C98A91C78687BE767DB6677AB5
            5F6FAC4B6DAC436CAB3B66A53366A73166A82D63A92B63AA2963AB2860AB2660
            AC235FAC205FAC1B5EAD175CAD145DAF125EB1115BAE1059A90F5CAC0E59A90C
            56A60B54A40A52A30852A30851A2074E9E054D9B044B9803479401459200438C
            004287004081003C7B003F7A03326A002E6100265600245000214A001F440015
            37001B3605132E040D2C0716371D658C95749AD6527BCE3B60C82B47C62135C1
            1625BB1325BE1123BE0F22BF0F22BF0E21BE0E21BE0E21BE0E21BE1421BD1421
            BD008DB9DF8CB8DE8CB8DE82B2DB82B2DB82B2DB81B1DA80AFDA80AFDA7FAED9
            7DAFD67FAFD67DB3D582B8D889BCDE90C1E69CC6EA99BCF1758AC82A37831219
            7815178A1A1A9B1A17A41914AC1A16B31F19BC221DC3211CC6231FC92421CE23
            21D12325D32327D62425DD2626E12923E62A24E62D28E62F2BE52F2BE0312EE3
            332FE6352CE7362CE8392FEE3C2FF03B30F03532ED3434ED3434EB3332E93734
            EB3B38EE3C37ED3E38EE3D36EB3F38ED413BED423CEB433DE7443FE44441E146
            44DE4745D84747D64B4AD64C4CD44D4DD24D4FCF4A4FCB484DC74B52C94C52C8
            4B52C74B50C44C51C54D52C64D53C74F55CA5256CB4F50C75151CA5251CB514B
            C9534CCA584BCA574BC85449C44F46C04D46BE4B47BA4A48B64846B04743AB47
            42A347419C433E953F3F923F428F3E43893C42873C3F853E408641418A3E3E86
            44438E47488F4B508B515A8B525E85586A7F5D74715F7E6463895665934A689A
            3E6B9F396EA1386C9F3870A23B71A63D71A63C72AA3B73AB3A73AB3B70A93F72
            AC4371AC446FAB4471AD4771AB4974AE4E72AD4E70AB4E6EA94B6EAA4D6EA94C
            6DA84A6CA7476CA8456EA9466DA9446CA63F6BA63A70AC3D6DAC386CAC326FB2
            326BAF2B6AB02667AE2369B12267B22066B12062B01F60AE1D5DAE1C5EAE1B5E
            AF195DAD185DAD185DAA165CA9155AA81458A51257A51158A61058A40F56A30E
            54A00C54A00C529D0A4C99084C99084D96074A8E064688064385043D7E013B79
            00377400366F00316800295C00275700275200214A002046021B3D0016360018
            35060925041F3C265F7D7F7BA0C9698CD84870CF375BCE2C48CD213ACA192BC2
            1D2BC61425C61324C61324C61324C61324C61324C61223C51223C51828C11828
            C100D0EDE8D0EDE8CFECE7B9DEE4B8DDE3B8DDE3B8DDE3B7DCE2B7DCE2B7DCE2
            B4DBE1ADD3DCACD6E1AFD7E2ACD9E1AEDBE4B1DFE7B2E0EAB6DDEFBDDDF38299
            CC2A387D0A11690E117B16168F13129516149C1918A41A1AA91B1CAE1D1FB31F
            1EB92321BF2423C32622C92823CD2824D02A26D22C28D22E2AD32F2CD5302DD5
            322DD83730DE372FE0322ADC332BDE3630E23530E33532E43734E43A36E53C38
            E43C38E33D37E23F39E54239E7433BE8443CE7433BE6433CE4433CE1453FE246
            40E04641DE4844E04945DF4844DB4845D74A48D54C4AD54B4AD24949CE4A4BCD
            4C4BCD4D4CCC4F4DCD4F4CCD4C4BCB4D4CCB4A4CC54C4DC44F4DC34F4AC04E45
            B94D43B45041B14F40AF4E42AF463EA9453FA8433FA2423F9E433F98433D9142
            3C894340873E3E7F3B3C7C3A3F7A373F74363E71353D70374271364270475583
            6B7FAA576988455A684A60614A6358506C5157754D557542577A3F59803F5C84
            3A5D8737618C3864913B63943A66973A689A3A6A9D386C9D366F9F376FA0386E
            A3386EA53C6CA53C6CA53D6CA73F6DA8406CA8406EAB436DAA426EAB416EAB40
            6FAA3F6FAB3D6EAA3B70AA3971AA3971AA376FAD3470AF326CAC2D6AAB2968AC
            2869AC2869AD2868AE2666AC2563AC2461AB2160AC2261AD235FAE215DAC1E5B
            AB1B5DAB195EA9185EA9195DA61959A218559D15549C14559D144F97104F980F
            4D960E4B940C4B900B468B0A448908448408417A073D72063A6E043569032E61
            012B5D00285800235100224D001E4700173D00163A011133010F2D01102C0622
            3F2668878B85ACD57698DB5C80D34769CD405BD0324ECB2640C4273DC72739C6
            2335C42033C72033C71E31C51E31C51E31C51E31C51C2FC31C2FC31C2CC51C2C
            C500ADD0D0ADD0D0ACCFCFAED0CDAFCFCCAFCFCCAFCFCCAECECBAECECBAECECB
            AECECBA3C7CAA1C7C89FC6C59DC9C79AC7C59ECDC8A1D1CDA9D5D8ABD5DDADD4
            E1B5D6E891A8DB5E6DAF1A2373111871101677131880141B88161C911B1F991E
            1FA22320A92521AE2821B32924B62B24BA2B26BD2D28BF2D2AC12D2AC2312CC8
            312DCB312BCC332DCF3630D33831D63732D53632D73734D93A36D83834D63834
            D53B37D73D38D73E39D73E36D74038D84138DA423AD8423BD9433ED8423CD542
            3DD44641D8443FD6433FD34540D24642D04844CD4642CA4845C94946C84A46C5
            4B46C34A46C04C47C14B46BF4C47BE4A47BC4849B74949B54845B14843AB4941
            A74A3FA2463C9C473D99423A944039923E3B8F3A3A8A3A3A823A397E3E3B793B
            3B73373B6C373F6B353E69333D6537426756648B7282AE8197CA8FAAE097B8E7
            98BCE699C0E2A0C3D09ABBB789A7956F8E6F5271464B6B394C6E3D4D6F3B4F72
            3A52763C517837567E385883395B87365D8835618C34648F3466923466933465
            9335649735659B36679D3868A039669D3867A0396AA23B6CA43C6BA43B6AA539
            6DA6396EA7386DA5356CA5346EA5346DA7326BA72E69A62D6BA82B6CA92B67A7
            2968A92865A62765A42761A32561A42660A3265DA0225AA02159A11F559F1D56
            9F1C59A11B579D1953991853971853951A5193195192194C8C144A8B124A8A11
            44840F42800E407D0C3E7A0B3B760A366D0838680A356209315D052C57042650
            03224B011D46001940001338001336011131050F2D07163214597569839FAB86
            A7CD6E95D35780CF4A72CC4062C83A55C72E46BF2D41BF2A3BBD2637BA2739BD
            2739BD1F33BE1F33BE1E32BD1E32BD1E32BD1F33BE1D31BC1D31BC1626BF1626
            BF00749AAD759BAE759BAE6B8CAF6C8DB06B8CAF6A8BAE6A8BAE6B8CAF6A8BAE
            698AAD5D7DB05D7CB25C7DB05D7EAF5A7EAC5D83B25E86B3668DBB6C91C1759A
            C77BA0CC85ACD48EB2DA91AEE07289BA405288162463101B66151E7311197718
            1C851B188A221C94241D97261F9A28229F2B26A62923A62D26AC2B25AD2F29B3
            2D27B4312AB9342BBC352DBD372FBE362FC03433C23233C23233C03434C23635
            C33534C33735C43836C43C37C73C37C73C39C53D3AC53D3BC43D3CC33F3DC23F
            3EC14040BF4342BF413FBC4440BC413FB74340B44543B64644B44644B14743AD
            4743AB4944A94A44A84844A44946A44745A147469F42419A4140983E3B91413E
            903D3B8B3D3B863A388137377A383979363973363B7134396B353C67353D6337
            41633F51724E6484667DA57896C586A6DD88A7DF7F9CDB7796D87090D56B8BD3
            6B8AD46786D26B8BD07493D27D9ED28DAED398BACF92B3B981A29B6287715378
            5A44684345693D476B394C70364C6F32537732577A32577932587E3258803358
            83325A86335A87335C8A34608D34608D336591356693376695376896396A993A
            689938679B38669A34639B33639C32629B30669D2F649B2E649B2D639B2B659B
            2A659C296198286197276098275E96245C94245A942358932158922055931F53
            911D55911D568F1C5089194E86184D84184A80174C8018497D16437612427413
            3F71113D6D0F37650E34620C33610B2E5A0A2A540829520A244C072046061C42
            05193D041335031131050F2E061531123752406A858C849FC27C97D46583D052
            72CF3961C92C52C82444C21B34BF192BBC1924BB1823BA1622B91523BB1523BB
            1624BC101EBB101EBB0F1DBB0F1DBB0F1CBC0F1CBC0F1DBB0E1CBA1025BD1025
            BD00A8CEE2A9CFE3A8CEE29FC7E19FC7E19EC6E09DC5DF9DC5DF9DC5DF9DC5DF
            9CC4DE98BFDD98BFDD98BFDD98BFDD97BEDA93BED791BED994C1DD91BFDD93C2
            E094C6E298C9E19CCDE39ECCE6A8D5EBAFD6EEA2C0F093ABE16A7DB73341821A
            236C1C20711B1C711F1F751F1F7A1E1F7E1F1F8222228926238F2B27962B299C
            2E2AA12D28A02E29A1322CA4322BA6302BA62F2EA72E2FA72F30A73232AA3433
            AD3432AC3634AE3936B03A36B03835AE3936AD3937AC3A39AC3C3BAC3C3CAB3B
            3CA83C3DA63D3CA43F3EA5403FA5403EA2413FA13E3D9E3F3E9A3F3F97424196
            44429543419043428E46458F46468D4142883C3D813F3F824041823B3D7C353A
            7633397130386B313A6A323B68363F683C486E4C5A8064759E879BC88DA7D28C
            ABDB92B9EA8FB9E789B5E583ADE47DA6E079A0DE789ADE7395DB7090D76B8AD5
            698AD6678AD7688CD86B90D97196DB769CDD769EDA7DAADC89B2E091BCDD9BC4
            DB98BFC49BBDBA9BBCAE83A388668460526D434B68384967334A6A33476B314B
            70334E7431507531527731567A32567B33597C335B7F355F8437618637628839
            6089385F8B365E8B355C8A345B8B325B8D315B8C305E8E2F5C8D2E5A8B2D5B8A
            2B5C8C2A5D8C295B8A285989285887275584255583245483235282205182204F
            801F4B7C1D4A7B1C49791C46751945741B43711A3F6B163A6615396514345F12
            335B11325A1030570F2D520E294D0C26490C21430C1B40091C3F0D1636081433
            0913310D2A472B6B8880829EAA87A1C385A0D77990DA647DD3546DD14861D13B
            56CF2E4ECA2746C8243FC61F35C82131C72030C71E2EC61F2FC71F2FC71E2EC6
            1E2EC61B29C61B29C61927C41826C41826C41826C41927C51927C5192BC6192B
            C600AFD7E5AFD7E5AFD7E5A2CDE5A2CDE5A2CDE5A2CDE5A2CDE5A1CCE4A1CCE4
            A0CBE3A5CBDFA5CBDFA5CAE1A4C9E0A4C9E0A4C9E0A2CADDA2CADD9BC5D99AC4
            DB99C7DB96C7DE98C8E39DC9E39FCAE7A3CAEAA1C7E9A8CDEBB1D6EDB1D2EFAD
            C9F3869FC9576C983C4E7D20326417255D1622611E276C1D23711E22741A1D74
            21227C2425812727862726872A26892C298B2C288A302D8C312D8E2F2C8D322E
            8F353092363195332E9236319236329337349238359239379138379138388F39
            388E3E3C913F3B903F3B903C3A8C3D3A8C3D3B8B3F3E8B3E3E873D3E853C3F81
            3E428042457F3F43793A4175373F713A43723C437138406B343C653741673C49
            6A4E5F804F6584667FA07694B788ABD595BAEA96BEEA91B9E890B8E685AFE37F
            ABE17CAADE76A5DC719FDB6C99D66E96D86D8FD66C8AD76581D3667ED0627BCC
            607CD05A79CD5B7BCF5B7ED15C7FD36284D46A8BD66D90D67095D6729AD6799F
            D97CA4D683A9D88DB3D994BAD89BC0D7A5C5D5A0BFC591ADA77894836183645B
            7E5B46653F446039425F364563364966384E6B384E6C36537038547337567537
            597939587938587936577935577934527832527931527C30517A2F4E792E5078
            2D4D762B52792A5077294D73284B7127497026486D24486D23486D22456B2043
            6A20426A1F3F6A1D3D661E39611B355D19335B183459183258163258162D5314
            2C5112294B112849112544122441151D3A121937121C3A1C35553D4A68567291
            928FAEC784A1CD7B98D1708BD06980D25C75D1506BD2475ED13F57CF374ECD2D
            45CA2742C4263EC2273BC32233C42332C62332C62231C52130C42130C42130C4
            2130C4192AC4192AC4192AC41929C61929C61727C41826C31826C31721C51721
            C50089AEB989AEB988ADB880A6B980A6B980A6B980A6B980A6B97FA5B87FA5B8
            7FA5B880A7B77FA6B67FA6B67FA6B67FA6B67FA6B67EA5B57EA5B57CA0B77BA2
            B579A1B476A3B778A5BA79A7BC7BA8BD7EABC082AEC384B1C38AB7C790BACD91
            BCD197C4D59CC5D8A6CDDD9ABEDD96B3D796B0D88197C55D6FA0445487303C72
            28346D212B6721296921286B242970272B72272A6D2A2D6F2C2E732D2E742F2F
            762E2F75302F782E2E7732337932337933347934367834367834397A353A7835
            3A78333673373A77383B78393D77393C7633376F3B3F76383E713B41713A416D
            3F4770454F744752745562836372926D7EA37E92B88CA0C890A5D090AAD48DAC
            D898BADF8AB2DC84AFD97FAAD67EA7D3759ECF6A95CD6892CA638EC85F89C55B
            85C2547FBC547DBD5279BD5178BC5274BB4E6FBA4C66B74B63B74D64B84A61B6
            4860B6455FB44461B44461B64462B84765BA4868B84A6AB74B6EB94E73BD5377
            BF557BC25A7DC35D81C36387C86A8ECD7095CF7197CF7AA0D08BAAD48CB1CF91
            B9CA9DBDCB9BBAC097B7B79AB7B492ADA37E9A886B856B607B5D526E49536F48
            526E454D693D4F6A3C4F6B3B516E3C4B6937466734436733436832466A32476B
            3240632D41642B41642A43642E42632C41612C40602B405F293E5D273D5D2539
            5A233659213358212E521E2D511F2E51212B4D1F2B4C1E274818244516254617
            2B4B1F2D4C25425E445A7766769391809FA883A4B77C9DBE82A1D17C98D06E8C
            CC617EC95D76CD506BC84761C43D55C1344BBC2B45C3253EC11E37BE1D33BE1B
            32BD1D30B91B2EBC1B2EBC1A2CBE1A2CBE1A2CBE1A2CBE192BBD1B2BBD1A2ABC
            1B2BBD1826BE1725BD1725BD1725BD1623BD1522BC1522BC1623BD101ABE101A
            BE00}
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
    Active = True
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
    Active = True
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
