object DMBusiness: TDMBusiness
  OldCreateOrder = True
  OnCreate = DataModuleCreate
  Left = 343
  Top = 217
  Height = 266
  Width = 575
  object ibdtbsBusiness: TIBDatabase
    Connected = True
    DatabaseName = 'localhost:BUSINESS'
    Params.Strings = (
      'user_name=sysdba'
      'password=masterkey'
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
    Left = 240
    Top = 64
  end
  object raveReport: TRvProject
    Left = 40
    Top = 120
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
    Left = 336
    Top = 144
  end
  object dtsrcUsers: TDataSource
    DataSet = ibdtstUsers
    Left = 208
    Top = 120
  end
end
