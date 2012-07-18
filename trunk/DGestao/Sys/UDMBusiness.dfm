object DMBusiness: TDMBusiness
  OldCreateOrder = True
  OnCreate = DataModuleCreate
  Left = 718
  Top = 175
  Height = 400
  Width = 575
  object ibdtbsBusiness: TIBDatabase
    DatabaseName = 'localhost:BUSINESS'
    Params.Strings = (
      'user_name=SYSDBA'
      'Password=masterkey'
      'lc_ctype=ISO8859_2')
    LoginPrompt = False
    DefaultTransaction = ibtrnsctnBusiness
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 40
    Top = 8
  end
  object ibtrnsctnBusiness: TIBTransaction
    Active = False
    DefaultDatabase = ibdtbsBusiness
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saCommit
    Left = 40
    Top = 64
  end
  object dtsrcAjustEstoq: TDataSource
    DataSet = ibdtstAjustEstoq
    Left = 144
    Top = 64
  end
  object ibdtstAjustEstoq: TIBDataSet
    Database = ibdtbsBusiness
    Transaction = ibtrnsctnBusiness
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from TBAJUSTESTOQ'
      'where'
      '  CODPROD = :OLD_CODPROD')
    InsertSQL.Strings = (
      'insert into TBAJUSTESTOQ'
      
        '  (CODPROD, CODFORN, QTDEATUAL, QTDENOVA, QTDEFINAL, MOTIVO, DOC' +
        ', DTAJUST)'
      'values'
      
        '  (:CODPROD, :CODFORN, :QTDEATUAL, :QTDENOVA, :QTDEFINAL, :MOTIV' +
        'O, :DOC, '
      '   :DTAJUST)')
    RefreshSQL.Strings = (
      'Select '
      '  CODPROD,'
      '  CODFORN,'
      '  QTDEATUAL,'
      '  QTDENOVA,'
      '  QTDEFINAL,'
      '  MOTIVO,'
      '  DOC,'
      '  DTAJUST'
      'from TBAJUSTESTOQ '
      'where'
      '  CODPROD = :CODPROD')
    SelectSQL.Strings = (
      'select * from TBAJUSTESTOQ')
    ModifySQL.Strings = (
      'update TBAJUSTESTOQ'
      'set'
      '  CODPROD = :CODPROD,'
      '  CODFORN = :CODFORN,'
      '  QTDEATUAL = :QTDEATUAL,'
      '  QTDENOVA = :QTDENOVA,'
      '  QTDEFINAL = :QTDEFINAL,'
      '  MOTIVO = :MOTIVO,'
      '  DOC = :DOC,'
      '  DTAJUST = :DTAJUST'
      'where'
      '  CODPROD = :OLD_CODPROD')
    Left = 144
    Top = 8
    object ibdtstAjustEstoqCODPROD: TIBStringField
      FieldName = 'CODPROD'
      Origin = 'TBAJUSTESTOQ.CODPROD'
      Required = True
      Size = 10
    end
    object ibdtstAjustEstoqCODFORN: TIntegerField
      FieldName = 'CODFORN'
      Origin = 'TBAJUSTESTOQ.CODFORN'
    end
    object ibdtstAjustEstoqQTDEATUAL: TIntegerField
      FieldName = 'QTDEATUAL'
      Origin = 'TBAJUSTESTOQ.QTDEATUAL'
    end
    object ibdtstAjustEstoqQTDENOVA: TIntegerField
      FieldName = 'QTDENOVA'
      Origin = 'TBAJUSTESTOQ.QTDENOVA'
    end
    object ibdtstAjustEstoqQTDEFINAL: TIntegerField
      FieldName = 'QTDEFINAL'
      Origin = 'TBAJUSTESTOQ.QTDEFINAL'
    end
    object ibdtstAjustEstoqMOTIVO: TIBStringField
      FieldName = 'MOTIVO'
      Origin = 'TBAJUSTESTOQ.MOTIVO'
      Size = 40
    end
    object ibdtstAjustEstoqDOC: TIBStringField
      FieldName = 'DOC'
      Origin = 'TBAJUSTESTOQ.DOC'
      Size = 10
    end
    object ibdtstAjustEstoqDTAJUST: TDateTimeField
      FieldName = 'DTAJUST'
      Origin = 'TBAJUSTESTOQ.DTAJUST'
    end
    object ibdtstAjustEstoqLookProdNome: TStringField
      FieldKind = fkLookup
      FieldName = 'LookProdNome'
      LookupDataSet = ibdtstProduto
      LookupKeyFields = 'COD'
      LookupResultField = 'DESCRI'
      KeyFields = 'CODPROD'
      Lookup = True
    end
    object ibdtstAjustEstoqLookProdQtde: TIntegerField
      FieldKind = fkLookup
      FieldName = 'LookProdQtde'
      LookupDataSet = ibdtstProduto
      LookupKeyFields = 'COD'
      LookupResultField = 'QTDE'
      KeyFields = 'CODPROD'
      Lookup = True
    end
    object ibdtstAjustEstoqLookFornec: TStringField
      FieldKind = fkLookup
      FieldName = 'LookFornec'
      LookupDataSet = ibdtstFornec
      LookupKeyFields = 'CODFORN'
      LookupResultField = 'NOMEFORN'
      KeyFields = 'CODFORN'
      Lookup = True
    end
  end
  object ibdtstProduto: TIBDataSet
    Database = ibdtbsBusiness
    Transaction = ibtrnsctnBusiness
    BufferChunks = 1000
    CachedUpdates = False
    SelectSQL.Strings = (
      'select COD, DESCRI, QTDE from TBPRODUTO'
      'order by cod')
    Left = 232
    Top = 8
  end
  object ibdtstFornec: TIBDataSet
    Database = ibdtbsBusiness
    Transaction = ibtrnsctnBusiness
    BufferChunks = 1000
    CachedUpdates = False
    SelectSQL.Strings = (
      'select CODFORN, NOMEFORN from TBFORNECEDOR'
      'order by NOMEFORN')
    Left = 312
    Top = 8
  end
  object qryBusca: TIBQuery
    Database = ibdtbsBusiness
    Transaction = ibtrnsctnBusiness
    BufferChunks = 1000
    CachedUpdates = False
    Left = 232
    Top = 56
  end
  object ibdtstUsers: TIBDataSet
    Database = ibdtbsBusiness
    Transaction = ibtrnsctnBusiness
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from TBUSERS'
      'where'
      '  NOME = :OLD_NOME')
    InsertSQL.Strings = (
      'insert into TBUSERS'
      '  (NOME, SENHA, NOMECOMPLETO, CODFUNCAO, LIMIDESC)'
      'values'
      '  (:NOME, :SENHA, :NOMECOMPLETO, :CODFUNCAO, :LIMIDESC)')
    RefreshSQL.Strings = (
      'Select '
      '  NOME,'
      '  SENHA,'
      '  NOMECOMPLETO,'
      '  CODFUNCAO,'
      '  LIMIDESC'
      'from TBUSERS '
      'where'
      '  NOME = :NOME')
    SelectSQL.Strings = (
      'select * from TBUSERS')
    ModifySQL.Strings = (
      'update TBUSERS'
      'set'
      '  NOME = :NOME,'
      '  SENHA = :SENHA,'
      '  NOMECOMPLETO = :NOMECOMPLETO,'
      '  CODFUNCAO = :CODFUNCAO,'
      '  LIMIDESC = :LIMIDESC'
      'where'
      '  NOME = :OLD_NOME')
    Left = 144
    Top = 120
    object ibdtstUsersNOME: TIBStringField
      FieldName = 'NOME'
      Origin = 'TBUSERS.NOME'
      Required = True
      Size = 12
    end
    object ibdtstUsersSENHA: TIBStringField
      FieldName = 'SENHA'
      Origin = 'TBUSERS.SENHA'
      Required = True
      Size = 16
    end
    object ibdtstUsersNOMECOMPLETO: TIBStringField
      FieldName = 'NOMECOMPLETO'
      Origin = 'TBUSERS.NOMECOMPLETO'
      Required = True
      Size = 60
    end
    object ibdtstUsersCODFUNCAO: TSmallintField
      FieldName = 'CODFUNCAO'
      Origin = 'TBUSERS.CODFUNCAO'
      Required = True
    end
    object ibdtstUsersLIMIDESC: TIBBCDField
      FieldName = 'LIMIDESC'
      Origin = 'TBUSERS.LIMIDESC'
      Precision = 9
      Size = 2
    end
  end
  object EvMsgDialog: TEvMsgDlg
    ButtonFont.Charset = ANSI_CHARSET
    ButtonFont.Color = clWindowText
    ButtonFont.Height = -11
    ButtonFont.Name = 'Tahoma'
    ButtonFont.Style = []
    MessageFont.Charset = DEFAULT_CHARSET
    MessageFont.Color = clWindowText
    MessageFont.Height = -11
    MessageFont.Name = 'MS Sans Serif'
    MessageFont.Style = []
    Left = 312
    Top = 56
  end
  object dtsrcUsers: TDataSource
    DataSet = ibdtstUsers
    Left = 208
    Top = 120
  end
  object raveReport: TRvProject
    Left = 40
    Top = 120
  end
  object IdIPWatch: TIdIPWatch
    Active = True
    HistoryFilename = 'NetWorkActiveDGE.dat'
    Left = 312
    Top = 104
  end
  object qryCaixaAberto: TIBDataSet
    Database = ibdtbsBusiness
    Transaction = ibtrnsctnBusiness
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from TBUSERS'
      'where'
      '  NOME = :OLD_NOME')
    InsertSQL.Strings = (
      'insert into TBUSERS'
      '  (NOME, SENHA, NOMECOMPLETO, CODFUNCAO, LIMIDESC)'
      'values'
      '  (:NOME, :SENHA, :NOMECOMPLETO, :CODFUNCAO, :LIMIDESC)')
    RefreshSQL.Strings = (
      'Select '
      '  NOME,'
      '  SENHA,'
      '  NOMECOMPLETO,'
      '  CODFUNCAO,'
      '  LIMIDESC'
      'from TBUSERS '
      'where'
      '  NOME = :NOME')
    SelectSQL.Strings = (
      'Select'
      '    c.Ano'
      '  , c.Numero'
      '  , c.Usuario'
      '  , c.Data_abertura'
      '  , c.Conta_corrente'
      '  , c.Valor_total_credito'
      '  , c.Valor_total_debito'
      'from GET_CAIXA_ABERTO_DETALHE(:Usuario, :Data, :FormaPagto) c')
    ModifySQL.Strings = (
      'update TBUSERS'
      'set'
      '  NOME = :NOME,'
      '  SENHA = :SENHA,'
      '  NOMECOMPLETO = :NOMECOMPLETO,'
      '  CODFUNCAO = :CODFUNCAO,'
      '  LIMIDESC = :LIMIDESC'
      'where'
      '  NOME = :OLD_NOME')
    Left = 144
    Top = 168
    object qryCaixaAbertoANO: TSmallintField
      FieldName = 'ANO'
      Origin = 'TBCAIXA.ANO'
      Required = True
    end
    object qryCaixaAbertoNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'TBCAIXA.NUMERO'
      Required = True
    end
    object qryCaixaAbertoUSUARIO: TIBStringField
      FieldName = 'USUARIO'
      Origin = 'TBCAIXA.USUARIO'
      Size = 12
    end
    object qryCaixaAbertoDATA_ABERTURA: TDateField
      FieldName = 'DATA_ABERTURA'
      Origin = 'TBCAIXA.DATA_ABERTURA'
    end
    object qryCaixaAbertoCONTA_CORRENTE: TIntegerField
      FieldName = 'CONTA_CORRENTE'
      Origin = 'TBCAIXA.CONTA_CORRENTE'
    end
    object qryCaixaAbertoVALOR_TOTAL_CREDITO: TIBBCDField
      FieldName = 'VALOR_TOTAL_CREDITO'
      Precision = 18
      Size = 2
    end
    object qryCaixaAbertoVALOR_TOTAL_DEBITO: TIBBCDField
      FieldName = 'VALOR_TOTAL_DEBITO'
      Precision = 18
      Size = 2
    end
  end
  object stpCaixaMovimentoREC: TIBStoredProc
    Database = ibdtbsBusiness
    Transaction = ibtrnsctnBusiness
    StoredProcName = 'SET_CAIXA_MOVIMENTO_REC'
    Left = 144
    Top = 216
  end
  object stpCaixaMovimentoPAG: TIBStoredProc
    Database = ibdtbsBusiness
    Transaction = ibtrnsctnBusiness
    StoredProcName = 'SET_CAIXA_MOVIMENTO_PAG'
    Left = 144
    Top = 264
  end
  object stpContaCorrenteSaldo: TIBStoredProc
    Database = ibdtbsBusiness
    Transaction = ibtrnsctnBusiness
    StoredProcName = 'SET_CONTA_CORRENTE_SALDO'
    Left = 144
    Top = 312
  end
end
