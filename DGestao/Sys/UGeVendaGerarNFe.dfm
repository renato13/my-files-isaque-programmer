inherited frmGeVendaGerarNFe: TfrmGeVendaGerarNFe
  BorderStyle = bsDialog
  BorderWidth = 4
  Caption = 'Gerar NF-e'
  ClientHeight = 447
  ClientWidth = 602
  Font.Charset = ANSI_CHARSET
  Font.Name = 'Tahoma'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 73
    Width = 602
    Height = 4
    Align = alTop
    Shape = bsSpacer
  end
  object Bevel2: TBevel
    Left = 0
    Top = 409
    Width = 602
    Height = 4
    Align = alTop
    Shape = bsSpacer
  end
  object GrpBxControle: TGroupBox
    Left = 0
    Top = 0
    Width = 602
    Height = 73
    Align = alTop
    Caption = 'Controle da Venda'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object lblCodigo: TLabel
      Left = 16
      Top = 24
      Width = 58
      Height = 13
      Caption = 'No. Venda:'
      FocusControl = dbCodigo
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblDataHora: TLabel
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
    object lblSerie: TLabel
      Left = 240
      Top = 24
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
    object lblNFe: TLabel
      Left = 288
      Top = 24
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
    object lblDataEmissao: TLabel
      Left = 416
      Top = 24
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
    object lblHoraEmissao: TLabel
      Left = 504
      Top = 24
      Width = 79
      Height = 13
      Caption = 'Hora Emiss'#227'o:'
      FocusControl = dbHoraEmissao
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dbCodigo: TDBEdit
      Left = 16
      Top = 40
      Width = 89
      Height = 21
      TabStop = False
      Color = clMoneyGreen
      DataSource = dtsVenda
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object dbDataHora: TDBEdit
      Left = 112
      Top = 40
      Width = 121
      Height = 21
      TabStop = False
      Color = clMoneyGreen
      DataSource = dtsVenda
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
      Left = 240
      Top = 40
      Width = 41
      Height = 21
      TabStop = False
      Color = clMoneyGreen
      DataSource = dtsVenda
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
    object dbNFe: TDBEdit
      Left = 288
      Top = 40
      Width = 121
      Height = 21
      TabStop = False
      Color = clMoneyGreen
      DataSource = dtsVenda
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
    end
    object dbDataEmissao: TDBEdit
      Left = 416
      Top = 40
      Width = 81
      Height = 21
      TabStop = False
      Color = clMoneyGreen
      DataSource = dtsVenda
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
    end
    object dbHoraEmissao: TDBEdit
      Left = 504
      Top = 40
      Width = 81
      Height = 21
      TabStop = False
      Color = clMoneyGreen
      DataSource = dtsVenda
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 5
    end
  end
  object GrpBxTributacao: TGroupBox
    Left = 0
    Top = 77
    Width = 602
    Height = 332
    Align = alTop
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = '?'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
  end
  object btnConfirmar: TBitBtn
    Left = 431
    Top = 414
    Width = 83
    Height = 33
    Anchors = [akRight, akBottom]
    Caption = 'Gerar NF-e'
    TabOrder = 2
    Glyph.Data = {
      36060000424D3606000000000000360000002800000020000000100000000100
      180000000000000600000000000000000000000000000000000000FF0000FF00
      00FF0000FF0000FF0000FF0000FF0000FF0000FF00C0A8A06048306048306048
      3060483060483060483000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
      FF0000FF00A8A8A843434343434343434343434343434343434300FF0000FF00
      00FF0000FF0000FF0000FF0000FF0000FF0000FF00C0A8A0FFF0F0F0D8D0E0D0
      C0E0C8B0E0C0B060483000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
      FF0000FF00A8A8A8F1F1F1D8D8D8CCCCCCC3C3C3BEBEBE43434300FF0000FF00
      00FF00A6A3CC1048E01048E01048E000FF0000FF00C0B0A0FFF8F0707070F0E8
      E0707070E0C8B060483000FF0000FF0000FF00AFAFAF70707070707070707000
      FF0000FF00ACACACF6F6F6707070E6E6E6707070C3C3C343434300FF0000FF00
      00FF004070F09E9FD300FF0000FF0000FF0000FF00D0B0A0FFFFFFFFF8F0FFF0
      F0F0E8E0E0D0C060483000FF0000FF0000FF00919191AEAEAE00FF0000FF0000
      FF0000FF00AEAEAEFFFFFFF6F6F6F1F1F1E6E6E6CCCCCC43434300FF0000FF00
      00FF001048F000FF0000FF0000FF0000FF0000FF00D0B8A0FFFFFF808880FFF8
      F0707070F0D8D060483000FF0000FF0000FF0074747400FF0000FF0000FF0000
      FF0000FF00B3B3B3FFFFFF848484F6F6F6707070D8D8D843434300FF0000FF00
      6080F03058F01048E000FF0000FF0000FF0000FF00D0B0A0FFFFFFFFFFFFFFFF
      FFFFF8F0FFF0F060483000FF0000FF009E9E9E81818170707000FF0000FF0000
      FF0000FF00AEAEAEFFFFFFFFFFFFFFFFFFF6F6F6F1F1F143434300FF0000FF00
      D0CEE080A0FFD0CADC00FF0000FF0000FF0000FF00C0B0A0C0B0A0C0B0A0C0B0
      A0C0B0A0C0A8A0C0A8A000FF0000FF00D3D3D3B9B9B9D0D0D000FF0000FF0000
      FF0000FF00ACACACACACACACACACACACACACACACA8A8A8A8A8A800FF0000FF00
      00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
      0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
      FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
      00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
      0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
      FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00C0A8A0604830
      60483060483060483060483060483000FF0000FF0000FF0000FF00D5D1E31048
      E0D1CFE100FF0000FF00A8A8A843434343434343434343434343434343434300
      FF0000FF0000FF0000FF00D6D6D6707070D4D4D400FF0000FF00C0A8A0FFF0F0
      F0D8D0E0D0C0E0C8B0E0C0B060483000FF0000FF0000FF0000FF0080A0FF3060
      F01048E000FF0000FF00A8A8A8F1F1F1D8D8D8CCCCCCC3C3C3BEBEBE43434300
      FF0000FF0000FF0000FF00B9B9B986868670707000FF0000FF00C0B0A0FFF8F0
      707070F0E8E0707070E0C8B060483000FF0000FF0000FF0000FF0000FF004070
      F000FF0000FF0000FF00ACACACF6F6F6707070E6E6E6707070C3C3C343434300
      FF0000FF0000FF0000FF0000FF0091919100FF0000FF0000FF00D0B0A0FFFFFF
      FFF8F0FFF0F0F0E8E0E0D0C060483000FF0000FF0000FF0000FF00AEB7EA1048
      F000FF0000FF0000FF00AEAEAEFFFFFFF6F6F6F1F1F1E6E6E6CCCCCC43434300
      FF0000FF0000FF0000FF00C5C5C574747400FF0000FF0000FF00D0B8A0FFFFFF
      808880FFF8F0707070F0D8D060483000FF0000FF006088F07090F07090F0A8B6
      EB00FF0000FF0000FF00B3B3B3FFFFFF848484F6F6F6707070D8D8D843434300
      FF0000FF00A3A3A3A9A9A9A9A9A9C4C4C400FF0000FF0000FF00D0B0A0FFFFFF
      FFFFFFFFFFFFFFF8F0FFF0F060483000FF0000FF0000FF0000FF0000FF0000FF
      0000FF0000FF0000FF00AEAEAEFFFFFFFFFFFFFFFFFFF6F6F6F1F1F143434300
      FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00C0B0A0C0B0A0
      C0B0A0C0B0A0C0B0A0C0A8A0C0A8A000FF0000FF0000FF0000FF0000FF0000FF
      0000FF0000FF0000FF00ACACACACACACACACACACACACACACACA8A8A8A8A8A800
      FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00}
    NumGlyphs = 2
  end
  object btnCancelar: TBitBtn
    Left = 519
    Top = 414
    Width = 83
    Height = 33
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = 'Cancelar'
    TabOrder = 3
    OnClick = btnCancelarClick
    Glyph.Data = {
      36060000424D3606000000000000360000002800000020000000100000000100
      180000000000000600000000000000000000000000000000000000FF0000FF00
      00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
      0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
      FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
      00FF0000FF0000FF0000FF00707070505850000000D0C0AE00FF0000FF0000FF
      0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0070707054
      5454000000BCBCBC00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
      00FF00B0A0907C644DAD957FA0A0A0FFFFFF5090B0101010988A767B61496048
      3060483000FF0000FF0000FF0000FF0000FF009C9C9C5F5F5F909090A0A0A0FF
      FFFF9393931010108585855C5C5C43434343434300FF0000FF0000FF0000FF00
      00FF00D6BAA8FFFFFFF0E8E0A0A0A090B8C070D0E05098B0101010A09890B0A0
      9060483000FF0000FF0000FF0000FF0000FF00B7B7B7FFFFFFE6E6E6A0A0A0B6
      B6B6CBCBCB9898981010109696969C9C9C43434300FF0000FF0000FF00B7B3DA
      0E2BDFB8ABBDFFFFFFFFFFFFE0E0E050A0B060A8E060C0D05098B01010109090
      907A5F4600FF0000FF0000FF00BFBFBF5E5E5EB1B1B1FFFFFFFFFFFFE0E0E09C
      9C9CB1B1B1BBBBBB9898981010109090905A5A5A00FF0000FF0000FF000028FF
      0020F04050D0FFFFFFFFFFFFFFFFFF4050E00010B090E0F060C0D05098B01010
      108B7D7200FF0000FF0000FF006464645B5B5B747474FFFFFFFFFFFFFFFFFF79
      79793E3E3EDCDCDCBBBBBB9898981010107B7B7B00FF0000FF0000FF002D51FC
      1038FF0028FFF0F8FFFFFFFF9098F00018C06078E060A8B090E0F060C0D05098
      B0101010CBAF9800FF0000FF008080806F6F6F646464F9F9F9FFFFFFB1B1B148
      4848949494A3A3A3DCDCDCBBBBBB989898101010AAAAAA00FF0000FF00E7D7DB
      3050FF2040FF90A0F0C0C8F00028F04058F0FFF8F0D0D8E070B0C090E0F070C8
      E0808880303890B1959500FF00D9D9D9818181767676B6B6B6D3D3D360606083
      8383F6F6F6D9D9D9AEAEAEDCDCDCC6C6C684848451515197979700FF0000FF00
      DCD0DC4060FF3050FF2040FF3050FFFFF8FFFFFFFFFFF8F0D0D8E080B0C0D0B8
      B07088D06070B030389000FF0000FF00D4D4D48C8C8C818181767676818181FA
      FAFAFFFFFFF6F6F6D9D9D9B0B0B0B8B8B89B9B9B81818151515100FF0000FF00
      00FF00B8B5D14068FF4060FFD0D8FFFFFFFFFFFFFFFFF8FFF0F0F0D0D8D06070
      B07090E06078D06070B000FF0000FF0000FF00BDBDBD9191918C8C8CE2E2E2FF
      FFFFFFFFFFFAFAFAF0F0F0D4D4D4818181A4A4A490909081818100FF0000FF00
      C6C4E26078FF6078FF6080FF5070FFF0F0FFFFFFFFFFFFFFFFF8F0F0F0F0B0A0
      A06070B06070B0D1B2A500FF0000FF00CDCDCD9E9E9E9E9E9EA2A2A2979797F4
      F4F4FFFFFFFFFFFFF6F6F6F0F0F0A1A1A1818181818181B1B1B100FF00B1B6E9
      5078FF5078FFC0D0FFFFFFFF7088FF6078FFD0E0FFFFFFFFFFFFFFB0A090B0A0
      9096785E00FF0000FF0000FF00C4C4C49C9C9C9C9C9CDCDCDCFFFFFFA9A9A99E
      9E9EE7E7E7FFFFFFFFFFFF9C9C9C9C9C9C73737300FF0000FF00859BF35078FF
      5078FFC8BED1FFFFFFFFFFFFFFFFFFB0C8FF8098FFFFFFFFB0A0908068508060
      5060483000FF0000FF00B3B3B39C9C9C9C9C9CC4C4C4FFFFFFFFFFFFFFFFFFD6
      D6D6B4B4B4FFFFFF9C9C9C6363635E5E5E43434300FF0000FF00859BF36585FA
      DCD2DCD8C7B6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0A890D0C8C08068
      50DEBAA500FF0000FF00B3B3B3A4A4A4D6D6D6C3C3C3FFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFA3A3A3C6C6C6636363B7B7B700FF0000FF0000FF0000FF00
      00FF00D0C0B0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0A8A0807060DFBD
      A700FF0000FF0000FF0000FF0000FF0000FF00BCBCBCFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFA8A8A86C6C6CB9B9B900FF0000FF0000FF0000FF0000FF00
      00FF00E0C0B0E0C0B0E0C0B0E0C0B0E0C0B0D0C0B0D0B8B0D0B0A0E0BEAA00FF
      0000FF0000FF0000FF0000FF0000FF0000FF00BEBEBEBEBEBEBEBEBEBEBEBEBE
      BEBEBCBCBCB8B8B8AEAEAEBBBBBB00FF0000FF0000FF0000FF00}
    NumGlyphs = 2
  end
  object cdsVenda: TIBDataSet
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    ForcedRefresh = True
    BufferChunks = 1000
    CachedUpdates = True
    RefreshSQL.Strings = (
      '')
    SelectSQL.Strings = (
      'Select'
      '    v.Ano'
      '  , v.Codcontrol'
      '  , v.Dtvenda'
      '  , v.Dtfinalizacao_venda'
      '  , v.Dataemissao'
      '  , v.Horaemissao'
      '  , v.Desconto'
      '  , v.Totalvenda'
      '  , v.Serie'
      '  , v.Nfe'
      '  , v.Nfe_valor_base_icms'
      '  , v.Nfe_valor_icms'
      '  , v.Nfe_valor_base_icms_subst'
      '  , v.Nfe_valor_icms_subst'
      '  , v.Nfe_valor_total_produto'
      '  , v.Nfe_valor_frete'
      '  , v.Nfe_valor_seguro'
      '  , v.Nfe_valor_desconto'
      '  , v.Nfe_valor_total_ii'
      '  , v.Nfe_valor_total_ipi'
      '  , v.Nfe_valor_pis'
      '  , v.Nfe_valor_cofins'
      '  , v.Nfe_valor_outros'
      '  , v.Nfe_valor_total_nota'
      '  , sum( coalesce(i.Valor_ipi, 0) ) as valor_total_IPI'
      '  , sum( coalesce(i.Qtde, 0) * i.Punit ) as valor_total_bruto'
      
        '  , sum( coalesce(i.Qtde, 0) * (i.Punit * i.Desconto / 100) ) as' +
        ' valor_total_desconto'
      '  , sum( coalesce(i.Qtde, 0) * i.Pfinal ) as valor_total_liquido'
      
        '  , sum( coalesce(i.Qtde, 0) * p.Customedio * coalesce(p.Aliquot' +
        'a, 0) / 100 ) as valor_total_icms_normal_entrada'
      
        '  , sum( coalesce(i.Qtde, 0) * i.Punit * coalesce(i.Aliquota, 0)' +
        ' / 100 ) as valor_total_icms_normal_saida'
      
        '  , sum( coalesce(i.Qtde, 0) * i.Punit * coalesce(i.Aliquota, 0)' +
        ' / 100 ) -'
      
        '    sum( coalesce(i.Qtde, 0) * p.Customedio * coalesce(p.Aliquot' +
        'a, 0) / 100 ) as valor_total_icms_normal_devido'
      'from TBVENDAS v'
      
        '  inner join TVENDASITENS i on (i.Ano = v.Ano and i.Codcontrol =' +
        ' v.Codcontrol)'
      '  inner join TBPRODUTO p on (p.Cod = i.Codprod)'
      ''
      'where v.Ano = :anovenda'
      '  and v.Codcontrol = :numvenda'
      ''
      'Group by'
      '    v.Ano'
      '  , v.Codcontrol'
      '  , v.Dtvenda'
      '  , v.Dtfinalizacao_venda'
      '  , v.Dataemissao'
      '  , v.Horaemissao'
      '  , v.Desconto'
      '  , v.Totalvenda'
      '  , v.Serie'
      '  , v.Nfe'
      '  , v.Nfe_valor_base_icms'
      '  , v.Nfe_valor_icms'
      '  , v.Nfe_valor_base_icms_subst'
      '  , v.Nfe_valor_icms_subst'
      '  , v.Nfe_valor_total_produto'
      '  , v.Nfe_valor_frete'
      '  , v.Nfe_valor_seguro'
      '  , v.Nfe_valor_desconto'
      '  , v.Nfe_valor_total_ii'
      '  , v.Nfe_valor_total_ipi'
      '  , v.Nfe_valor_pis'
      '  , v.Nfe_valor_cofins'
      '  , v.Nfe_valor_outros'
      '  , v.Nfe_valor_total_nota')
    ModifySQL.Strings = (
      '')
    GeneratorField.Field = 'CODCONTROL'
    UpdateObject = updVenda
    Left = 32
    Top = 16
  end
  object updVenda: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  ANO,'
      '  CODCONTROL,'
      '  CODEMP,'
      '  CODCLI,'
      '  DTVENDA,'
      '  STATUS,'
      '  DESCONTO,'
      '  TOTALVENDA,'
      '  DTFINALIZACAO_VENDA,'
      '  OBS,'
      '  FORMAPAG,'
      '  FATDIAS,'
      '  SERIE,'
      '  NFE,'
      '  DATAEMISSAO,'
      '  HORAEMISSAO,'
      '  CFOP,'
      '  VERIFICADOR_NFE,'
      '  XML_NFE,'
      '  VENDEDOR_COD,'
      '  USUARIO,'
      '  FORMAPAGTO_COD,'
      '  CONDICAOPAGTO_COD,'
      '  VENDA_PRAZO,'
      '  PRAZO_01,'
      '  PRAZO_02,'
      '  PRAZO_03,'
      '  PRAZO_04,'
      '  PRAZO_05,'
      '  PRAZO_06,'
      '  PRAZO_07,'
      '  PRAZO_08,'
      '  PRAZO_09,'
      '  PRAZO_10,'
      '  PRAZO_11,'
      '  PRAZO_12,'
      '  NFE_VALOR_BASE_ICMS,'
      '  NFE_VALOR_ICMS,'
      '  NFE_VALOR_BASE_ICMS_SUBST,'
      '  NFE_VALOR_ICMS_SUBST,'
      '  NFE_VALOR_TOTAL_PRODUTO,'
      '  NFE_VALOR_FRETE,'
      '  NFE_VALOR_SEGURO,'
      '  NFE_VALOR_DESCONTO,'
      '  NFE_VALOR_TOTAL_II,'
      '  NFE_VALOR_TOTAL_IPI,'
      '  NFE_VALOR_PIS,'
      '  NFE_VALOR_COFINS,'
      '  NFE_VALOR_OUTROS,'
      '  NFE_VALOR_TOTAL_NOTA'
      'from TBVENDAS '
      'where'
      '  ANO = :ANO and'
      '  CODCONTROL = :CODCONTROL')
    ModifySQL.Strings = (
      'update TBVENDAS'
      'set'
      '  ANO = :ANO,'
      '  CODCONTROL = :CODCONTROL,'
      '  DTVENDA = :DTVENDA,'
      '  DESCONTO = :DESCONTO,'
      '  TOTALVENDA = :TOTALVENDA,'
      '  DTFINALIZACAO_VENDA = :DTFINALIZACAO_VENDA,'
      '  SERIE = :SERIE,'
      '  NFE = :NFE,'
      '  DATAEMISSAO = :DATAEMISSAO,'
      '  HORAEMISSAO = :HORAEMISSAO,'
      '  NFE_VALOR_BASE_ICMS = :NFE_VALOR_BASE_ICMS,'
      '  NFE_VALOR_ICMS = :NFE_VALOR_ICMS,'
      '  NFE_VALOR_BASE_ICMS_SUBST = :NFE_VALOR_BASE_ICMS_SUBST,'
      '  NFE_VALOR_ICMS_SUBST = :NFE_VALOR_ICMS_SUBST,'
      '  NFE_VALOR_TOTAL_PRODUTO = :NFE_VALOR_TOTAL_PRODUTO,'
      '  NFE_VALOR_FRETE = :NFE_VALOR_FRETE,'
      '  NFE_VALOR_SEGURO = :NFE_VALOR_SEGURO,'
      '  NFE_VALOR_DESCONTO = :NFE_VALOR_DESCONTO,'
      '  NFE_VALOR_TOTAL_II = :NFE_VALOR_TOTAL_II,'
      '  NFE_VALOR_TOTAL_IPI = :NFE_VALOR_TOTAL_IPI,'
      '  NFE_VALOR_PIS = :NFE_VALOR_PIS,'
      '  NFE_VALOR_COFINS = :NFE_VALOR_COFINS,'
      '  NFE_VALOR_OUTROS = :NFE_VALOR_OUTROS,'
      '  NFE_VALOR_TOTAL_NOTA = :NFE_VALOR_TOTAL_NOTA'
      'where'
      '  ANO = :OLD_ANO and'
      '  CODCONTROL = :OLD_CODCONTROL')
    InsertSQL.Strings = (
      'insert into TBVENDAS'
      
        '  (ANO, CODCONTROL, DTVENDA, DESCONTO, TOTALVENDA, DTFINALIZACAO' +
        '_VENDA, '
      
        '   SERIE, NFE, DATAEMISSAO, HORAEMISSAO, NFE_VALOR_BASE_ICMS, NF' +
        'E_VALOR_ICMS, '
      
        '   NFE_VALOR_BASE_ICMS_SUBST, NFE_VALOR_ICMS_SUBST, NFE_VALOR_TO' +
        'TAL_PRODUTO, '
      
        '   NFE_VALOR_FRETE, NFE_VALOR_SEGURO, NFE_VALOR_DESCONTO, NFE_VA' +
        'LOR_TOTAL_II, '
      
        '   NFE_VALOR_TOTAL_IPI, NFE_VALOR_PIS, NFE_VALOR_COFINS, NFE_VAL' +
        'OR_OUTROS, '
      '   NFE_VALOR_TOTAL_NOTA)'
      'values'
      
        '  (:ANO, :CODCONTROL, :DTVENDA, :DESCONTO, :TOTALVENDA, :DTFINAL' +
        'IZACAO_VENDA, '
      
        '   :SERIE, :NFE, :DATAEMISSAO, :HORAEMISSAO, :NFE_VALOR_BASE_ICM' +
        'S, :NFE_VALOR_ICMS, '
      
        '   :NFE_VALOR_BASE_ICMS_SUBST, :NFE_VALOR_ICMS_SUBST, :NFE_VALOR' +
        '_TOTAL_PRODUTO, '
      
        '   :NFE_VALOR_FRETE, :NFE_VALOR_SEGURO, :NFE_VALOR_DESCONTO, :NF' +
        'E_VALOR_TOTAL_II, '
      
        '   :NFE_VALOR_TOTAL_IPI, :NFE_VALOR_PIS, :NFE_VALOR_COFINS, :NFE' +
        '_VALOR_OUTROS, '
      '   :NFE_VALOR_TOTAL_NOTA)')
    DeleteSQL.Strings = (
      'delete from TBVENDAS'
      'where'
      '  ANO = :OLD_ANO and'
      '  CODCONTROL = :OLD_CODCONTROL')
    Left = 64
    Top = 16
  end
  object dtsVenda: TDataSource
    AutoEdit = False
    DataSet = cdsVenda
    Left = 96
    Top = 16
  end
end