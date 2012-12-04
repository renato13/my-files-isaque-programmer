object frmAltSenha: TfrmAltSenha
  Left = 429
  Top = 270
  BorderStyle = bsDialog
  Caption = 'Altera'#231#227'o de Senha'
  ClientHeight = 197
  ClientWidth = 261
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 261
    Height = 151
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 0
    object lblNome: TLabel
      Left = 60
      Top = 17
      Width = 59
      Height = 16
      Caption = 'Usu'#225'rio:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblsenha: TLabel
      Left = 29
      Top = 81
      Width = 90
      Height = 16
      Caption = 'Senha Nova:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblconfSen: TLabel
      Left = 7
      Top = 113
      Width = 112
      Height = 16
      Caption = 'Confirmar Nova:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 31
      Top = 49
      Width = 88
      Height = 16
      Caption = 'Senha Atual:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBENome: TDBEdit
      Left = 122
      Top = 14
      Width = 122
      Height = 24
      CharCase = ecUpperCase
      DataField = 'NOME'
      DataSource = dtsrcUsers
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object DBEsenha: TDBEdit
      Left = 122
      Top = 46
      Width = 50
      Height = 24
      CharCase = ecUpperCase
      DataField = 'SENHA'
      DataSource = dtsrcUsers
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      PasswordChar = '*'
      ReadOnly = True
      TabOrder = 1
      OnExit = DBEsenhaExit
    end
    object EdConfirmSenha: TEdit
      Left = 122
      Top = 111
      Width = 51
      Height = 24
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      PasswordChar = '*'
      TabOrder = 2
    end
    object DBEsenhanova: TDBEdit
      Left = 122
      Top = 79
      Width = 50
      Height = 24
      CharCase = ecUpperCase
      DataField = 'SENHA'
      DataSource = dtsrcUsers
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      PasswordChar = '*'
      ReadOnly = True
      TabOrder = 3
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 151
    Width = 261
    Height = 46
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 1
    object btbtnFechar: TBitBtn
      Left = 194
      Top = 8
      Width = 47
      Height = 31
      Hint = 'Fechar'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = btbtnFecharClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033BBBBBBBBBB
        BB33337777777777777F33BB00BBBBBBBB33337F77333333F37F33BB0BBBBBB0
        BB33337F73F33337FF7F33BBB0BBBB000B33337F37FF3377737F33BBB00BB00B
        BB33337F377F3773337F33BBBB0B00BBBB33337F337F7733337F33BBBB000BBB
        BB33337F33777F33337F33EEEE000EEEEE33337F3F777FFF337F33EE0E80000E
        EE33337F73F77773337F33EEE0800EEEEE33337F37377F33337F33EEEE000EEE
        EE33337F33777F33337F33EEEEE00EEEEE33337F33377FF3337F33EEEEEE00EE
        EE33337F333377F3337F33EEEEEE00EEEE33337F33337733337F33EEEEEEEEEE
        EE33337FFFFFFFFFFF7F33EEEEEEEEEEEE333377777777777773}
      NumGlyphs = 2
    end
    object btbtnSalvar: TBitBtn
      Left = 124
      Top = 8
      Width = 47
      Height = 31
      Hint = 'Gravar Nova Senha'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = btbtnSalvarClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        55555FFFFFFF5F55FFF5777777757559995777777775755777F7555555555550
        305555555555FF57F7F555555550055BB0555555555775F777F55555550FB000
        005555555575577777F5555550FB0BF0F05555555755755757F555550FBFBF0F
        B05555557F55557557F555550BFBF0FB005555557F55575577F555500FBFBFB0
        B05555577F555557F7F5550E0BFBFB00B055557575F55577F7F550EEE0BFB0B0
        B05557FF575F5757F7F5000EEE0BFBF0B055777FF575FFF7F7F50000EEE00000
        B0557777FF577777F7F500000E055550805577777F7555575755500000555555
        05555777775555557F5555000555555505555577755555557555}
      NumGlyphs = 2
    end
  end
  object ibdtstUsers: TIBDataSet
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
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
    Left = 184
    Top = 40
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
  object dtsrcUsers: TDataSource
    DataSet = ibdtstUsers
    Left = 184
    Top = 88
  end
end
