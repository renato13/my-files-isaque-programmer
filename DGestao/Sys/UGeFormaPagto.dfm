inherited frmGeFormaPagto: TfrmGeFormaPagto
  Left = 553
  Top = 269
  Caption = 'Tabela de Formas de Pagamento'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgcGuias: TPageControl
    inherited tbsTabela: TTabSheet
      inherited dbgDados: TDBGrid
        Columns = <
          item
            Expanded = False
            FieldName = 'COD'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRI'
            Width = 350
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ACRESCIMO'
            Visible = True
          end>
      end
      inherited pnlFiltros: TPanel
        inherited grpBxFiltro: TGroupBox
          Left = 392
          Width = 322
          inherited lbltFiltrar: TLabel
            Width = 107
            Caption = 'Forma Pagamento:'
          end
          inherited btnFiltrar: TSpeedButton
            Left = 277
          end
          inherited edtFiltrar: TEdit
            Left = 120
            Width = 153
          end
        end
      end
    end
    inherited tbsCadastro: TTabSheet
      inherited Bevel8: TBevel
        Top = 81
      end
      inherited GrpBxDadosNominais: TGroupBox
        Height = 81
        object lblNome: TLabel [1]
          Left = 88
          Top = 24
          Width = 50
          Height = 13
          Caption = 'Descri'#231#227'o:'
        end
        object lblAcrescimo: TLabel [2]
          Left = 432
          Top = 24
          Width = 66
          Height = 13
          Caption = '% Acr'#233'scimo:'
        end
        inherited dbCodigo: TDBEdit
          Color = clMoneyGreen
          DataField = 'COD'
        end
        object dbNome: TDBEdit
          Left = 88
          Top = 40
          Width = 337
          Height = 21
          CharCase = ecUpperCase
          DataField = 'DESCRI'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object dbAcrescimo: TDBEdit
          Left = 432
          Top = 40
          Width = 97
          Height = 21
          CharCase = ecUpperCase
          DataField = 'ACRESCIMO'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
      end
    end
  end
  inherited IbDtstTabela: TIBDataSet
    OnNewRecord = IbDtstTabelaNewRecord
    SelectSQL.Strings = (
      'Select'
      '    p.Cod'
      '  , p.Descri'
      '  , p.Acrescimo'
      'from TBFORMPAGTO p')
    GeneratorField.Field = 'COD'
    GeneratorField.Generator = 'GEN_GRUPOPRODUTO_COD'
    object IbDtstTabelaCOD: TSmallintField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD'
      Origin = 'TBFORMPAGTO.COD'
      Required = True
    end
    object IbDtstTabelaDESCRI: TIBStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRI'
      Origin = 'TBFORMPAGTO.DESCRI'
      Size = 30
    end
    object IbDtstTabelaACRESCIMO: TFloatField
      DisplayLabel = '% Acr'#233'scimo'
      FieldName = 'ACRESCIMO'
      Origin = 'TBFORMPAGTO.ACRESCIMO'
    end
  end
  inherited IbUpdTabela: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  COD,'
      '  DESCRI'
      'from TBGRUPOPROD '
      'where'
      '  COD = :COD')
    ModifySQL.Strings = (
      'update TBGRUPOPROD'
      'set'
      '  COD = :COD,'
      '  DESCRI = :DESCRI'
      'where'
      '  COD = :OLD_COD')
    InsertSQL.Strings = (
      'insert into TBGRUPOPROD'
      '  (COD, DESCRI)'
      'values'
      '  (:COD, :DESCRI)')
    DeleteSQL.Strings = (
      'delete from TBGRUPOPROD'
      'where'
      '  COD = :OLD_COD')
  end
end
