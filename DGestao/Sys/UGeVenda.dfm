inherited frmGeVenda: TfrmGeVenda
  Left = 485
  Top = 265
  Width = 1045
  Height = 672
  ActiveControl = nil
  Caption = 'Controle de Vendas'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Top = 630
    Width = 1029
  end
  inherited Bevel3: TBevel
    Top = 591
    Width = 1029
  end
  inherited tlbBotoes: TToolBar
    Top = 595
    Width = 1029
  end
  inherited pgcGuias: TPageControl
    Width = 1029
    Height = 591
    inherited tbsTabela: TTabSheet
      inherited Bevel4: TBevel
        Top = 496
        Width = 1021
      end
      inherited dbgDados: TDBGrid
        Width = 1021
        Height = 496
      end
      inherited pnlFiltros: TPanel
        Top = 500
        Width = 1021
        inherited grpBxFiltro: TGroupBox
          Left = 584
          Width = 433
          DesignSize = (
            433
            54)
          inherited lbltFiltrar: TLabel
            Left = 174
            Width = 38
            Caption = 'Venda:'
          end
          inherited btnFiltrar: TSpeedButton
            Left = 388
          end
          object lblData: TLabel [2]
            Left = 14
            Top = 25
            Width = 30
            Height = 13
            Caption = 'Data:'
            FocusControl = edData
          end
          inherited edtFiltrar: TEdit
            Left = 224
            Width = 160
            TabOrder = 1
          end
          object edData: TDateTimePicker
            Left = 56
            Top = 21
            Width = 105
            Height = 21
            Date = 40913.000000000000000000
            Time = 40913.000000000000000000
            TabOrder = 0
          end
        end
      end
    end
    inherited tbsCadastro: TTabSheet
      inherited Bevel8: TBevel
        Top = 233
        Width = 1021
      end
      object Bevel5: TBevel [1]
        Left = 0
        Top = 113
        Width = 1021
        Height = 4
        Align = alTop
        Shape = bsSpacer
      end
      object Bevel6: TBevel [2]
        Left = 0
        Top = 412
        Width = 1021
        Height = 4
        Align = alBottom
        Shape = bsSpacer
      end
      inherited GrpBxDadosNominais: TGroupBox
        Width = 1021
        Height = 113
        Caption = 'Dados da venda'
        inherited lblCodigo: TLabel
          Width = 58
          Caption = 'No. Venda:'
        end
        object lblEmpresa: TLabel [1]
          Left = 240
          Top = 24
          Width = 45
          Height = 13
          Caption = 'Empresa:'
          FocusControl = dbEmpresa
        end
        object lblCliente: TLabel [2]
          Left = 672
          Top = 24
          Width = 37
          Height = 13
          Caption = 'Cliente:'
          FocusControl = dbCliente
        end
        object lblDataHora: TLabel [3]
          Left = 112
          Top = 24
          Width = 63
          Height = 13
          Caption = 'Data/Hora:'
          FocusControl = dbDataHora
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblSerie: TLabel [4]
          Left = 16
          Top = 64
          Width = 32
          Height = 13
          Caption = 'S'#233'rie:'
          FocusControl = dbSerie
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblNFe: TLabel [5]
          Left = 64
          Top = 64
          Width = 28
          Height = 13
          Caption = 'NF-e:'
          FocusControl = dbNFe
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblDataEmissao: TLabel [6]
          Left = 192
          Top = 64
          Width = 79
          Height = 13
          Caption = 'Data Emiss'#227'o:'
          FocusControl = dbDataEmissao
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblSituacao: TLabel [7]
          Left = 280
          Top = 64
          Width = 52
          Height = 13
          Caption = 'Situa'#231#227'o:'
          FocusControl = dbSituacao
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblVendedor: TLabel [8]
          Left = 672
          Top = 64
          Width = 50
          Height = 13
          Caption = 'Vendedor:'
          FocusControl = dbVendedor
        end
        object lblValorTotal: TLabel [9]
          Left = 568
          Top = 64
          Width = 92
          Height = 13
          Caption = 'Valor Total (R$):'
          FocusControl = dbValorTotal
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblValorDesconto: TLabel [10]
          Left = 472
          Top = 64
          Width = 84
          Height = 13
          Caption = 'Desconto (R$):'
          FocusControl = dbValorDesconto
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        inherited dbCodigo: TDBEdit
          Width = 89
          TabStop = False
          Color = clMoneyGreen
        end
        object dbEmpresa: TDBLookupComboBox
          Left = 240
          Top = 40
          Width = 425
          Height = 21
          DataSource = DtSrcTabela
          DropDownRows = 10
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyField = 'CNPJ'
          ListField = 'RZSOC'
          ListSource = dtsEmpresa
          ParentFont = False
          TabOrder = 2
        end
        object dbCliente: TRxDBComboEdit
          Left = 672
          Top = 40
          Width = 329
          Height = 21
          ButtonHint = 'Pesquisar Cliente (Ctrl+P)'
          CharCase = ecUpperCase
          ClickKey = 16464
          Color = clMoneyGreen
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Glyph.Data = {
            36060000424D3606000000000000360000002800000020000000100000000100
            18000000000000060000000000000000000000000000000000001DE6B51DE6B5
            1DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B5B1AD
            AC203040ACA5A21DE6B5C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7FACA5A2C3C3C31DE6B5B0A090
            6048306048306048306048306048306048306048306048306048305048403050
            604078C0304860B1ACA6C3C3C37F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
            7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3B1ACA61DE6B5B0A090
            FFFFFFB0A090B0A090B0A090B0A090B0A090B0A090B0A0909088803050703080
            D04098E050B0F0506870C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C39088807F7F7FC3C3C3C3C3C3C3C3C37F7F7F1DE6B5B0A090
            FFFFFFFFFFFFFFF8FFF0F0F0D0D8D090989070686060686050586040709040A0
            E060C8FF7090A0C5BEB5C3C3C37F7F7FFFFFFFFFFFFFFFF8FFF0F0F0D0D8D07F
            7F7F7F7F7F7F7F7F505860C3C3C3C3C3C3C3C3C37090A0C5BEB51DE6B5B0A090
            FFFFFFFFFFFFFFFFFFE0E0E0909090B0A8A0D0C0B0D0B0A08078705058506090
            B07098B0AEAEAA1DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFFE0E0E07F7F7F7F
            7F7FD0C0B0D0B0A0807870505850C3C3C37098B0AEAEAAC3C3C31DE6B5B0A090
            FFFFFFFFFFFFFFFFFFB0B0B0C0B8B0FFF0E0FFE8E0F0D8C0F0D0B08078709D8F
            8CAEAFAA1DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFF7F7F7F7F7F7FFF
            F0E0FFE8E0F0D8C0F0D0B08078709D8F8CAEAFAAC3C3C3C3C3C31DE6B5C0A890
            FFFFFFFFFFFFFFFFFFA09890F0E8E0FFF8F0FFF0F0FFE8E0F0D8D0D0B0A06367
            5E1DE6B51DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFF7F7F7F7F7F7FFF
            F8F0FFF0F0FFE8E0F0D8D0D0B0A063675EC3C3C3C3C3C3C3C3C31DE6B5C0A8A0
            FFFFFFFFFFFFFFFFFFA0A090F0E8E0FFFFFFFFF8F0FFF0F0FFE8E0E0C0B0716E
            6C1DE6B51DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFF7F7F7F7F7F7FFF
            FFFFFFF8F0FFF0F0FFE8E0E0C0B0716E6CC3C3C3C3C3C3C3C3C31DE6B5C0B0A0
            FFFFFFFFFFFFFFFFFFC0C8C0C0C0C0FFFFFFFFFFFFFFF8F0FFF0E0B0A090A69C
            951DE6B51DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFF7F7F7F7F7F7FFF
            FFFFFFFFFFFFF8F0FFF0E0B0A090A69C95C3C3C3C3C3C3C3C3C31DE6B5D0B0A0
            FFFFFFFFFFFFFFFFFFF0F8FFC0B8B0C0C0C0F0E8E0F0E8E0B0B0A07070601DE6
            B51DE6B51DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFFF0F8FF7F7F7F7F
            7F7FF0E8E0F0E8E0B0B0A0707060C3C3C3C3C3C3C3C3C3C3C3C31DE6B5D0B8A0
            FFFFFFFFFFFFFFFFFFFFFFFFF0F8FFC0C8C0A0A0909090809090906050401DE6
            B51DE6B51DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFFFFFFFFF0F8FF7F
            7F7FA0A0907F7F7F909090605040C3C3C3C3C3C3C3C3C3C3C3C31DE6B5D0B8B0
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB0A0906048306048306048301DE6
            B51DE6B51DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFF7F7F7F604830604830604830C3C3C3C3C3C3C3C3C3C3C3C31DE6B5D0C0B0
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0A890D0C8C06048301DE6B51DE6
            B51DE6B51DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFF7F7F7FC3C3C3604830C3C3C3C3C3C3C3C3C3C3C3C3C3C3C31DE6B5E0C0B0
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0A8A0604830E0C6B71DE6B51DE6
            B51DE6B51DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C31DE6B5E0C0B0
            E0C0B0E0C0B0E0C0B0E0C0B0D0C0B0D0B8B0D0B0A0E0C7B91DE6B51DE6B51DE6
            B51DE6B51DE6B51DE6B5C3C3C37F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
            7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C31DE6B51DE6B5
            1DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6
            B51DE6B51DE6B51DE6B5C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3}
          NumGlyphs = 2
          ParentFont = False
          ParentShowHint = False
          ReadOnly = True
          ShowHint = True
          TabOrder = 3
        end
        object dbDataHora: TDBEdit
          Left = 112
          Top = 40
          Width = 121
          Height = 21
          TabStop = False
          Color = clMoneyGreen
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
        end
        object dbSerie: TDBEdit
          Left = 16
          Top = 80
          Width = 41
          Height = 21
          TabStop = False
          Color = clMoneyGreen
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 4
        end
        object dbNFe: TDBEdit
          Left = 64
          Top = 80
          Width = 121
          Height = 21
          TabStop = False
          Color = clMoneyGreen
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 5
        end
        object dbDataEmissao: TDBEdit
          Left = 192
          Top = 80
          Width = 81
          Height = 21
          TabStop = False
          Color = clMoneyGreen
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 6
        end
        object dbSituacao: TDBEdit
          Left = 280
          Top = 80
          Width = 185
          Height = 21
          TabStop = False
          Color = clMoneyGreen
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 7
        end
        object dbVendedor: TDBLookupComboBox
          Left = 672
          Top = 80
          Width = 329
          Height = 21
          DataSource = DtSrcTabela
          DropDownRows = 10
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyField = 'CNPJ'
          ListField = 'RZSOC'
          ListSource = dtsEmpresa
          ParentFont = False
          TabOrder = 10
        end
        object dbValorTotal: TDBEdit
          Left = 568
          Top = 80
          Width = 97
          Height = 21
          TabStop = False
          Color = clMoneyGreen
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 9
        end
        object dbValorDesconto: TDBEdit
          Left = 472
          Top = 80
          Width = 89
          Height = 21
          TabStop = False
          Color = clMoneyGreen
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 8
        end
      end
      object GrpBxDadosProduto: TGroupBox
        Left = 0
        Top = 117
        Width = 1021
        Height = 116
        Align = alTop
        Caption = 'Dados do produto'
        TabOrder = 1
        object lblProduto: TLabel
          Left = 88
          Top = 24
          Width = 42
          Height = 13
          Caption = 'Produto:'
          FocusControl = dbProduto
        end
        object lblQuantidade: TLabel
          Left = 208
          Top = 64
          Width = 60
          Height = 13
          Caption = 'Quantidade:'
          FocusControl = dbQuantidade
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblValorUnit: TLabel
          Left = 304
          Top = 64
          Width = 92
          Height = 13
          Caption = 'Valor Unit'#225'rio (R$):'
          FocusControl = dbValorUnit
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblDesconto: TLabel
          Left = 536
          Top = 64
          Width = 45
          Height = 13
          Caption = '% Desc.:'
          FocusControl = dbDesconto
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblValorLiq: TLabel
          Left = 608
          Top = 64
          Width = 88
          Height = 13
          Caption = 'Valor L'#237'quido (R$):'
          FocusControl = dbValorLiq
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblUnidade: TLabel
          Left = 592
          Top = 24
          Width = 27
          Height = 13
          Caption = 'Und.:'
          FocusControl = dbUnidade
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblCFOP: TLabel
          Left = 640
          Top = 24
          Width = 31
          Height = 13
          Caption = 'CFOP:'
          FocusControl = dbCFOP
        end
        object lblAliquota: TLabel
          Left = 88
          Top = 64
          Width = 57
          Height = 13
          Caption = '% Al'#237'quota:'
          FocusControl = dbAliquota
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblCST: TLabel
          Left = 168
          Top = 64
          Width = 23
          Height = 13
          Caption = 'CST:'
          FocusControl = dbCST
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblValorIPI: TLabel
          Left = 432
          Top = 64
          Width = 69
          Height = 13
          Caption = 'Valor IPI (R$):'
          FocusControl = dbValorIPI
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Bevel7: TBevel
          Left = 2
          Top = 15
          Width = 4
          Height = 99
          Align = alLeft
          Shape = bsSpacer
        end
        object dbProduto: TRxDBComboEdit
          Left = 88
          Top = 40
          Width = 89
          Height = 21
          ButtonHint = 'Pesquisar Produto (Ctrl+P)'
          CharCase = ecUpperCase
          ClickKey = 16464
          Color = clWhite
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Glyph.Data = {
            36060000424D3606000000000000360000002800000020000000100000000100
            18000000000000060000000000000000000000000000000000001DE6B51DE6B5
            1DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B5B1AD
            AC203040ACA5A21DE6B5C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7FACA5A2C3C3C31DE6B5B0A090
            6048306048306048306048306048306048306048306048306048305048403050
            604078C0304860B1ACA6C3C3C37F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
            7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3B1ACA61DE6B5B0A090
            FFFFFFB0A090B0A090B0A090B0A090B0A090B0A090B0A0909088803050703080
            D04098E050B0F0506870C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C39088807F7F7FC3C3C3C3C3C3C3C3C37F7F7F1DE6B5B0A090
            FFFFFFFFFFFFFFF8FFF0F0F0D0D8D090989070686060686050586040709040A0
            E060C8FF7090A0C5BEB5C3C3C37F7F7FFFFFFFFFFFFFFFF8FFF0F0F0D0D8D07F
            7F7F7F7F7F7F7F7F505860C3C3C3C3C3C3C3C3C37090A0C5BEB51DE6B5B0A090
            FFFFFFFFFFFFFFFFFFE0E0E0909090B0A8A0D0C0B0D0B0A08078705058506090
            B07098B0AEAEAA1DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFFE0E0E07F7F7F7F
            7F7FD0C0B0D0B0A0807870505850C3C3C37098B0AEAEAAC3C3C31DE6B5B0A090
            FFFFFFFFFFFFFFFFFFB0B0B0C0B8B0FFF0E0FFE8E0F0D8C0F0D0B08078709D8F
            8CAEAFAA1DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFF7F7F7F7F7F7FFF
            F0E0FFE8E0F0D8C0F0D0B08078709D8F8CAEAFAAC3C3C3C3C3C31DE6B5C0A890
            FFFFFFFFFFFFFFFFFFA09890F0E8E0FFF8F0FFF0F0FFE8E0F0D8D0D0B0A06367
            5E1DE6B51DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFF7F7F7F7F7F7FFF
            F8F0FFF0F0FFE8E0F0D8D0D0B0A063675EC3C3C3C3C3C3C3C3C31DE6B5C0A8A0
            FFFFFFFFFFFFFFFFFFA0A090F0E8E0FFFFFFFFF8F0FFF0F0FFE8E0E0C0B0716E
            6C1DE6B51DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFF7F7F7F7F7F7FFF
            FFFFFFF8F0FFF0F0FFE8E0E0C0B0716E6CC3C3C3C3C3C3C3C3C31DE6B5C0B0A0
            FFFFFFFFFFFFFFFFFFC0C8C0C0C0C0FFFFFFFFFFFFFFF8F0FFF0E0B0A090A69C
            951DE6B51DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFF7F7F7F7F7F7FFF
            FFFFFFFFFFFFF8F0FFF0E0B0A090A69C95C3C3C3C3C3C3C3C3C31DE6B5D0B0A0
            FFFFFFFFFFFFFFFFFFF0F8FFC0B8B0C0C0C0F0E8E0F0E8E0B0B0A07070601DE6
            B51DE6B51DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFFF0F8FF7F7F7F7F
            7F7FF0E8E0F0E8E0B0B0A0707060C3C3C3C3C3C3C3C3C3C3C3C31DE6B5D0B8A0
            FFFFFFFFFFFFFFFFFFFFFFFFF0F8FFC0C8C0A0A0909090809090906050401DE6
            B51DE6B51DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFFFFFFFFF0F8FF7F
            7F7FA0A0907F7F7F909090605040C3C3C3C3C3C3C3C3C3C3C3C31DE6B5D0B8B0
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB0A0906048306048306048301DE6
            B51DE6B51DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFF7F7F7F604830604830604830C3C3C3C3C3C3C3C3C3C3C3C31DE6B5D0C0B0
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0A890D0C8C06048301DE6B51DE6
            B51DE6B51DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFF7F7F7FC3C3C3604830C3C3C3C3C3C3C3C3C3C3C3C3C3C3C31DE6B5E0C0B0
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0A8A0604830E0C6B71DE6B51DE6
            B51DE6B51DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C31DE6B5E0C0B0
            E0C0B0E0C0B0E0C0B0E0C0B0D0C0B0D0B8B0D0B0A0E0C7B91DE6B51DE6B51DE6
            B51DE6B51DE6B51DE6B5C3C3C37F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
            7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C31DE6B51DE6B5
            1DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6
            B51DE6B51DE6B51DE6B5C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3}
          NumGlyphs = 2
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
        end
        object dbProdutoNome: TDBEdit
          Left = 184
          Top = 40
          Width = 401
          Height = 21
          TabStop = False
          Color = clMoneyGreen
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
        end
        object dbQuantidade: TDBEdit
          Left = 208
          Top = 80
          Width = 89
          Height = 21
          Color = clWhite
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 8
        end
        object dbValorUnit: TDBEdit
          Left = 304
          Top = 80
          Width = 121
          Height = 21
          Color = clWhite
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 9
        end
        object dbDesconto: TDBEdit
          Left = 536
          Top = 80
          Width = 65
          Height = 21
          Color = clWhite
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 11
        end
        object dbValorLiq: TDBEdit
          Left = 608
          Top = 80
          Width = 121
          Height = 21
          Color = clWhite
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 12
        end
        object dbUnidade: TDBEdit
          Left = 592
          Top = 40
          Width = 41
          Height = 21
          TabStop = False
          Color = clMoneyGreen
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
        end
        object dbCFOP: TRxDBComboEdit
          Left = 640
          Top = 40
          Width = 89
          Height = 21
          ButtonHint = 'Pesquisar Produto (Ctrl+P)'
          CharCase = ecUpperCase
          ClickKey = 16464
          Color = clWhite
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Glyph.Data = {
            36060000424D3606000000000000360000002800000020000000100000000100
            18000000000000060000000000000000000000000000000000001DE6B51DE6B5
            1DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B5B1AD
            AC203040ACA5A21DE6B5C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7FACA5A2C3C3C31DE6B5B0A090
            6048306048306048306048306048306048306048306048306048305048403050
            604078C0304860B1ACA6C3C3C37F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
            7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3B1ACA61DE6B5B0A090
            FFFFFFB0A090B0A090B0A090B0A090B0A090B0A090B0A0909088803050703080
            D04098E050B0F0506870C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C39088807F7F7FC3C3C3C3C3C3C3C3C37F7F7F1DE6B5B0A090
            FFFFFFFFFFFFFFF8FFF0F0F0D0D8D090989070686060686050586040709040A0
            E060C8FF7090A0C5BEB5C3C3C37F7F7FFFFFFFFFFFFFFFF8FFF0F0F0D0D8D07F
            7F7F7F7F7F7F7F7F505860C3C3C3C3C3C3C3C3C37090A0C5BEB51DE6B5B0A090
            FFFFFFFFFFFFFFFFFFE0E0E0909090B0A8A0D0C0B0D0B0A08078705058506090
            B07098B0AEAEAA1DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFFE0E0E07F7F7F7F
            7F7FD0C0B0D0B0A0807870505850C3C3C37098B0AEAEAAC3C3C31DE6B5B0A090
            FFFFFFFFFFFFFFFFFFB0B0B0C0B8B0FFF0E0FFE8E0F0D8C0F0D0B08078709D8F
            8CAEAFAA1DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFF7F7F7F7F7F7FFF
            F0E0FFE8E0F0D8C0F0D0B08078709D8F8CAEAFAAC3C3C3C3C3C31DE6B5C0A890
            FFFFFFFFFFFFFFFFFFA09890F0E8E0FFF8F0FFF0F0FFE8E0F0D8D0D0B0A06367
            5E1DE6B51DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFF7F7F7F7F7F7FFF
            F8F0FFF0F0FFE8E0F0D8D0D0B0A063675EC3C3C3C3C3C3C3C3C31DE6B5C0A8A0
            FFFFFFFFFFFFFFFFFFA0A090F0E8E0FFFFFFFFF8F0FFF0F0FFE8E0E0C0B0716E
            6C1DE6B51DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFF7F7F7F7F7F7FFF
            FFFFFFF8F0FFF0F0FFE8E0E0C0B0716E6CC3C3C3C3C3C3C3C3C31DE6B5C0B0A0
            FFFFFFFFFFFFFFFFFFC0C8C0C0C0C0FFFFFFFFFFFFFFF8F0FFF0E0B0A090A69C
            951DE6B51DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFF7F7F7F7F7F7FFF
            FFFFFFFFFFFFF8F0FFF0E0B0A090A69C95C3C3C3C3C3C3C3C3C31DE6B5D0B0A0
            FFFFFFFFFFFFFFFFFFF0F8FFC0B8B0C0C0C0F0E8E0F0E8E0B0B0A07070601DE6
            B51DE6B51DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFFF0F8FF7F7F7F7F
            7F7FF0E8E0F0E8E0B0B0A0707060C3C3C3C3C3C3C3C3C3C3C3C31DE6B5D0B8A0
            FFFFFFFFFFFFFFFFFFFFFFFFF0F8FFC0C8C0A0A0909090809090906050401DE6
            B51DE6B51DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFFFFFFFFF0F8FF7F
            7F7FA0A0907F7F7F909090605040C3C3C3C3C3C3C3C3C3C3C3C31DE6B5D0B8B0
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB0A0906048306048306048301DE6
            B51DE6B51DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFF7F7F7F604830604830604830C3C3C3C3C3C3C3C3C3C3C3C31DE6B5D0C0B0
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0A890D0C8C06048301DE6B51DE6
            B51DE6B51DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFF7F7F7FC3C3C3604830C3C3C3C3C3C3C3C3C3C3C3C3C3C3C31DE6B5E0C0B0
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0A8A0604830E0C6B71DE6B51DE6
            B51DE6B51DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C31DE6B5E0C0B0
            E0C0B0E0C0B0E0C0B0E0C0B0D0C0B0D0B8B0D0B0A0E0C7B91DE6B51DE6B51DE6
            B51DE6B51DE6B51DE6B5C3C3C37F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
            7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C31DE6B51DE6B5
            1DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6
            B51DE6B51DE6B51DE6B5C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3}
          NumGlyphs = 2
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 4
        end
        object dbAliquota: TDBEdit
          Left = 88
          Top = 80
          Width = 73
          Height = 21
          Color = clMoneyGreen
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 6
        end
        object dbCST: TDBEdit
          Left = 168
          Top = 80
          Width = 33
          Height = 21
          TabStop = False
          Color = clMoneyGreen
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 7
        end
        object dbValorIPI: TDBEdit
          Left = 432
          Top = 80
          Width = 97
          Height = 21
          Color = clMoneyGreen
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 10
        end
        object dbCFOPDescricao: TDBEdit
          Left = 736
          Top = 40
          Width = 265
          Height = 21
          TabStop = False
          Color = clMoneyGreen
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 5
        end
        object pnlBotoesProduto: TPanel
          Left = 6
          Top = 15
          Width = 70
          Height = 99
          Align = alLeft
          AutoSize = True
          BevelOuter = bvNone
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          object btnProdutoInserir: TBitBtn
            Left = 0
            Top = 1
            Width = 70
            Height = 25
            Hint = 'Inserir Produto'
            Caption = 'Inserir'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            Glyph.Data = {
              36060000424D3606000000000000360000002800000020000000100000000100
              18000000000000060000000000000000000000000000000000000000FF0000FF
              0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
              FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
              00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
              B0A0906048306048306048306048306048306048306048306048306048306048
              300000FF0000FF0000FF0000FF0000FF9C9C9C43434343434343434343434343
              43434343434343434343434343434343430000FF0000FF0000FF0000FF0000FF
              B0A090FFFFFFB0A090B0A090B0A090B0A090B0A090B0A090B0A090B0A0906048
              300000FF0000FF0000FF0000FF0000FF9C9C9CFFFFFF9C9C9C9C9C9C9C9C9C9C
              9C9C9C9C9C9C9C9C9C9C9C9C9C9C4343430000FF0000FF0000FF0000FF0000FF
              B0A090FFFFFFFFFFFFFFF8FFF0F0F0F0E8E0F0E0D0E0D0D0E0C8C0B0A0906048
              300000FF0000FF0000FF0000FF0000FF9C9C9CFFFFFFFFFFFFFAFAFAF0F0F0E6
              E6E6DCDCDCD1D1D1C8C8C89C9C9C4343430000FF0000FF0000FF0000FF0000FF
              B0A090FFFFFFFFFFFFFFFFFFFFF8F0F0F0F0F0E0E0F0D8D0E0D0C0B0A0906048
              300000FF0000FF0000FF0000FF0000FF9C9C9CFFFFFFFFFFFFFFFFFFF6F6F6F0
              F0F0E1E1E1D8D8D8CCCCCC9C9C9C4343430000FF0000FF0000FF0000FF0000FF
              B0A090FFFFFFFFFFFFFFFFFFFFFFFFFFF0F0F0E8E0F0E0E0E0D8D0B0A0906048
              300000FF0000FF0000FF0000FF0000FF9C9C9CFFFFFFFFFFFFFFFFFFFFFFFFF1
              F1F1E6E6E6E1E1E1D6D6D69C9C9C4343430000FF0000FF0000FF0000FF0000FF
              C0A890FFFFFFFFFFFFFFFFFFFFFFFFFFF8F0F0F0F0F0E8E0F0D8D0B0A0906048
              300000FF0000FF0000FF0000FF0000FFA3A3A3FFFFFFFFFFFFFFFFFFFFFFFFF6
              F6F6F0F0F0E6E6E6D8D8D89C9C9C4343430000FF0000FF0000FF0000FF0000FF
              C0A8A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F0F0E8E0F0E0E0B0A0906048
              300000FF0000FF0000FF0000FF0000FFA8A8A8FFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFF6F6F6E6E6E6E1E1E19C9C9C4343430000FF0000FF0000FF0000FF0000FF
              C0B0A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8FFF0F0F0F0E8E0B0A0906048
              300000FF0000FF0000FF0000FF0000FFACACACFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFAFAFAF0F0F0E6E6E69C9C9C4343430000FF0000FF0000FF0000FF0000FF
              D0B0A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F0F0F0F0B0A0906048
              300000FF0000FF0000FF0000FF0000FFAEAEAEFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFF6F6F6F0F0F09C9C9C4343430000FF0000FF0000FF0000FF0000FF
              D0B8A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB0A090B0A0906048
              300000FF0000FF0000FF0000FF0000FFB3B3B3FFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFF9C9C9C9C9C9C4343430000FF0000FF0000FF0000FF0000FF
              D0B8B0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB0A0906048306048306048
              300000FF0000FF0000FF0000FF0000FFB8B8B8FFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFF9C9C9C4343434343434343430000FF0000FF0000FF0000FF0000FF
              D0C0B0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0A890D0C8C0604830DACA
              C10000FF0000FF0000FF0000FF0000FFBCBCBCFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFA3A3A3C6C6C6434343C8C8C80000FF0000FF0000FF0000FF0000FF
              E0C0B0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0A8A0604830DBCAC20000
              FF0000FF0000FF0000FF0000FF0000FFBEBEBEFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFA8A8A8434343C9C9C90000FF0000FF0000FF0000FF0000FF0000FF
              E0C0B0E0C0B0E0C0B0E0C0B0E0C0B0D0C0B0D0B8B0D0B0A0DCCAC20000FF0000
              FF0000FF0000FF0000FF0000FF0000FFBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBC
              BCBCB8B8B8AEAEAEC9C9C90000FF0000FF0000FF0000FF0000FF0000FF0000FF
              0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
              FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
              00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF}
            NumGlyphs = 2
          end
          object btnProdutoEditar: TBitBtn
            Left = 0
            Top = 25
            Width = 70
            Height = 25
            Hint = 'Editar Produto'
            Caption = 'Editar'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
            TabStop = False
            Glyph.Data = {
              36060000424D3606000000000000360000002800000020000000100000000100
              180000000000000600000000000000000000000000000000000000FF0000FF00
              00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
              0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
              FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
              00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
              0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
              FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
              00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
              0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
              FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00B0A090604830
              60483060483060483060483060483060483060483060483060483070504000FF
              0000FF0000FF0000FF009C9C9C43434343434343434343434343434343434343
              43434343434343434343434E4E4E00FF0000FF0000FF0000FF00C0A8A0FFFFFF
              E0E8E0E0E0E0E0E0D0E0D8D0E0D0C0E0C8C0E0C8B0E0C0B0C0A8A070504000FF
              0000FF0000FF0000FF00A8A8A8FFFFFFE4E4E4E0E0E0DBDBDBD6D6D6CCCCCCC8
              C8C8C3C3C3BEBEBEA8A8A84E4E4E00FF0000FF0000FF0000FF00C0B0A0FFFFFF
              E0C8C0D0C0B0D0C0B0FFF0E0D0B0A0D0B0A0D0B0A0F0D8D0C0A8A070504000FF
              0000FF0000FF0000FF00ACACACFFFFFFC8C8C8BCBCBCBCBCBCECECECAEAEAEAE
              AEAEAEAEAED8D8D8A8A8A84E4E4E00FF0000FF0000FF0000FF00D0B8A0FFFFFF
              FFFFFFFFFFFFFFF8F0FFF8F0707070505850000000D0C0B0D0B0A070504000FF
              0000FF0000FF0000FF00B3B3B3FFFFFFFFFFFFFFFFFFF6F6F6F6F6F670707054
              5454000000BCBCBCAEAEAE4E4E4E00FF0000FF0000FF0000FF00D0B8A0FFFFFF
              E0C8C0E0C8C0E0C8C0FFF8F0A0A0A0FFFFFF5090B0101010C0B0B080605000FF
              0000FF0000FF0000FF00B3B3B3FFFFFFC8C8C8C8C8C8C8C8C8F6F6F6A0A0A0FF
              FFFF939393101010B1B1B15E5E5E00FF0000FF0000FF0000FF00D0B8A0FFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFA0A0A090B8C070D0E05098B010101080706000FF
              0000FF0000FF0000FF00B3B3B3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA0A0A0B6
              B6B6CBCBCB9898981010106C6C6C00FF0000FF0000FF0000FF00D0B8A0FFFFFF
              E0C8C0E0C8C0E0C8C0FFFFFFC0B8B050A0B090E0F060C0D05098B0101010C8C0
              B400FF0000FF0000FF00B3B3B3FFFFFFC8C8C8C8C8C8C8C8C8FFFFFFB6B6B69C
              9C9CDCDCDCBBBBBB989898101010BDBDBD00FF0000FF0000FF00D0B8A0FFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFF8F0D0D0D050A0B090E0F060C0D05098B01010
              10C8C1B400FF0000FF00B3B3B3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F6F6D0
              D0D09C9C9CDCDCDCBBBBBB989898101010BDBDBD00FF0000FF00F0B090F0A890
              F0A890F0A080F09870E09060E08860E09060D0A89060A8B090E0F060C0D05098
              B0101010D5C8B900FF00ACACACA8A8A8A8A8A89E9E9E94949489898984848489
              8989A4A4A4A3A3A3DCDCDCBBBBBB989898101010C4C4C400FF00F0B090FFC0A0
              FFC0A0FFB8A0FFB890FFB090FFA880FFA880F0A880D0B0A070B0C090E0F070C8
              E0808880303890BCAEB6ACACACBCBCBCBCBCBCB7B7B7B3B3B3AEAEAEA4A4A4A4
              A4A4A3A3A3AEAEAEAEAEAEDCDCDCC6C6C6848484515151B1B1B1F0B090F0A890
              F0A890F0A890F0A080F0A070E09870E09060E08850E09060D0988080B0C0D0B8
              B07088D06070B0303890ACACACA8A8A8A8A8A8A8A8A89E9E9E99999993939389
              8989808080898989969696B0B0B0B8B8B89B9B9B81818151515100FF0000FF00
              00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00DDD4CA6070
              B07090E06078D06070B000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
              FF0000FF0000FF0000FF00D1D1D1818181A4A4A490909081818100FF0000FF00
              00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00D0C6
              CE6070B06070B0DFD2D100FF0000FF0000FF0000FF0000FF0000FF0000FF0000
              FF0000FF0000FF0000FF0000FF00C9C9C9818181818181D3D3D3}
            NumGlyphs = 2
          end
          object btnProdutoExcluir: TBitBtn
            Left = 0
            Top = 49
            Width = 70
            Height = 25
            Hint = 'Excluir Produto'
            Caption = 'Excluir'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 2
            TabStop = False
            Glyph.Data = {
              36060000424D3606000000000000360000002800000020000000100000000100
              1800000000000006000000000000000000000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCFC1C52030902030902030802028
              70C6A797FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFC3C3C34B4B4B4B4B4B4646463C3C3CA5A5A5FF00FFFF00FFFF00FFFF00FF
              B0A0906048306048306048307058406050601038C02050D01038C01030B01030
              A0102070C5A392FF00FFFF00FFFF00FF9C9C9C43434343434343434353535356
              56565C5C5C7171715C5C5C5353534E4E4E363636A1A1A1FF00FFFF00FFFF00FF
              B0A090FFFFFFD0C8C0D0C8C0D0C8C01040E04068E03058E00038E00038D01030
              C01030A0202870FF00FFFF00FFFF00FF9C9C9CFFFFFFC6C6C6C6C6C6C6C6C66B
              6B6B8888887C7C7C6464646060605858584E4E4E3C3C3CFF00FFFF00FFFF00FF
              B0A090FFFFFFFFFFFFFFF8FFFFF0F03068F0F0F8FFFFF8FFFFF8FFFFF8FFFFF8
              FFFFF8FF203090FF00FFFF00FFFF00FF9C9C9CFFFFFFFFFFFFFAFAFAF1F1F18B
              8B8BF9F9F9FAFAFAFAFAFAFAFAFAFAFAFAFAFAFA4B4B4BFF00FFFF00FFFF00FF
              B0A090FFFFFFFFFFFFFFFFFFFFF8F03068F0FFF8FFFFF8FFFFF8FFFFF8FFFFF8
              FFFFF8FF203090FF00FFFF00FFFF00FF9C9C9CFFFFFFFFFFFFFFFFFFF6F6F68B
              8B8BFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA4B4B4BFF00FFFF00FFFF00FF
              B0A090FFFFFFFFFFFFFFFFFFFFFFFF3060FF80A0F06080F04060E02058E00038
              D01038C02038A0FF00FFFF00FFFF00FF9C9C9CFFFFFFFFFFFFFFFFFFFFFFFF8A
              8A8AB4B4B49E9E9E8383837B7B7B6060605C5C5C545454FF00FFFF00FFFF00FF
              C0A890FFFFFFFFFFFFFFFFFFFFFFFFD0D8F03068F090A8F06080F05078E02048
              D02038B0C8ACAAFF00FFFF00FFFF00FFA3A3A3FFFFFFFFFFFFFFFFFFFFFFFFDE
              DEDE8B8B8BBBBBBB9E9E9E9393936C6C6C595959AEAEAEFF00FFFF00FFFF00FF
              C0A8A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD0D8F03060F03060F03060E02048
              C0C9B0AFFF00FFFF00FFFF00FFFF00FFA8A8A8FFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFDEDEDE868686868686818181686868B2B2B2FF00FFFF00FFFF00FFFF00FF
              C0B0A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8FFF0F0F0F0F0F0D0C8C08068
              50FF00FFFF00FFFF00FFFF00FFFF00FFACACACFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFAFAFAF0F0F0F0F0F0C6C6C6636363FF00FFFF00FFFF00FFFF00FFFF00FF
              D0B0A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F0F0F0F0D0C8C06048
              30FF00FFFF00FFFF00FFFF00FFFF00FFAEAEAEFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFF6F6F6F0F0F0C6C6C6434343FF00FFFF00FFFF00FFFF00FFFF00FF
              D0B8A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0A8A0C0A8A06048
              30FF00FFFF00FFFF00FFFF00FFFF00FFB3B3B3FFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFA8A8A8A8A8A8434343FF00FFFF00FFFF00FFFF00FFFF00FF
              D0B8B0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB0A0906048306048306048
              30FF00FFFF00FFFF00FFFF00FFFF00FFB8B8B8FFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFF9C9C9C434343434343434343FF00FFFF00FFFF00FFFF00FFFF00FF
              D0C0B0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0A890D0C8C0604830DFBD
              A7FF00FFFF00FFFF00FFFF00FFFF00FFBCBCBCFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFA3A3A3C6C6C6434343B9B9B9FF00FFFF00FFFF00FFFF00FFFF00FF
              E0C0B0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0A8A0604830E0BEAAFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFBEBEBEFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFA8A8A8434343BBBBBBFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              E0C0B0E0C0B0E0C0B0E0C0B0E0C0B0D0C0B0D0B8B0D0B0A0E0C0ADFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBC
              BCBCB8B8B8AEAEAEBDBDBDFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
            NumGlyphs = 2
          end
          object btnProdutoSalvar: TBitBtn
            Left = 0
            Top = 73
            Width = 70
            Height = 25
            Hint = 'Salvar Produto'
            Caption = 'Salvar'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 3
            Glyph.Data = {
              36060000424D3606000000000000360000002800000020000000100000000100
              18000000000000060000000000000000000000000000000000000000FF0000FF
              0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
              FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
              00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
              C06860B05850A05050A05050A050509048509048409048408040408038408038
              407038407038300000FF0000FF0000FF6E6E6E5E5E5E58585858585858585851
              51514C4C4C4C4C4C4646464141414141414040403B3B3B0000FF0000FFD06870
              F09090E08080B04820403020C0B8B0C0B8B0D0C0C0D0C8C0505050A04030A040
              30A038307038400000FF0000FF7474749999998989894646462C2C2CB6B6B6B6
              B6B6C1C1C1C6C6C65050504444444444444040404040400000FF0000FFD07070
              FF98A0F08880E08080705850404030907870F0E0E0F0E8E0908070A04030A040
              40A040308038400000FF0000FF797979A4A4A49090908989895858583B3B3B78
              7878E1E1E1E6E6E67C7C7C4444444949494444444141410000FF0000FFD07870
              FFA0A0F09090F08880705850000000404030F0D8D0F0E0D0807860B04840B048
              40A040408040400000FF0000FF7E7E7EA9A9A99999999090905858580000003B
              3B3BD8D8D8DCDCDC7171715050505050504949494646460000FF0000FFD07880
              FFA8B0FFA0A0F09090705850705850705850705850706050806860C05850B050
              50B048408040400000FF0000FF838383B3B3B3A9A9A999999958585858585858
              58585858585C5C5C6868686060605959595050504646460000FF0000FFE08080
              FFB0B0FFB0B0FFA0A0F09090F08880E08080E07880D07070D06870C06060C058
              50B050509048400000FF0000FF898989B7B7B7B7B7B7A9A9A999999990909089
              89898484847979797474746969696060605959594C4C4C0000FF0000FFE08890
              FFB8C0FFB8B0D06060C06050C05850C05040B05030B04830A04020A03810C060
              60C058509048400000FF0000FF939393C1C1C1BCBCBC6B6B6B64646460606056
              56565050504B4B4B4040403636366969696060604C4C4C0000FF0000FFE09090
              FFC0C0D06860FFFFFFFFFFFFFFF8F0F0F0F0F0E8E0F0D8D0E0D0C0E0C8C0A038
              10C060609048500000FF0000FF989898C6C6C6707070FFFFFFFFFFFFF6F6F6F0
              F0F0E6E6E6D8D8D8CCCCCCC8C8C83636366969695151510000FF0000FFE098A0
              FFC0C0D07070FFFFFFFFFFFFFFFFFFFFF8F0F0F0F0F0E8E0F0D8D0E0D0C0A040
              20D06860A050500000FF0000FFA1A1A1C6C6C6797979FFFFFFFFFFFFFFFFFFF6
              F6F6F0F0F0E6E6E6D8D8D8CCCCCC4040407070705858580000FF0000FFF0A0A0
              FFC0C0E07870FFFFFFFFFFFFFFFFFFFFFFFFFFF8F0F0F0F0F0E8E0F0D8D0B048
              30D07070A050500000FF0000FFA8A8A8C6C6C6808080FFFFFFFFFFFFFFFFFFFF
              FFFFF6F6F6F0F0F0E6E6E6D8D8D84B4B4B7979795858580000FF0000FFF0A8A0
              FFC0C0E08080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F0F0F0F0F0E8E0B050
              30E07880A050500000FF0000FFACACACC6C6C6898989FFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFF6F6F6F0F0F0E6E6E65050508484845858580000FF0000FFF0B0B0
              FFC0C0F08890FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F0F0F0F0C050
              40603030B058500000FF0000FFB6B6B6C6C6C6949494FFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFF6F6F6F0F0F05656563434345E5E5E0000FF0000FFF0B0B0
              FFC0C0FF9090FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F0C058
              50B05860B058600000FF0000FFB6B6B6C6C6C69B9B9BFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFF6F6F66060606363636363630000FF0000FFF0B8B0
              F0B8B0F0B0B0F0B0B0F0A8B0F0A0A0E098A0E09090E09090E08890E08080D078
              80D07870D070700000FF0000FFBBBBBBBBBBBBB6B6B6B6B6B6B1B1B1A8A8A8A1
              A1A19898989898989393938989898383837E7E7E7979790000FF0000FF0000FF
              0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
              FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
              00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF}
            NumGlyphs = 2
          end
        end
      end
      object pgcMaisDados: TPageControl
        Left = 0
        Top = 416
        Width = 1021
        Height = 146
        ActivePage = tbsRecebimento
        Align = alBottom
        Style = tsFlatButtons
        TabOrder = 3
        object tbsRecebimento: TTabSheet
          Caption = 'Recebimento'
          DesignSize = (
            1013
            115)
          object lblObservacao: TLabel
            Left = 0
            Top = 0
            Width = 1013
            Height = 13
            Align = alTop
            Caption = 'Observa'#231#245'es:'
            FocusControl = dbObservacao
          end
          object lblFormaPagto: TLabel
            Left = 0
            Top = 72
            Width = 106
            Height = 13
            Anchors = [akLeft, akBottom]
            Caption = 'Forma de Pagamento:'
            FocusControl = dbFormaPagto
          end
          object lblCondicaoPagto: TLabel
            Left = 160
            Top = 72
            Width = 120
            Height = 13
            Anchors = [akLeft, akBottom]
            Caption = 'Condi'#231#227'o de Pagamento:'
            FocusControl = dbCondicaoPagto
          end
          object lblPrazo01: TLabel
            Left = 440
            Top = 72
            Width = 24
            Height = 13
            Anchors = [akLeft, akBottom]
            Caption = 'P01:'
            FocusControl = dbPrazo01
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblPrazo02: TLabel
            Left = 488
            Top = 72
            Width = 24
            Height = 13
            Anchors = [akLeft, akBottom]
            Caption = 'P02:'
            FocusControl = dbPrazo02
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblPrazo03: TLabel
            Left = 536
            Top = 72
            Width = 24
            Height = 13
            Anchors = [akLeft, akBottom]
            Caption = 'P03:'
            FocusControl = dbPrazo03
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblPrazo04: TLabel
            Left = 584
            Top = 72
            Width = 24
            Height = 13
            Anchors = [akLeft, akBottom]
            Caption = 'P04:'
            FocusControl = dbPrazo04
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblPrazo05: TLabel
            Left = 632
            Top = 72
            Width = 24
            Height = 13
            Anchors = [akLeft, akBottom]
            Caption = 'P05:'
            FocusControl = dbPrazo05
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblPrazo06: TLabel
            Left = 680
            Top = 72
            Width = 24
            Height = 13
            Anchors = [akLeft, akBottom]
            Caption = 'P06:'
            FocusControl = dbPrazo06
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblPrazo07: TLabel
            Left = 728
            Top = 72
            Width = 24
            Height = 13
            Anchors = [akLeft, akBottom]
            Caption = 'P07:'
            FocusControl = dbPrazo07
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblPrazo08: TLabel
            Left = 776
            Top = 72
            Width = 24
            Height = 13
            Anchors = [akLeft, akBottom]
            Caption = 'P08:'
            FocusControl = dbPrazo08
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblPrazo09: TLabel
            Left = 824
            Top = 72
            Width = 24
            Height = 13
            Anchors = [akLeft, akBottom]
            Caption = 'P09:'
            FocusControl = dbPrazo09
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblPrazo10: TLabel
            Left = 872
            Top = 72
            Width = 24
            Height = 13
            Anchors = [akLeft, akBottom]
            Caption = 'P10:'
            FocusControl = dbPrazo10
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblPrazo11: TLabel
            Left = 920
            Top = 72
            Width = 24
            Height = 13
            Anchors = [akLeft, akBottom]
            Caption = 'P11:'
            FocusControl = dbPrazo11
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblPrazo12: TLabel
            Left = 968
            Top = 72
            Width = 24
            Height = 13
            Anchors = [akLeft, akBottom]
            Caption = 'P12:'
            FocusControl = dbPrazo12
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object dbObservacao: TDBMemo
            Left = 0
            Top = 13
            Width = 1013
            Height = 50
            Align = alTop
            Anchors = [akLeft, akTop, akRight, akBottom]
            DataSource = DtSrcTabela
            TabOrder = 0
          end
          object dbFormaPagto: TDBLookupComboBox
            Left = 0
            Top = 88
            Width = 153
            Height = 21
            Anchors = [akLeft, akBottom]
            DataSource = DtSrcTabela
            DropDownRows = 10
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            KeyField = 'CNPJ'
            ListField = 'RZSOC'
            ListSource = dtsEmpresa
            ParentFont = False
            TabOrder = 1
          end
          object dbCondicaoPagto: TDBLookupComboBox
            Left = 160
            Top = 88
            Width = 273
            Height = 21
            Anchors = [akLeft, akBottom]
            DataSource = DtSrcTabela
            DropDownRows = 10
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            KeyField = 'CNPJ'
            ListField = 'RZSOC'
            ListSource = dtsEmpresa
            ParentFont = False
            TabOrder = 2
          end
          object dbPrazo01: TDBEdit
            Left = 440
            Top = 88
            Width = 41
            Height = 21
            TabStop = False
            Anchors = [akLeft, akBottom]
            Color = clMoneyGreen
            DataSource = DtSrcTabela
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 3
          end
          object dbPrazo02: TDBEdit
            Left = 488
            Top = 88
            Width = 41
            Height = 21
            TabStop = False
            Anchors = [akLeft, akBottom]
            Color = clMoneyGreen
            DataSource = DtSrcTabela
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 4
          end
          object dbPrazo03: TDBEdit
            Left = 536
            Top = 88
            Width = 41
            Height = 21
            TabStop = False
            Anchors = [akLeft, akBottom]
            Color = clMoneyGreen
            DataSource = DtSrcTabela
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 5
          end
          object dbPrazo04: TDBEdit
            Left = 584
            Top = 88
            Width = 41
            Height = 21
            TabStop = False
            Anchors = [akLeft, akBottom]
            Color = clMoneyGreen
            DataSource = DtSrcTabela
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 6
          end
          object dbPrazo05: TDBEdit
            Left = 632
            Top = 88
            Width = 41
            Height = 21
            TabStop = False
            Anchors = [akLeft, akBottom]
            Color = clMoneyGreen
            DataSource = DtSrcTabela
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 7
          end
          object dbPrazo06: TDBEdit
            Left = 680
            Top = 88
            Width = 41
            Height = 21
            TabStop = False
            Anchors = [akLeft, akBottom]
            Color = clMoneyGreen
            DataSource = DtSrcTabela
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 8
          end
          object dbPrazo07: TDBEdit
            Left = 728
            Top = 88
            Width = 41
            Height = 21
            TabStop = False
            Anchors = [akLeft, akBottom]
            Color = clMoneyGreen
            DataSource = DtSrcTabela
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 9
          end
          object dbPrazo08: TDBEdit
            Left = 776
            Top = 88
            Width = 41
            Height = 21
            TabStop = False
            Anchors = [akLeft, akBottom]
            Color = clMoneyGreen
            DataSource = DtSrcTabela
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 10
          end
          object dbPrazo09: TDBEdit
            Left = 824
            Top = 88
            Width = 41
            Height = 21
            TabStop = False
            Anchors = [akLeft, akBottom]
            Color = clMoneyGreen
            DataSource = DtSrcTabela
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 11
          end
          object dbPrazo10: TDBEdit
            Left = 872
            Top = 88
            Width = 41
            Height = 21
            TabStop = False
            Anchors = [akLeft, akBottom]
            Color = clMoneyGreen
            DataSource = DtSrcTabela
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 12
          end
          object dbPrazo11: TDBEdit
            Left = 920
            Top = 88
            Width = 41
            Height = 21
            TabStop = False
            Anchors = [akLeft, akBottom]
            Color = clMoneyGreen
            DataSource = DtSrcTabela
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 13
          end
          object dbPrazo12: TDBEdit
            Left = 968
            Top = 88
            Width = 41
            Height = 21
            TabStop = False
            Anchors = [akLeft, akBottom]
            Color = clMoneyGreen
            DataSource = DtSrcTabela
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 14
          end
        end
        object tbsTitulo: TTabSheet
          Caption = 'T'#237'tulo(s) Gerado(s)'
          ImageIndex = 1
          object Bevel9: TBevel
            Left = 74
            Top = 0
            Width = 4
            Height = 115
            Align = alLeft
            Shape = bsSpacer
          end
          object Bevel10: TBevel
            Left = 0
            Top = 0
            Width = 4
            Height = 115
            Align = alLeft
            Shape = bsSpacer
          end
          object pnlBotoesTitulo: TPanel
            Left = 4
            Top = 0
            Width = 70
            Height = 115
            Align = alLeft
            AutoSize = True
            BevelOuter = bvNone
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            object BitBtn1: TBitBtn
              Left = 0
              Top = 1
              Width = 70
              Height = 25
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              NumGlyphs = 2
            end
            object BitBtn2: TBitBtn
              Left = 0
              Top = 25
              Width = 70
              Height = 25
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
              TabStop = False
              NumGlyphs = 2
            end
            object BitBtn3: TBitBtn
              Left = 0
              Top = 49
              Width = 70
              Height = 25
              ParentShowHint = False
              ShowHint = True
              TabOrder = 2
              TabStop = False
              NumGlyphs = 2
            end
            object BitBtn4: TBitBtn
              Left = 0
              Top = 73
              Width = 70
              Height = 25
              ParentShowHint = False
              ShowHint = True
              TabOrder = 3
              NumGlyphs = 2
            end
          end
          object dbgTitulos: TDBGrid
            Left = 78
            Top = 0
            Width = 935
            Height = 115
            TabStop = False
            Align = alClient
            DataSource = DtSrcTabela
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
            TitleFont.Charset = ANSI_CHARSET
            TitleFont.Color = clBlack
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = [fsBold]
            OnDrawColumnCell = dbgDadosDrawColumnCell
          end
        end
      end
      object dbgProdutos: TDBGrid
        Left = 0
        Top = 237
        Width = 1021
        Height = 175
        TabStop = False
        Align = alClient
        DataSource = DtSrcTabela
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clBlack
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = [fsBold]
        OnDrawColumnCell = dbgDadosDrawColumnCell
      end
    end
  end
  inherited IbDtstTabela: TIBDataSet
    SelectSQL.Strings = (
      'Select'
      '    v.Codcontrol'
      '  , v.Codemp'
      '  , v.Codcli'
      '  , v.Dtvenda'
      '  , v.Status'
      '  , v.Desconto'
      '  , v.Totalvenda'
      '  , v.Obs'
      '  , v.Formapag'
      '  , v.Fatdias'
      '  , v.Serie'
      '  , v.Nfe'
      '  , v.Dataemissao'
      '  , v.Horaemissao'
      '  , v.Verificador_nfe'
      '  , v.Xml_nfe'
      '  , v.Vendedor_cod'
      '  , v.Usuario'
      '  , v.Formapagto_cod'
      '  , v.Condicaopagto_cod'
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
      '  , c.Nome'
      'from TBVENDAS v'
      '  inner join TBCLIENTE c on (c.Cnpj = v.Codcli)'
      '')
    Left = 928
    Top = 8
  end
  inherited DtSrcTabela: TDataSource
    Left = 992
    Top = 8
  end
  inherited IbUpdTabela: TIBUpdateSQL
    Left = 960
    Top = 8
  end
  inherited ImgList: TImageList
    Left = 896
    Top = 8
  end
  object tblEmpresa: TIBTable
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'TBEMPRESA'
    Left = 832
    Top = 8
  end
  object dtsEmpresa: TDataSource
    DataSet = tblEmpresa
    Left = 864
    Top = 8
  end
end
