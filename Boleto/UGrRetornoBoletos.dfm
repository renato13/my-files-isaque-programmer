object frmGrRetornoBoleto: TfrmGrRetornoBoleto
  Left = 326
  Top = 141
  Width = 928
  Height = 480
  BorderIcons = [biSystemMenu]
  Caption = 'Retorno Boletos'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 438
    Width = 912
    Height = 4
    Align = alBottom
    Shape = bsSpacer
  end
  object Bevel5: TBevel
    Left = 0
    Top = 399
    Width = 912
    Height = 4
    Align = alBottom
    Shape = bsSpacer
  end
  object pnlFiltro: TPanel
    Left = 0
    Top = 0
    Width = 912
    Height = 121
    Align = alTop
    BevelOuter = bvNone
    BorderWidth = 4
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 4
      Top = 4
      Width = 904
      Height = 113
      Align = alClient
      Caption = 
        'Dados para processar arquivo de retorno de boletos recebidos pel' +
        'os bancos'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      DesignSize = (
        904
        113)
      object Label1: TLabel
        Left = 8
        Top = 24
        Width = 197
        Height = 13
        Caption = 'Selecionar a entidade financeira (Banco):'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 8
        Top = 64
        Width = 163
        Height = 13
        Caption = 'Diret'#243'rio dos arquivos de retorno:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 280
        Top = 24
        Width = 324
        Height = 13
        Caption = 
          'Rela'#231#227'o de arquivos de retorno da entidade financeira selecionad' +
          'a:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object cmbBanco: TComboBox
        Left = 8
        Top = 40
        Width = 257
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        ItemIndex = 0
        TabOrder = 0
        Text = '001 - Banco do Brasil'
        OnChange = cmbBancoChange
        Items.Strings = (
          '001 - Banco do Brasil'
          '341 - Ita'#250)
      end
      object edtDiretorioRetorno: TEdit
        Left = 8
        Top = 80
        Width = 257
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      object lstBxRetorno: TCheckListBox
        Left = 280
        Top = 40
        Width = 613
        Height = 60
        Anchors = [akLeft, akTop, akRight]
        Columns = 2
        ItemHeight = 13
        Items.Strings = (
          '1'
          '2'
          '3'
          '4'
          '5'
          '6'
          '7'
          '8'
          '9'
          '10')
        TabOrder = 2
      end
    end
  end
  object tlbBotoes: TToolBar
    Left = 0
    Top = 403
    Width = 912
    Height = 35
    Align = alBottom
    ButtonHeight = 31
    Caption = #39
    TabOrder = 1
    object Bevel2: TBevel
      Left = 0
      Top = 2
      Width = 4
      Height = 31
      Shape = bsSpacer
    end
    object btnFechar: TBitBtn
      Left = 4
      Top = 2
      Width = 75
      Height = 31
      Caption = '&Fechar'
      TabOrder = 0
      OnClick = btnFecharClick
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        180000000000000600000000000000000000000000000000000000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF00D5C5C4958DAF565B932C32752C2B66494878837386C9ABA100FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF00C7C7C79898986B6B6B45
        45453D3D3D5656567A7A7AABABAB00FF0000FF0000FF0000FF0000FF0000FF00
        00FF00AFAABF4853A51038A01030B00030C00030C00028B01020802B275C9783
        8700FF0000FF0000FF0000FF0000FF0000FF00B1B1B16A6A6A53535353535356
        56565656564D4D4D3B3B3B37373786868600FF0000FF0000FF0000FF0000FF00
        B5AEC73C51B21038C00030D00030D00030D00030D00030D00030D00028A00E1B
        6496808300FF0000FF0000FF0000FF00B6B6B66C6C6C5D5D5D5B5B5B5B5B5B5B
        5B5B5B5B5B5B5B5B5B5B5B4848482F2F2F83838300FF0000FF0000FF00D9CCD3
        4862B41040D00038E00038E00038E00038E00038D00030D00030D00030D00028
        A02B265BC5A09200FF0000FF00D0D0D078787866666665656565656565656565
        65656060605B5B5B5B5B5B5B5B5B484848363636A0A0A000FF0000FF009EA3CB
        2050C00038F00040F0FFFFFFFFFFFF4070F04068F0FFFFFFFFFFFF0030D00030
        D01020807F697A00FF0000FF00AFAFAF6D6D6D6A6A6A6E6E6EFFFFFFFFFFFF92
        92928D8D8DFFFFFFFFFFFF5B5B5B5B5B5B3B3B3B70707000FF0000FF006E81C5
        2048E00040FF1048FF7098FFFFFFFFFFFFFFFFFFFFFFFFFF6080F00038D00030
        D00028B047427100FF0000FF00949494727272737373797979B3B3B3FFFFFFFF
        FFFFFFFFFFFFFFFF9F9F9F6060605B5B5B4D4D4D50505000FF0000FF004B68C1
        5070FF5078FF3060FF3060FFB0C8FFFFFFFFFFFFFFA0B8FF0038F00038E00030
        D00030C02C296400FF0000FF008080809898989D9D9D8B8B8B8B8B8BD6D6D6FF
        FFFFFFFFFFCBCBCB6A6A6A6565655B5B5B5656563B3B3B00FF0000FF004B68C1
        5078FF5080FF5078FF4070FFB0C8FFFFFFFFFFFFFFA0B8FF0040FF0038E00038
        D00030C02C317300FF0000FF008080809D9D9DA1A1A19D9D9D969696D6D6D6FF
        FFFFFFFFFFCBCBCB73737365656560606056565644444400FF0000FF006E87D1
        5078F06090FF7090FF90B0FFFFFFFFFFFFFFFFFFFFFFFFFF7098FF0038F00038
        E01030B053548900FF0000FF009B9B9B989898ADADADAEAEAEC5C5C5FFFFFFFF
        FFFFFFFFFFFFFFFFB3B3B36A6A6A65656553535364646400FF0000FF009EA7D3
        4068E07098FF80A0FFFFFFFFFFFFFF80A0FF8098FFFFFFFFFFFFFF0040F00038
        E02038A08F7D9A00FF0000FF00B4B4B4888888B3B3B3BABABAFFFFFFFFFFFFBA
        BABAB5B5B5FFFFFFFFFFFF6E6E6E65656555555588888800FF0000FF00DCCFD6
        5677D06080F080A8FF90B0FF80A0FF6080FF4070FF3060FF1048FF0040F01040
        C04750A1CBABA100FF0000FF00D3D3D38E8E8E9F9F9FBEBEBEC5C5C5BABABAA3
        A3A39696968B8B8B7979796E6E6E616161676767ABABAB00FF0000FF0000FF00
        BBB7D35A76D06080F080A0FF80A8FF8098FF6088FF3060FF1048FF1048D03B4F
        B0A898A700FF0000FF0000FF0000FF00C0C0C08E8E8E9F9F9FBABABABEBEBEB5
        B5B5A8A8A88B8B8B7979796B6B6B6A6A6A9E9E9E00FF0000FF0000FF0000FF00
        00FF00BBB6D16477D05070E05078F05080FF5078FF3060E03050D0475FB0AF9E
        B100FF0000FF0000FF0000FF0000FF0000FF00BFBFBF9090908E8E8E989898A1
        A1A19D9D9D828282737373757575A6A6A600FF0000FF0000FF0000FF0000FF00
        00FF0000FF00DBCCD09DA5CF6E86CF4B67C04B67C06D7EC09B9BBFD2BBB900FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF00CFCFCFB1B1B19A9A9A7F
        7F7F7F7F7F909090A6A6A6BDBDBD00FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00}
      NumGlyphs = 2
    end
    object Bevel3: TBevel
      Left = 79
      Top = 2
      Width = 4
      Height = 31
      Shape = bsSpacer
    end
    object btnCarregarRetorno: TBitBtn
      Left = 83
      Top = 2
      Width = 118
      Height = 31
      Caption = 'Carregar &Retorno'
      TabOrder = 1
      OnClick = btnCarregarRetornoClick
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        18000000000000060000000000000000000000000000000000000000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FFCDA187E5BC9E0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF9D9D9DB7B7B700
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FFAA7457904820B47657F0CEB30000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF707070434343727272C9
        C9C90000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FFA55839D07850D07040B06030CB91730000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF5656567474746B6B6B5959598D
        8D8D0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        A05030D07850F09060E19C75D08860B96F42D3A4860000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF4E4E4E7474748B8B8B97979783838368
        68689F9F9F0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FFA56039
        E08050F09060F3AF8E0000FFF2AA86D08860B46739EBC9AF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF5B5B5B7B7B7B8B8B8BABABAB0000FFA6A6A683
        8383606060C4C4C40000FF0000FF0000FF0000FF0000FF0000FF0000FFF1B698
        F0A890F2AC820000FF0000FF0000FFE6AA86D08860AA6841F2C7B40000FF0000
        FF0000FF0000FF0000FF0000FFB2B2B2A8A8A8A6A6A60000FF0000FF0000FFA5
        A5A5838383626262C5C5C50000FF0000FF0000FF0000FF0000FF0000FFFDE0CD
        F7CEB60000FF0000FF0000FF0000FF0000FFE19C75D07850B47D56F2CCB30000
        FF0000FF0000FF0000FF0000FFDDDDDDCACACA0000FF0000FF0000FF0000FF00
        00FF979797747474767676C8C8C80000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FFE19C74C07040C38C74F1CA
        B00000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF9696966969698A8A8AC6C6C60000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FFE29F79C07040D29B
        82EBC3A80000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF9A9A9A696969999999BEBEBE0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FFF1AF91C070
        50E4B99B0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FFACACAC6E6E6EB4B4B40000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FFF1C1
        A7D291720000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FFBEBEBE8E8E8E0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF}
      NumGlyphs = 2
    end
    object btnConfirmarBaixa: TBitBtn
      Left = 201
      Top = 2
      Width = 118
      Height = 31
      Caption = '&Confirmar Baixa'
      Enabled = False
      TabOrder = 2
      OnClick = btnConfirmarBaixaClick
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        180000000000000600000000000000000000000000000000000000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF00C0A8A06048306048306048
        3060483060483060483000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF00A8A8A843434343434343434343434343434343434300FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF00C0A8A0FFF0F0F0D8D0E0D0
        C0E0C8B0E0C0B060483000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF00A8A8A8F1F1F1D8D8D8CCCCCCC3C3C3BEBEBE43434300FF0000FF00
        00FF00A6A3CC1048E01048E01048E000FF0000FF00C0B0A0FFF8F0707070F0E8
        E0707070E0C8B060483000FF0000FF0000FF00AFAFAF70707070707070707000
        FF0000FF00ACACACF6F6F6707070E6E6E6707070C3C3C343434300FF0000FF00
        00FF004070F09E9FD300FF0000FF0000FF0000FF00D0B0A0FFFFFFFFF8F0FFF0
        F0F0E8E0E0D0C060483000FF0000FF0000FF00919191AEAEAE00FF0000FF0000
        FF0000FF00AEAEAEFFFFFFF6F6F6F1F1F1E6E6E6CCCCCC43434300FF0000FF00
        00FF001048F000FF0000FF0000FF0000FF0000FF00D0B8A0FFFFFF808880FFF8
        F0707070F0D8D060483000FF0000FF0000FF0074747400FF0000FF0000FF0000
        FF0000FF00B3B3B3FFFFFF848484F6F6F6707070D8D8D843434300FF0000FF00
        6080F03058F01048E000FF0000FF0000FF0000FF00D0B0A0FFFFFFFFFFFFFFFF
        FFFFF8F0FFF0F060483000FF0000FF009E9E9E81818170707000FF0000FF0000
        FF0000FF00AEAEAEFFFFFFFFFFFFFFFFFFF6F6F6F1F1F143434300FF0000FF00
        D0CEE080A0FFD0CADC00FF0000FF0000FF0000FF00C0B0A0C0B0A0C0B0A0C0B0
        A0C0B0A0C0A8A0C0A8A000FF0000FF00D3D3D3B9B9B9D0D0D000FF0000FF0000
        FF0000FF00ACACACACACACACACACACACACACACACA8A8A8A8A8A800FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00C0A8A0604830
        60483060483060483060483060483000FF0000FF0000FF0000FF00D5D1E31048
        E0D1CFE100FF0000FF00A8A8A843434343434343434343434343434343434300
        FF0000FF0000FF0000FF00D6D6D6707070D4D4D400FF0000FF00C0A8A0FFF0F0
        F0D8D0E0D0C0E0C8B0E0C0B060483000FF0000FF0000FF0000FF0080A0FF3060
        F01048E000FF0000FF00A8A8A8F1F1F1D8D8D8CCCCCCC3C3C3BEBEBE43434300
        FF0000FF0000FF0000FF00B9B9B986868670707000FF0000FF00C0B0A0FFF8F0
        707070F0E8E0707070E0C8B060483000FF0000FF0000FF0000FF0000FF004070
        F000FF0000FF0000FF00ACACACF6F6F6707070E6E6E6707070C3C3C343434300
        FF0000FF0000FF0000FF0000FF0091919100FF0000FF0000FF00D0B0A0FFFFFF
        FFF8F0FFF0F0F0E8E0E0D0C060483000FF0000FF0000FF0000FF00AEB7EA1048
        F000FF0000FF0000FF00AEAEAEFFFFFFF6F6F6F1F1F1E6E6E6CCCCCC43434300
        FF0000FF0000FF0000FF00C5C5C574747400FF0000FF0000FF00D0B8A0FFFFFF
        808880FFF8F0707070F0D8D060483000FF0000FF006088F07090F07090F0A8B6
        EB00FF0000FF0000FF00B3B3B3FFFFFF848484F6F6F6707070D8D8D843434300
        FF0000FF00A3A3A3A9A9A9A9A9A9C4C4C400FF0000FF0000FF00D0B0A0FFFFFF
        FFFFFFFFFFFFFFF8F0FFF0F060483000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF00AEAEAEFFFFFFFFFFFFFFFFFFF6F6F6F1F1F143434300
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00C0B0A0C0B0A0
        C0B0A0C0B0A0C0B0A0C0A8A0C0A8A000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF00ACACACACACACACACACACACACACACACA8A8A8A8A8A800
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00}
      NumGlyphs = 2
    end
    object Bevel4: TBevel
      Left = 319
      Top = 2
      Width = 4
      Height = 31
      Shape = bsSpacer
    end
  end
  object pnlTitulos: TPanel
    Left = 0
    Top = 121
    Width = 912
    Height = 278
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 4
    TabOrder = 2
    object Shape1: TShape
      Left = 4
      Top = 4
      Width = 904
      Height = 20
      Align = alTop
      Brush.Color = clMoneyGreen
      Pen.Color = 9355662
    end
    object Bevel6: TBevel
      Left = 4
      Top = 24
      Width = 904
      Height = 4
      Align = alTop
      Shape = bsSpacer
    end
    object Label3: TLabel
      Left = 8
      Top = 8
      Width = 383
      Height = 13
      Caption = 
        'Rela'#231#227'o dos t'#237'tulos recebidos presentes no(s) arquivo(s) de reto' +
        'rno'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object dbgTitulos: TDBGrid
      Left = 4
      Top = 28
      Width = 904
      Height = 246
      Hint = 
        'Pressione a tecla "SPACE (Espa'#231'o)" para marcar/desmarcar'#13#10'os t'#237't' +
        'ulos para a gera'#231#227'o de boletos banc'#225'rios.'
      Align = alClient
      DataSource = DtsTitulos
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 0
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clBlack
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = [fsBold]
      OnDrawColumnCell = dbgTitulosDrawColumnCell
      Columns = <
        item
          Expanded = False
          FieldName = 'Quitar'
          Title.Alignment = taCenter
          Width = 45
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NossoNumero'
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NumeroDocumento'
          Title.Alignment = taCenter
          Title.Caption = 'No. Documento'
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DataPagamento'
          Title.Alignment = taCenter
          Title.Caption = 'Data Pagto.'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ValorPago'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Lancamento'
          Title.Alignment = taCenter
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Parcela'
          Title.Alignment = taCenter
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'APagar'
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Sacado'
          Width = 250
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Cnpj'
          Width = 120
          Visible = True
        end>
    end
  end
  object IbTblBancos: TIBTable
    Database = Dm.ibDtbsDVM
    Transaction = Dm.ibTrnsctnDVM
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'BCO_COD'
        DataType = ftSmallint
      end
      item
        Name = 'BCO_CARTEIRA'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'BCO_NOME'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'BCO_CHAVE'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'BCO_AGENCIA'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'BCO_CC'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'BCO_NOSSO_NUM_INICIO'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'BCO_NOSSO_NUM_FINAL'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'BCO_NOSSO_NUM_PROXIMO'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'BCO_CONFG_1'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'BCO_CONFG_2'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'BCO_SEQUENCIAL_REM'
        DataType = ftInteger
      end
      item
        Name = 'BCO_DIRETORIO_REMESSA'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'BCO_DIRETORIO_RETORNO'
        DataType = ftString
        Size = 100
      end>
    IndexDefs = <
      item
        Name = 'PK_TBBANCO_BOLETO'
        Fields = 'BCO_COD'
        Options = [ixUnique]
      end>
    IndexName = 'PK_TBBANCO_BOLETO'
    StoreDefs = True
    TableName = 'TBBANCO_BOLETO'
    Left = 16
    Top = 232
    object IbTblBancosBCO_COD: TSmallintField
      FieldName = 'BCO_COD'
      ProviderFlags = [pfInUpdate, pfInKey]
    end
    object IbTblBancosBCO_CARTEIRA: TIBStringField
      FieldName = 'BCO_CARTEIRA'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object IbTblBancosBCO_NOME: TIBStringField
      FieldName = 'BCO_NOME'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object IbTblBancosBCO_CHAVE: TIBStringField
      FieldName = 'BCO_CHAVE'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object IbTblBancosBCO_AGENCIA: TIBStringField
      FieldName = 'BCO_AGENCIA'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object IbTblBancosBCO_CC: TIBStringField
      FieldName = 'BCO_CC'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object IbTblBancosBCO_NOSSO_NUM_INICIO: TIBStringField
      FieldName = 'BCO_NOSSO_NUM_INICIO'
      Size = 10
    end
    object IbTblBancosBCO_NOSSO_NUM_FINAL: TIBStringField
      FieldName = 'BCO_NOSSO_NUM_FINAL'
      Size = 10
    end
    object IbTblBancosBCO_NOSSO_NUM_PROXIMO: TIBStringField
      FieldName = 'BCO_NOSSO_NUM_PROXIMO'
      Size = 10
    end
    object IbTblBancosBCO_CONFG_1: TIBStringField
      FieldName = 'BCO_CONFG_1'
    end
    object IbTblBancosBCO_CONFG_2: TIBStringField
      FieldName = 'BCO_CONFG_2'
    end
    object IbTblBancosBCO_SEQUENCIAL_REM: TIntegerField
      FieldName = 'BCO_SEQUENCIAL_REM'
    end
    object IbTblBancosBCO_DIRETORIO_REMESSA: TIBStringField
      FieldName = 'BCO_DIRETORIO_REMESSA'
      Size = 100
    end
    object IbTblBancosBCO_DIRETORIO_RETORNO: TIBStringField
      FieldName = 'BCO_DIRETORIO_RETORNO'
      Size = 100
    end
  end
  object UpdateLanc: TIBSQL
    Database = Dm.ibDtbsDVM
    ParamCheck = True
    SQL.Strings = (
      'Update TBCONTREC set'
      '    nossonumero = :nossonumero'
      '  , codbanco    = :banco'
      '  , dataprocessoboleto = :data'
      'where numlanc = :lancamento')
    Transaction = Dm.ibTrnsctnDVM
    Left = 112
    Top = 264
  end
  object CdsTitulos: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'Quitar'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'NossoNumero'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'DataPagamento'
        DataType = ftDate
      end
      item
        Name = 'ValorPago'
        DataType = ftCurrency
      end
      item
        Name = 'NumeroDocumento'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Arquivo'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Lancamento'
        DataType = ftLargeint
      end
      item
        Name = 'Parcela'
        DataType = ftInteger
      end
      item
        Name = 'Banco'
        DataType = ftInteger
      end
      item
        Name = 'APagar'
        DataType = ftCurrency
      end
      item
        Name = 'Sacado'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'Cnpj'
        DataType = ftString
        Size = 20
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 16
    Top = 264
    object CdsTitulosQuitar: TStringField
      Alignment = taCenter
      FieldName = 'Quitar'
      Size = 1
    end
    object CdsTitulosNossoNumero: TStringField
      DisplayLabel = 'Nosso N'#250'mero'
      FieldName = 'NossoNumero'
    end
    object CdsTitulosDataPagamento: TDateField
      Alignment = taCenter
      DisplayLabel = 'D. Pagto.'
      FieldName = 'DataPagamento'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object CdsTitulosValorPago: TCurrencyField
      DisplayLabel = 'Valor Pago (R$)'
      FieldName = 'ValorPago'
    end
    object CdsTitulosNumeroDocumento: TStringField
      Alignment = taCenter
      DisplayLabel = 'Documento'
      FieldName = 'NumeroDocumento'
    end
    object CdsTitulosArquivo: TStringField
      FieldName = 'Arquivo'
      Size = 50
    end
    object CdsTitulosLancamento: TLargeintField
      Alignment = taCenter
      DisplayLabel = 'Lan'#231'amento'
      FieldName = 'Lancamento'
      DisplayFormat = '0000000'
    end
    object CdsTitulosParcela: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'Parc.'
      FieldName = 'Parcela'
      DisplayFormat = '000'
    end
    object CdsTitulosBanco: TIntegerField
      Alignment = taCenter
      FieldName = 'Banco'
      DisplayFormat = '000'
    end
    object CdsTitulosAPagar: TCurrencyField
      DisplayLabel = 'A Pagar (R$)'
      FieldName = 'APagar'
    end
    object CdsTitulosSacado: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'Sacado'
      Size = 60
    end
    object CdsTitulosCnpj: TStringField
      DisplayLabel = 'CNPJ/CPF'
      FieldName = 'Cnpj'
    end
  end
  object DtsTitulos: TDataSource
    DataSet = CdsTitulos
    Left = 48
    Top = 264
  end
  object gFind: TIBQuery
    Database = Dm.ibDtbsDVM
    Transaction = Dm.ibTrnsctnDVM
    BufferChunks = 1000
    CachedUpdates = False
    Left = 80
    Top = 265
  end
end
