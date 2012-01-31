inherited frmGeTipoDespesa: TfrmGeTipoDespesa
  Caption = 'Cadastro de Tipos de Despesas'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgcGuias: TPageControl
    inherited tbsTabela: TTabSheet
      inherited dbgDados: TDBGrid
        Columns = <
          item
            Expanded = False
            FieldName = 'COD'
            Width = 55
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TIPODESP'
            Width = 350
            Visible = True
          end>
      end
      inherited pnlFiltros: TPanel
        inherited grpBxFiltro: TGroupBox
          Left = 424
          Width = 290
          inherited lbltFiltrar: TLabel
            Width = 78
            Caption = 'Tipo Despesa:'
          end
          inherited btnFiltrar: TSpeedButton
            Left = 245
          end
          inherited edtFiltrar: TEdit
            Left = 88
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
        object lblDescricao: TLabel [1]
          Left = 88
          Top = 24
          Width = 50
          Height = 13
          Caption = 'Descri'#231#227'o:'
        end
        inherited dbCodigo: TDBEdit
          DataField = 'COD'
        end
        object dbDescricao: TDBEdit
          Left = 88
          Top = 40
          Width = 337
          Height = 21
          CharCase = ecUpperCase
          DataField = 'TIPODESP'
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
    end
  end
  inherited IbDtstTabela: TIBDataSet
    OnNewRecord = IbDtstTabelaNewRecord
    SelectSQL.Strings = (
      'Select'
      '    t.Cod'
      '  , t.Tipodesp'
      'from TBTPDESPESA t')
    object IbDtstTabelaCOD: TSmallintField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD'
      Origin = 'TBTPDESPESA.COD'
      Required = True
    end
    object IbDtstTabelaTIPODESP: TIBStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'TIPODESP'
      Origin = 'TBTPDESPESA.TIPODESP'
      Size = 25
    end
  end
  inherited IbUpdTabela: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  COD,'
      '  TIPODESP'
      'from TBTPDESPESA '
      'where'
      '  COD = :COD')
    ModifySQL.Strings = (
      'update TBTPDESPESA'
      'set'
      '  COD = :COD,'
      '  TIPODESP = :TIPODESP'
      'where'
      '  COD = :OLD_COD')
    InsertSQL.Strings = (
      'insert into TBTPDESPESA'
      '  (COD, TIPODESP)'
      'values'
      '  (:COD, :TIPODESP)')
    DeleteSQL.Strings = (
      'delete from TBTPDESPESA'
      'where'
      '  COD = :OLD_COD')
  end
end
