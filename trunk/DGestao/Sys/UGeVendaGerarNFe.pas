unit UGeVendaGerarNFe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadrao, DB, IBCustomDataSet, IBUpdateSQL, StdCtrls, Mask,
  DBCtrls, ExtCtrls, Buttons;

type
  TfrmGeVendaGerarNFe = class(TfrmGrPadrao)
    cdsVenda: TIBDataSet;
    updVenda: TIBUpdateSQL;
    dtsVenda: TDataSource;
    GrpBxControle: TGroupBox;
    lblCodigo: TLabel;
    lblDataHora: TLabel;
    lblSerie: TLabel;
    lblNFe: TLabel;
    lblDataEmissao: TLabel;
    dbCodigo: TDBEdit;
    dbDataHora: TDBEdit;
    dbSerie: TDBEdit;
    dbNFe: TDBEdit;
    dbDataEmissao: TDBEdit;
    lblHoraEmissao: TLabel;
    dbHoraEmissao: TDBEdit;
    Bevel1: TBevel;
    GrpBxImposto: TGroupBox;
    Bevel2: TBevel;
    btnConfirmar: TBitBtn;
    btnCancelar: TBitBtn;
    lblBaseICMS: TLabel;
    dbBaseICMS: TDBEdit;
    lblValorICMS: TLabel;
    dbValorICMS: TDBEdit;
    lblBaseICMSSubs: TLabel;
    dbBaseICMSSubs: TDBEdit;
    lblValorICMSSubs: TLabel;
    dbValorICMSSubs: TDBEdit;
    lblValorPIS: TLabel;
    dbValorPIS: TDBEdit;
    lblTotalProduto: TLabel;
    dbTotalProduto: TDBEdit;
    lblFrete: TLabel;
    dbFrete: TDBEdit;
    lblSeguro: TLabel;
    dbSeguro: TDBEdit;
    lblDesconto: TLabel;
    dbDesconto: TDBEdit;
    lblOutrasDespesas: TLabel;
    dbOutrasDespesas: TDBEdit;
    lblValorIPI: TLabel;
    dbValorIPI: TDBEdit;
    lblValorCOFINS: TLabel;
    dbValorCOFINS: TDBEdit;
    lblTotalNota: TLabel;
    dbTotalNota: TDBEdit;
    cdsVendaANO: TSmallintField;
    cdsVendaCODCONTROL: TIntegerField;
    cdsVendaDTVENDA: TDateTimeField;
    cdsVendaDTFINALIZACAO_VENDA: TDateField;
    cdsVendaDATAEMISSAO: TDateField;
    cdsVendaHORAEMISSAO: TTimeField;
    cdsVendaDESCONTO: TIBBCDField;
    cdsVendaTOTALVENDA: TIBBCDField;
    cdsVendaSERIE: TIBStringField;
    cdsVendaNFE: TLargeintField;
    cdsVendaSTATUS: TSmallintField;
    cdsVendaNFE_VALOR_BASE_ICMS_SUBST: TIBBCDField;
    cdsVendaNFE_VALOR_ICMS_SUBST: TIBBCDField;
    cdsVendaNFE_VALOR_TOTAL_PRODUTO: TIBBCDField;
    cdsVendaNFE_VALOR_FRETE: TIBBCDField;
    cdsVendaNFE_VALOR_SEGURO: TIBBCDField;
    cdsVendaNFE_VALOR_DESCONTO: TIBBCDField;
    cdsVendaNFE_VALOR_TOTAL_II: TIBBCDField;
    cdsVendaNFE_VALOR_TOTAL_IPI: TIBBCDField;
    cdsVendaNFE_VALOR_PIS: TIBBCDField;
    cdsVendaNFE_VALOR_COFINS: TIBBCDField;
    cdsVendaNFE_VALOR_OUTROS: TIBBCDField;
    cdsVendaNFE_VALOR_TOTAL_NOTA: TIBBCDField;
    btnCalcular: TBitBtn;
    cdsVendaCODEMP: TIBStringField;
    cdsVendaCODCLI: TIBStringField;
    cdsVendaVALOR_TOTAL_IPI: TIBBCDField;
    cdsVendaVALOR_TOTAL_BRUTO: TIBBCDField;
    cdsVendaVALOR_TOTAL_LIQUIDO: TIBBCDField;
    lblInforme: TLabel;
    cdsVendaVALOR_TOTAL_DESCONTO: TIBBCDField;
    cdsVendaNFE_VALOR_BASE_ICMS: TIBBCDField;
    cdsVendaNFE_VALOR_ICMS: TIBBCDField;
    cdsVendaVALOR_BASE_ICMS_NORMAL_ENTRADA: TIBBCDField;
    cdsVendaVALOR_TOTAL_ICMS_NORMAL_ENTRADA: TIBBCDField;
    cdsVendaVALOR_BASE_ICMS_NORMAL_SAIDA: TIBBCDField;
    cdsVendaVALOR_TOTAL_ICMS_NORMAL_SAIDA: TFloatField;
    cdsVendaVALOR_TOTAL_ICMS_NORMAL_DEVIDO: TFloatField;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnCalcularClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    iSerieNFe,
    iNumeroNFe  : Integer;
    sFileNameXML ,
    sChaveNFE    ,
    sProtocoloNFE,
    sReciboNFE   : String;
    iNumeroLote  : Int64;
    procedure RecalcularTotalNota;
  public
    { Public declarations }
  end;

