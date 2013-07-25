inherited FrmProdutoRotatividadePRC: TFrmProdutoRotatividadePRC
  Left = 411
  Top = 133
  Width = 1027
  Height = 628
  ActiveControl = edTipoProcesso
  Caption = 'Rotatividade de Produtos'
  Font.Charset = ANSI_CHARSET
  Font.Name = 'Tahoma'
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 586
    Width = 1011
    Height = 4
    Align = alBottom
    Shape = bsSpacer
  end
  object Bevel3: TBevel
    Left = 0
    Top = 547
    Width = 1011
    Height = 4
    Align = alBottom
    Shape = bsSpacer
  end
  object pnlPesquisa: TPanel
    Left = 0
    Top = 0
    Width = 1011
    Height = 81
    Align = alTop
    BevelOuter = bvNone
    BorderWidth = 4
    TabOrder = 0
    object BvlTipoPesquisa: TBevel
      Left = 265
      Top = 4
      Width = 4
      Height = 73
      Align = alLeft
      Shape = bsSpacer
    end
    object GrpBxTipoPesquisa: TGroupBox
      Left = 4
      Top = 4
      Width = 261
      Height = 73
      Align = alLeft
      Caption = 'Tipo'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      DesignSize = (
        261
        73)
      object lblTipoProcesso: TLabel
        Left = 16
        Top = 24
        Width = 117
        Height = 13
        Caption = '&Tipo de rotatividade:'
        FocusControl = edTipoProcesso
      end
      object BtnProcessar: TSpeedButton
        Left = 222
        Top = 40
        Width = 23
        Height = 22
        Hint = 'Processar rotatividade (F5)'
        Anchors = [akTop, akRight]
        Flat = True
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000120B0000120B00000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF5E60613D3C3E4343445F6162FEFEFEFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F4F47C7F80ADAFAFD3D6D55050514E
          484B4D484B4D4D4ECBCDCDAFB1B1737676F2F3F3FFFFFFFFFFFFFFFFFFF1F2F2
          76797A4D4A4D5150525353555C595B645F62635E625E5A5D5152534C4C4D4340
          42707273EFF0F0FFFFFFFFFFFF8B8E8E585658716C6E6E6A6D767375807D7F7A
          77797773757572746A66695D5A5C5653543A393B7F8282FEFFFFFFFFFFCECFCF
          6666677E7A7C8A87898B888A7272737A7C7D787A7B6262646561635F5C5E5854
          57515152C8CACAFFFFFFF0F1F1D1D4D37273748E8B8D949192777879C4C7C7F6
          F7F7F7F8F8D3D6D6696B6C676465858284777778C0C2C2F1F2F2767979777879
          949294A7A4A6818182C1C3C4FFFFFFFFFFFFFFFFFFFFFFFFD7D9D97E7E7FA19D
          9F959294737374737677818282A9A6A7A3A1A1A19F9F7C7E7FF3F4F4FFFFFFFF
          FFFFFFFFFFFFFFFFFCFCFC8B8D8E9B99989D9B9A9E9B9B7C7D7E8A8C8CB0ADAD
          A19FA09D9A9B7A7D7DF3F4F3FFFFFFFFFFFFFFFFFFFFFFFFFAFBFB8A8C8DA2A0
          A0A3A1A2ABA8A98486879295958B8D8D9796979D9A9A7C7C7DC0C2C2FFFFFFFF
          FFFFFFFFFFFFFFFFD2D3D47E8080AFADAEA6A5A69193938B8E8FF6F7F7D2D4D4
          7C7D7EB2B0B0BEBDBE878A8ABCBEBEF1F2F2F3F4F4D6D8D8858788ABAAAABAB9
          B98E8F8FC1C3C3F5F5F5FFFFFFBDC0C09C9F9FD2D3D3CECECEC6C6C693959586
          89888689898F9090B6B6B6C6C6C6C9C8C8959797ACAFAFFFFFFFFDFDFDA1A5A5
          B9BABADBDBDBD7D7D7D7D7D7D6D6D6CCCDCCCACACAD2D2D1D6D6D5D5D4D4D5D4
          D4B5B7B6999D9DFBFBFBFFFFFFF8F8F8A6A9A9C0C2C2ABAEAFAEB0B0D6D6D6DA
          DADADADADAD7D8D8B5B8B8ACAFAEC1C3C2A2A5A6F6F7F7FFFFFFFFFFFFFFFFFF
          FAFAFAA3A7A7C7C9CAC6C8C8A4A6A7F4F3F2F4F4F4A7AAAABCBFC0C9CBCBA2A5
          A5F8F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F99DA0A1B1
          B4B5B2B5B59A9E9EF7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        ParentShowHint = False
        ShowHint = True
        OnClick = BtnProcessarClick
      end
      object edTipoProcesso: TComboBox
        Left = 16
        Top = 40
        Width = 201
        Height = 21
        Style = csDropDownList
        Anchors = [akLeft, akTop, akRight]
        ItemHeight = 13
        ItemIndex = 0
        TabOrder = 0
        Text = 'Por Produto'
        OnChange = edTipoProcessoChange
        Items.Strings = (
          'Por Produto'
          'Por Grupo'
          'Por Fornecedor')
      end
    end
    object GrpBxPesquisar: TGroupBox
      Left = 269
      Top = 4
      Width = 738
      Height = 73
      Align = alClient
      Caption = 'Filtrar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      DesignSize = (
        738
        73)
      object BtnPesquisar: TSpeedButton
        Left = 701
        Top = 40
        Width = 23
        Height = 22
        Hint = 'Executar Pesquisa'
        Anchors = [akTop, akRight]
        Flat = True
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000120B0000120B00000000000000000000FF00FF314B62
          AC7D7EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FF5084B20F6FE1325F8CB87E7AFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF32A0FE37A1FF
          106FE2325F8BB67D79FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FF37A4FE379FFF0E6DDE355F89BB7F79FF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          37A4FE359EFF0F6FDE35608BA67B7FFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF38A5FE329DFF156DCE444F5BFF
          00FF9C6B65AF887BAF887EAA8075FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FF3BABFFA1CAE7AD8679A98373E0CFB1FFFFDAFFFFDDFCF8CFCCB2
          9FA1746BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC0917DFC
          E9ACFFFFCCFFFFCFFFFFD0FFFFDEFFFFFAE3D3D1996965FF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFB08978FAD192FEF4C2FFFFD0FFFFDAFFFFF6FFFF
          FCFFFFFCB69384FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB08978FEDA97ED
          B478FBEEBBFFFFD3FFFFDCFFFFF4FFFFF4FFFFE2E9DDBCA67B73FF00FFFF00FF
          FF00FFFF00FFFF00FFB18A78FFDE99E9A167F4D199FEFCCCFFFFD5FFFFDAFFFF
          DCFFFFD7EFE6C5A97E75FF00FFFF00FFFF00FFFF00FFFF00FFAA7F73FAE0A4F0
          B778EEBA7BF6DDA6FEFBCCFFFFD3FFFFD1FFFFD7D9C5A7A3756CFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFCEB293FFFEDDF4D1A5EEBA7BF2C78FF8E1ABFCF0
          BAFCFACAA3776FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA1746BE1
          D4D3FFFEEEF7CC8CF0B473F7C788FCE3A5C2A088A5776CFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FF986865BA9587EAD7A4EAD59EE0C097A577
          6CA5776CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFA77E70A98073A4786EFF00FFFF00FFFF00FFFF00FF}
        ParentShowHint = False
        ShowHint = True
        OnClick = BtnPesquisarClick
      end
      object lblPesquisar: TLabel
        Left = 16
        Top = 24
        Width = 55
        Height = 13
        Caption = '&Pesquisar'
        FocusControl = edPesquisar
      end
      object edPesquisar: TEdit
        Left = 16
        Top = 40
        Width = 678
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        CharCase = ecUpperCase
        TabOrder = 0
      end
    end
  end
  object pnlDados: TPanel
    Left = 0
    Top = 81
    Width = 1011
    Height = 466
    Align = alClient
    BevelOuter = bvNone
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object PgcTabelas: TPageControl
      Left = 0
      Top = 0
      Width = 1011
      Height = 466
      ActivePage = TbsProduto
      Align = alClient
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object TbsProduto: TTabSheet
        Caption = 'TbsProduto'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        object dbgProduto: TcxGrid
          Left = 0
          Top = 0
          Width = 1003
          Height = 438
          Align = alClient
          TabOrder = 0
          object dbgProdutoTbl: TcxGridDBBandedTableView
            OnKeyPress = NovaPesquisaKeyPress
            NavigatorButtons.ConfirmDelete = False
            DataController.DataSource = dsProduto
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <
              item
                Format = ',0.00'
                Kind = skSum
                FieldName = 'COMPRA_VALOR_01'
                Column = dbgProdutoTblColumn6
              end
              item
                Format = ',0.00'
                Kind = skSum
                FieldName = 'VENDA_VALOR_01'
                Column = dbgProdutoTblColumn8
              end
              item
                Format = ',0.00'
                Kind = skSum
                FieldName = 'COMPRA_VALOR_03'
                Column = dbgProdutoTblColumn10
              end
              item
                Format = ',0.00'
                Kind = skSum
                FieldName = 'VENDA_VALOR_03'
                Column = dbgProdutoTblColumn12
              end
              item
                Format = ',0.00'
                Kind = skSum
                FieldName = 'COMPRA_VALOR_06'
                Column = dbgProdutoTblColumn14
              end
              item
                Format = ',0.00'
                Kind = skSum
                FieldName = 'VENDA_VALOR_06'
                Column = dbgProdutoTblColumn16
              end
              item
                Format = ',0.00'
                Kind = skSum
                FieldName = 'COMPRA_VALOR_09'
                Column = dbgProdutoTblColumn18
              end
              item
                Format = ',0.00'
                Kind = skSum
                FieldName = 'VENDA_QTDE_09'
                Column = dbgProdutoTblColumn20
              end
              item
                Format = ',0.00'
                Kind = skSum
                FieldName = 'COMPRA_VALOR_12'
                Column = dbgProdutoTblColumn22
              end
              item
                Format = ',0.00'
                Kind = skSum
                FieldName = 'VENDA_VALOR_12'
                Column = dbgProdutoTblColumn24
              end
              item
                Format = ',0.00'
                Kind = skSum
                FieldName = 'COMPRA_VALOR_99'
                Column = dbgProdutoTblColumn26
              end
              item
                Format = ',0.00'
                Kind = skSum
                FieldName = 'VENDA_VALOR_99'
                Column = dbgProdutoTblColumn28
              end>
            DataController.Summary.SummaryGroups = <>
            OptionsBehavior.CellHints = True
            OptionsData.CancelOnExit = False
            OptionsData.Deleting = False
            OptionsData.DeletingConfirmation = False
            OptionsData.Editing = False
            OptionsData.Inserting = False
            OptionsSelection.CellSelect = False
            OptionsView.CellEndEllipsis = True
            OptionsView.NoDataToDisplayInfoText = '<Sem dados para visualiza'#231#227'o>'
            OptionsView.Footer = True
            OptionsView.GroupByBox = False
            Styles.Content = StyleContent
            Styles.ContentEven = StyleContentEven
            Styles.Inactive = StyleSelecao
            Styles.Selection = StyleSelecao
            Bands = <
              item
                Caption = 'Produto'
                Options.Moving = False
                Width = 400
              end
              item
                Caption = #218'ltimo Movimento'
                Options.Moving = False
                Width = 150
              end
              item
                Caption = '0 - 1'
                Options.Moving = False
                Width = 280
              end
              item
                Caption = 'Compra'
                Options.Moving = False
                Position.BandIndex = 2
                Position.ColIndex = 0
                Width = 140
              end
              item
                Caption = 'Venda'
                Options.Moving = False
                Position.BandIndex = 2
                Position.ColIndex = 1
                Width = 140
              end
              item
                Caption = '1 - 3'
                Options.Moving = False
                Width = 280
              end
              item
                Caption = 'Compra'
                Options.Moving = False
                Position.BandIndex = 5
                Position.ColIndex = 0
                Width = 140
              end
              item
                Caption = 'Venda'
                Options.Moving = False
                Position.BandIndex = 5
                Position.ColIndex = 1
                Width = 140
              end
              item
                Caption = '3 - 6'
                Options.Moving = False
                Width = 280
              end
              item
                Caption = 'Compra'
                Options.Moving = False
                Position.BandIndex = 8
                Position.ColIndex = 0
                Width = 140
              end
              item
                Caption = 'Venda'
                Options.Moving = False
                Position.BandIndex = 8
                Position.ColIndex = 1
                Width = 140
              end
              item
                Caption = '6 - 9'
                Options.Moving = False
                Width = 280
              end
              item
                Caption = 'Compra'
                Options.Moving = False
                Position.BandIndex = 11
                Position.ColIndex = 0
                Width = 140
              end
              item
                Caption = 'Venda'
                Options.Moving = False
                Position.BandIndex = 11
                Position.ColIndex = 1
                Width = 140
              end
              item
                Caption = '9 - 12'
                Options.Moving = False
                Width = 280
              end
              item
                Caption = 'Compra'
                Options.Moving = False
                Position.BandIndex = 14
                Position.ColIndex = 0
                Width = 140
              end
              item
                Caption = 'Venda'
                Options.Moving = False
                Position.BandIndex = 14
                Position.ColIndex = 1
                Width = 140
              end
              item
                Caption = '12 - 99'
                Options.Moving = False
                Width = 280
              end
              item
                Caption = 'Compra'
                Options.Moving = False
                Position.BandIndex = 17
                Position.ColIndex = 0
                Width = 140
              end
              item
                Caption = 'Venda'
                Options.Moving = False
                Position.BandIndex = 17
                Position.ColIndex = 1
                Width = 140
              end>
            object dbgProdutoTblColumn1: TcxGridDBBandedColumn
              Caption = 'C'#243'digo'
              DataBinding.FieldName = 'CODIGO'
              Options.Filtering = False
              Options.Moving = False
              Width = 60
              Position.BandIndex = 0
              Position.ColIndex = 0
              Position.RowIndex = 0
            end
            object dbgProdutoTblColumn2: TcxGridDBBandedColumn
              Caption = 'Descri'#231#227'o'
              DataBinding.FieldName = 'DESCRICAO'
              Options.Filtering = False
              Options.Moving = False
              Width = 247
              Position.BandIndex = 0
              Position.ColIndex = 1
              Position.RowIndex = 0
            end
            object dbgProdutoTblColumn3: TcxGridDBBandedColumn
              Caption = 'Compra'
              DataBinding.FieldName = 'DATA_ULTIMA_COMPRA'
              HeaderAlignmentHorz = taCenter
              Options.Moving = False
              Width = 75
              Position.BandIndex = 1
              Position.ColIndex = 0
              Position.RowIndex = 0
            end
            object dbgProdutoTblColumn4: TcxGridDBBandedColumn
              Caption = 'Venda'
              DataBinding.FieldName = 'DATA_ULTIMA_VENDA'
              HeaderAlignmentHorz = taCenter
              Options.Moving = False
              Width = 75
              Position.BandIndex = 1
              Position.ColIndex = 1
              Position.RowIndex = 0
            end
            object dbgProdutoTblColumn5: TcxGridDBBandedColumn
              DataBinding.FieldName = 'COMPRA_QTDE_01'
              Options.Filtering = False
              Options.Moving = False
              Options.Sorting = False
              Width = 60
              Position.BandIndex = 3
              Position.ColIndex = 0
              Position.RowIndex = 0
            end
            object dbgProdutoTblColumn6: TcxGridDBBandedColumn
              DataBinding.FieldName = 'COMPRA_VALOR_01'
              Options.Filtering = False
              Options.Moving = False
              Options.Sorting = False
              Width = 80
              Position.BandIndex = 3
              Position.ColIndex = 1
              Position.RowIndex = 0
            end
            object dbgProdutoTblColumn7: TcxGridDBBandedColumn
              DataBinding.FieldName = 'VENDA_QTDE_01'
              Options.Filtering = False
              Options.Moving = False
              Options.Sorting = False
              Width = 60
              Position.BandIndex = 4
              Position.ColIndex = 0
              Position.RowIndex = 0
            end
            object dbgProdutoTblColumn8: TcxGridDBBandedColumn
              DataBinding.FieldName = 'VENDA_VALOR_01'
              Options.Filtering = False
              Options.Moving = False
              Options.Sorting = False
              Position.BandIndex = 4
              Position.ColIndex = 1
              Position.RowIndex = 0
            end
            object dbgProdutoTblColumn9: TcxGridDBBandedColumn
              Tag = 60
              DataBinding.FieldName = 'COMPRA_QTDE_03'
              Options.Filtering = False
              Options.Moving = False
              Options.Sorting = False
              Width = 60
              Position.BandIndex = 6
              Position.ColIndex = 0
              Position.RowIndex = 0
            end
            object dbgProdutoTblColumn10: TcxGridDBBandedColumn
              DataBinding.FieldName = 'COMPRA_VALOR_03'
              Options.Filtering = False
              Options.Moving = False
              Options.Sorting = False
              Width = 80
              Position.BandIndex = 6
              Position.ColIndex = 1
              Position.RowIndex = 0
            end
            object dbgProdutoTblColumn11: TcxGridDBBandedColumn
              Tag = 60
              DataBinding.FieldName = 'VENDA_QTDE_03'
              Options.Filtering = False
              Options.Moving = False
              Options.Sorting = False
              Width = 60
              Position.BandIndex = 7
              Position.ColIndex = 0
              Position.RowIndex = 0
            end
            object dbgProdutoTblColumn12: TcxGridDBBandedColumn
              DataBinding.FieldName = 'VENDA_VALOR_03'
              Options.Filtering = False
              Options.Moving = False
              Options.Sorting = False
              Width = 80
              Position.BandIndex = 7
              Position.ColIndex = 1
              Position.RowIndex = 0
            end
            object dbgProdutoTblColumn13: TcxGridDBBandedColumn
              DataBinding.FieldName = 'COMPRA_QTDE_06'
              Options.Filtering = False
              Options.Moving = False
              Options.Sorting = False
              Width = 60
              Position.BandIndex = 9
              Position.ColIndex = 0
              Position.RowIndex = 0
            end
            object dbgProdutoTblColumn14: TcxGridDBBandedColumn
              DataBinding.FieldName = 'COMPRA_VALOR_06'
              Options.Filtering = False
              Options.Moving = False
              Options.Sorting = False
              Width = 80
              Position.BandIndex = 9
              Position.ColIndex = 1
              Position.RowIndex = 0
            end
            object dbgProdutoTblColumn15: TcxGridDBBandedColumn
              DataBinding.FieldName = 'VENDA_QTDE_06'
              Options.Filtering = False
              Options.Moving = False
              Options.Sorting = False
              Width = 60
              Position.BandIndex = 10
              Position.ColIndex = 0
              Position.RowIndex = 0
            end
            object dbgProdutoTblColumn16: TcxGridDBBandedColumn
              DataBinding.FieldName = 'VENDA_VALOR_06'
              Options.Filtering = False
              Options.Moving = False
              Options.Sorting = False
              Width = 80
              Position.BandIndex = 10
              Position.ColIndex = 1
              Position.RowIndex = 0
            end
            object dbgProdutoTblColumn17: TcxGridDBBandedColumn
              DataBinding.FieldName = 'COMPRA_QTDE_09'
              Options.Filtering = False
              Options.Moving = False
              Options.Sorting = False
              Width = 60
              Position.BandIndex = 12
              Position.ColIndex = 0
              Position.RowIndex = 0
            end
            object dbgProdutoTblColumn18: TcxGridDBBandedColumn
              DataBinding.FieldName = 'COMPRA_VALOR_09'
              Options.Filtering = False
              Options.Moving = False
              Options.Sorting = False
              Width = 80
              Position.BandIndex = 12
              Position.ColIndex = 1
              Position.RowIndex = 0
            end
            object dbgProdutoTblColumn19: TcxGridDBBandedColumn
              DataBinding.FieldName = 'VENDA_QTDE_09'
              Options.Filtering = False
              Options.Moving = False
              Options.Sorting = False
              Width = 60
              Position.BandIndex = 13
              Position.ColIndex = 0
              Position.RowIndex = 0
            end
            object dbgProdutoTblColumn20: TcxGridDBBandedColumn
              DataBinding.FieldName = 'VENDA_VALOR_09'
              Options.Filtering = False
              Options.Moving = False
              Options.Sorting = False
              Width = 80
              Position.BandIndex = 13
              Position.ColIndex = 1
              Position.RowIndex = 0
            end
            object dbgProdutoTblColumn21: TcxGridDBBandedColumn
              DataBinding.FieldName = 'COMPRA_QTDE_12'
              Options.Filtering = False
              Options.Moving = False
              Options.Sorting = False
              Width = 60
              Position.BandIndex = 15
              Position.ColIndex = 0
              Position.RowIndex = 0
            end
            object dbgProdutoTblColumn22: TcxGridDBBandedColumn
              DataBinding.FieldName = 'COMPRA_VALOR_12'
              Options.Filtering = False
              Options.Moving = False
              Options.Sorting = False
              Width = 80
              Position.BandIndex = 15
              Position.ColIndex = 1
              Position.RowIndex = 0
            end
            object dbgProdutoTblColumn23: TcxGridDBBandedColumn
              DataBinding.FieldName = 'VENDA_QTDE_12'
              Options.Filtering = False
              Options.Moving = False
              Options.Sorting = False
              Width = 60
              Position.BandIndex = 16
              Position.ColIndex = 0
              Position.RowIndex = 0
            end
            object dbgProdutoTblColumn24: TcxGridDBBandedColumn
              DataBinding.FieldName = 'VENDA_VALOR_12'
              Options.Filtering = False
              Options.Moving = False
              Options.Sorting = False
              Width = 80
              Position.BandIndex = 16
              Position.ColIndex = 1
              Position.RowIndex = 0
            end
            object dbgProdutoTblColumn25: TcxGridDBBandedColumn
              DataBinding.FieldName = 'COMPRA_QTDE_99'
              Options.Filtering = False
              Options.Moving = False
              Options.Sorting = False
              Width = 60
              Position.BandIndex = 18
              Position.ColIndex = 0
              Position.RowIndex = 0
            end
            object dbgProdutoTblColumn26: TcxGridDBBandedColumn
              DataBinding.FieldName = 'COMPRA_VALOR_99'
              Options.Filtering = False
              Options.Moving = False
              Options.Sorting = False
              Width = 80
              Position.BandIndex = 18
              Position.ColIndex = 1
              Position.RowIndex = 0
            end
            object dbgProdutoTblColumn27: TcxGridDBBandedColumn
              DataBinding.FieldName = 'VENDA_QTDE_99'
              Options.Filtering = False
              Options.Moving = False
              Options.Sorting = False
              Width = 60
              Position.BandIndex = 19
              Position.ColIndex = 0
              Position.RowIndex = 0
            end
            object dbgProdutoTblColumn28: TcxGridDBBandedColumn
              DataBinding.FieldName = 'VENDA_VALOR_99'
              Options.Filtering = False
              Options.Moving = False
              Options.Sorting = False
              Width = 80
              Position.BandIndex = 19
              Position.ColIndex = 1
              Position.RowIndex = 0
            end
            object dbgProdutoTblColumn29: TcxGridDBBandedColumn
              DataBinding.FieldName = 'QTDE'
              Options.Filtering = False
              Options.Moving = False
              Options.Sorting = False
              Width = 60
              Position.BandIndex = 0
              Position.ColIndex = 2
              Position.RowIndex = 0
            end
            object dbgProdutoTblColumn30: TcxGridDBBandedColumn
              DataBinding.FieldName = 'UNP_SIGLA'
              Options.Filtering = False
              Options.Moving = False
              Options.Sorting = False
              Width = 34
              Position.BandIndex = 0
              Position.ColIndex = 3
              Position.RowIndex = 0
            end
          end
          object dbgProdutoLvl: TcxGridLevel
            GridView = dbgProdutoTbl
          end
        end
      end
      object TbsGrupo: TTabSheet
        Caption = 'TbsGrupo'
        ImageIndex = 1
      end
      object TbsFornecedor: TTabSheet
        Caption = 'TbsFornecedor'
        ImageIndex = 2
        object Label2: TLabel
          Left = 248
          Top = 152
          Width = 55
          Height = 13
          Caption = 'Fornecedor'
        end
      end
    end
  end
  object tlbBotoes: TToolBar
    Left = 0
    Top = 551
    Width = 1011
    Height = 35
    Align = alBottom
    ButtonHeight = 31
    ButtonWidth = 96
    Caption = #39
    TabOrder = 2
    object Bevel2: TBevel
      Left = 0
      Top = 2
      Width = 4
      Height = 31
      Shape = bsSpacer
    end
    object btbtnIncluir: TBitBtn
      Left = 4
      Top = 2
      Width = 75
      Height = 31
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      TabStop = False
      NumGlyphs = 2
    end
  end
  object pnlProcesso: TPanel
    Left = 312
    Top = 264
    Width = 449
    Height = 65
    Anchors = []
    BorderWidth = 4
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    Visible = False
    object Label3: TLabel
      Left = 5
      Top = 5
      Width = 439
      Height = 13
      Align = alTop
      Caption = 'Andamento do Processo . . .'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object gagProcesso: TGauge
      Left = 5
      Top = 22
      Width = 439
      Height = 17
      Align = alTop
      Progress = 0
    end
    object Bevel4: TBevel
      Left = 5
      Top = 18
      Width = 439
      Height = 4
      Align = alTop
      Shape = bsSpacer
    end
    object Bevel5: TBevel
      Left = 5
      Top = 39
      Width = 439
      Height = 4
      Align = alTop
      Shape = bsSpacer
    end
    object dbProduto: TDBText
      Left = 5
      Top = 43
      Width = 439
      Height = 17
      Align = alTop
      DataField = 'DESCRI'
      DataSource = dsListaProduto
    end
  end
  object QryListaProduto: TIBQuery
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    SQL.Strings = (
      'Select'
      '    p.codigo as Sequencial'
      '  , p.cod    as Codigo'
      '  , coalesce(p.descri_apresentacao, p.descri) as descri'
      ''
      '  , (Select'
      '       max(cc.dtent)'
      '     from TBCOMPRAS cc'
      
        '       inner join TBCOMPRASITENS c on (c.ano = cc.ano and c.codc' +
        'ontrol = cc.codcontrol)'
      '     where cc.status in (2, 4) -- Finalizada, NF-e'
      '       and cc.codemp = p.codemp'
      '       and c.codprod = p.cod'
      '    ) as data_ultima_compra'
      ''
      '  , (Select'
      '       max(vv.dtvenda)'
      '     from TBVENDAS vv'
      
        '       inner join TVENDASITENS v on (v.ano = vv.ano and v.codcon' +
        'trol = vv.codcontrol)'
      '     where vv.status in (3, 4) -- Finalizada, NF-e'
      '       and vv.codemp = p.codemp'
      '       and v.codprod = p.cod'
      '    ) as data_ultima_venda'
      'from TBPRODUTO p'
      'where p.codemp = :empresa')
    Left = 24
    Top = 184
    ParamData = <
      item
        DataType = ftString
        Name = 'empresa'
        ParamType = ptInput
      end>
  end
  object QryProduto: TIBQuery
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    SQL.Strings = (
      'select'
      '    p.cod as Codigo'
      '  , coalesce(p.descri_apresentacao, p.descri) as descricao'
      '  , p.qtde'
      '  , u.unp_descricao'
      '  , u.unp_sigla'
      '  , r.data_ultima_compra'
      '  , r.data_ultima_venda'
      '  , r.compra_qtde_01'
      '  , r.compra_valor_01'
      '  , r.venda_qtde_01'
      '  , r.venda_valor_01'
      '  , r.compra_qtde_03'
      '  , r.compra_valor_03'
      '  , r.venda_qtde_03'
      '  , r.venda_valor_03'
      '  , r.compra_qtde_06'
      '  , r.compra_valor_06'
      '  , r.venda_qtde_06'
      '  , r.venda_valor_06'
      '  , r.compra_qtde_09'
      '  , r.compra_valor_09'
      '  , r.venda_qtde_09'
      '  , r.venda_valor_09'
      '  , r.compra_qtde_12'
      '  , r.compra_valor_12'
      '  , r.venda_qtde_12'
      '  , r.venda_valor_12'
      '  , r.compra_qtde_99'
      '  , r.compra_valor_99'
      '  , r.venda_qtde_99'
      '  , r.venda_valor_99'
      '  , r.movimentado'
      '  , r.processo_data'
      '  , r.processo_hora'
      '  , r.processo_usuario'
      'from TBPRODUTO p'
      '  left join TBPRODUTO_ROTATIVIDADE r on (r.cod_produto = p.cod)'
      '  left join TBUNIDADEPROD u on (u.unp_cod = p.codunidade)'
      ''
      'where 1=1'
      ''
      'order by 2')
    Left = 24
    Top = 248
  end
  object dsProduto: TDataSource
    DataSet = CdsProduto
    Left = 120
    Top = 248
  end
  object DspListaProduto: TDataSetProvider
    DataSet = QryListaProduto
    Left = 56
    Top = 184
  end
  object CdsListaProduto: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'empresa'
        ParamType = ptInput
      end>
    ProviderName = 'DspListaProduto'
    Left = 88
    Top = 184
  end
  object setProdutoRotatividade: TIBStoredProc
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    StoredProcName = 'SET_PRODUTO_ROTATIVIDADE'
    Left = 24
    Top = 216
    ParamData = <
      item
        DataType = ftDate
        Name = 'DATA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'USUARIO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PRODUTO'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'EXCLUIR_ROT'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'TIPO_ROTATI'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'ULTIMA_COMPRA'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'ULTIMA_VENDA'
        ParamType = ptInput
      end>
  end
  object dsListaProduto: TDataSource
    DataSet = CdsListaProduto
    Left = 124
    Top = 185
  end
  object DspProduto: TDataSetProvider
    DataSet = QryProduto
    Left = 56
    Top = 248
  end
  object CdsProduto: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspProduto'
    Left = 88
    Top = 248
    object CdsProdutoCODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = '"TBPRODUTO_ROTATIVIDADE"."COD_PRODUTO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 10
    end
    object CdsProdutoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      ProviderFlags = []
      Size = 100
    end
    object CdsProdutoQTDE: TIntegerField
      DisplayLabel = 'Estoque'
      FieldName = 'QTDE'
      DisplayFormat = ',0'
    end
    object CdsProdutoUNP_DESCRICAO: TStringField
      FieldName = 'UNP_DESCRICAO'
      Size = 50
    end
    object CdsProdutoUNP_SIGLA: TStringField
      DisplayLabel = 'Und.'
      FieldName = 'UNP_SIGLA'
      Size = 5
    end
    object CdsProdutoDATA_ULTIMA_COMPRA: TDateField
      Alignment = taCenter
      FieldName = 'DATA_ULTIMA_COMPRA'
      Origin = '"TBPRODUTO_ROTATIVIDADE"."DATA_ULTIMA_COMPRA"'
    end
    object CdsProdutoDATA_ULTIMA_VENDA: TDateField
      Alignment = taCenter
      FieldName = 'DATA_ULTIMA_VENDA'
      Origin = '"TBPRODUTO_ROTATIVIDADE"."DATA_ULTIMA_VENDA"'
    end
    object CdsProdutoCOMPRA_QTDE_01: TBCDField
      DisplayLabel = 'Quant.'
      FieldName = 'COMPRA_QTDE_01'
      Origin = '"TBPRODUTO_ROTATIVIDADE"."COMPRA_QTDE_01"'
      DisplayFormat = ',0'
      Precision = 18
    end
    object CdsProdutoCOMPRA_VALOR_01: TBCDField
      DisplayLabel = 'Valor'
      FieldName = 'COMPRA_VALOR_01'
      Origin = '"TBPRODUTO_ROTATIVIDADE"."COMPRA_VALOR_01"'
      DisplayFormat = ',0.00'
      Precision = 18
    end
    object CdsProdutoVENDA_QTDE_01: TBCDField
      DisplayLabel = 'Quant.'
      FieldName = 'VENDA_QTDE_01'
      Origin = '"TBPRODUTO_ROTATIVIDADE"."VENDA_QTDE_01"'
      DisplayFormat = ',0'
      Precision = 18
    end
    object CdsProdutoVENDA_VALOR_01: TBCDField
      DisplayLabel = 'Valor'
      FieldName = 'VENDA_VALOR_01'
      Origin = '"TBPRODUTO_ROTATIVIDADE"."VENDA_VALOR_01"'
      DisplayFormat = ',0.00'
      Precision = 18
    end
    object CdsProdutoCOMPRA_QTDE_03: TBCDField
      DisplayLabel = 'Quant.'
      FieldName = 'COMPRA_QTDE_03'
      Origin = '"TBPRODUTO_ROTATIVIDADE"."COMPRA_QTDE_03"'
      DisplayFormat = ',0'
      Precision = 18
    end
    object CdsProdutoCOMPRA_VALOR_03: TBCDField
      DisplayLabel = 'Valor'
      FieldName = 'COMPRA_VALOR_03'
      Origin = '"TBPRODUTO_ROTATIVIDADE"."COMPRA_VALOR_03"'
      DisplayFormat = ',0.00'
      Precision = 18
    end
    object CdsProdutoVENDA_QTDE_03: TBCDField
      DisplayLabel = 'Quant.'
      FieldName = 'VENDA_QTDE_03'
      Origin = '"TBPRODUTO_ROTATIVIDADE"."VENDA_QTDE_03"'
      DisplayFormat = ',0'
      Precision = 18
    end
    object CdsProdutoVENDA_VALOR_03: TBCDField
      DisplayLabel = 'Valor'
      FieldName = 'VENDA_VALOR_03'
      Origin = '"TBPRODUTO_ROTATIVIDADE"."VENDA_VALOR_03"'
      DisplayFormat = ',0.00'
      Precision = 18
    end
    object CdsProdutoCOMPRA_QTDE_06: TBCDField
      DisplayLabel = 'Quant.'
      FieldName = 'COMPRA_QTDE_06'
      Origin = '"TBPRODUTO_ROTATIVIDADE"."COMPRA_QTDE_06"'
      DisplayFormat = ',0'
      Precision = 18
    end
    object CdsProdutoCOMPRA_VALOR_06: TBCDField
      DisplayLabel = 'Valor'
      FieldName = 'COMPRA_VALOR_06'
      Origin = '"TBPRODUTO_ROTATIVIDADE"."COMPRA_VALOR_06"'
      DisplayFormat = ',0.00'
      Precision = 18
    end
    object CdsProdutoVENDA_QTDE_06: TBCDField
      DisplayLabel = 'Quant.'
      FieldName = 'VENDA_QTDE_06'
      Origin = '"TBPRODUTO_ROTATIVIDADE"."VENDA_QTDE_06"'
      DisplayFormat = ',0'
      Precision = 18
    end
    object CdsProdutoVENDA_VALOR_06: TBCDField
      DisplayLabel = 'Valor'
      FieldName = 'VENDA_VALOR_06'
      Origin = '"TBPRODUTO_ROTATIVIDADE"."VENDA_VALOR_06"'
      DisplayFormat = ',0.00'
      Precision = 18
    end
    object CdsProdutoCOMPRA_QTDE_09: TBCDField
      DisplayLabel = 'Quant.'
      FieldName = 'COMPRA_QTDE_09'
      Origin = '"TBPRODUTO_ROTATIVIDADE"."COMPRA_QTDE_09"'
      DisplayFormat = ',0'
      Precision = 18
    end
    object CdsProdutoCOMPRA_VALOR_09: TBCDField
      DisplayLabel = 'Valor'
      FieldName = 'COMPRA_VALOR_09'
      Origin = '"TBPRODUTO_ROTATIVIDADE"."COMPRA_VALOR_09"'
      DisplayFormat = ',0.00'
      Precision = 18
    end
    object CdsProdutoVENDA_QTDE_09: TBCDField
      DisplayLabel = 'Quant.'
      FieldName = 'VENDA_QTDE_09'
      Origin = '"TBPRODUTO_ROTATIVIDADE"."VENDA_QTDE_09"'
      DisplayFormat = ',0'
      Precision = 18
    end
    object CdsProdutoVENDA_VALOR_09: TBCDField
      DisplayLabel = 'Valor'
      FieldName = 'VENDA_VALOR_09'
      Origin = '"TBPRODUTO_ROTATIVIDADE"."VENDA_VALOR_09"'
      DisplayFormat = ',0.00'
      Precision = 18
    end
    object CdsProdutoCOMPRA_QTDE_12: TBCDField
      DisplayLabel = 'Quant.'
      FieldName = 'COMPRA_QTDE_12'
      Origin = '"TBPRODUTO_ROTATIVIDADE"."COMPRA_QTDE_12"'
      DisplayFormat = ',0'
      Precision = 18
    end
    object CdsProdutoCOMPRA_VALOR_12: TBCDField
      DisplayLabel = 'Valor'
      FieldName = 'COMPRA_VALOR_12'
      Origin = '"TBPRODUTO_ROTATIVIDADE"."COMPRA_VALOR_12"'
      DisplayFormat = ',0.00'
      Precision = 18
    end
    object CdsProdutoVENDA_QTDE_12: TBCDField
      DisplayLabel = 'Quant.'
      FieldName = 'VENDA_QTDE_12'
      Origin = '"TBPRODUTO_ROTATIVIDADE"."VENDA_QTDE_12"'
      DisplayFormat = ',0'
      Precision = 18
    end
    object CdsProdutoVENDA_VALOR_12: TBCDField
      DisplayLabel = 'Valor'
      FieldName = 'VENDA_VALOR_12'
      Origin = '"TBPRODUTO_ROTATIVIDADE"."VENDA_VALOR_12"'
      DisplayFormat = ',0.00'
      Precision = 18
    end
    object CdsProdutoCOMPRA_QTDE_99: TBCDField
      DisplayLabel = 'Quant.'
      FieldName = 'COMPRA_QTDE_99'
      Origin = '"TBPRODUTO_ROTATIVIDADE"."COMPRA_QTDE_99"'
      DisplayFormat = ',0'
      Precision = 18
    end
    object CdsProdutoCOMPRA_VALOR_99: TBCDField
      DisplayLabel = 'Valor'
      FieldName = 'COMPRA_VALOR_99'
      Origin = '"TBPRODUTO_ROTATIVIDADE"."COMPRA_VALOR_99"'
      DisplayFormat = ',0.00'
      Precision = 18
    end
    object CdsProdutoVENDA_QTDE_99: TBCDField
      DisplayLabel = 'Quant.'
      FieldName = 'VENDA_QTDE_99'
      Origin = '"TBPRODUTO_ROTATIVIDADE"."VENDA_QTDE_99"'
      DisplayFormat = ',0'
      Precision = 18
    end
    object CdsProdutoVENDA_VALOR_99: TBCDField
      DisplayLabel = 'Valor'
      FieldName = 'VENDA_VALOR_99'
      Origin = '"TBPRODUTO_ROTATIVIDADE"."VENDA_VALOR_99"'
      DisplayFormat = ',0.00'
      Precision = 18
    end
    object CdsProdutoMOVIMENTADO: TSmallintField
      FieldName = 'MOVIMENTADO'
      Origin = '"TBPRODUTO_ROTATIVIDADE"."MOVIMENTADO"'
    end
    object CdsProdutoPROCESSO_DATA: TDateField
      FieldName = 'PROCESSO_DATA'
      Origin = '"TBPRODUTO_ROTATIVIDADE"."PROCESSO_DATA"'
    end
    object CdsProdutoPROCESSO_HORA: TTimeField
      FieldName = 'PROCESSO_HORA'
      Origin = '"TBPRODUTO_ROTATIVIDADE"."PROCESSO_HORA"'
    end
    object CdsProdutoPROCESSO_USUARIO: TStringField
      FieldName = 'PROCESSO_USUARIO'
      Origin = '"TBPRODUTO_ROTATIVIDADE"."PROCESSO_USUARIO"'
      Size = 50
    end
  end
  object QryGrupo: TIBQuery
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    SQL.Strings = (
      'select'
      '    p.codgrupo as Codigo'
      '  , coalesce(g.descri, '#39'* A Definir'#39') as descricao'
      '  , sum( coalesce(p.qtde, 0) ) as qtde'
      '  , count( p.cod ) as itens'
      '  , max( r.data_ultima_compra ) as data_ultima_compra'
      '  , max( r.data_ultima_venda  ) as data_ultima_venda'
      '  , sum( coalesce(r.compra_qtde_01, 0) )  as compra_qtde_01'
      '  , sum( coalesce(r.compra_valor_01, 0) ) as compra_valor_01'
      '  , sum( coalesce(r.venda_qtde_01, 0) )   as venda_qtde_01'
      '  , sum( coalesce(r.venda_valor_01, 0) )  as venda_valor_01'
      '  , sum( coalesce(r.compra_qtde_03, 0) )  as compra_qtde_03'
      '  , sum( coalesce(r.compra_valor_03, 0) ) as compra_valor_03'
      '  , sum( coalesce(r.venda_qtde_03, 0) )   as venda_qtde_03'
      '  , sum( coalesce(r.venda_valor_03, 0) )  as venda_valor_03'
      '  , sum( coalesce(r.compra_qtde_06, 0) )  as compra_qtde_06'
      '  , sum( coalesce(r.compra_valor_06, 0) ) as compra_valor_06'
      '  , sum( coalesce(r.venda_qtde_06, 0) )   as venda_qtde_06'
      '  , sum( coalesce(r.venda_valor_06, 0) )  as venda_valor_06'
      '  , sum( coalesce(r.compra_qtde_09, 0) )  as compra_qtde_09'
      '  , sum( coalesce(r.compra_valor_09, 0) ) as compra_valor_09'
      '  , sum( coalesce(r.venda_qtde_09, 0) )   as venda_qtde_09'
      '  , sum( coalesce(r.venda_valor_09, 0) )  as venda_valor_09'
      '  , sum( coalesce(r.compra_qtde_12, 0) )  as compra_qtde_12'
      '  , sum( coalesce(r.compra_valor_12, 0) ) as compra_valor_12'
      '  , sum( coalesce(r.venda_qtde_12, 0) )   as venda_qtde_12'
      '  , sum( coalesce(r.venda_valor_12, 0) )  as venda_valor_12'
      '  , sum( coalesce(r.compra_qtde_99, 0) )  as compra_qtde_99'
      '  , sum( coalesce(r.compra_valor_99, 0) ) as compra_valor_99'
      '  , sum( coalesce(r.venda_qtde_99, 0) )   as venda_qtde_99'
      '  , sum( coalesce(r.venda_valor_99, 0) )  as venda_valor_99'
      '  , 0.0 as percent_cq01'
      '  , 0.0 as percent_cv01'
      '  , 0.0 as percent_vq01'
      '  , 0.0 as percent_vv01'
      '  , 0.0 as percent_cq03'
      '  , 0.0 as percent_cv03'
      '  , 0.0 as percent_vq03'
      '  , 0.0 as percent_vv03'
      '  , 0.0 as percent_cq06'
      '  , 0.0 as percent_cv06'
      '  , 0.0 as percent_vq06'
      '  , 0.0 as percent_vv06'
      '  , 0.0 as percent_cq09'
      '  , 0.0 as percent_cv09'
      '  , 0.0 as percent_vq09'
      '  , 0.0 as percent_vv09'
      '  , 0.0 as percent_cq12'
      '  , 0.0 as percent_cv12'
      '  , 0.0 as percent_vq12'
      '  , 0.0 as percent_vv12'
      '  , 0.0 as percent_cq99'
      '  , 0.0 as percent_cv99'
      '  , 0.0 as percent_vq99'
      '  , 0.0 as percent_vv99'
      'from TBPRODUTO p'
      '  left join TBPRODUTO_ROTATIVIDADE r on (r.cod_produto = p.cod)'
      '  left join TBGRUPOPROD g on (g.cod = p.codgrupo)'
      ''
      'where 1=1'
      ''
      'group by 1, 2'
      ''
      'order by 2')
    Left = 24
    Top = 280
  end
  object DspGrupo: TDataSetProvider
    DataSet = QryGrupo
    Left = 56
    Top = 280
  end
  object CdsGrupo: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspGrupo'
    Left = 88
    Top = 280
    object CdsGrupoCODIGO: TSmallintField
      FieldName = 'CODIGO'
      DisplayFormat = '##000'
    end
    object CdsGrupoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 30
    end
    object CdsGrupoQTDE: TLargeintField
      FieldName = 'QTDE'
      DisplayFormat = ',0'
    end
    object CdsGrupoITENS: TIntegerField
      FieldName = 'ITENS'
      DisplayFormat = ',0'
    end
    object CdsGrupoDATA_ULTIMA_COMPRA: TDateField
      Alignment = taCenter
      FieldName = 'DATA_ULTIMA_COMPRA'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object CdsGrupoDATA_ULTIMA_VENDA: TDateField
      Alignment = taCenter
      FieldName = 'DATA_ULTIMA_VENDA'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object CdsGrupoCOMPRA_QTDE_01: TBCDField
      FieldName = 'COMPRA_QTDE_01'
      DisplayFormat = ',0'
      Precision = 18
    end
    object CdsGrupoCOMPRA_VALOR_01: TBCDField
      FieldName = 'COMPRA_VALOR_01'
      DisplayFormat = ',0.00'
      Precision = 18
    end
    object CdsGrupoVENDA_QTDE_01: TBCDField
      FieldName = 'VENDA_QTDE_01'
      DisplayFormat = ',0'
      Precision = 18
    end
    object CdsGrupoVENDA_VALOR_01: TBCDField
      FieldName = 'VENDA_VALOR_01'
      DisplayFormat = ',0.00'
      Precision = 18
    end
    object CdsGrupoCOMPRA_QTDE_03: TBCDField
      FieldName = 'COMPRA_QTDE_03'
      DisplayFormat = ',0'
      Precision = 18
    end
    object CdsGrupoCOMPRA_VALOR_03: TBCDField
      FieldName = 'COMPRA_VALOR_03'
      DisplayFormat = ',0.00'
      Precision = 18
    end
    object CdsGrupoVENDA_QTDE_03: TBCDField
      FieldName = 'VENDA_QTDE_03'
      DisplayFormat = ',0'
      Precision = 18
    end
    object CdsGrupoVENDA_VALOR_03: TBCDField
      FieldName = 'VENDA_VALOR_03'
      DisplayFormat = ',0.00'
      Precision = 18
    end
    object CdsGrupoCOMPRA_QTDE_06: TBCDField
      FieldName = 'COMPRA_QTDE_06'
      DisplayFormat = ',0'
      Precision = 18
    end
    object CdsGrupoCOMPRA_VALOR_06: TBCDField
      FieldName = 'COMPRA_VALOR_06'
      DisplayFormat = ',0.00'
      Precision = 18
    end
    object CdsGrupoVENDA_QTDE_06: TBCDField
      FieldName = 'VENDA_QTDE_06'
      DisplayFormat = ',0'
      Precision = 18
    end
    object CdsGrupoVENDA_VALOR_06: TBCDField
      FieldName = 'VENDA_VALOR_06'
      DisplayFormat = ',0.00'
      Precision = 18
    end
    object CdsGrupoCOMPRA_QTDE_09: TBCDField
      FieldName = 'COMPRA_QTDE_09'
      DisplayFormat = ',0'
      Precision = 18
    end
    object CdsGrupoCOMPRA_VALOR_09: TBCDField
      FieldName = 'COMPRA_VALOR_09'
      DisplayFormat = ',0.00'
      Precision = 18
    end
    object CdsGrupoVENDA_QTDE_09: TBCDField
      FieldName = 'VENDA_QTDE_09'
      DisplayFormat = ',0'
      Precision = 18
    end
    object CdsGrupoVENDA_VALOR_09: TBCDField
      FieldName = 'VENDA_VALOR_09'
      DisplayFormat = ',0.00'
      Precision = 18
    end
    object CdsGrupoCOMPRA_QTDE_12: TBCDField
      FieldName = 'COMPRA_QTDE_12'
      DisplayFormat = ',0'
      Precision = 18
    end
    object CdsGrupoCOMPRA_VALOR_12: TBCDField
      FieldName = 'COMPRA_VALOR_12'
      DisplayFormat = ',0.00'
      Precision = 18
    end
    object CdsGrupoVENDA_QTDE_12: TBCDField
      FieldName = 'VENDA_QTDE_12'
      DisplayFormat = ',0'
      Precision = 18
    end
    object CdsGrupoVENDA_VALOR_12: TBCDField
      FieldName = 'VENDA_VALOR_12'
      DisplayFormat = ',0.00'
      Precision = 18
    end
    object CdsGrupoCOMPRA_QTDE_99: TBCDField
      FieldName = 'COMPRA_QTDE_99'
      DisplayFormat = ',0'
      Precision = 18
    end
    object CdsGrupoCOMPRA_VALOR_99: TBCDField
      FieldName = 'COMPRA_VALOR_99'
      DisplayFormat = ',0.00'
      Precision = 18
    end
    object CdsGrupoVENDA_QTDE_99: TBCDField
      FieldName = 'VENDA_QTDE_99'
      DisplayFormat = ',0'
      Precision = 18
    end
    object CdsGrupoVENDA_VALOR_99: TBCDField
      FieldName = 'VENDA_VALOR_99'
      DisplayFormat = ',0.00'
      Precision = 18
    end
    object CdsGrupoPERCENT_CQ01: TBCDField
      DisplayLabel = '%'
      FieldName = 'PERCENT_CQ01'
      DisplayFormat = ',0.##'
      Precision = 18
      Size = 1
    end
    object CdsGrupoPERCENT_CV01: TBCDField
      DisplayLabel = '%'
      FieldName = 'PERCENT_CV01'
      DisplayFormat = ',0.##'
      Precision = 18
      Size = 1
    end
    object CdsGrupoPERCENT_VQ01: TBCDField
      DisplayLabel = '%'
      FieldName = 'PERCENT_VQ01'
      DisplayFormat = ',0.##'
      Precision = 18
      Size = 1
    end
    object CdsGrupoPERCENT_VV01: TBCDField
      DisplayLabel = '%'
      FieldName = 'PERCENT_VV01'
      DisplayFormat = ',0.##'
      Precision = 18
      Size = 1
    end
    object CdsGrupoPERCENT_CQ03: TBCDField
      DisplayLabel = '%'
      FieldName = 'PERCENT_CQ03'
      DisplayFormat = ',0.##'
      Precision = 18
      Size = 1
    end
    object CdsGrupoPERCENT_CV03: TBCDField
      DisplayLabel = '%'
      FieldName = 'PERCENT_CV03'
      DisplayFormat = ',0.##'
      Precision = 18
      Size = 1
    end
    object CdsGrupoPERCENT_VQ03: TBCDField
      DisplayLabel = '%'
      FieldName = 'PERCENT_VQ03'
      DisplayFormat = ',0.##'
      Precision = 18
      Size = 1
    end
    object CdsGrupoPERCENT_VV03: TBCDField
      DisplayLabel = '%'
      FieldName = 'PERCENT_VV03'
      DisplayFormat = ',0.##'
      Precision = 18
      Size = 1
    end
    object CdsGrupoPERCENT_CQ06: TBCDField
      DisplayLabel = '%'
      FieldName = 'PERCENT_CQ06'
      DisplayFormat = ',0.##'
      Precision = 18
      Size = 1
    end
    object CdsGrupoPERCENT_CV06: TBCDField
      DisplayLabel = '%'
      FieldName = 'PERCENT_CV06'
      DisplayFormat = ',0.##'
      Precision = 18
      Size = 1
    end
    object CdsGrupoPERCENT_VQ06: TBCDField
      DisplayLabel = '%'
      FieldName = 'PERCENT_VQ06'
      DisplayFormat = ',0.##'
      Precision = 18
      Size = 1
    end
    object CdsGrupoPERCENT_VV06: TBCDField
      DisplayLabel = '%'
      FieldName = 'PERCENT_VV06'
      DisplayFormat = ',0.##'
      Precision = 18
      Size = 1
    end
    object CdsGrupoPERCENT_CQ09: TBCDField
      DisplayLabel = '%'
      FieldName = 'PERCENT_CQ09'
      DisplayFormat = ',0.##'
      Precision = 18
      Size = 1
    end
    object CdsGrupoPERCENT_CV09: TBCDField
      DisplayLabel = '%'
      FieldName = 'PERCENT_CV09'
      DisplayFormat = ',0.##'
      Precision = 18
      Size = 1
    end
    object CdsGrupoPERCENT_VQ09: TBCDField
      DisplayLabel = '%'
      FieldName = 'PERCENT_VQ09'
      DisplayFormat = ',0.##'
      Precision = 18
      Size = 1
    end
    object CdsGrupoPERCENT_VV09: TBCDField
      DisplayLabel = '%'
      FieldName = 'PERCENT_VV09'
      DisplayFormat = ',0.##'
      Precision = 18
      Size = 1
    end
    object CdsGrupoPERCENT_CQ12: TBCDField
      DisplayLabel = '%'
      FieldName = 'PERCENT_CQ12'
      DisplayFormat = ',0.##'
      Precision = 18
      Size = 1
    end
    object CdsGrupoPERCENT_CV12: TBCDField
      DisplayLabel = '%'
      FieldName = 'PERCENT_CV12'
      DisplayFormat = ',0.##'
      Precision = 18
      Size = 1
    end
    object CdsGrupoPERCENT_VQ12: TBCDField
      DisplayLabel = '%'
      FieldName = 'PERCENT_VQ12'
      DisplayFormat = ',0.##'
      Precision = 18
      Size = 1
    end
    object CdsGrupoPERCENT_VV12: TBCDField
      DisplayLabel = '%'
      FieldName = 'PERCENT_VV12'
      DisplayFormat = ',0.##'
      Precision = 18
      Size = 1
    end
    object CdsGrupoPERCENT_CQ99: TBCDField
      DisplayLabel = '%'
      FieldName = 'PERCENT_CQ99'
      DisplayFormat = ',0.##'
      Precision = 18
      Size = 1
    end
    object CdsGrupoPERCENT_CV99: TBCDField
      DisplayLabel = '%'
      FieldName = 'PERCENT_CV99'
      DisplayFormat = ',0.##'
      Precision = 18
      Size = 1
    end
    object CdsGrupoPERCENT_VQ99: TBCDField
      DisplayLabel = '%'
      FieldName = 'PERCENT_VQ99'
      DisplayFormat = ',0.##'
      Precision = 18
      Size = 1
    end
    object CdsGrupoPERCENT_VV99: TBCDField
      DisplayLabel = '%'
      FieldName = 'PERCENT_VV99'
      DisplayFormat = ',0.##'
      Precision = 18
      Size = 1
    end
  end
  object dsGrupo: TDataSource
    DataSet = CdsGrupo
    Left = 120
    Top = 280
  end
  object StyleRepository: TcxStyleRepository
    Left = 16
    Top = 456
    PixelsPerInch = 96
    object StyleSelecao: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clMoneyGreen
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object StyleContent: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clMenuBar
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlack
    end
    object StyleContentEven: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 10930928
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlack
    end
  end
end
