unit UGeConsultarLoteNFe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadrao, DB, IBCustomDataSet, IBQuery, StdCtrls, Buttons,
  ExtCtrls, Mask, DBCtrls, IBUpdateSQL;

type
  TfrmGeConsultarLoteNFe = class(TfrmGrPadrao)
    dtsEmpresa: TDataSource;
    qryEmpresa: TIBQuery;
    qryEmpresaCNPJ: TIBStringField;
    qryEmpresaRZSOC: TIBStringField;
    qryEmpresaSERIE_NFE: TSmallintField;
    qryEmpresaNUMERO_NFE: TIntegerField;
    qryEmpresaLOTE_ANO_NFE: TSmallintField;
    qryEmpresaLOTE_NUM_NFE: TIntegerField;
    qryEmpresaMODELO_NFE: TIntegerField;
    cdsLOG: TIBDataSet;
    cdsLOGUSUARIO: TIBStringField;
    cdsLOGDATA_HORA: TDateTimeField;
    cdsLOGTIPO: TSmallintField;
    cdsLOGDESCRICAO: TIBStringField;
    cdsLOGESPECIFICACAO: TMemoField;
    updLOG: TIBUpdateSQL;
    qryLotesNFe: TIBQuery;
    GrpBxControle: TGroupBox;
    lblCNPJ: TLabel;
    lblRazaoSocial: TLabel;
    lblSerie: TLabel;
    lblNFe: TLabel;
    lblHoraEmissao: TLabel;
    lblModelo: TLabel;
    dbCNPJ: TDBEdit;
    dbRazaoSocial: TDBEdit;
    dbSerie: TDBEdit;
    dbNFe: TDBEdit;
    dbHoraEmissao: TDBEdit;
    dbModelo: TDBEdit;
    Bevel1: TBevel;
    GrpBxDadosLote: TGroupBox;
    lblUsuario: TLabel;
    lblDataHora: TLabel;
    lblJustificativa: TLabel;
    lblAno: TLabel;
    lblNumeroLote: TLabel;
    lblNumeroRecibo: TLabel;
    dbJustificativa: TMemo;
    dbUsuario: TEdit;
    dbDataHora: TEdit;
    edAno: TEdit;
    edNumeroLote: TEdit;
    edNumeroRecibo: TEdit;
    Bevel2: TBevel;
    lblInforme: TLabel;
    btnConfirmar: TBitBtn;
    btFechar: TBitBtn;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure Auditar;  
  public
    { Public declarations }
  end;

var
  frmGeConsultarLoteNFe: TfrmGeConsultarLoteNFe;

implementation

uses UDMBusiness, UDMNFe, UConstantesDGE;

{$R *.dfm}

{ TfrmGeConsultarLoteNFe }

procedure TfrmGeConsultarLoteNFe.Auditar;
begin
  dbUsuario.Text  := Trim(GetUserApp);
  dbDataHora.Text := FormatDateTime('dd/mm/yyyy hh:mm:ss', Now);
end;

procedure TfrmGeConsultarLoteNFe.FormCreate(Sender: TObject);
begin
  inherited;
  
  with qryEmpresa do
  begin
    Close;
    ParamByName('cnpj').AsString := GetEmpresaIDDefault;
    Open;
  end;

  Auditar;
  edAno.Text := FormatDateTime('yyyy', Date);
end;

end.
