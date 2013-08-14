inherited frmGeConfiguracaoEmpresa: TfrmGeConfiguracaoEmpresa
  Left = 523
  Top = 210
  Width = 767
  Height = 495
  ActiveControl = dbCodigo
  Caption = 'Configura'#231#245'es da Empresa'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Top = 453
    Width = 751
  end
  inherited Bevel3: TBevel
    Top = 414
    Width = 751
  end
  inherited tlbBotoes: TToolBar
    Top = 418
    Width = 751
  end
  inherited pgcGuias: TPageControl
    Width = 751
    Height = 414
    ActivePage = tbsCadastro
    inherited tbsTabela: TTabSheet
      inherited Bevel4: TBevel
        Top = 319
        Width = 743
      end
      inherited dbgDados: TDBGrid
        Width = 743
        Height = 319
        Columns = <
          item
            Expanded = False
            FieldName = 'EMPRESA'
            Title.Caption = 'CNPJ'
            Width = 120
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RZSOC'
            Title.Caption = 'Raz'#227'o Social'
            Width = 350
            Visible = True
          end
          item
            Expanded = False
            Visible = False
          end
          item
            Expanded = False
            Visible = False
          end>
      end
      inherited pnlFiltros: TPanel
        Top = 323
        Width = 743
        inherited grpBxFiltro: TGroupBox
          Left = 417
          Width = 322
          inherited lbltFiltrar: TLabel
            Left = 14
            Width = 52
            Caption = 'Empresa:'
          end
          inherited btnFiltrar: TSpeedButton
            Left = 277
          end
          inherited edtFiltrar: TEdit
            Left = 72
            Width = 201
          end
        end
      end
    end
    inherited tbsCadastro: TTabSheet
      inherited Bevel8: TBevel
        Top = 81
        Width = 743
      end
      inherited GrpBxDadosNominais: TGroupBox
        Width = 743
        Height = 81
        Caption = 'Dados de Identifica'#231#227'o'
        object lblNome: TLabel [1]
          Left = 88
          Top = 24
          Width = 31
          Height = 13
          Caption = 'Nome:'
        end
        object lblEmpresa: TLabel [2]
          Left = 240
          Top = 24
          Width = 45
          Height = 13
          Caption = 'Empresa:'
          FocusControl = dbEmpresa
        end
        inherited dbCodigo: TDBEdit
          Color = clMoneyGreen
          DataField = 'COD'
        end
        object dbNome: TDBEdit
          Left = 88
          Top = 40
          Width = 145
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
          TabOrder = 1
        end
        object dbEmpresa: TDBLookupComboBox
          Left = 240
          Top = 40
          Width = 425
          Height = 21
          DataField = 'EMPRESA'
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
      end
    end
  end
  inherited IbDtstTabela: TIBDataSet
    SelectSQL.Strings = (
      'Select'
      '    c.empresa'
      '  , c.email_conta'
      '  , c.email_senha'
      '  , c.email_pop'
      '  , c.email_smtp'
      '  , c.email_assunto_padrao'
      '  , c.email_mensagem_padrao'
      '  , e.rzsoc'
      '  , e.nmfant'
      'from TBCONFIGURACAO c'
      '  inner join TBEMPRESA e on (e.cnpj = c.empresa)'
      '')
    object IbDtstTabelaEMPRESA: TIBStringField
      FieldName = 'EMPRESA'
      Origin = '"TBCONFIGURACAO"."EMPRESA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 18
    end
    object IbDtstTabelaEMAIL_CONTA: TIBStringField
      FieldName = 'EMAIL_CONTA'
      Origin = '"TBCONFIGURACAO"."EMAIL_CONTA"'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object IbDtstTabelaEMAIL_SENHA: TIBStringField
      FieldName = 'EMAIL_SENHA'
      Origin = '"TBCONFIGURACAO"."EMAIL_SENHA"'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object IbDtstTabelaEMAIL_POP: TIBStringField
      FieldName = 'EMAIL_POP'
      Origin = '"TBCONFIGURACAO"."EMAIL_POP"'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object IbDtstTabelaEMAIL_SMTP: TIBStringField
      FieldName = 'EMAIL_SMTP'
      Origin = '"TBCONFIGURACAO"."EMAIL_SMTP"'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object IbDtstTabelaEMAIL_ASSUNTO_PADRAO: TIBStringField
      FieldName = 'EMAIL_ASSUNTO_PADRAO'
      Origin = '"TBCONFIGURACAO"."EMAIL_ASSUNTO_PADRAO"'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object IbDtstTabelaEMAIL_MENSAGEM_PADRAO: TIBStringField
      FieldName = 'EMAIL_MENSAGEM_PADRAO'
      Origin = '"TBCONFIGURACAO"."EMAIL_MENSAGEM_PADRAO"'
      ProviderFlags = [pfInUpdate]
      Size = 250
    end
    object IbDtstTabelaRZSOC: TIBStringField
      FieldName = 'RZSOC'
      Origin = '"TBEMPRESA"."RZSOC"'
      ProviderFlags = []
      Size = 60
    end
    object IbDtstTabelaNMFANT: TIBStringField
      FieldName = 'NMFANT'
      Origin = '"TBEMPRESA"."NMFANT"'
      ProviderFlags = []
      Size = 25
    end
  end
  inherited IbUpdTabela: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  EMPRESA,'
      '  EMAIL_CONTA,'
      '  EMAIL_SENHA,'
      '  EMAIL_POP,'
      '  EMAIL_SMTP,'
      '  EMAIL_ASSUNTO_PADRAO,'
      '  EMAIL_MENSAGEM_PADRAO'
      'from TBCONFIGURACAO '
      'where'
      '  EMPRESA = :EMPRESA')
    ModifySQL.Strings = (
      'update TBCONFIGURACAO'
      'set'
      '  EMAIL_ASSUNTO_PADRAO = :EMAIL_ASSUNTO_PADRAO,'
      '  EMAIL_CONTA = :EMAIL_CONTA,'
      '  EMAIL_MENSAGEM_PADRAO = :EMAIL_MENSAGEM_PADRAO,'
      '  EMAIL_POP = :EMAIL_POP,'
      '  EMAIL_SENHA = :EMAIL_SENHA,'
      '  EMAIL_SMTP = :EMAIL_SMTP,'
      '  EMPRESA = :EMPRESA'
      'where'
      '  EMPRESA = :OLD_EMPRESA')
    InsertSQL.Strings = (
      'insert into TBCONFIGURACAO'
      
        '  (EMAIL_ASSUNTO_PADRAO, EMAIL_CONTA, EMAIL_MENSAGEM_PADRAO, EMA' +
        'IL_POP, '
      '   EMAIL_SENHA, EMAIL_SMTP, EMPRESA)'
      'values'
      
        '  (:EMAIL_ASSUNTO_PADRAO, :EMAIL_CONTA, :EMAIL_MENSAGEM_PADRAO, ' +
        ':EMAIL_POP, '
      '   :EMAIL_SENHA, :EMAIL_SMTP, :EMPRESA)')
    DeleteSQL.Strings = (
      'delete from TBCONFIGURACAO'
      'where'
      '  EMPRESA = :OLD_EMPRESA')
  end
  object tblEmpresa: TIBTable
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    TableName = 'TBEMPRESA'
    Left = 384
    Top = 208
  end
  object dtsEmpresa: TDataSource
    DataSet = tblEmpresa
    Left = 416
    Top = 208
  end
end
