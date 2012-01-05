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
        Top = 436
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
        object Label1: TLabel [4]
          Left = 16
          Top = 64
          Width = 106
          Height = 13
          Caption = 'Forma de Pagamento:'
          FocusControl = DBLookupComboBox1
        end
        object Label2: TLabel [5]
          Left = 176
          Top = 64
          Width = 120
          Height = 13
          Caption = 'Condi'#231#227'o de Pagamento:'
          FocusControl = DBLookupComboBox2
        end
        object Label3: TLabel [6]
          Left = 432
          Top = 64
          Width = 24
          Height = 13
          Caption = 'P01:'
          FocusControl = DBEdit1
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label4: TLabel [7]
          Left = 480
          Top = 64
          Width = 24
          Height = 13
          Caption = 'P02:'
          FocusControl = DBEdit2
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label5: TLabel [8]
          Left = 528
          Top = 64
          Width = 24
          Height = 13
          Caption = 'P03:'
          FocusControl = DBEdit3
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label6: TLabel [9]
          Left = 576
          Top = 64
          Width = 24
          Height = 13
          Caption = 'P04:'
          FocusControl = DBEdit4
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label7: TLabel [10]
          Left = 624
          Top = 64
          Width = 24
          Height = 13
          Caption = 'P05:'
          FocusControl = DBEdit5
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label8: TLabel [11]
          Left = 672
          Top = 64
          Width = 24
          Height = 13
          Caption = 'P06:'
          FocusControl = DBEdit6
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label9: TLabel [12]
          Left = 720
          Top = 64
          Width = 24
          Height = 13
          Caption = 'P07:'
          FocusControl = DBEdit7
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label10: TLabel [13]
          Left = 768
          Top = 64
          Width = 24
          Height = 13
          Caption = 'P08:'
          FocusControl = DBEdit8
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label11: TLabel [14]
          Left = 816
          Top = 64
          Width = 24
          Height = 13
          Caption = 'P09:'
          FocusControl = DBEdit9
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label12: TLabel [15]
          Left = 864
          Top = 64
          Width = 24
          Height = 13
          Caption = 'P10:'
          FocusControl = DBEdit10
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label13: TLabel [16]
          Left = 912
          Top = 64
          Width = 24
          Height = 13
          Caption = 'P11:'
          FocusControl = DBEdit11
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label14: TLabel [17]
          Left = 960
          Top = 64
          Width = 24
          Height = 13
          Caption = 'P12:'
          FocusControl = DBEdit12
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
        object DBLookupComboBox1: TDBLookupComboBox
          Left = 16
          Top = 80
          Width = 153
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
          TabOrder = 4
        end
        object DBLookupComboBox2: TDBLookupComboBox
          Left = 176
          Top = 80
          Width = 249
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
          TabOrder = 5
        end
        object DBEdit1: TDBEdit
          Left = 432
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
          TabOrder = 6
        end
        object DBEdit2: TDBEdit
          Left = 480
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
          TabOrder = 7
        end
        object DBEdit3: TDBEdit
          Left = 528
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
          TabOrder = 8
        end
        object DBEdit4: TDBEdit
          Left = 576
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
          TabOrder = 9
        end
        object DBEdit5: TDBEdit
          Left = 624
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
          TabOrder = 10
        end
        object DBEdit6: TDBEdit
          Left = 672
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
          TabOrder = 11
        end
        object DBEdit7: TDBEdit
          Left = 720
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
          TabOrder = 12
        end
        object DBEdit8: TDBEdit
          Left = 768
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
          TabOrder = 13
        end
        object DBEdit9: TDBEdit
          Left = 816
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
          TabOrder = 14
        end
        object DBEdit10: TDBEdit
          Left = 864
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
          TabOrder = 15
        end
        object DBEdit11: TDBEdit
          Left = 912
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
          TabOrder = 16
        end
        object DBEdit12: TDBEdit
          Left = 960
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
          TabOrder = 17
        end
      end
      object GroupBox1: TGroupBox
        Left = 0
        Top = 117
        Width = 1021
        Height = 116
        Align = alTop
        Caption = 'Dados do produto'
        TabOrder = 1
        object Label15: TLabel
          Left = 16
          Top = 24
          Width = 42
          Height = 13
          Caption = 'Produto:'
          FocusControl = RxDBComboEdit1
        end
        object Label17: TLabel
          Left = 144
          Top = 64
          Width = 60
          Height = 13
          Caption = 'Quantidade:'
          FocusControl = DBEdit14
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label18: TLabel
          Left = 240
          Top = 64
          Width = 92
          Height = 13
          Caption = 'Valor Unit'#225'rio (R$):'
          FocusControl = DBEdit15
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label19: TLabel
          Left = 472
          Top = 64
          Width = 45
          Height = 13
          Caption = '% Desc.:'
          FocusControl = DBEdit16
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label20: TLabel
          Left = 544
          Top = 64
          Width = 88
          Height = 13
          Caption = 'Valor L'#237'quido (R$):'
          FocusControl = DBEdit17
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label21: TLabel
          Left = 544
          Top = 24
          Width = 27
          Height = 13
          Caption = 'Und.:'
          FocusControl = DBEdit18
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label22: TLabel
          Left = 592
          Top = 24
          Width = 31
          Height = 13
          Caption = 'CFOP:'
          FocusControl = RxDBComboEdit2
        end
        object Label23: TLabel
          Left = 16
          Top = 64
          Width = 57
          Height = 13
          Caption = '% Al'#237'quota:'
          FocusControl = DBEdit19
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label24: TLabel
          Left = 96
          Top = 64
          Width = 23
          Height = 13
          Caption = 'CST:'
          FocusControl = DBEdit20
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label25: TLabel
          Left = 368
          Top = 64
          Width = 69
          Height = 13
          Caption = 'Valor IPI (R$):'
          FocusControl = DBEdit21
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object RxDBComboEdit1: TRxDBComboEdit
          Left = 16
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
          TabOrder = 0
        end
        object DBEdit13: TDBEdit
          Left = 112
          Top = 40
          Width = 425
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
          TabOrder = 1
        end
        object DBEdit14: TDBEdit
          Left = 144
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
          TabOrder = 2
        end
        object DBEdit15: TDBEdit
          Left = 240
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
          TabOrder = 3
        end
        object DBEdit16: TDBEdit
          Left = 472
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
          TabOrder = 4
        end
        object DBEdit17: TDBEdit
          Left = 544
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
          TabOrder = 5
        end
        object BitBtn1: TBitBtn
          Left = 848
          Top = 76
          Width = 73
          Height = 25
          Hint = 'Salvar Produto'
          Caption = 'Salvar'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 6
          Glyph.Data = {
            36060000424D3606000000000000360000002800000020000000100000000100
            180000000000000600000000000000000000000000000000000000FF0000FF00
            00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
            0000FF0000FF0000FF00C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C000FF0000FF00
            D6D9D868513A6050406048307050407060507050406048306048306048306048
            30604830A6A6A900FF00C0C0C0C0C0C0D6D9D880808080808080808080808080
            8080808080808080808080808080808080808080A6A6A9C0C0C000FF0000FF00
            C0A8A0F0F0F0E0D8D0E0D0C0E0C8C09090B0D0C0B0E0B8A0D0B0A0D0B0A0D0A8
            90D0A09060483000FF00C0C0C0C0C0C0808080C0C0C0C0C0C0C0C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0808080C0C0C000FF0000FF00
            C0A8A0FFF0F0F0F0F0F0E8E03050C01038B07078C0E0D0D0F0D0C0E0D0C0E0C8
            B0D0A89060483000FF00C0C0C0C0C0C0808080C0C0C0C0C0C0C0C0C080808080
            8080C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0808080C0C0C000FF0000FF00
            C0A8A0FFF0F0D0D0E03050C03058F02048E01038B0A098C0F0D0C0F0D0C0E0C8
            B0D0A89060483000FF00C0C0C0C0C0C0808080C0C0C0C0C0C080808080808080
            8080808080C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0808080C0C0C000FF0000FF00
            C0B0A0FFF8F02040C03058F06080FF5078F04060F02040B0D0C0C0F0D8D0E0C8
            C0D0B0A060483000FF00C0C0C0C0C0C0808080C0C0C0808080808080FFFFFFFF
            FFFF808080808080D0C0C0C0C0C0C0C0C0C0C0C0808080C0C0C000FF0000FF00
            C0B0A0FFF8F080A0FF8098FF8090F0D0D0E08098F04060E04058B0F0D8D0F0D8
            D0D0B8A060504000FF00C0C0C0C0C0C0808080C0C0C0808080FFFFFFFFFFFFC0
            C0C0FFFFFF808080808080C0C0C0C0C0C0C0C0C0808080C0C0C000FF0000FF00
            D0B0A0FFF8FFE0E8FFC0C8F0F0F0F0F0F0E0E0D8E08090F03058E05068B0F0E0
            D0E0C8B070584000FF00C0C0C0C0C0C0808080C0C0C0C0C0C0FFFFFFC0C0C0C0
            C0C0C0C0C0FFFFFF808080808080C0C0C0C0C0C0808080C0C0C000FF0000FF00
            D0B8A0FFFFFFFFF8FFFFF8F0FFF8F0FFF0F0F0F0E0F0E0E07088F02050D09090
            C0E0D0C080706000FF00C0C0C0C0C0C0808080C0C0C0C0C0C0C0C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0FFFFFF808080808080C0C0C0808080C0C0C000FF0000FF00
            D0B8B0FFFFFFFFFFFFFFF8FFFFF8F0FFF8F0F0F0F0F0E0E0F0E8E08090F02048
            D0A098C0A0908000FF00C0C0C0C0C0C0808080C0C0C0C0C0C0C0C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0FFFFFF808080808080808080C0C0C000FF0000FF00
            D0C0B0FFFFFFFFFFFF80A0B060889060889060789060788070809090A0B090A0
            F03050D0B0989000FF00C0C0C0C0C0C0808080C0C0C0C0C0C080808080808080
            8080808080808080808080808080FFFFFF808080808080C0C0C000FF0000FF00
            D0C0B0FFFFFFFFFFFF80A8B090D8E090E8F080D8F060C8E05098B0708090F0E8
            E0E0D8D0A0989000FF00C0C0C0C0C0C0808080C0C0C0C0C0C0808080C0C0C0C0
            C0C0C0C0C0C0C0C0808080808080C0C0C0C0C0C0808080C0C0C000FF0000FF00
            D1C2B3FFFFFFFFFFFFF0F8FF80A8B0A0A8A095867780C8D0507080F0F0F0F0E0
            E0F0E0E080706000FF00C0C0C0C0C0C0808080C0C0C0C0C0C0C0C0C080808080
            8080808080C0C0C0808080C0C0C0C0C0C0C0C0C0808080C0C0C000FF0000FF00
            E2E5E1D1C2B3D0C0B0D0C0B070A8B0A0E8F0A0E8F090D0E0406870C0A8A0C0A8
            A0C0A890D6DAD600FF00C0C0C0C0C0C0E2E5E1808080808080808080808080C0
            C0C0C0C0C0C0C0C0808080808080808080808080D6DAD6C0C0C000FF0000FF00
            00FF0000FF0000FF0000FF00DCE3E180B0C080A0B07090A0D8DDD900FF0000FF
            0000FF0000FF0000FF00C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0DCE3E180
            8080808080808080D8DDD9C0C0C0C0C0C0C0C0C0C0C0C0C0C0C000FF0000FF00
            00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
            0000FF0000FF0000FF00C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0}
          NumGlyphs = 2
        end
        object BitBtn2: TBitBtn
          Left = 928
          Top = 76
          Width = 73
          Height = 25
          Hint = 'Excluir Produto'
          Caption = 'Excluir'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 7
          TabStop = False
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000000000000000000000000000000000001DE6B51DE6B5
            1DE6B51DE6B51DE6B51DE6B5707070505850000000C7CECC1DE6B51DE6B51DE6
            B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B5B0A0907A6652A69A8CA0A0A0FF
            FFFF5090B01010109494897A66526048306048301DE6B51DE6B51DE6B51DE6B5
            1DE6B5D1BDB1FFFFFFF0E8E0A0A0A090B8C070D0E05098B0101010A09890B0A0
            906048301DE6B51DE6B51DE6B5ADB7E60E2CE0B3AEC5FFFFFFFFFFFFE0E0E050
            A0B060A8E060C0D05098B01010109090907A66521DE6B51DE6B51DE6B50028FF
            0020F04050D0FFFFFFFFFFFFFFFFFF4050E00010B090E0F060C0D05098B01010
            108A8A891DE6B51DE6B51DE6B52C51FD1038FF0028FFF0F8FFFFFFFF9098F000
            18C06078E060A8B090E0F060C0D05098B0101010CAD1CF1DE6B51DE6B5DADDE9
            3050FF2040FF90A0F0C0C8F00028F04058F0FFF8F0D0D8E070B0C090E0F070C8
            E0808880303890B2B4C81DE6B51DE6B5D0D6ED4060FF3050FF2040FF3050FFFF
            F8FFFFFFFFFFF8F0D0D8E080B0C0D0B8B07088D06070B03038901DE6B51DE6B5
            1DE6B5B3B8D94068FF4060FFD0D8FFFFFFFFFFFFFFFFF8FFF0F0F0D0D8D06070
            B07090E06078D06070B01DE6B51DE6B5BCC8EF6078FF6078FF6080FF5070FFF0
            F0FFFFFFFFFFFFFFFFF8F0F0F0F0B0A0A06070B06070B01DE6B51DE6B5A8BAF2
            5078FF5078FFC0D0FFFFFFFF7088FF6078FFD0E0FFFFFFFFFFFFFFB0A090B0A0
            909485741DE6B51DE6B5809CF85078FF5078FFC1C1DAFFFFFFFFFFFFFFFFFFB0
            C8FF8098FFFFFFFFB0A0908068508060506048301DE6B51DE6B5809CF86386FC
            D0D7EDD5C8BAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0A890D0C8C08068
            50DDCABF1DE6B51DE6B51DE6B51DE6B51DE6B5D0C0B0FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFC0A8A0807060DDCABF1DE6B51DE6B51DE6B51DE6B51DE6B5
            1DE6B5E0C0B0E0C0B0E0C0B0E0C0B0E0C0B0D0C0B0D0B8B0D0B0A0DDCABF1DE6
            B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51D
            E6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B5}
        end
        object DBEdit18: TDBEdit
          Left = 544
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
          TabOrder = 8
        end
        object RxDBComboEdit2: TRxDBComboEdit
          Left = 592
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
          TabOrder = 9
        end
        object DBEdit19: TDBEdit
          Left = 16
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
          TabOrder = 10
        end
        object DBEdit20: TDBEdit
          Left = 96
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
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 11
        end
        object DBEdit21: TDBEdit
          Left = 368
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
          TabOrder = 12
        end
        object DBEdit22: TDBEdit
          Left = 688
          Top = 40
          Width = 313
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
          TabOrder = 13
        end
        object BitBtn3: TBitBtn
          Left = 688
          Top = 76
          Width = 73
          Height = 25
          Hint = 'Salvar Produto'
          Caption = 'Inserir'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 14
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000000000000000000000000000000000001DE6B51DE6B5
            1DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6
            B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B5B0A09060483060483060483060
            48306048306048306048306048306048306048301DE6B51DE6B51DE6B51DE6B5
            1DE6B5B0A090FFFFFFB0A090B0A090B0A090B0A090B0A090B0A090B0A090B0A0
            906048301DE6B51DE6B51DE6B51DE6B51DE6B5B0A090FFFFFFFFFFFFFFF8FFF0
            F0F0F0E8E0F0E0D0E0D0D0E0C8C0B0A0906048301DE6B51DE6B51DE6B51DE6B5
            1DE6B5B0A090FFFFFFFFFFFFFFFFFFFFF8F0F0F0F0F0E0E0F0D8D0E0D0C0B0A0
            906048301DE6B51DE6B51DE6B51DE6B51DE6B5B0A090FFFFFFFFFFFFFFFFFFFF
            FFFFFFF0F0F0E8E0F0E0E0E0D8D0B0A0906048301DE6B51DE6B51DE6B51DE6B5
            1DE6B5C0A890FFFFFFFFFFFFFFFFFFFFFFFFFFF8F0F0F0F0F0E8E0F0D8D0B0A0
            906048301DE6B51DE6B51DE6B51DE6B51DE6B5C0A8A0FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFF8F0F0E8E0F0E0E0B0A0906048301DE6B51DE6B51DE6B51DE6B5
            1DE6B5C0B0A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8FFF0F0F0F0E8E0B0A0
            906048301DE6B51DE6B51DE6B51DE6B51DE6B5D0B0A0FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFF8F0F0F0F0B0A0906048301DE6B51DE6B51DE6B51DE6B5
            1DE6B5D0B8A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB0A090B0A0
            906048301DE6B51DE6B51DE6B51DE6B51DE6B5D0B8B0FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFB0A0906048306048306048301DE6B51DE6B51DE6B51DE6B5
            1DE6B5D0C0B0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0A890D0C8C06048
            30DFC5B61DE6B51DE6B51DE6B51DE6B51DE6B5E0C0B0FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFC0A8A0604830E0C6B71DE6B51DE6B51DE6B51DE6B51DE6B5
            1DE6B5E0C0B0E0C0B0E0C0B0E0C0B0E0C0B0D0C0B0D0B8B0D0B0A0E0C7B91DE6
            B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51D
            E6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B5}
        end
        object BitBtn4: TBitBtn
          Left = 768
          Top = 76
          Width = 73
          Height = 25
          Hint = 'Excluir Produto'
          Caption = 'Editar'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 15
          TabStop = False
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            180000000000000300000000000000000000000000000000000000FF0000FF00
            00FF0000FF0000FF00C0C0C02525252525252525252525252525252525252525
            25252525C0C0C000FF0000FF0000FF0000FF0000FF0000FF00252525FFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF25252500FF0000FF0000FF00
            00FF0000FF0000FF00252525FFFFFF525252525252006699FFFFFFFFFFFFFFFF
            FFFFFFFF25252500FF0000FF0000FF0000FF0000FF0000FF00252525FFFFFF52
            5252C0C0C033CCFF2D2D2DFFFFFFFFFFFFFFFFFF25252500FF0000FF0000FF00
            00FF0000FF0000FF00252525FFFFFF00669900F2FF33CCFF0066992D2D2DFFFF
            FFFFFFFF25252500FF0000FF0000FF0000FF0000FF0000FF00252525FFFFFFFF
            FFFF2D2D2D00F2FF33CCFF0066992D2D2DFFFFFF25252500FF0000FF000267FF
            00FF0000FF0000FF00252525FFFFFFFFFFFFFFFFFF2D2D2D00F2FF33CCFF0066
            992D2D2DC0C0C000FF0000FF0000FF000468FF00FF0000FF00252525FFFFFFFF
            FFFFFFFFFFFFFFFF2D2D2D00F2FF33CCFF0066992D2D2D00FF0000FF0000FF00
            00FF000436CD00FF00252525525252525252525252525252C0C0C02D2D2D00F2
            FF33CCFF2D2D2D00007A00FF0000FF0000FF0000FF000267FF0235CCC0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C02D2D2D2D2D2D1E1EE200007A00FF000234CC
            0235CC0235CC0033CC33CAFD0234CC252525252525252525252525252525C0C0
            C000007A00007A00FF0000FF0000FF0000FF0000FF000267FF0235CC0267FF00
            FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
            00FF000468FF00FF000235CC00FF000468FF00FF0000FF0000FF0000FF0000FF
            0000FF0000FF0000FF0000FF0000FF000436CD00FF0000FF000235CC00FF0000
            FF000436CD00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF000267FF
            00FF0000FF0000FF000235CC00FF0000FF0000FF000267FF00FF0000FF0000FF
            0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF000235CC00FF0000
            FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00}
        end
      end
      object pgcMaisDados: TPageControl
        Left = 0
        Top = 440
        Width = 1021
        Height = 122
        ActivePage = tbsObservacao
        Align = alBottom
        Style = tsFlatButtons
        TabOrder = 2
        object tbsObservacao: TTabSheet
          Caption = 'Observa'#231#245'es'
          object dbObservacao: TDBMemo
            Left = 0
            Top = 0
            Width = 1013
            Height = 91
            Align = alClient
            DataSource = DtSrcTabela
            TabOrder = 0
          end
        end
        object tbsTitulo: TTabSheet
          Caption = 'T'#237'tulos Gerados'
          ImageIndex = 1
        end
      end
      object DBGrid1: TDBGrid
        Left = 0
        Top = 237
        Width = 1021
        Height = 199
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
        TabOrder = 3
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
      '  v.*'
      'from TBVENDAS v')
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