var
  frmGeVendaGerarNFe: TfrmGeVendaGerarNFe;

  function GerarNFe(const AOwer : TComponent; Ano : Smallint; Numero : Integer;
    var SerieNFe, NumeroNFe  : Integer; var FileNameXML, ChaveNFE, ProtocoloNFE, ReciboNFE   : String; var NumeroLote  : Int64) : Boolean;

implementation

uses UDMBusiness, UDMNFe;

{$R *.dfm}

function GerarNFe(const AOwer : TComponent; Ano : Smallint; Numero : Integer;
  var SerieNFe, NumeroNFe  : Integer; var FileNameXML, ChaveNFE, ProtocoloNFE, ReciboNFE   : String; var NumeroLote  : Int64) : Boolean;
var
  frm : TfrmGeVendaGerarNFe;
begin
  frm := TfrmGeVendaGerarNFe.Create(AOwer);
  try
    with frm do
    begin
      cdsVenda.Close;
      cdsVenda.ParamByName('anovenda').AsShort   := Ano;
      cdsVenda.ParamByName('numvenda').AsInteger := Numero;
      cdsVenda.Open;

      if ( not cdsVenda.IsEmpty ) then
      begin
        cdsVenda.Edit;

        cdsVendaNFE_VALOR_BASE_ICMS.Value := cdsVendaVALOR_BASE_ICMS_NORMAL_SAIDA.AsCurrency;
        cdsVendaNFE_VALOR_ICMS.Value      := cdsVendaVALOR_TOTAL_ICMS_NORMAL_SAIDA.AsCurrency;
        cdsVendaNFE_VALOR_BASE_ICMS_SUBST.Value := 0;
        cdsVendaNFE_VALOR_ICMS_SUBST.Value      := 0;
        cdsVendaNFE_VALOR_TOTAL_PRODUTO.Value   := cdsVendaVALOR_TOTAL_BRUTO.AsCurrency;
        cdsVendaNFE_VALOR_FRETE.Value      := 0;
        cdsVendaNFE_VALOR_SEGURO.Value     := 0;
        cdsVendaNFE_VALOR_DESCONTO.Value   := cdsVendaVALOR_TOTAL_DESCONTO.AsCurrency;
        cdsVendaNFE_VALOR_OUTROS.Value     := 0;
        cdsVendaNFE_VALOR_TOTAL_IPI.Value  := cdsVendaVALOR_TOTAL_IPI.AsCurrency;
        cdsVendaNFE_VALOR_PIS.Value        := 0;
        cdsVendaNFE_VALOR_COFINS.Value     := 0;
        cdsVendaNFE_VALOR_TOTAL_II.Value   := 0;

        RecalcularTotalNota;
      end;

      Result := (ShowModal = mrOk);

      if ( Result ) then
      begin
        SerieNFe     := iSerieNFe;
        NumeroNFe    := iNumeroNFe;
        FileNameXML  := sFileNameXML;
        ChaveNFE     := sChaveNFE;
        ProtocoloNFE := sProtocoloNFE;
        ReciboNFE    := sReciboNFE;
        NumeroLote   := iNumeroLote;
      end;
    end;
  finally
    frm.Free;
  end;
