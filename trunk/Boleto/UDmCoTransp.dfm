object Dm: TDm
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 439
  Top = 207
  Height = 180
  Width = 299
  object ibDtbsDVM: TIBDatabase
    DatabaseName = 'localhost:FinanCred'
    Params.Strings = (
      ''
      'user_name=SYSDBA'
      'password=masterkey'
      'lc_ctype=ISO8859_2')
    LoginPrompt = False
    DefaultTransaction = ibTrnsctnDVM
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 48
    Top = 16
  end
  object ibTrnsctnDVM: TIBTransaction
    Active = False
    DefaultDatabase = ibDtbsDVM
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saNone
    Left = 120
    Top = 16
  end
  object qryEmpresa: TIBQuery
    Database = ibDtbsDVM
    Transaction = ibTrnsctnDVM
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from TBEMPRESA')
    Left = 40
    Top = 72
  end
  object dtsrcEmpresa: TDataSource
    DataSet = qryEmpresa
    Left = 112
    Top = 72
  end
end
