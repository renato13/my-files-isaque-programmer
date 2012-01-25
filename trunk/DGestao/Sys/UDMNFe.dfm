object DMNFe: TDMNFe
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 633
  Top = 375
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
  object qryEmitente: TIBQuery
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select'
      '    e.Codigo'
      '  , e.Pessoa_fisica'
      '  , e.Cnpj'
      '  , e.Rzsoc'
      '  , e.Nmfant'
      '  , e.Ie'
      '  , e.Im'
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
    Left = 144
    Top = 24
    ParamData = <
      item
        DataType = ftString
        Name = 'Cnpj'
        ParamType = ptInput
        Value = ''
      end>
    object qryEmitenteCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'TBEMPRESA.CODIGO'
      Required = True
    end
    object qryEmitentePESSOA_FISICA: TSmallintField
      FieldName = 'PESSOA_FISICA'
      Origin = 'TBEMPRESA.PESSOA_FISICA'
      Required = True
    end
    object qryEmitenteCNPJ: TIBStringField
      FieldName = 'CNPJ'
      Origin = 'TBEMPRESA.CNPJ'
      Required = True
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
  object qryCalculoImporto: TIBQuery
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
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
      '  , v.Dataemissao'
      '  , v.Horaemissao'
      '  , v.Cfop'
      '  , cf.Cfop_descricao'
      '  , v.Verificador_nfe'
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
    Left = 144
    Top = 120
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
    object qryCalculoImportoANO: TSmallintField
      FieldName = 'ANO'
      Origin = 'TBVENDAS.ANO'
      Required = True
    end
    object qryCalculoImportoCODCONTROL: TIntegerField
      FieldName = 'CODCONTROL'
      Origin = 'TBVENDAS.CODCONTROL'
      Required = True
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
      Required = True
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
    object qryCalculoImportoDATAEMISSAO: TDateField
      FieldName = 'DATAEMISSAO'
      Origin = 'TBVENDAS.DATAEMISSAO'
    end
    object qryCalculoImportoHORAEMISSAO: TTimeField
      FieldName = 'HORAEMISSAO'
      Origin = 'TBVENDAS.HORAEMISSAO'
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
      Required = True
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
      Required = True
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
      '  , p.Descri'
      '  , p.Referencia'
      '  , i.Codemp'
      '  , i.Codcli'
      '  , i.Dtvenda'
      '  , i.Qtde'
      '  , i.Punit'
      '  , i.Desconto'
      '  , i.Pfinal'
      '  , i.Qtdefinal'
      '  , i.Unid_cod'
      '  , u.Unp_descricao'
      '  , u.Unp_sigla'
      '  , i.Cfop_cod'
      '  , i.Aliquota'
      '  , i.Valor_ipi'
      '  , i.Qtde * i.Punit as Total_bruto'
      '  , i.Qtde * i.Pfinal as Total_liquido'
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
    object qryDadosProdutoDESCONTO: TIBBCDField
      FieldName = 'DESCONTO'
      Origin = 'TVENDASITENS.DESCONTO'
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
    ReportOptions.LastChange = 40928.416853240700000000
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
        Height = 60.472480000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object frdEmpresaRZSOC: TfrxMemoView
          Width = 559.370440000000000000
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
          Top = 18.897650000000000000
          Width = 559.370440000000000000
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
          Top = 37.795300000000000000
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
          Top = 56.692950000000000000
          Width = 718.110700000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
      end
      object bndMasterData: TfrxMasterData
        Height = 18.897650000000000000
        Top = 234.330860000000000000
        Width = 718.110700000000000000
        DataSet = frdItens
        DataSetName = 'frdItens'
        RowCount = 0
        object frdItensCODPROD: TfrxMemoView
          Left = 22.677180000000000000
          Width = 60.472480000000000000
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
          Left = 83.149660000000000000
          Width = 260.787570000000000000
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
          Left = 343.937230000000000000
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
            '[FormatFloat('#39'###,###,##0'#39',<frdItens."QTDE">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          Left = 408.189240000000000000
          Width = 41.574830000000000000
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
            
              '[FormatFloat('#39',0.00'#39',<frdItens."PUNIT">*<frdItens."DESCONTO">/10' +
              '0)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
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
            '[FormatFloat('#39',0.00'#39',<frdItens."VALOR_IPI">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object bndPageFooter: TfrxPageFooter
        Height = 22.677180000000000000
        Top = 665.197280000000000000
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
        Height = 83.149660000000000000
        Top = 105.826840000000000000
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
          Font.Height = -9
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
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            ' C i e n t e :')
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
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            ' C P F   /   C N P J . :')
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
          Font.Height = -9
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
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            ' D a t a : ')
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
          Font.Height = -9
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
            'T o t a l ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
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
            'I P I ')
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
            'D e s c .')
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
            'V a l o r ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          Left = 408.189240000000000000
          Top = 64.252010000000000000
          Width = 41.574830000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            ' U n d .')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Left = 343.937230000000000000
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
            'Q t d e . ')
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
          Width = 60.472480000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            ' P r o d . ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo25: TfrxMemoView
          Left = 83.149660000000000000
          Top = 64.252010000000000000
          Width = 260.787570000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            ' D e s c r i '#195#167' '#195#163' o ')
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
          Font.Height = -9
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
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            ' E n d e r e '#195#167' o :')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object bndReportSummary: TfrxReportSummary
        Height = 298.582870000000000000
        Top = 298.582870000000000000
        Width = 718.110700000000000000
        object SysMemo1: TfrxSysMemoView
          Left = 642.520100000000000000
          Width = 75.590600000000000000
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
          Left = 514.016080000000000000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
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
          Font.Style = []
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
            ' V e n d e d o r :')
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
          Font.Style = []
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
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            ' F o r m a   d e   P a g a m e n t o :')
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
          Font.Style = []
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
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            ' C o n d i '#195#167' '#195#163' o   d e   P a g a m e n t o :')
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
          Font.Style = []
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
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            ' T o t a l   V e n d a : ')
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
          Font.Style = []
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
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            ' D e s c o n t o : ')
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
          Font.Style = []
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
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            ' T o t a l   L i q . : ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo40: TfrxMemoView
          Top = 102.047310000000000000
          Width = 718.110700000000000000
          Height = 30.236240000000000000
          ShowHint = False
          DataSet = frdVenda
          DataSetName = 'frdVenda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
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
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop]
          Memo.UTF8 = (
            ' O b s e r v a '#195#167' '#195#163' o :')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo42: TfrxMemoView
          Left = 272.126160000000000000
          Top = 272.126160000000000000
          Width = 204.094620000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
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
          Top = 154.960730000000000000
          Width = 623.622450000000000000
          Height = 60.472480000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
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
      'DATAEMISSAO=DATAEMISSAO'
      'HORAEMISSAO=HORAEMISSAO'
      'CFOP=CFOP'
      'CFOP_DESCRICAO=CFOP_DESCRICAO'
      'VERIFICADOR_NFE=VERIFICADOR_NFE'
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
      'PRAZO_12=PRAZO_12')
    DataSet = qryCalculoImporto
    Left = 180
    Top = 121
  end
  object frdItens: TfrxDBDataset
    UserName = 'frdItens'
    CloseDataSource = False
    FieldAliases.Strings = (
      'ANO=ANO'
      'CODCONTROL=CODCONTROL'
      'SEQ=SEQ'
      'CODPROD=CODPROD'
      'DESCRI=DESCRI'
      'REFERENCIA=REFERENCIA'
      'CODEMP=CODEMP'
      'CODCLI=CODCLI'
      'DTVENDA=DTVENDA'
      'QTDE=QTDE'
      'PUNIT=PUNIT'
      'DESCONTO=DESCONTO'
      'PFINAL=PFINAL'
      'QTDEFINAL=QTDEFINAL'
      'UNID_COD=UNID_COD'
      'UNP_DESCRICAO=UNP_DESCRICAO'
      'UNP_SIGLA=UNP_SIGLA'
      'CFOP_COD=CFOP_COD'
      'ALIQUOTA=ALIQUOTA'
      'VALOR_IPI=VALOR_IPI'
      'TOTAL_BRUTO=TOTAL_BRUTO'
      'TOTAL_LIQUIDO=TOTAL_LIQUIDO'
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
end
