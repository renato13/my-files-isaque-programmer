inherited frmGeBancos: TfrmGeBancos
  Caption = 'Tabela de Bancos'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgcGuias: TPageControl
    inherited tbsTabela: TTabSheet
      inherited dbgDados: TDBGrid
        Columns = <
          item
            Expanded = False
            FieldName = 'BCO_COD'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BCO_NOME'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BCO_AGENCIA'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BCO_CC'
            Visible = True
          end>
      end
      inherited pnlFiltros: TPanel
        inherited grpBxFiltro: TGroupBox
          inherited Label1: TLabel
            Width = 41
            Caption = 'Banco:'
          end
        end
      end
    end
    inherited tbsCadastro: TTabSheet
      object Bevel9: TBevel [1]
        Left = 0
        Top = 201
        Width = 718
        Height = 4
        Align = alTop
        Shape = bsSpacer
      end
      inherited GrpBxDadosNominais: TGroupBox
        object lblNome: TLabel [1]
          Left = 88
          Top = 24
          Width = 31
          Height = 13
          Caption = 'Nome:'
        end
        object lblAgencia: TLabel [2]
          Left = 16
          Top = 64
          Width = 42
          Height = 13
          Caption = 'Ag'#234'ncia:'
        end
        object lblConta: TLabel [3]
          Left = 120
          Top = 64
          Width = 22
          Height = 13
          Caption = 'C/C:'
        end
        object lblContrato: TLabel [4]
          Left = 224
          Top = 64
          Width = 47
          Height = 13
          Caption = 'Contrato:'
        end
        object lblCarteira: TLabel [5]
          Left = 328
          Top = 64
          Width = 43
          Height = 13
          Caption = 'Carteira:'
        end
        inherited dbCodigo: TDBEdit
          DataField = 'BCO_COD'
          ReadOnly = False
        end
        object dbNome: TDBEdit
          Left = 88
          Top = 40
          Width = 337
          Height = 21
          CharCase = ecUpperCase
          DataField = 'BCO_NOME'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object dbAgencia: TDBEdit
          Left = 16
          Top = 80
          Width = 97
          Height = 21
          DataField = 'BCO_AGENCIA'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
        object dbConta: TDBEdit
          Left = 120
          Top = 80
          Width = 97
          Height = 21
          DataField = 'BCO_CC'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
        end
        object dbContrato: TDBEdit
          Left = 224
          Top = 80
          Width = 97
          Height = 21
          DataField = 'BCO_CHAVE'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
        end
        object dbCarteira: TDBEdit
          Left = 328
          Top = 80
          Width = 97
          Height = 21
          DataField = 'BCO_CARTEIRA'
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
      object GrpBxDiretorios: TGroupBox
        Left = 0
        Top = 125
        Width = 718
        Height = 76
        Align = alTop
        Caption = 'Diret'#243'rios de arquivos'
        TabOrder = 1
        object lblRemessa: TLabel
          Left = 16
          Top = 24
          Width = 104
          Height = 13
          Caption = 'Arquivos de remessa:'
        end
        object lblRetorno: TLabel
          Left = 360
          Top = 24
          Width = 100
          Height = 13
          Caption = 'Arquivos de retorno:'
        end
        object dbRemessa: TDBEdit
          Left = 16
          Top = 40
          Width = 337
          Height = 21
          DataField = 'BCO_DIRETORIO_REMESSA'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object dbRetorno: TDBEdit
          Left = 360
          Top = 40
          Width = 337
          Height = 21
          DataField = 'BCO_DIRETORIO_RETORNO'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
      end
      object GrpBxConfigCobreBemX: TGroupBox
        Left = 0
        Top = 205
        Width = 718
        Height = 125
        Align = alClient
        Caption = 'Configura'#231#245'es CobreBemX (Boletos)'
        TabOrder = 2
        object lblConfiguracao1: TLabel
          Left = 16
          Top = 24
          Width = 205
          Height = 13
          Caption = 'Cadeia de caracteres para configura'#231#227'o 1:'
        end
        object lblConfiguracao2: TLabel
          Left = 360
          Top = 24
          Width = 205
          Height = 13
          Caption = 'Cadeia de caracteres para configura'#231#227'o 2:'
        end
        object lblNossoNumeroI: TLabel
          Left = 16
          Top = 64
          Width = 99
          Height = 13
          Caption = 'Nosso N'#250'mero Inicial'
        end
        object lblNossoNumeroF: TLabel
          Left = 136
          Top = 64
          Width = 94
          Height = 13
          Caption = 'Nosso N'#250'mero Final'
        end
        object lblNossoNumeroP: TLabel
          Left = 256
          Top = 64
          Width = 110
          Height = 13
          Caption = 'Pr'#243'ximo Nosso N'#250'mero'
        end
        object lblProximaRemessa: TLabel
          Left = 376
          Top = 64
          Width = 88
          Height = 13
          Caption = 'Pr'#243'xima Remessa:'
        end
        object dbConfiguracao1: TDBEdit
          Left = 16
          Top = 40
          Width = 337
          Height = 21
          DataField = 'BCO_CONFG_1'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object dbConfiguracao2: TDBEdit
          Left = 360
          Top = 40
          Width = 337
          Height = 21
          DataField = 'BCO_CONFG_2'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object dbNossoNumeroI: TDBEdit
          Left = 16
          Top = 80
          Width = 113
          Height = 21
          DataField = 'BCO_NOSSO_NUM_INICIO'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
        object dbNossoNumeroF: TDBEdit
          Left = 136
          Top = 80
          Width = 113
          Height = 21
          DataField = 'BCO_NOSSO_NUM_FINAL'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
        end
        object dbNossoNumeroP: TDBEdit
          Left = 256
          Top = 80
          Width = 113
          Height = 21
          Color = clMoneyGreen
          DataField = 'BCO_NOSSO_NUM_PROXIMO'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 4
        end
        object dbProximaRemessa: TDBEdit
          Left = 376
          Top = 80
          Width = 113
          Height = 21
          Color = clMoneyGreen
          DataField = 'BCO_SEQUENCIAL_REM'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 5
        end
      end
    end
  end
  inherited IbDtstTabela: TIBDataSet
    BeforePost = IbDtstTabelaBeforePost
    OnNewRecord = IbDtstTabelaNewRecord
    object IbDtstTabelaBCO_COD: TSmallintField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'BCO_COD'
      Origin = 'TBBANCO_BOLETO.BCO_COD'
      Required = True
    end
    object IbDtstTabelaBCO_CARTEIRA: TIBStringField
      DisplayLabel = 'Carteira'
      FieldName = 'BCO_CARTEIRA'
      Origin = 'TBBANCO_BOLETO.BCO_CARTEIRA'
      Required = True
      Size = 10
    end
    object IbDtstTabelaBCO_NOME: TIBStringField
      DisplayLabel = 'Nome'
      FieldName = 'BCO_NOME'
      Origin = 'TBBANCO_BOLETO.BCO_NOME'
      Size = 50
    end
    object IbDtstTabelaBCO_CHAVE: TIBStringField
      DisplayLabel = 'Contrato'
      FieldName = 'BCO_CHAVE'
      Origin = 'TBBANCO_BOLETO.BCO_CHAVE'
      Size = 10
    end
    object IbDtstTabelaBCO_AGENCIA: TIBStringField
      DisplayLabel = 'Ag'#234'ncia'
      FieldName = 'BCO_AGENCIA'
      Origin = 'TBBANCO_BOLETO.BCO_AGENCIA'
      Size = 10
    end
    object IbDtstTabelaBCO_CC: TIBStringField
      DisplayLabel = 'C/C'
      FieldName = 'BCO_CC'
      Origin = 'TBBANCO_BOLETO.BCO_CC'
      Size = 10
    end
    object IbDtstTabelaBCO_NOSSO_NUM_INICIO: TIBStringField
      FieldName = 'BCO_NOSSO_NUM_INICIO'
      Origin = 'TBBANCO_BOLETO.BCO_NOSSO_NUM_INICIO'
      Size = 10
    end
    object IbDtstTabelaBCO_NOSSO_NUM_FINAL: TIBStringField
      FieldName = 'BCO_NOSSO_NUM_FINAL'
      Origin = 'TBBANCO_BOLETO.BCO_NOSSO_NUM_FINAL'
      Size = 10
    end
    object IbDtstTabelaBCO_NOSSO_NUM_PROXIMO: TIBStringField
      FieldName = 'BCO_NOSSO_NUM_PROXIMO'
      Origin = 'TBBANCO_BOLETO.BCO_NOSSO_NUM_PROXIMO'
      Size = 10
    end
    object IbDtstTabelaBCO_CONFG_1: TIBStringField
      FieldName = 'BCO_CONFG_1'
      Origin = 'TBBANCO_BOLETO.BCO_CONFG_1'
    end
    object IbDtstTabelaBCO_CONFG_2: TIBStringField
      FieldName = 'BCO_CONFG_2'
      Origin = 'TBBANCO_BOLETO.BCO_CONFG_2'
    end
    object IbDtstTabelaBCO_DIRETORIO_REMESSA: TIBStringField
      FieldName = 'BCO_DIRETORIO_REMESSA'
      Origin = 'TBBANCO_BOLETO.BCO_DIRETORIO_REMESSA'
      Size = 100
    end
    object IbDtstTabelaBCO_DIRETORIO_RETORNO: TIBStringField
      FieldName = 'BCO_DIRETORIO_RETORNO'
      Origin = 'TBBANCO_BOLETO.BCO_DIRETORIO_RETORNO'
      Size = 100
    end
    object IbDtstTabelaBCO_SEQUENCIAL_REM: TIntegerField
      FieldName = 'BCO_SEQUENCIAL_REM'
      Origin = 'TBBANCO_BOLETO.BCO_SEQUENCIAL_REM'
      Required = True
    end
  end
  inherited IbUpdTabela: TIBUpdateSQL
    InsertSQL.Strings = (
      'insert into TBBANCO_BOLETO'
      '  (BCO_COD, BCO_CARTEIRA, BCO_NOME, BCO_CHAVE, BCO_AGENCIA, '
      'BCO_CC, BCO_NOSSO_NUM_INICIO, '
      '   BCO_NOSSO_NUM_FINAL, BCO_NOSSO_NUM_PROXIMO, BCO_CONFG_1, '
      'BCO_CONFG_2, '
      '   BCO_DIRETORIO_REMESSA, BCO_DIRETORIO_RETORNO, '
      'BCO_SEQUENCIAL_REM)'
      'values'
      
        '  (:BCO_COD, :BCO_CARTEIRA, :BCO_NOME, :BCO_CHAVE, :BCO_AGENCIA,' +
        ' '
      ':BCO_CC, '
      '   :BCO_NOSSO_NUM_INICIO, :BCO_NOSSO_NUM_FINAL, '
      ':BCO_NOSSO_NUM_PROXIMO, '
      '   :BCO_CONFG_1, :BCO_CONFG_2, :BCO_DIRETORIO_REMESSA, '
      ':BCO_DIRETORIO_RETORNO, '
      '   :BCO_SEQUENCIAL_REM)')
  end
end
