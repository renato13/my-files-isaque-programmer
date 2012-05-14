object frmGerRelCR: TfrmGerRelCR
  Left = 413
  Top = 225
  Width = 289
  Height = 267
  AutoSize = True
  BorderIcons = []
  Caption = 'Relat'#243'rio Contas a Receber'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Left = 64
    Top = 24
    Width = 32
    Height = 13
    Caption = 'SERIE'
  end
  object rdgrpSerie: TRadioGroup
    Left = 0
    Top = 0
    Width = 273
    Height = 50
    Align = alTop
    Caption = 'S'#233'rie'
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      'Cliente:')
    TabOrder = 0
  end
  object rdgrpStatus: TRadioGroup
    Left = 0
    Top = 140
    Width = 273
    Height = 50
    Align = alTop
    Caption = 'Status Duplicata'
    Columns = 3
    ItemIndex = 0
    Items.Strings = (
      'Todas'
      'Quitadas'
      'Pendentes')
    TabOrder = 1
  end
  object Panel1: TPanel
    Left = 0
    Top = 188
    Width = 273
    Height = 41
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 2
    object BitBtn2: TBitBtn
      Left = 168
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Fechar'
      TabOrder = 0
      Kind = bkClose
    end
    object btbtnGrupo: TBitBtn
      Left = 32
      Top = 8
      Width = 75
      Height = 25
      TabOrder = 1
      OnClick = btbtnGrupoClick
      Kind = bkOK
    end
  end
  object rdgrpData: TRadioGroup
    Left = 0
    Top = 50
    Width = 273
    Height = 50
    Align = alTop
    Anchors = [akTop, akRight]
    BiDiMode = bdLeftToRight
    Caption = 'Per'#237'odo'
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      'Data de Emiss'#227'o'
      'Data de Vencimento')
    ParentBiDiMode = False
    TabOrder = 3
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 100
    Width = 273
    Height = 40
    Align = alTop
    TabOrder = 4
    object Label1: TLabel
      Left = 9
      Top = 10
      Width = 17
      Height = 13
      Caption = 'De:'
    end
    object Label2: TLabel
      Left = 142
      Top = 11
      Width = 6
      Height = 13
      Caption = 'a'
    end
    object dttmpcIni: TDateTimePicker
      Left = 33
      Top = 10
      Width = 101
      Height = 21
      Date = 39934.729982395800000000
      Time = 39934.729982395800000000
      TabOrder = 0
    end
    object dttmpcFim: TDateTimePicker
      Left = 162
      Top = 10
      Width = 98
      Height = 21
      Date = 39964.729982395800000000
      Time = 39964.729982395800000000
      TabOrder = 1
    end
  end
  object cmbbx: TComboBox
    Left = 65
    Top = 18
    Width = 192
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 5
  end
  object ibqryCli: TIBQuery
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select NOME from TBCLIENTE'
      'order by NOME')
    Left = 200
    Top = 8
    object ibqryCliNOME: TIBStringField
      FieldName = 'NOME'
      Origin = 'TBCLIENTE.NOME'
      Size = 60
    end
  end
end
