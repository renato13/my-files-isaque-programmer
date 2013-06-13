inherited frlDANFeEventoRLRetrato: TfrlDANFeEventoRLRetrato
  Left = 266
  Top = 127
  Width = 816
  Height = 655
  Caption = 'frlDANFeEventoRLRetrato'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited RLEvento: TRLReport
    Background.Arrange = baDistributed
    Background.Height = 96
    Background.Width = 175
    Margins.LeftMargin = 7.000000000000000000
    Margins.TopMargin = 7.000000000000000000
    Margins.RightMargin = 7.000000000000000000
    Margins.BottomMargin = 7.000000000000000000
    PreviewOptions.FormStyle = fsStayOnTop
    PrintDialog = False
    Title = 'Danfe Retrato'
    BeforePrint = RLEventoBeforePrint
    object rliMarcaDagua1: TRLImage
      Left = 233
      Top = 300
      Width = 327
      Height = 234
      Center = True
      HoldStyle = hsHorizontally
      Scaled = True
    end
    object rlbUsuario: TRLBand
      Left = 26
      Top = 817
      Width = 742
      Height = 12
      AlignToBottom = True
      AutoExpand = False
      BandType = btTitle
      object rllUsuario: TRLLabel
        Tag = 10
        Left = 0
        Top = 1
        Width = 212
        Height = 7
        Caption = 'DATA / HORA DA IMPRESS'#195'O: 00/00/0000 00:00:00 - USUARIO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -7
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object rllSistema: TRLLabel
        Tag = 10
        Left = 562
        Top = 1
        Width = 176
        Height = 7
        Alignment = taRightJustify
        Caption = 'DESENVOLVIDO POR: EMPRESA RRRRRRRRRRRR'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -7
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
    end
    object rlbEvento: TRLBand
      Left = 26
      Top = 222
      Width = 742
      Height = 111
      BandType = btTitle
      object RLDraw15: TRLDraw
        Left = 0
        Top = 20
        Width = 740
        Height = 91
      end
      object rllNomeEvento: TRLLabel
        Tag = 30
        Left = 0
        Top = 1
        Width = 121
        Height = 16
        Caption = 'NOME DO EVENTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        HoldStyle = hsRelatively
        ParentFont = False
      end
      object RLLabel32: TRLLabel
        Tag = 10
        Left = 3
        Top = 23
        Width = 31
        Height = 10
        Caption = 'ORGAO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        HoldStyle = hsRelatively
        ParentFont = False
      end
      object rllOrgao: TRLLabel
        Left = 7
        Top = 33
        Width = 90
        Height = 14
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel35: TRLLabel
        Tag = 10
        Left = 3
        Top = 53
        Width = 34
        Height = 10
        Caption = 'EVENTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        HoldStyle = hsRelatively
        ParentFont = False
      end
      object rllEvento: TRLLabel
        Left = 7
        Top = 63
        Width = 114
        Height = 14
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel39: TRLLabel
        Tag = 10
        Left = 3
        Top = 83
        Width = 33
        Height = 10
        Caption = 'STATUS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        HoldStyle = hsRelatively
        ParentFont = False
      end
      object rllStatusEvento: TRLLabel
        Left = 7
        Top = 93
        Width = 370
        Height = 14
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel40: TRLLabel
        Tag = 10
        Left = 383
        Top = 83
        Width = 52
        Height = 10
        Caption = 'PROTOCOLO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        HoldStyle = hsRelatively
        ParentFont = False
      end
      object rllProtocoloEvento: TRLLabel
        Left = 387
        Top = 93
        Width = 158
        Height = 14
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel36: TRLLabel
        Tag = 10
        Left = 133
        Top = 53
        Width = 97
        Height = 10
        Caption = 'DESCRI'#199#195'O DO EVENTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        HoldStyle = hsRelatively
        ParentFont = False
      end
      object rllDescrEvento: TRLLabel
        Left = 137
        Top = 63
        Width = 328
        Height = 14
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel33: TRLLabel
        Tag = 10
        Left = 109
        Top = 23
        Width = 42
        Height = 10
        Caption = 'AMBIENTE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        HoldStyle = hsRelatively
        ParentFont = False
      end
      object rllAmbiente: TRLLabel
        Left = 113
        Top = 33
        Width = 432
        Height = 14
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel37: TRLLabel
        Tag = 10
        Left = 473
        Top = 53
        Width = 96
        Height = 10
        Caption = 'SEQU'#202'NCIA DO EVENTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        HoldStyle = hsRelatively
        ParentFont = False
      end
      object rllSeqEvento: TRLLabel
        Left = 477
        Top = 63
        Width = 140
        Height = 14
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel42: TRLLabel
        Tag = 10
        Left = 553
        Top = 83
        Width = 109
        Height = 10
        Caption = 'DATA / HORA DO REGISTRO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        HoldStyle = hsRelatively
        ParentFont = False
      end
      object rllDataHoraRegistro: TRLLabel
        Left = 557
        Top = 93
        Width = 180
        Height = 14
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel38: TRLLabel
        Tag = 10
        Left = 626
        Top = 53
        Width = 82
        Height = 10
        Caption = 'VERS'#195'O DO EVENTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        HoldStyle = hsRelatively
        ParentFont = False
      end
      object rllVersaoEvento: TRLLabel
        Left = 630
        Top = 63
        Width = 99
        Height = 14
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLDraw16: TRLDraw
        Left = 0
        Top = 50
        Width = 740
        Height = 1
        DrawKind = dkLine
        HoldStyle = hsRelatively
      end
      object RLDraw17: TRLDraw
        Left = 0
        Top = 80
        Width = 740
        Height = 1
        DrawKind = dkLine
        HoldStyle = hsRelatively
      end
      object RLDraw22: TRLDraw
        Left = 380
        Top = 80
        Width = 1
        Height = 31
        Angle = 90.000000000000000000
        DrawKind = dkLine
        HoldStyle = hsRelatively
      end
      object RLDraw20: TRLDraw
        Left = 130
        Top = 50
        Width = 1
        Height = 31
        Angle = 90.000000000000000000
        DrawKind = dkLine
        HoldStyle = hsRelatively
      end
      object RLDraw19: TRLDraw
        Left = 106
        Top = 20
        Width = 1
        Height = 31
        Angle = 90.000000000000000000
        DrawKind = dkLine
        HoldStyle = hsRelatively
      end
      object RLDraw24: TRLDraw
        Left = 550
        Top = 80
        Width = 1
        Height = 31
        Angle = 90.000000000000000000
        DrawKind = dkLine
        HoldStyle = hsRelatively
      end
      object RLDraw21: TRLDraw
        Left = 470
        Top = 50
        Width = 1
        Height = 31
        Angle = 90.000000000000000000
        DrawKind = dkLine
        HoldStyle = hsRelatively
      end
      object RLDraw4: TRLDraw
        Left = 550
        Top = 20
        Width = 1
        Height = 31
        Angle = 90.000000000000000000
        DrawKind = dkLine
        HoldStyle = hsRelatively
      end
      object rllDataHoraEvento: TRLLabel
        Left = 557
        Top = 33
        Width = 180
        Height = 14
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel5: TRLLabel
        Tag = 10
        Left = 553
        Top = 23
        Width = 100
        Height = 10
        Caption = 'DATA / HORA DO EVENTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        HoldStyle = hsRelatively
        ParentFont = False
      end
      object RLDraw5: TRLDraw
        Left = 622
        Top = 50
        Width = 1
        Height = 31
        Angle = 90.000000000000000000
        DrawKind = dkLine
        HoldStyle = hsRelatively
      end
    end
    object rlbNFe: TRLBand
      Left = 26
      Top = 124
      Width = 742
      Height = 98
      BandType = btTitle
      object RLDraw29: TRLDraw
        Left = 0
        Top = 20
        Width = 740
        Height = 61
      end
      object RLLabel20: TRLLabel
        Tag = 30
        Left = 0
        Top = 1
        Width = 177
        Height = 16
        Caption = 'NOTA FISCAL ELETR'#212'NICA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        HoldStyle = hsRelatively
        ParentFont = False
      end
      object RLLabel44: TRLLabel
        Tag = 10
        Left = 3
        Top = 23
        Width = 36
        Height = 10
        Caption = 'MODELO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        Holder = RLDraw29
        HoldStyle = hsRelatively
        ParentFont = False
      end
      object rllModeloNF: TRLLabel
        Left = 6
        Top = 33
        Width = 81
        Height = 14
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel45: TRLLabel
        Tag = 10
        Left = 101
        Top = 23
        Width = 25
        Height = 10
        Caption = 'S'#201'RIE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        Holder = RLDraw29
        HoldStyle = hsRelatively
        ParentFont = False
      end
      object rllSerieNF: TRLLabel
        Left = 104
        Top = 33
        Width = 57
        Height = 14
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel46: TRLLabel
        Tag = 10
        Left = 303
        Top = 23
        Width = 92
        Height = 10
        Caption = 'M'#202'S / ANO DA EMISS'#195'O'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        HoldStyle = hsRelatively
        ParentFont = False
      end
      object rllMesAnoEmissaoNF: TRLLabel
        Left = 306
        Top = 33
        Width = 119
        Height = 14
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLDraw30: TRLDraw
        Left = 0
        Top = 50
        Width = 430
        Height = 1
        DrawKind = dkLine
        Holder = RLDraw29
        HoldStyle = hsRelatively
      end
      object RLDraw32: TRLDraw
        Left = 98
        Top = 20
        Width = 1
        Height = 31
        Angle = 90.000000000000000000
        DrawKind = dkLine
        HoldStyle = hsRelatively
      end
      object RLDraw31: TRLDraw
        Left = 300
        Top = 20
        Width = 1
        Height = 31
        Angle = 90.000000000000000000
        DrawKind = dkLine
        HoldStyle = hsRelatively
      end
      object RLDraw37: TRLDraw
        Left = 430
        Top = 20
        Width = 1
        Height = 61
        Angle = 90.000000000000000000
        DrawKind = dkLine
        HoldStyle = hsRelatively
      end
      object rlbCodigoBarras: TRLBarcode
        Left = 519
        Top = 29
        Width = 132
        Height = 44
        Alignment = taCenter
        BarcodeType = bcCode128C
        Margins.LeftMargin = 1.000000000000000000
        Margins.RightMargin = 1.000000000000000000
      end
      object rllChaveNFe: TRLLabel
        Left = 6
        Top = 63
        Width = 419
        Height = 14
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel4: TRLLabel
        Tag = 10
        Left = 3
        Top = 53
        Width = 76
        Height = 10
        Caption = 'CHAVE DE ACESSO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        Holder = RLDraw29
        HoldStyle = hsRelatively
        ParentFont = False
      end
      object RLLabel1: TRLLabel
        Tag = 10
        Left = 173
        Top = 23
        Width = 38
        Height = 10
        Caption = 'N'#218'MERO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        HoldStyle = hsRelatively
        ParentFont = False
      end
      object RLDraw8: TRLDraw
        Left = 170
        Top = 20
        Width = 1
        Height = 31
        Angle = 90.000000000000000000
        DrawKind = dkLine
        HoldStyle = hsRelatively
      end
      object rllNumNF: TRLLabel
        Left = 176
        Top = 33
        Width = 113
        Height = 14
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object rlbCondUso: TRLBand
      Left = 26
      Top = 364
      Width = 742
      Height = 213
      BandType = btTitle
      object RLLabel21: TRLLabel
        Tag = 30
        Left = 0
        Top = 20
        Width = 134
        Height = 16
        Caption = 'CONDI'#199#213'ES DE USO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        HoldStyle = hsRelatively
        ParentFont = False
      end
      object RLDraw50: TRLDraw
        Left = 0
        Top = 39
        Width = 740
        Height = 154
      end
      object rlmCondUso: TRLMemo
        Left = 8
        Top = 46
        Width = 721
        Height = 139
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        IntegralHeight = True
        ParentFont = False
      end
    end
    object rlbCabecalho: TRLBand
      Left = 26
      Top = 26
      Width = 742
      Height = 98
      AutoExpand = False
      BandType = btHeader
      object RLDraw3: TRLDraw
        Left = 0
        Top = 0
        Width = 742
        Height = 81
        Align = faTop
      end
      object rliLogo: TRLImage
        Left = 8
        Top = 8
        Width = 67
        Height = 63
        Center = True
        Scaled = True
      end
      object rllTitulo: TRLLabel
        Tag = 40
        Left = 88
        Top = 10
        Width = 650
        Height = 19
        Alignment = taCenter
        AutoSize = False
        Caption = 'NOME DO EVENTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object rllCabecalhoLinha1: TRLLabel
        Tag = 40
        Left = 88
        Top = 34
        Width = 650
        Height = 16
        Alignment = taCenter
        AutoSize = False
        Caption = 
          'N'#227'o possui valor fiscal. Simples representa'#231#227'o do evento indicad' +
          'o abaixo.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object rllCabecalhoLinha2: TRLLabel
        Tag = 40
        Left = 88
        Top = 54
        Width = 650
        Height = 16
        Alignment = taCenter
        AutoSize = False
        Caption = 'CONSULTE A AUTENTICIDADE NO SITE DA SEFAZ AUTORIZADORA.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
    end
    object rlbJustificativa: TRLBand
      Left = 26
      Top = 333
      Width = 742
      Height = 31
      BandType = btTitle
      object RLLabel3: TRLLabel
        Tag = 10
        Left = 3
        Top = 3
        Width = 56
        Height = 7
        Caption = 'JUSTIFICATIVA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -7
        Font.Name = 'Arial'
        Font.Style = []
        HoldStyle = hsRelatively
        ParentFont = False
      end
      object rllJustificativa: TRLLabel
        Left = 7
        Top = 13
        Width = 722
        Height = 14
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLDraw1: TRLDraw
        Left = 0
        Top = 0
        Width = 1
        Height = 31
        Angle = 90.000000000000000000
        DrawKind = dkLine
        HoldStyle = hsRelatively
      end
      object RLDraw2: TRLDraw
        Left = 739
        Top = 0
        Width = 1
        Height = 31
        Angle = 90.000000000000000000
        DrawKind = dkLine
        HoldStyle = hsRelatively
      end
      object RLDraw6: TRLDraw
        Left = 0
        Top = 30
        Width = 740
        Height = 1
        DrawKind = dkLine
        HoldStyle = hsRelatively
      end
    end
    object rlbCorrecao: TRLBand
      Left = 26
      Top = 577
      Width = 742
      Height = 240
      BandType = btTitle
      object RLLabel6: TRLLabel
        Tag = 30
        Left = 0
        Top = 1
        Width = 77
        Height = 16
        Caption = 'CORRE'#199#195'O'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        HoldStyle = hsRelatively
        ParentFont = False
      end
      object RLDraw7: TRLDraw
        Left = 0
        Top = 20
        Width = 740
        Height = 218
      end
      object rlmCorrecao: TRLMemo
        Left = 8
        Top = 27
        Width = 721
        Height = 205
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        IntegralHeight = True
        ParentFont = False
      end
    end
  end
  inherited RLPDFFilter1: TRLPDFFilter
    Left = 720
    Top = 41
  end
end