end;

procedure TfrmGeVendaGerarNFe.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmGeVendaGerarNFe.RecalcularTotalNota;
begin
  if ( not cdsVenda.IsEmpty ) then
  begin
    if ( cdsVenda.State <> dsEdit ) then
      cdsVenda.Edit;

      cdsVendaDATAEMISSAO.Value := Date;
      cdsVendaHORAEMISSAO.Value := Time;

    cdsVendaNFE_VALOR_TOTAL_NOTA.AsCurrency := cdsVendaTOTALVENDA.AsCurrency + cdsVendaNFE_VALOR_ICMS_SUBST.AsCurrency + cdsVendaNFE_VALOR_FRETE.AsCurrency +
                                               cdsVendaNFE_VALOR_SEGURO.AsCurrency + cdsVendaNFE_VALOR_OUTROS.AsCurrency;
  end;
end;

procedure TfrmGeVendaGerarNFe.btnCalcularClick(Sender: TObject);
begin
  RecalcularTotalNota;
  if ( (dbTotalNota.Visible) and (dbTotalNota.Enabled) ) then
    dbTotalNota.SetFocus;
end;

procedure TfrmGeVendaGerarNFe.btnConfirmarClick(Sender: TObject);
var
  bOK : Boolean;
begin
  if ( ShowConfirm('Confirma a geração da NF-e?') ) then
  begin
    if ( cdsVenda.State = dsEdit ) then
    begin
      cdsVenda.Post;
      cdsVenda.ApplyUpdates;
      CommitTransaction;
    end;

    lblInforme.Caption := 'Consulta/Gerando NF-e junto a SEFA. Aguarde . . . ';
    Application.ProcessMessages;
    
    if ( DMNFe.GerarNFeOnLine ) then
      bOK := DMNFe.GerarNFeOnLineACBr ( cdsVendaCODEMP.AsString, cdsVendaCODCLI.AsString, cdsVendaANO.AsInteger, cdsVendaCODCONTROL.AsInteger,
               iSerieNFe, iNumeroNFe, sFileNameXML, sChaveNFE, sProtocoloNFE, sReciboNFE, iNumeroLote, False)
    else
      bOK := DMNFe.GerarNFeOffLineACBr( cdsVendaCODEMP.AsString, cdsVendaCODCLI.AsString, cdsVendaANO.AsInteger, cdsVendaCODCONTROL.AsInteger,
               iSerieNFe, iNumeroNFe, sFileNameXML, sChaveNFE, False);

    if ( bOK ) then
      ModalResult := mrOk;
  end;
end;

procedure TfrmGeVendaGerarNFe.FormCreate(Sender: TObject);
begin
  inherited;
  iSerieNFe     := 0;
  iNumeroNFe    := 0;
  sFileNameXML  := EmptyStr;
  sChaveNFE     := EmptyStr;
  sProtocoloNFE := EmptyStr;
  sReciboNFE    := EmptyStr;
  iNumeroLote   := 0;
  lblInforme.Caption := EmptyStr;
end;

end.
