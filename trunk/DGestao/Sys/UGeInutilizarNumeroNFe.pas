unit UGeInutilizarNumeroNFe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadrao, StdCtrls, Buttons, ExtCtrls, Mask, DBCtrls, DB,
  IBCustomDataSet, IBUpdateSQL, IBQuery;

type
  TfrmGeInutilizarNumeroNFe = class(TfrmGrPadrao)
    GrpBxControle: TGroupBox;
    lblCNPJ: TLabel;
    lblRazaoSocial: TLabel;
    lblSerie: TLabel;
    lblNFe: TLabel;
    lblHoraEmissao: TLabel;
    dbCNPJ: TDBEdit;
    dbRazaoSocial: TDBEdit;
    dbSerie: TDBEdit;
    dbNFe: TDBEdit;
    dbHoraEmissao: TDBEdit;
    Bevel1: TBevel;
    GrpBxImposto: TGroupBox;
    lblUsuario: TLabel;
    lblDataHora: TLabel;
    lblJustificativa: TLabel;
    dbJustificativa: TMemo;
    dbUsuario: TEdit;
    dbDataHora: TEdit;
    Bevel2: TBevel;
    lblInforme: TLabel;
    btnCancelar: TBitBtn;
    btFechar: TBitBtn;
    cdsEmpresa: TIBDataSet;
    updEmpresa: TIBUpdateSQL;
    dtsEmpresaxxx: TDataSource;
    qryEmpresa: TIBQuery;
    dtsEmpresa: TDataSource;
    qryEmpresaCNPJ: TIBStringField;
    qryEmpresaRZSOC: TIBStringField;
    qryEmpresaSERIE_NFE: TSmallintField;
    qryEmpresaNUMERO_NFE: TIntegerField;
    qryEmpresaLOTE_ANO_NFE: TSmallintField;
    qryEmpresaLOTE_NUM_NFE: TIntegerField;
    procedure btFecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure qryEmpresaCNPJGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
    procedure Auditar;
  public
    { Public declarations }
  end;

var
  frmGeInutilizarNumeroNFe: TfrmGeInutilizarNumeroNFe;

implementation

uses UDMBusiness, UDMNFe;

{$R *.dfm}

procedure TfrmGeInutilizarNumeroNFe.Auditar;
begin
  dbUsuario.Text  := Trim(GetUserApp);
  dbDataHora.Text := FormatDateTime('dd/mm/yyyy hh:mm:ss', Now);
end;

procedure TfrmGeInutilizarNumeroNFe.btFecharClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmGeInutilizarNumeroNFe.FormCreate(Sender: TObject);
begin
  with qryEmpresa do
  begin
    Close;
    ParamByName('cnpj').AsString := GetEmpresaIDDefault;
    Open;
  end;

  Auditar;
end;

procedure TfrmGeInutilizarNumeroNFe.qryEmpresaCNPJGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if ( Sender.IsNull ) then
    Exit;
    
  if StrIsCNPJ(Sender.AsString) then
    Text := StrFormatarCnpj(Sender.AsString)
  else
  if StrIsCPF(Sender.AsString) then
    Text := StrFormatarCpf(Sender.AsString);
end;

procedure TfrmGeInutilizarNumeroNFe.btnCancelarClick(Sender: TObject);
begin
  Auditar;
  
end;

initialization
  FormFunction.RegisterForm('frmGeInutilizarNumeroNFe', TfrmGeInutilizarNumeroNFe);

end.
