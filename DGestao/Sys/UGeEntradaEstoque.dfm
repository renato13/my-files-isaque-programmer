inherited frmGeEntradaEstoque: TfrmGeEntradaEstoque
  Left = 563
  Top = 270
  Width = 1045
  Height = 672
  ActiveControl = GrpBxDadosNominais
  Caption = 'Controle de Entradas no Estoque'
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
          inherited lbltFiltrar: TLabel
            Left = 166
            Width = 47
            Caption = 'Entrada:'
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
            Left = 216
            Width = 168
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
        Width = 1021
      end
      inherited GrpBxDadosNominais: TGroupBox
        Width = 1021
        inherited lblCodigo: TLabel
          Width = 67
          Caption = 'No. Entrada:'
        end
        inherited dbCodigo: TDBEdit
          Width = 89
          TabStop = False
          Color = clMoneyGreen
        end
      end
    end
  end
end
