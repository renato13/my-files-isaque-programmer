inherited frmGeCliente: TfrmGeCliente
  Left = 278
  Top = 146
  Width = 903
  Height = 574
  ActiveControl = dbCodigo
  Caption = 'Cadastro de Clientes'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Top = 532
    Width = 887
  end
  inherited Bevel3: TBevel
    Top = 493
    Width = 887
  end
  inherited tlbBotoes: TToolBar
    Top = 497
    Width = 887
    inherited bvlToolExpandir: TBevel
      Width = 81
    end
    inherited btbtnSelecionar: TBitBtn
      Left = 622
    end
    inherited bvlTool4: TBevel
      Left = 742
    end
  end
  inherited pgcGuias: TPageControl
    Width = 887
    Height = 493
    ActivePage = tbsCadastro
    OnChange = pgcGuiasChange
    inherited tbsTabela: TTabSheet
      inherited Bevel4: TBevel
        Top = 398
        Width = 879
      end
      inherited dbgDados: TDBGrid
        Width = 879
        Height = 398
        Columns = <
          item
            Expanded = False
            FieldName = 'CODIGO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME'
            Width = 250
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CNPJ'
            Width = 140
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'INSCEST'
            Title.Caption = 'RG / Ins. Estadual'
            Width = 120
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'INSCMUN'
            Title.Caption = 'Inscri'#231#227'o Municipal'
            Width = 120
            Visible = True
          end>
      end
      inherited pnlFiltros: TPanel
        Top = 402
        Width = 879
        inherited grpBxFiltro: TGroupBox
          Left = 604
          Width = 271
          inherited lbltFiltrar: TLabel
            Width = 42
            Caption = 'Cliente:'
          end
          inherited btnFiltrar: TSpeedButton
            Left = 226
          end
          inherited edtFiltrar: TEdit
            Left = 56
            Width = 166
          end
        end
      end
    end
    inherited tbsCadastro: TTabSheet
      inherited Bevel8: TBevel
        Top = 113
        Width = 879
      end
      object Bevel5: TBevel [1]
        Left = 0
        Top = 233
        Width = 879
        Height = 4
        Align = alTop
        Shape = bsSpacer
      end
      inherited GrpBxDadosNominais: TGroupBox
        Width = 879
        Height = 113
        object lblCNPJ: TLabel [1]
          Left = 192
          Top = 24
          Width = 58
          Height = 13
          Caption = 'CPF / CNPJ:'
          FocusControl = dbCNPJ
        end
        object lblRazao: TLabel [2]
          Left = 352
          Top = 24
          Width = 101
          Height = 13
          Caption = 'Nome / Raz'#227'o Social:'
          FocusControl = dbRazao
        end
        object lblIE: TLabel [3]
          Left = 16
          Top = 64
          Width = 115
          Height = 13
          Caption = 'RG / Inscri'#231#227'o Estadual:'
          FocusControl = dbIE
        end
        object lblIM: TLabel [4]
          Left = 176
          Top = 64
          Width = 93
          Height = 13
          Caption = 'Inscri'#231#227'o Municipal:'
          FocusControl = dbIM
        end
        inherited dbCodigo: TDBEdit
          Color = clMoneyGreen
          DataField = 'CODIGO'
        end
        object dbPessoaFisica: TDBCheckBox
          Left = 88
          Top = 42
          Width = 97
          Height = 17
          Caption = 'Pessoa F'#237'sica'
          DataField = 'PESSOA_FISICA'
          DataSource = DtSrcTabela
          TabOrder = 1
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object dbCNPJ: TDBEdit
          Left = 192
          Top = 40
          Width = 153
          Height = 21
          CharCase = ecUpperCase
          DataField = 'CNPJ'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
        object dbRazao: TDBEdit
          Left = 352
          Top = 40
          Width = 369
          Height = 21
          CharCase = ecUpperCase
          DataField = 'NOME'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
        end
        object dbIE: TDBEdit
          Left = 16
          Top = 80
          Width = 153
          Height = 21
          CharCase = ecUpperCase
          DataField = 'INSCEST'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
        end
        object dbIM: TDBEdit
          Left = 176
          Top = 80
          Width = 153
          Height = 21
          CharCase = ecUpperCase
          DataField = 'INSCMUN'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
        end
      end
      object GroupBox1: TGroupBox
        Left = 0
        Top = 117
        Width = 879
        Height = 116
        Align = alTop
        Caption = 'Endere'#231'o'
        TabOrder = 1
        object lblCidade: TLabel
          Left = 160
          Top = 24
          Width = 37
          Height = 13
          Caption = 'Cidade:'
        end
        object lblEstado: TLabel
          Left = 16
          Top = 24
          Width = 37
          Height = 13
          Caption = 'Estado:'
        end
        object lblBairro: TLabel
          Left = 416
          Top = 24
          Width = 32
          Height = 13
          Caption = 'Bairro:'
        end
        object lblLogradouro: TLabel
          Left = 16
          Top = 64
          Width = 59
          Height = 13
          Caption = 'Logradouro:'
        end
        object lblCEP: TLabel
          Left = 616
          Top = 24
          Width = 23
          Height = 13
          Caption = 'CEP:'
          FocusControl = dbCEP
        end
        object lblNumero: TLabel
          Left = 416
          Top = 64
          Width = 41
          Height = 13
          Caption = 'N'#250'mero:'
          FocusControl = dbNumero
        end
        object lblComplemento: TLabel
          Left = 488
          Top = 64
          Width = 69
          Height = 13
          Caption = 'Complemento:'
          FocusControl = dbComplemento
        end
        object lblPais: TLabel
          Left = 616
          Top = 64
          Width = 23
          Height = 13
          Caption = 'Pa'#237's:'
        end
        object dbCidade: TRxDBComboEdit
          Left = 160
          Top = 40
          Width = 249
          Height = 21
          ButtonHint = 'Pesquisar Cidade (Ctrl+P)'
          CharCase = ecUpperCase
          ClickKey = 16464
          Color = clMoneyGreen
          DataField = 'CID_NOME'
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
          TabOrder = 1
          OnButtonClick = dbCidadeButtonClick
        end
        object dbEstado: TRxDBComboEdit
          Left = 16
          Top = 40
          Width = 137
          Height = 21
          ButtonHint = 'Pesquisar Estado (Ctrl+P)'
          CharCase = ecUpperCase
          ClickKey = 16464
          Color = clMoneyGreen
          DataField = 'EST_NOME'
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
          TabOrder = 0
          OnButtonClick = dbEstadoButtonClick
        end
        object dbBairro: TRxDBComboEdit
          Left = 416
          Top = 40
          Width = 193
          Height = 21
          ButtonHint = 'Pesquisar Bairro (Ctrl+P)'
          CharCase = ecUpperCase
          ClickKey = 16464
          Color = clMoneyGreen
          DataField = 'BAIRRO'
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
          TabOrder = 2
          OnButtonClick = dbBairroButtonClick
        end
        object dbLogradouro: TRxDBComboEdit
          Left = 16
          Top = 80
          Width = 393
          Height = 21
          ButtonHint = 'Pesquisar Logradouro (Ctrl+P)'
          CharCase = ecUpperCase
          ClickKey = 16464
          Color = clMoneyGreen
          DataField = 'LOGRADOURO'
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
          TabOrder = 4
          OnButtonClick = dbLogradouroButtonClick
        end
        object dbCEP: TDBEdit
          Left = 616
          Top = 40
          Width = 105
          Height = 21
          CharCase = ecUpperCase
          DataField = 'CEP'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 10
          ParentFont = False
          TabOrder = 3
        end
        object dbNumero: TDBEdit
          Left = 416
          Top = 80
          Width = 65
          Height = 21
          CharCase = ecUpperCase
          DataField = 'NUMERO_END'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
        end
        object dbComplemento: TDBEdit
          Left = 488
          Top = 80
          Width = 121
          Height = 21
          CharCase = ecUpperCase
          DataField = 'COMPLEMENTO'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
        end
        object dbPais: TRxDBComboEdit
          Left = 616
          Top = 80
          Width = 105
          Height = 21
          ButtonHint = 'Pesquisar Pa'#237's (Ctrl+P)'
          CharCase = ecUpperCase
          ClickKey = 16464
          Color = clMoneyGreen
          DataField = 'PAIS_NOME'
          DataSource = DtSrcTabela
          Enabled = False
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
          TabOrder = 7
        end
      end
      object pgcMaisDados: TPageControl
        Left = 0
        Top = 237
        Width = 879
        Height = 227
        ActivePage = tbsContato
        Align = alClient
        TabOrder = 2
        object tbsContato: TTabSheet
          Caption = 'Contato'
          object lblFone: TLabel
            Left = 8
            Top = 0
            Width = 28
            Height = 13
            Caption = 'Fone:'
            FocusControl = dbFone
          end
          object lblEmail: TLabel
            Left = 168
            Top = 0
            Width = 32
            Height = 13
            Caption = 'E-mail:'
            FocusControl = dbEmail
          end
          object lblHome: TLabel
            Left = 8
            Top = 40
            Width = 58
            Height = 13
            Caption = 'Home page:'
            FocusControl = dbHome
          end
          object Label1: TLabel
            Left = 8
            Top = 96
            Width = 54
            Height = 13
            Caption = 'Cadastro:'
            FocusControl = dbValorLimiteCompra
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object dbFone: TDBEdit
            Left = 8
            Top = 16
            Width = 153
            Height = 21
            CharCase = ecUpperCase
            DataField = 'FONE'
            DataSource = DtSrcTabela
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            MaxLength = 13
            ParentFont = False
            TabOrder = 0
          end
          object dbEmail: TDBEdit
            Left = 168
            Top = 16
            Width = 305
            Height = 21
            CharCase = ecLowerCase
            DataField = 'EMAIL'
            DataSource = DtSrcTabela
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
          end
          object dbHome: TDBEdit
            Left = 8
            Top = 56
            Width = 465
            Height = 21
            CharCase = ecLowerCase
            DataField = 'SITE'
            DataSource = DtSrcTabela
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            OnKeyPress = ProximoCampoKeyPress
          end
          object DBEdit1: TDBEdit
            Left = 8
            Top = 112
            Width = 121
            Height = 21
            Color = clMoneyGreen
            DataField = 'DTCAD'
            DataSource = DtSrcTabela
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 3
          end
        end
        object tbsFinanceiro: TTabSheet
          Caption = 'Financeiro'
          ImageIndex = 1
          DesignSize = (
            871
            199)
          object lblValorLimiteCompra: TLabel
            Left = 8
            Top = 0
            Width = 111
            Height = 13
            Caption = 'Limte p/ Compras (R$):'
            FocusControl = dbValorLimiteCompra
          end
          object lblTotalCompras: TLabel
            Left = 8
            Top = 40
            Width = 138
            Height = 13
            Caption = 'Total Compras Abertas (R$):'
            FocusControl = dbTotalCompras
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lblLimiteDisponivel: TLabel
            Left = 8
            Top = 80
            Width = 127
            Height = 13
            Caption = 'Limite Dispon'#237'vel (R$):'
            FocusControl = dbLimiteDisponivel
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblTituloCancelado: TLabel
            Left = 8
            Top = 175
            Width = 114
            Height = 13
            Anchors = [akLeft, akBottom]
            Caption = '* T'#237'tulos cancelados'
            Font.Charset = ANSI_CHARSET
            Font.Color = clRed
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblTituloPagando: TLabel
            Left = 8
            Top = 151
            Width = 122
            Height = 13
            Anchors = [akLeft, akBottom]
            Caption = '* T'#237'tulos sendo pagos'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object dbValorLimiteCompra: TDBEdit
            Left = 8
            Top = 16
            Width = 153
            Height = 21
            CharCase = ecUpperCase
            DataField = 'VALOR_LIMITE_COMPRA'
            DataSource = DtSrcTabela
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object dbTotalCompras: TDBEdit
            Left = 8
            Top = 56
            Width = 153
            Height = 21
            Color = clMoneyGreen
            DataField = 'VALOR_COMPRAS_ABERTAS'
            DataSource = cdsTotalComprasAbertas
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
          end
          object dbLimiteDisponivel: TDBEdit
            Left = 8
            Top = 96
            Width = 153
            Height = 21
            Color = clMoneyGreen
            DataField = 'VALOR_LIMITE_DISPONIVEL'
            DataSource = cdsTotalComprasAbertas
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 2
          end
          object pnlTitulos: TPanel
            Left = 168
            Top = 0
            Width = 703
            Height = 199
            Align = alRight
            Anchors = [akLeft, akTop, akRight, akBottom]
            BevelOuter = bvNone
            TabOrder = 3
            object dbgTitulos: TDBGrid
              Left = 0
              Top = 0
              Width = 703
              Height = 199
              Align = alClient
              DataSource = dtsTitulos
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
              TitleFont.Charset = ANSI_CHARSET
              TitleFont.Color = clBlack
              TitleFont.Height = -11
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = [fsBold]
              OnDrawColumnCell = dbgDadosDrawColumnCell
              Columns = <
                item
                  Expanded = False
                  FieldName = 'LANCAMENTO'
                  Title.Caption = 'Lan'#231'amento'
                  Width = 100
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DTEMISS'
                  Title.Caption = 'Emiss'#227'o'
                  Width = 85
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DTVENC'
                  Title.Caption = 'Vencimento'
                  Width = 85
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'FORMA_PAGTO_DESC'
                  Title.Caption = 'Forma de Pagamento'
                  Width = 150
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'SITUACAO'
                  Title.Caption = 'Situa'#231#227'o'
                  Width = 75
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'VALORREC'
                  Title.Caption = 'Valor (R$)'
                  Width = 80
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'VALORRECTOT'
                  Title.Caption = 'Pago (R$)'
                  Width = 80
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'VALORSALDO'
                  Title.Caption = 'A Pagar (R$)'
                  Width = 80
                  Visible = True
                end>
            end
          end
        end
      end
    end
  end
  inherited IbDtstTabela: TIBDataSet
    OnNewRecord = IbDtstTabelaNewRecord
    SelectSQL.Strings = (
      'Select'
      '    cl.Codigo'
      '  , cl.Pessoa_fisica'
      '  , cl.Cnpj'
      '  , cl.Nome'
      '  , cl.Inscest'
      '  , cl.Inscmun'
      '  , cl.Ender'
      '  , cl.Complemento'
      '  , cl.Numero_end'
      '  , cl.Bairro'
      '  , cl.Cep'
      '  , cl.Cidade'
      '  , cl.Uf'
      '  , cl.Fone'
      '  , cl.Tlg_tipo'
      '  , cl.Log_cod'
      '  , cl.Bai_cod'
      '  , cl.Cid_cod'
      '  , cl.Est_cod'
      '  , cl.Email'
      '  , cl.Site'
      '  , cl.Pais_id'
      '  , cl.Valor_limite_compra'
      
        '  , coalesce( cast(coalesce(coalesce(t.Tlg_sigla, t.Tlg_descrica' +
        'o) || '#39' '#39', '#39#39') || l.Log_nome as varchar(250)), cl.Ender ) as Log' +
        'radouro'
      '  , coalesce(c.Cid_nome, cl.Cidade) as Cid_nome'
      '  , coalesce(u.Est_nome, cl.Uf) as Est_nome'
      '  , p.Pais_nome'
      '  , cl.DtCad '
      'from TBCLIENTE cl'
      '  left join TBTIPO_LOGRADOURO t on (t.Tlg_cod = cl.Tlg_tipo)'
      '  left join TBLOGRADOURO l on (l.Log_cod = cl.Log_cod)'
      '  left join TBCIDADE c on (c.Cid_cod = cl.Cid_cod)'
      '  left join TBESTADO u on (u.Est_cod = cl.Est_cod)'
      '  left join TBPAIS p on (p.Pais_id = cl.Pais_id)')
    GeneratorField.Field = 'CODIGO'
    GeneratorField.Generator = 'GEN_CLIENTE_ID'
    Active = True
    Left = 640
    object IbDtstTabelaCODIGO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      Origin = 'TBEMPRESA.CODIGO'
      Required = True
    end
    object IbDtstTabelaPESSOA_FISICA: TSmallintField
      DisplayLabel = 'Pessoa F'#237'sica'
      FieldName = 'PESSOA_FISICA'
      Origin = 'TBEMPRESA.PESSOA_FISICA'
      Required = True
    end
    object IbDtstTabelaCNPJ: TIBStringField
      DisplayLabel = 'CPF / CNPJ'
      FieldName = 'CNPJ'
      Origin = 'TBEMPRESA.CNPJ'
      Required = True
      Size = 18
    end
    object IbDtstTabelaNOME: TIBStringField
      DisplayLabel = 'Nome / Raz'#227'o Social'
      FieldName = 'NOME'
      Origin = 'TBCLIENTE.NOME'
      Size = 60
    end
    object IbDtstTabelaINSCEST: TIBStringField
      DisplayLabel = 'RG / Inscri'#231#227'o Estadual'
      FieldName = 'INSCEST'
      Origin = 'TBCLIENTE.INSCEST'
    end
    object IbDtstTabelaINSCMUN: TIBStringField
      DisplayLabel = 'Inscri'#231#227'o Estadual'
      FieldName = 'INSCMUN'
      Origin = 'TBCLIENTE.INSCMUN'
    end
    object IbDtstTabelaENDER: TIBStringField
      DisplayLabel = 'Endere'#231'o'
      FieldName = 'ENDER'
      Origin = 'TBEMPRESA.ENDER'
      Size = 250
    end
    object IbDtstTabelaCOMPLEMENTO: TIBStringField
      DisplayLabel = 'Complemento'
      FieldName = 'COMPLEMENTO'
      Origin = 'TBEMPRESA.COMPLEMENTO'
      Size = 50
    end
    object IbDtstTabelaNUMERO_END: TIBStringField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'NUMERO_END'
      Origin = 'TBEMPRESA.NUMERO_END'
      Size = 10
    end
    object IbDtstTabelaBAIRRO: TIBStringField
      DisplayLabel = 'Bairro'
      FieldName = 'BAIRRO'
      Origin = 'TBEMPRESA.BAIRRO'
      Size = 25
    end
    object IbDtstTabelaCEP: TIBStringField
      FieldName = 'CEP'
      Origin = 'TBEMPRESA.CEP'
      EditMask = '99.999-999;0; '
      Size = 8
    end
    object IbDtstTabelaCIDADE: TIBStringField
      DisplayLabel = 'Cidade'
      FieldName = 'CIDADE'
      Origin = 'TBEMPRESA.CIDADE'
      Size = 30
    end
    object IbDtstTabelaUF: TIBStringField
      FieldName = 'UF'
      Origin = 'TBEMPRESA.UF'
      FixedChar = True
      Size = 2
    end
    object IbDtstTabelaFONE: TIBStringField
      DisplayLabel = 'Fone'
      FieldName = 'FONE'
      Origin = 'TBEMPRESA.FONE'
      EditMask = '(99)9999.9999;0; '
      Size = 11
    end
    object IbDtstTabelaTLG_TIPO: TSmallintField
      DisplayLabel = 'Tipo End.'
      FieldName = 'TLG_TIPO'
      Origin = 'TBEMPRESA.TLG_TIPO'
    end
    object IbDtstTabelaLOG_COD: TIntegerField
      DisplayLabel = 'Logradouro'
      FieldName = 'LOG_COD'
      Origin = 'TBEMPRESA.LOG_COD'
    end
    object IbDtstTabelaBAI_COD: TIntegerField
      DisplayLabel = 'Bairro'
      FieldName = 'BAI_COD'
      Origin = 'TBEMPRESA.BAI_COD'
    end
    object IbDtstTabelaCID_COD: TIntegerField
      DisplayLabel = 'Cidade'
      FieldName = 'CID_COD'
      Origin = 'TBEMPRESA.CID_COD'
    end
    object IbDtstTabelaEST_COD: TSmallintField
      DisplayLabel = 'Estado'
      FieldName = 'EST_COD'
      Origin = 'TBEMPRESA.EST_COD'
    end
    object IbDtstTabelaEMAIL: TIBStringField
      DisplayLabel = 'E-mail'
      FieldName = 'EMAIL'
      Origin = 'TBEMPRESA.EMAIL'
      Size = 100
    end
    object IbDtstTabelaSITE: TIBStringField
      DisplayLabel = 'Home page'
      FieldName = 'SITE'
      Origin = 'TBCLIENTE.SITE'
      Size = 40
    end
    object IbDtstTabelaPAIS_ID: TIBStringField
      DisplayLabel = 'Pa'#237's'
      FieldName = 'PAIS_ID'
      Origin = 'TBEMPRESA.PAIS_ID'
      Size = 5
    end
    object IbDtstTabelaLOGRADOURO: TIBStringField
      DisplayLabel = 'Logradouro'
      FieldName = 'LOGRADOURO'
      Size = 250
    end
    object IbDtstTabelaCID_NOME: TIBStringField
      FieldName = 'CID_NOME'
      Origin = 'TBCIDADE.CID_NOME'
      Size = 100
    end
    object IbDtstTabelaEST_NOME: TIBStringField
      FieldName = 'EST_NOME'
      Origin = 'TBESTADO.EST_NOME'
      Size = 100
    end
    object IbDtstTabelaPAIS_NOME: TIBStringField
      FieldName = 'PAIS_NOME'
      Origin = 'TBPAIS.PAIS_NOME'
      Size = 150
    end
    object IbDtstTabelaVALOR_LIMITE_COMPRA: TIBBCDField
      DisplayLabel = 'Valor Limite p/ Compra'
      FieldName = 'VALOR_LIMITE_COMPRA'
      Origin = 'TBCLIENTE.VALOR_LIMITE_COMPRA'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object IbDtstTabelaDTCAD: TDateField
      FieldName = 'DTCAD'
      Origin = 'TBCLIENTE.DTCAD'
      Required = True
    end
  end
  inherited DtSrcTabela: TDataSource
    OnDataChange = DtSrcTabelaDataChange
    Left = 704
  end
  inherited IbUpdTabela: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  CODIGO,'
      '  PESSOA_FISICA,'
      '  CNPJ,'
      '  NOME,'
      '  INSCEST,'
      '  INSCMUN,'
      '  ENDER,'
      '  COMPLEMENTO,'
      '  BAIRRO,'
      '  CEP,'
      '  CIDADE,'
      '  UF,'
      '  FONE,'
      '  EMAIL,'
      '  SITE,'
      '  TLG_TIPO,'
      '  LOG_COD,'
      '  BAI_COD,'
      '  CID_COD,'
      '  EST_COD,'
      '  NUMERO_END,'
      '  PAIS_ID,'
      '  VALOR_LIMITE_COMPRA.'
      '  DTCAD'
      'from TBCLIENTE '
      'where'
      '  CNPJ = :CNPJ')
    ModifySQL.Strings = (
      'update TBCLIENTE'
      'set'
      '  CODIGO = :CODIGO,'
      '  PESSOA_FISICA = :PESSOA_FISICA,'
      '  CNPJ = :CNPJ,'
      '  NOME = :NOME,'
      '  INSCEST = :INSCEST,'
      '  INSCMUN = :INSCMUN,'
      '  ENDER = :ENDER,'
      '  COMPLEMENTO = :COMPLEMENTO,'
      '  BAIRRO = :BAIRRO,'
      '  CEP = :CEP,'
      '  CIDADE = :CIDADE,'
      '  UF = :UF,'
      '  FONE = :FONE,'
      '  EMAIL = :EMAIL,'
      '  SITE = :SITE,'
      '  TLG_TIPO = :TLG_TIPO,'
      '  LOG_COD = :LOG_COD,'
      '  BAI_COD = :BAI_COD,'
      '  CID_COD = :CID_COD,'
      '  EST_COD = :EST_COD,'
      '  NUMERO_END = :NUMERO_END,'
      '  PAIS_ID = :PAIS_ID,'
      '  VALOR_LIMITE_COMPRA = :VALOR_LIMITE_COMPRA,'
      '  DTCAD = :DTCAD'
      'where'
      '  CNPJ = :OLD_CNPJ')
    InsertSQL.Strings = (
      'insert into TBCLIENTE'
      
        '  (CODIGO, PESSOA_FISICA, CNPJ, NOME, INSCEST, INSCMUN, ENDER, C' +
        'OMPLEMENTO, '
      
        '   BAIRRO, CEP, CIDADE, UF, FONE, EMAIL, SITE, TLG_TIPO, LOG_COD' +
        ', BAI_COD, '
      
        '   CID_COD, EST_COD, NUMERO_END, PAIS_ID, VALOR_LIMITE_COMPRA, D' +
        'TCAD)'
      'values'
      
        '  (:CODIGO, :PESSOA_FISICA, :CNPJ, :NOME, :INSCEST, :INSCMUN, :E' +
        'NDER, :COMPLEMENTO, '
      
        '   :BAIRRO, :CEP, :CIDADE, :UF, :FONE, :EMAIL, :SITE, :TLG_TIPO,' +
        ' :LOG_COD, '
      
        '   :BAI_COD, :CID_COD, :EST_COD, :NUMERO_END, :PAIS_ID, :VALOR_L' +
        'IMITE_COMPRA, :DTCAD)')
    DeleteSQL.Strings = (
      'delete from TBCLIENTE'
      'where'
      '  CNPJ = :OLD_CNPJ')
    Left = 672
  end
  inherited ImgList: TImageList
    Left = 608
  end
  object qryTotalComprasAbertas: TIBQuery
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select'
      '    g.Valor_limite'
      '  , g.Valor_compras_abertas'
      '  , g.Valor_limite_disponivel'
      'from GET_LIMITE_DISPONIVEL_CLIENTE(:CNPJ) g')
    Left = 672
    Top = 41
    ParamData = <
      item
        DataType = ftString
        Name = 'CNPJ'
        ParamType = ptInput
        Value = ''
      end>
    object qryTotalComprasAbertasVALOR_LIMITE: TIBBCDField
      FieldName = 'VALOR_LIMITE'
      Origin = 'GET_LIMITE_DISPONIVEL_CLIENTE.VALOR_LIMITE'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryTotalComprasAbertasVALOR_COMPRAS_ABERTAS: TIBBCDField
      FieldName = 'VALOR_COMPRAS_ABERTAS'
      Origin = 'GET_LIMITE_DISPONIVEL_CLIENTE.VALOR_COMPRAS_ABERTAS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryTotalComprasAbertasVALOR_LIMITE_DISPONIVEL: TIBBCDField
      FieldName = 'VALOR_LIMITE_DISPONIVEL'
      Origin = 'GET_LIMITE_DISPONIVEL_CLIENTE.VALOR_LIMITE_DISPONIVEL'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
  end
  object cdsTotalComprasAbertas: TDataSource
    DataSet = qryTotalComprasAbertas
    Left = 704
    Top = 41
  end
  object qryTitulos: TIBQuery
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select'
      '    r.Anolanc'
      '  , r.Numlanc'
      
        '  , r.Anolanc || '#39'/'#39' || right('#39'0000000'#39' || r.Numlanc, 7) as Lanc' +
        'amento'
      '  , r.Parcela'
      '  , r.Dtemiss'
      '  , r.Dtvenc'
      '  , r.Forma_pagto'
      '  , f.Descri as Forma_pagto_Desc'
      '  , r.Nossonumero'
      '  , r.Valorrec'
      '  , r.Valormulta'
      '  , r.Valorrectot'
      '  , r.Valorsaldo'
      '  , r.Status'
      '  , r.Situacao'
      'from TBCONTREC r'
      '  inner join TBFORMPAGTO f on (f.Cod = r.Forma_pagto)'
      'where r.Baixado = 0'
      '  and r.Cnpj = :cliente')
    Left = 672
    Top = 73
    ParamData = <
      item
        DataType = ftString
        Name = 'cliente'
        ParamType = ptInput
        Value = ''
      end>
    object qryTitulosANOLANC: TSmallintField
      FieldName = 'ANOLANC'
      Origin = 'TBCONTREC.ANOLANC'
      Required = True
    end
    object qryTitulosNUMLANC: TIntegerField
      FieldName = 'NUMLANC'
      Origin = 'TBCONTREC.NUMLANC'
      Required = True
    end
    object qryTitulosLANCAMENTO: TIBStringField
      FieldName = 'LANCAMENTO'
      Required = True
      Size = 25
    end
    object qryTitulosPARCELA: TSmallintField
      FieldName = 'PARCELA'
      Origin = 'TBCONTREC.PARCELA'
    end
    object qryTitulosDTEMISS: TDateField
      FieldName = 'DTEMISS'
      Origin = 'TBCONTREC.DTEMISS'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qryTitulosDTVENC: TDateField
      FieldName = 'DTVENC'
      Origin = 'TBCONTREC.DTVENC'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qryTitulosFORMA_PAGTO: TSmallintField
      FieldName = 'FORMA_PAGTO'
      Origin = 'TBCONTREC.FORMA_PAGTO'
    end
    object qryTitulosFORMA_PAGTO_DESC: TIBStringField
      FieldName = 'FORMA_PAGTO_DESC'
      Origin = 'TBFORMPAGTO.DESCRI'
      Size = 30
    end
    object qryTitulosNOSSONUMERO: TIBStringField
      FieldName = 'NOSSONUMERO'
      Origin = 'TBCONTREC.NOSSONUMERO'
    end
    object qryTitulosVALORREC: TIBBCDField
      FieldName = 'VALORREC'
      Origin = 'TBCONTREC.VALORREC'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryTitulosVALORMULTA: TIBBCDField
      FieldName = 'VALORMULTA'
      Origin = 'TBCONTREC.VALORMULTA'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryTitulosVALORRECTOT: TIBBCDField
      FieldName = 'VALORRECTOT'
      Origin = 'TBCONTREC.VALORRECTOT'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryTitulosVALORSALDO: TIBBCDField
      FieldName = 'VALORSALDO'
      Origin = 'TBCONTREC.VALORSALDO'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryTitulosSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'TBCONTREC.STATUS'
      Size = 12
    end
    object qryTitulosSITUACAO: TSmallintField
      Alignment = taLeftJustify
      FieldName = 'SITUACAO'
      Origin = 'TBCONTREC.SITUACAO'
      OnGetText = qryTitulosSITUACAOGetText
    end
  end
  object dtsTitulos: TDataSource
    DataSet = qryTitulos
    Left = 704
    Top = 73
  end
  object IBQuery1: TIBQuery
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select current_timestamp, current_date from rdb$database')
    Left = 676
    Top = 121
    object IBQuery1CURRENT_TIMESTAMP: TDateTimeField
      FieldName = 'CURRENT_TIMESTAMP'
      Required = True
    end
    object IBQuery1CURRENT_DATE: TDateField
      FieldName = 'CURRENT_DATE'
      Required = True
    end
  end
end
