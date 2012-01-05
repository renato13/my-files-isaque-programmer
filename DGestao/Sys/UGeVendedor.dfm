inherited frmGeVendedor: TfrmGeVendedor
  Caption = 'Cadastro de Vendedores'
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
            FieldName = 'NOME'
            Width = 350
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CPF'
            Width = 100
            Visible = True
          end>
      end
      inherited pnlFiltros: TPanel
        inherited grpBxFiltro: TGroupBox
          Left = 424
          Width = 290
          inherited lbltFiltrar: TLabel
            Width = 57
            Caption = 'Vendedor:'
          end
          inherited btnFiltrar: TSpeedButton
            Left = 245
          end
          inherited edtFiltrar: TEdit
            Left = 72
            Width = 169
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
          Width = 31
          Height = 13
          Caption = 'Nome:'
        end
        object lblCPF: TLabel [2]
          Left = 432
          Top = 24
          Width = 23
          Height = 13
          Caption = 'CPF:'
          FocusControl = dbCPF
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
        object dbCPF: TDBEdit
          Left = 432
          Top = 40
          Width = 153
          Height = 21
          CharCase = ecUpperCase
          DataField = 'CPF'
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
      '    v.Cod'
      '  , v.Nome'
      '  , v.Cpf'
      'from TBVENDEDOR v')
    GeneratorField.Field = 'COD'
    GeneratorField.Generator = 'GEN_GRUPOPRODUTO_COD'
    object IbDtstTabelaCOD: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD'
      Origin = 'TBVENDEDOR.COD'
      Required = True
    end
    object IbDtstTabelaNOME: TIBStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Origin = 'TBVENDEDOR.NOME'
      Size = 60
    end
    object IbDtstTabelaCPF: TIBStringField
      FieldName = 'CPF'
      Origin = 'TBVENDEDOR.CPF'
      Required = True
      EditMask = '000.000.000-00;0; '
      Size = 12
    end
  end
  inherited IbUpdTabela: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  COD,'
      '  NOME,'
      '  CPF'
      'from TBVENDEDOR '
      'where'
      '  COD = :COD')
    ModifySQL.Strings = (
      'update TBVENDEDOR'
      'set'
      '  COD = :COD,'
      '  NOME = :NOME,'
      '  CPF = :CPF'
      'where'
      '  COD = :OLD_COD')
    InsertSQL.Strings = (
      'insert into TBVENDEDOR'
      '  (COD, NOME, CPF)'
      'values'
      '  (:COD, :NOME, :CPF)')
    DeleteSQL.Strings = (
      'delete from TBVENDEDOR'
      'where'
      '  COD = :OLD_COD')
  end
end
