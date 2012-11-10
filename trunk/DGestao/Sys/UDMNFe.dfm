object DMNFe: TDMNFe
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 458
  Top = 133
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
      '  , p.Apresentacao'
      
        '  , coalesce(p.Descri_apresentacao, p.Descri) as Descri_apresent' +
        'acao'
      '  , p.Modelo'
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
      '  , p.Produto_novo'
      '  , p.Cor_veiculo'
      '  , cr.Descricao as Cor_veiculo_descricao'
      '  , p.Combustivel_veiculo'
      '  , cb.Descricao as Combustivel_veiculo_descricao'
      '  , p.Ano_fabricacao_veiculo'
      '  , p.Ano_modelo_veiculo'
      
        '  , p.Ano_fabricacao_veiculo || '#39'/'#39' || p.Ano_modelo_veiculo as a' +
        'no_fab_modelo_veiculo'
      '  , p.Tipo_veiculo'
      '  , tv.Descricao as Tipo_veiculo_descricao'
      '  , p.Renavam_veiculo'
      '  , p.Chassi_veiculo'
      '  , p.Kilometragem_veiculo'
      '  , coalesce(p.Qtde, 0) - coalesce(p.Reserva, 0) as Disponivel'
      'from TVENDASITENS i'
      '  inner join TBPRODUTO p on (p.Cod = i.Codprod)'
      '  inner join TBUNIDADEPROD u on (u.Unp_cod = i.Unid_cod)'
      '  left join RENAVAM_COR cr on (cr.Codigo = p.Cor_veiculo)'
      
        '  left join RENAVAM_COBUSTIVEL cb on (cb.Codigo = p.Combustivel_' +
        'veiculo)'
      
        '  left join RENAVAM_TIPOVEICULO tv on (tv.Codigo = p.Tipo_veicul' +
        'o)'
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
    object qryDadosProdutoAPRESENTACAO: TIBStringField
      FieldName = 'APRESENTACAO'
      Origin = 'TBPRODUTO.APRESENTACAO'
      Size = 50
    end
    object qryDadosProdutoDESCRI_APRESENTACAO: TIBStringField
      FieldName = 'DESCRI_APRESENTACAO'
      Size = 100
    end
    object qryDadosProdutoMODELO: TIBStringField
      FieldName = 'MODELO'
      Origin = 'TBPRODUTO.MODELO'
      Size = 40
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
    object qryDadosProdutoPRODUTO_NOVO: TSmallintField
      FieldName = 'PRODUTO_NOVO'
      Origin = 'TBPRODUTO.PRODUTO_NOVO'
      Required = True
    end
    object qryDadosProdutoDISPONIVEL: TLargeintField
      FieldName = 'DISPONIVEL'
    end
    object qryDadosProdutoCOR_VEICULO: TIBStringField
      FieldName = 'COR_VEICULO'
      Origin = 'TBPRODUTO.COR_VEICULO'
      Size = 3
    end
    object qryDadosProdutoCOR_VEICULO_DESCRICAO: TIBStringField
      FieldName = 'COR_VEICULO_DESCRICAO'
      Origin = 'RENAVAM_COR.DESCRICAO'
      Size = 50
    end
    object qryDadosProdutoCOMBUSTIVEL_VEICULO: TIBStringField
      FieldName = 'COMBUSTIVEL_VEICULO'
      Origin = 'TBPRODUTO.COMBUSTIVEL_VEICULO'
      Size = 3
    end
    object qryDadosProdutoCOMBUSTIVEL_VEICULO_DESCRICAO: TIBStringField
      FieldName = 'COMBUSTIVEL_VEICULO_DESCRICAO'
      Origin = 'RENAVAM_COBUSTIVEL.DESCRICAO'
      Size = 100
    end
    object qryDadosProdutoANO_FABRICACAO_VEICULO: TSmallintField
      FieldName = 'ANO_FABRICACAO_VEICULO'
      Origin = 'TBPRODUTO.ANO_FABRICACAO_VEICULO'
    end
    object qryDadosProdutoANO_MODELO_VEICULO: TSmallintField
      FieldName = 'ANO_MODELO_VEICULO'
      Origin = 'TBPRODUTO.ANO_MODELO_VEICULO'
    end
    object qryDadosProdutoANO_FAB_MODELO_VEICULO: TIBStringField
      FieldName = 'ANO_FAB_MODELO_VEICULO'
      Size = 13
    end
    object qryDadosProdutoTIPO_VEICULO: TIBStringField
      FieldName = 'TIPO_VEICULO'
      Origin = 'TBPRODUTO.TIPO_VEICULO'
      Size = 3
    end
    object qryDadosProdutoTIPO_VEICULO_DESCRICAO: TIBStringField
      FieldName = 'TIPO_VEICULO_DESCRICAO'
      Origin = 'RENAVAM_TIPOVEICULO.DESCRICAO'
      Size = 100
    end
    object qryDadosProdutoRENAVAM_VEICULO: TIBStringField
      FieldName = 'RENAVAM_VEICULO'
      Origin = 'TBPRODUTO.RENAVAM_VEICULO'
      Size = 50
    end
    object qryDadosProdutoCHASSI_VEICULO: TIBStringField
      FieldName = 'CHASSI_VEICULO'
      Origin = 'TBPRODUTO.CHASSI_VEICULO'
      Size = 50
    end
    object qryDadosProdutoKILOMETRAGEM_VEICULO: TIntegerField
      FieldName = 'KILOMETRAGEM_VEICULO'
      Origin = 'TBPRODUTO.KILOMETRAGEM_VEICULO'
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
    ReportOptions.LastChange = 41209.028739675920000000
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
        Height = 90.401670000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
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
        object Picture1: TfrxPictureView
          Left = 3.779530000000000000
          Width = 139.842610000000000000
          Height = 79.370130000000000000
          ShowHint = False
          DataField = 'LOGO'
          DataSet = frdEmpresa
          DataSetName = 'frdEmpresa'
          HightQuality = False
        end
        object frdEmpresaRZSOC: TfrxMemoView
          Left = 143.622140000000000000
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
          Left = 143.622140000000000000
          Top = 18.897650000000000000
          Width = 411.968770000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataSet = frdCliente
          DataSetName = 'frdCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Lucida Console'
          Font.Style = []
          Memo.UTF8 = (
            
              'CNPJ.: [FormatMaskText('#39'##.###.###/####-##;0;'#39',<frdEmpresa."CNPJ' +
              '">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object frdFone: TfrxMemoView
          Left = 143.622140000000000000
          Top = 34.015770000000000000
          Width = 411.968770000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataSet = frdCliente
          DataSetName = 'frdCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Lucida Console'
          Font.Style = []
          Memo.UTF8 = (
            'FONE: [FormatMaskText('#39'(##)####.####;0;'#39',<frdEmpresa."FONE">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          Left = 143.622140000000000000
          Top = 49.133890000000000000
          Width = 411.968770000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataSet = frdCliente
          DataSetName = 'frdCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Lucida Console'
          Font.Style = []
          Memo.UTF8 = (
            
              '[frdEmpresa."TLG_SIGLA"] [frdEmpresa."LOG_NOME"], [frdEmpresa."N' +
              'UMERO_END"], [frdEmpresa."BAI_NOME"] - [frdEmpresa."CID_NOME"]/[' +
              'frdEmpresa."EST_SIGLA"] CEP.: [FormatMaskText('#39'##.###-###;0;'#39',<f' +
              'rdEmpresa."CEP">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Line1: TfrxLineView
          Top = 83.149660000000000000
          Width = 718.110700000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
        object Memo44: TfrxMemoView
          Left = 143.622140000000000000
          Top = 64.252010000000000000
          Width = 574.488560000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataSet = frdCliente
          DataSetName = 'frdCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Lucida Console'
          Font.Style = []
          Memo.UTF8 = (
            'Site / E-mail: [frdEmpresa."HOME_PAGE"] / [frdEmpresa."EMAIL"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
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
            
              ' [IIF(<frdCliente."PESSOA_FISICA">=1,FormatMaskText('#39'###.###.###' +
              '-##;0;'#39',<frdCliente."CNPJ">),FormatMaskText('#39'##.###.###/####-##;' +
              '0;'#39',<frdCliente."CNPJ">))]')
          ParentFont = False
          WordWrap = False
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
      'APRESENTACAO=APRESENTACAO'
      'DESCRI_APRESENTACAO=DESCRI_APRESENTACAO'
      'MODELO=MODELO'
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
      'PRODUTO_NOVO=PRODUTO_NOVO'
      'DISPONIVEL=DISPONIVEL'
      'COR_VEICULO=COR_VEICULO'
      'COR_VEICULO_DESCRICAO=COR_VEICULO_DESCRICAO'
      'COMBUSTIVEL_VEICULO=COMBUSTIVEL_VEICULO'
      'COMBUSTIVEL_VEICULO_DESCRICAO=COMBUSTIVEL_VEICULO_DESCRICAO'
      'ANO_FABRICACAO_VEICULO=ANO_FABRICACAO_VEICULO'
      'ANO_MODELO_VEICULO=ANO_MODELO_VEICULO'
      'ANO_FAB_MODELO_VEICULO=ANO_FAB_MODELO_VEICULO'
      'TIPO_VEICULO=TIPO_VEICULO'
      'TIPO_VEICULO_DESCRICAO=TIPO_VEICULO_DESCRICAO'
      'RENAVAM_VEICULO=RENAVAM_VEICULO'
      'CHASSI_VEICULO=CHASSI_VEICULO'
      'KILOMETRAGEM_VEICULO=KILOMETRAGEM_VEICULO')
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
