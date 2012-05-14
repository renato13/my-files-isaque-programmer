object frmRelVendas: TfrmRelVendas
  Left = 250
  Top = 149
  Width = 925
  Height = 533
  VertScrollBar.Position = 64
  Caption = 'Relat'#243'rio de Vendas'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Left = 64
    Top = -40
    Width = 32
    Height = 13
    Caption = 'SERIE'
  end
  object Panel1: TPanel
    Left = -8
    Top = 145
    Width = 837
    Height = 48
    Align = alCustom
    BevelOuter = bvLowered
    TabOrder = 0
    object BitBtn2: TBitBtn
      Left = 144
      Top = 6
      Width = 75
      Height = 27
      Caption = '&Fechar'
      TabOrder = 0
      Kind = bkClose
    end
    object btbtnLista: TBitBtn
      Left = 40
      Top = 7
      Width = 89
      Height = 26
      Caption = '&Imprimir'
      PopupMenu = PopupMenu1
      TabOrder = 1
      OnClick = btbtnListaClick
      Glyph.Data = {
        76080000424D7608000000000000760000002800000020000000100000000100
        2000000000000008000000000000000000001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00008080000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000808000008080007F7F
        7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
        7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F000080800000000000BFBF
        BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
        BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00000000007F7F7F00FFFF
        FF00008080000080800000808000008080000080800000808000008080000080
        800000808000008080000080800000808000008080007F7F7F0000000000BFBF
        BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
        BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00000000007F7F7F00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF007F7F7F00000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000000000000007F7F7F007F7F
        7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
        7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F0000000000FFFF
        FF00BFBFBF00FFFFFF00BFBFBF00FFFFFF00BFBFBF00FFFFFF00BFBFBF00FFFF
        FF00BFBFBF00FFFFFF00BFBFBF00FFFFFF00BFBFBF00000000007F7F7F00FFFF
        FF00008080000080800000808000008080000080800000808000008080000080
        800000808000008080000080800000808000FFFFFF007F7F7F0000000000BFBF
        BF00FFFFFF00BFBFBF00FFFFFF00BFBFBF00FFFFFF00BFBFBF00FFFFFF00BFBF
        BF00FFFFFF00BFBFBF00FFFFFF000000FF00FFFFFF00000000007F7F7F00FFFF
        FF00008080000080800000808000008080000080800000808000008080000080
        80000080800000808000008080007F7F7F00008080007F7F7F0000000000FFFF
        FF00BFBFBF00FFFFFF00BFBFBF00FFFFFF00BFBFBF00FFFFFF00BFBFBF00FFFF
        FF00BFBFBF00FFFFFF00BFBFBF00FFFFFF00BFBFBF00000000007F7F7F00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF007F7F7F00000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000000000000007F7F7F007F7F
        7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
        7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F00008080000080
        80000080800000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF0000000000008080000080800000808000008080000080
        8000008080007F7F7F00FFFFFF0000808000FFFFFF00FFFFFF00FFFFFF00FFFF
        FF0000808000FFFFFF007F7F7F00FFFFFF000080800000808000008080000080
        80000080800000000000FFFFFF0000000000000000000000000000000000FFFF
        FF0000000000FFFFFF0000000000008080000080800000808000008080000080
        8000008080007F7F7F00FFFFFF007F7F7F007F7F7F007F7F7F007F7F7F000080
        80007F7F7F00008080007F7F7F00FFFFFF000080800000808000008080000080
        80000080800000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF0000000000008080000080800000808000008080000080
        8000008080007F7F7F00FFFFFF0000808000FFFFFF00FFFFFF0000808000FFFF
        FF00FFFFFF00FFFFFF007F7F7F00FFFFFF000080800000808000008080000080
        80000080800000000000FFFFFF000000000000000000FFFFFF00000000000000
        0000000000000000000000000000008080000080800000808000008080000080
        8000008080007F7F7F00FFFFFF007F7F7F007F7F7F00008080007F7F7F007F7F
        7F007F7F7F007F7F7F007F7F7F00008080000080800000808000008080000080
        80000080800000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
        FF00FFFFFF000000000000808000008080000080800000808000008080000080
        8000008080007F7F7F00FFFFFF0000808000FFFFFF00008080007F7F7F00FFFF
        FF00008080007F7F7F0000808000008080000080800000808000008080000080
        80000080800000000000FFFFFF0000000000BFBFBF00FFFFFF0000000000FFFF
        FF00000000000080800000808000008080000080800000808000008080000080
        8000008080007F7F7F00FFFFFF007F7F7F0000808000008080007F7F7F00FFFF
        FF007F7F7F000080800000808000008080000080800000808000008080000080
        80000080800000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
        0000008080000080800000808000008080000080800000808000008080000080
        8000008080007F7F7F00FFFFFF00FFFFFF00FFFFFF00FFFFFF007F7F7F007F7F
        7F00008080000080800000808000008080000080800000808000008080000080
        8000008080000000000000000000000000000000000000000000000000000080
        8000008080000080800000808000008080000080800000808000008080000080
        8000008080007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F000080
        8000008080000080800000808000008080000080800000808000}
      NumGlyphs = 2
    end
  end
  object cmbbxSerie: TComboBox
    Left = 57
    Top = -46
    Width = 65
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 1
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = -64
    Width = 966
    Height = 60
    Align = alTop
    Caption = 'Per'#237'odo do Faturamento'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    object Label1: TLabel
      Left = 9
      Top = 24
      Width = 17
      Height = 13
      Caption = 'De:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 142
      Top = 25
      Width = 6
      Height = 13
      Caption = 'a'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object dttmpcIni: TDateTimePicker
      Left = 33
      Top = 24
      Width = 101
      Height = 21
      Date = 41061.729982395800000000
      Time = 41061.729982395800000000
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object dttmpcFim: TDateTimePicker
      Left = 162
      Top = 24
      Width = 98
      Height = 21
      Date = 41090.729982395800000000
      Time = 41090.729982395800000000
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
  end
  object qckrpVendas: TQuickRep
    Left = 14
    Top = 204
    Width = 952
    Height = 1347
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    DataSet = ibqryVendas
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Functions.Strings = (
      'PAGENUMBER'
      'COLUMNNUMBER'
      'REPORTTITLE')
    Functions.DATA = (
      '0'
      '0'
      #39#39)
    Options = [FirstPageHeader, LastPageFooter]
    Page.Columns = 1
    Page.Orientation = poPortrait
    Page.PaperSize = A4
    Page.Values = (
      100.000000000000000000
      2970.000000000000000000
      100.000000000000000000
      2100.000000000000000000
      100.000000000000000000
      100.000000000000000000
      0.000000000000000000)
    PrinterSettings.Copies = 1
    PrinterSettings.Duplex = False
    PrinterSettings.FirstPage = 0
    PrinterSettings.LastPage = 0
    PrinterSettings.OutputBin = Auto
    PrintIfEmpty = True
    SnapToGrid = True
    Units = MM
    Zoom = 120
    object TitleBand1: TQRBand
      Left = 45
      Top = 45
      Width = 861
      Height = 108
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = True
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Frame.Width = 2
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        238.125000000000000000
        1898.385416666667000000)
      BandType = rbTitle
      object QRLabel6: TQRLabel
        Left = 0
        Top = 5
        Width = 154
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          41.892361111111110000
          0.000000000000000000
          11.024305555555560000
          339.548611111111100000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'DVM - Sistema de Vendas Mercantil'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRSysData1: TQRSysData
        Left = 808
        Top = 0
        Width = 53
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          41.892361111111110000
          1781.527777777778000000
          0.000000000000000000
          116.857638888888900000)
        Alignment = taRightJustify
        AlignToBand = True
        AutoSize = True
        Color = clWhite
        Data = qrsDateTime
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        FontSize = 6
      end
      object qrlblPeriodo: TQRLabel
        Left = 0
        Top = 65
        Width = 67
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          41.892361111111110000
          0.000000000000000000
          143.315972222222200000
          147.725694444444400000)
        Alignment = taLeftJustify
        AlignToBand = True
        AutoSize = True
        AutoStretch = False
        Caption = 'PERIODO'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRLabel2: TQRLabel
        Left = 289
        Top = 41
        Width = 283
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Frame.Style = psDashDotDot
        Size.Values = (
          44.097222222222220000
          637.204861111111100000
          90.399305555555560000
          623.975694444444400000)
        Alignment = taCenter
        AlignToBand = True
        AutoSize = True
        AutoStretch = False
        Caption = 'RELAT'#211'RIO DE VENDAS - ANAL'#205'TICO'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrlblVendedor: TQRLabel
        Left = 0
        Top = 84
        Width = 83
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          41.892361111111110000
          0.000000000000000000
          185.208333333333300000
          183.003472222222200000)
        Alignment = taLeftJustify
        AlignToBand = True
        AutoSize = True
        AutoStretch = False
        Caption = 'VENDEDOR'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRDBText5: TQRDBText
        Left = 392
        Top = 12
        Width = 76
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          864.305555555555600000
          26.458333333333330000
          167.569444444444400000)
        Alignment = taCenter
        AlignToBand = True
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataField = 'NMFANT'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Black'
        Font.Style = [fsUnderline]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrlblStatus: TQRLabel
        Left = 805
        Top = 84
        Width = 56
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          41.892361111111110000
          1774.913194444444000000
          185.208333333333300000
          123.472222222222200000)
        Alignment = taRightJustify
        AlignToBand = True
        AutoSize = True
        AutoStretch = False
        Caption = 'STATUS'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
    end
    object ColumnHeaderBand1: TQRBand
      Left = 45
      Top = 153
      Width = 861
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = True
      Frame.DrawBottom = True
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ForceNewColumn = False
      ForceNewPage = False
      ParentFont = False
      Size.Values = (
        44.097222222222220000
        1898.385416666667000000)
      BandType = rbColumnHeader
      object QRLabel4: TQRLabel
        Left = 98
        Top = 1
        Width = 56
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          41.892361111111110000
          216.076388888888900000
          2.204861111111111000
          123.472222222222200000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'N'#186' VENDA'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial Narrow'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel5: TQRLabel
        Left = 824
        Top = 1
        Width = 37
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          41.892361111111110000
          1816.805555555556000000
          2.204861111111111000
          81.579861111111110000)
        Alignment = taRightJustify
        AlignToBand = True
        AutoSize = True
        AutoStretch = False
        Caption = 'TOTAL'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial Narrow'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object qrlblCliMot: TQRLabel
        Left = 198
        Top = 1
        Width = 49
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          41.892361111111110000
          436.562500000000000000
          2.204861111111111000
          108.038194444444400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'CLIENTE'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial Narrow'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel7: TQRLabel
        Left = 0
        Top = 1
        Width = 59
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          41.892361111111110000
          0.000000000000000000
          2.204861111111111000
          130.086805555555600000)
        Alignment = taLeftJustify
        AlignToBand = True
        AutoSize = True
        AutoStretch = False
        Caption = 'DT.VENDA'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial Narrow'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel1: TQRLabel
        Left = 542
        Top = 1
        Width = 64
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          41.892361111111110000
          1195.034722222222000000
          2.204861111111111000
          141.111111111111100000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'DESCONTO'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial Narrow'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
    end
    object DetailBand1: TQRBand
      Left = 45
      Top = 173
      Width = 861
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = True
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ForceNewColumn = False
      ForceNewPage = False
      ParentFont = False
      Size.Values = (
        41.892361111111110000
        1898.385416666667000000)
      BandType = rbDetail
      object QRDBText1: TQRDBText
        Left = 111
        Top = 2
        Width = 30
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.097222222222220000
          244.739583333333300000
          4.409722222222222000
          66.145833333333330000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = ibqryVendas
        DataField = 'CODCONTROL'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial Narrow'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText2: TQRDBText
        Left = 198
        Top = 2
        Width = 225
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.097222222222220000
          436.562500000000000000
          4.409722222222222000
          496.093750000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = ibqryVendas
        DataField = 'CLIENTE'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial Narrow'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText6: TQRDBText
        Left = 787
        Top = 2
        Width = 74
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          41.892361111111110000
          1735.225694444444000000
          4.409722222222222000
          163.159722222222200000)
        Alignment = taRightJustify
        AlignToBand = True
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = ibqryVendas
        DataField = 'TOTALVENDA'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial Narrow'
        Font.Style = []
        Mask = '###,##0.00'
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText10: TQRDBText
        Left = 0
        Top = 2
        Width = 65
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          41.892361111111110000
          0.000000000000000000
          4.409722222222222000
          143.315972222222200000)
        Alignment = taLeftJustify
        AlignToBand = True
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = ibqryVendas
        DataField = 'DTFINALIZACAO_VENDA'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial Narrow'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText7: TQRDBText
        Left = 545
        Top = 2
        Width = 64
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          41.892361111111110000
          1201.649305555556000000
          4.409722222222222000
          141.111111111111100000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = ibqryVendas
        DataField = 'DESCONTO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial Narrow'
        Font.Style = []
        Mask = '###,##0.00'
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
    end
    object PageFooterBand1: TQRBand
      Left = 45
      Top = 192
      Width = 861
      Height = 29
      Frame.Color = clBlack
      Frame.DrawTop = True
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Frame.Width = 2
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        63.940972222222220000
        1898.385416666667000000)
      BandType = rbSummary
      object QRLabel11: TQRLabel
        Left = 0
        Top = 6
        Width = 50
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          41.892361111111110000
          0.000000000000000000
          13.229166666666670000
          110.243055555555600000)
        Alignment = taLeftJustify
        AlignToBand = True
        AutoSize = True
        AutoStretch = False
        Caption = 'TOTAL:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRExpr1: TQRExpr
        Left = 627
        Top = 6
        Width = 234
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          41.892361111111110000
          1382.447916666667000000
          13.229166666666670000
          515.937500000000000000)
        Alignment = taRightJustify
        AlignToBand = True
        AutoSize = True
        AutoStretch = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        WordWrap = True
        Expression = 'SUM(ibqryCRecParc.VALORPARC)'
        Mask = 'R$ ###,##0.00'
        FontSize = 9
      end
      object QRSysData3: TQRSysData
        Left = 59
        Top = 6
        Width = 91
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          41.892361111111110000
          130.086805555555600000
          13.229166666666670000
          200.642361111111100000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        Color = clWhite
        Data = qrsDetailCount
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        FontSize = 9
      end
    end
    object PageFooterBand2: TQRBand
      Left = 45
      Top = 221
      Width = 861
      Height = 29
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        63.940972222222220000
        1898.385416666667000000)
      BandType = rbPageFooter
      object QRSysData2: TQRSysData
        Left = 821
        Top = 5
        Width = 40
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          41.892361111111110000
          1810.190972222222000000
          11.024305555555560000
          88.194444444444440000)
        Alignment = taRightJustify
        AlignToBand = True
        AutoSize = True
        Color = clWhite
        Data = qrsPageNumber
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial Narrow'
        Font.Style = []
        ParentFont = False
        Transparent = False
        FontSize = 8
      end
    end
  end
  object grpbxVendedor: TGroupBox
    Left = 0
    Top = -4
    Width = 966
    Height = 61
    Align = alTop
    Caption = 'Status'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    object ComboBox1: TComboBox
      Left = 10
      Top = 22
      Width = 151
      Height = 21
      Style = csDropDownList
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemHeight = 13
      ParentFont = False
      TabOrder = 0
      Items.Strings = (
        'FINALIZADA'
        'CANCELADA')
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 57
    Width = 966
    Height = 61
    Align = alTop
    Caption = 'Vendedor'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    object ComboBox2: TComboBox
      Left = 10
      Top = 22
      Width = 249
      Height = 21
      Style = csDropDownList
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemHeight = 13
      ParentFont = False
      TabOrder = 0
    end
  end
  object ibqryVendedor: TIBQuery
    BufferChunks = 1000
    CachedUpdates = False
    Left = 297
    Top = 131
    object ibqryVendedorNOME: TIBStringField
      FieldName = 'NOME'
      Origin = 'TBVENDEDOR.NOME'
      Required = True
      Size = 60
    end
  end
  object ibqryVendas: TIBQuery
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select C.nome as CLIENTE, V.CODCONTROL, V.DTFINALIZACAO_VENDA, V' +
        '.DESCONTO, V.STATUS, V.TOTALVENDA, ve.nome as VENDEDOR'
      'from TBVENDAS V inner join  TBCLIENTE C'
      '    on V.CODCLI = C.cnpj'
      '     inner join tbvendedor ve'
      '     on v.vendedor_cod = ve.cod'
      'where DTFINALIZACAO_VENDA between '#39'02.05.2012'#39' and '#39'02.05.2012'#39
      'and STATUS in (3,4)'
      'order by DTFINALIZACAO_VENDA, CODCONTROL')
    Left = 289
    Top = 11
  end
  object PopupMenu1: TPopupMenu
    Left = 240
    Top = 200
    object Analtico1: TMenuItem
      Caption = 'Anal'#237'tico'
      OnClick = Analtico1Click
    end
    object Sinttico1: TMenuItem
      Caption = 'Sint'#233'tico'
    end
  end
end
