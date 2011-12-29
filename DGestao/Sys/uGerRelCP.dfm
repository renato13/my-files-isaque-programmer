object frmGerRelCP: TfrmGerRelCP
  Left = 458
  Top = 192
  Width = 291
  Height = 218
  AutoSize = True
  BorderIcons = []
  Caption = 'Relat'#243'rio de Contas a Pagar'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Left = 64
    Top = 24
    Width = 32
    Height = 13
    Caption = 'SERIE'
  end
  object rdgrpStatus: TRadioGroup
    Left = 0
    Top = 90
    Width = 275
    Height = 50
    Align = alTop
    Caption = 'Status Duplicata'
    Columns = 3
    ItemIndex = 0
    Items.Strings = (
      'Todas'
      'Quitadas'
      'Pendentes')
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 141
    Width = 275
    Height = 41
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 1
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
    Top = 0
    Width = 275
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
    TabOrder = 2
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 50
    Width = 275
    Height = 40
    Align = alTop
    TabOrder = 3
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
      CalAlignment = dtaLeft
      Date = 39934.7299823958
      Time = 39934.7299823958
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 0
    end
    object dttmpcFim: TDateTimePicker
      Left = 162
      Top = 10
      Width = 98
      Height = 21
      CalAlignment = dtaLeft
      Date = 39964.7299823958
      Time = 39964.7299823958
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 1
    end
  end
end
