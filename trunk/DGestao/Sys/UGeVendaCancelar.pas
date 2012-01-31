unit UGeVendaCancelar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadrao, DB, IBCustomDataSet, IBUpdateSQL, ExtCtrls, StdCtrls,
  Mask, DBCtrls, Buttons;

type
  TfrmGeVendaCancelar = class(TfrmGrPadrao)
    cdsVenda: TIBDataSet;
    updVenda: TIBUpdateSQL;
    dtsVenda: TDataSource;
    GrpBxControle: TGroupBox;
    lblCodigo: TLabel;
    lblDataHora: TLabel;
    lblSerie: TLabel;
    lblNFe: TLabel;
    lblDataEmissao: TLabel;
    lblHoraEmissao: TLabel;
    dbCodigo: TDBEdit;
    dbDataHora: TDBEdit;
    dbSerie: TDBEdit;
    dbNFe: TDBEdit;
    dbDataEmissao: TDBEdit;
    dbHoraEmissao: TDBEdit;
    Bevel1: TBevel;
    GrpBxImposto: TGroupBox;
    Bevel2: TBevel;
    btnCancelar: TBitBtn;
    btFechar: TBitBtn;
    lblCancelUsuario: TLabel;
    lblCancelDataHora: TLabel;
    lblMotivo: TLabel;
    dbMotivo: TMemo;
    dbCancelUsuario: TEdit;
    dbCancelDataHora: TEdit;
    procedure btFecharClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGeVendaCancelar: TfrmGeVendaCancelar;

  function CancelarVND(const AOwer : TComponent; Ano : Smallint; Numero : Integer) : Boolean;

implementation

uses UDMBusiness, UDMNFe;

{$R *.dfm}

function CancelarVND(const AOwer : TComponent; Ano : Smallint; Numero : Integer) : Boolean;
var
  frm : TfrmGeVendaCancelar;
begin
  frm := TfrmGeVendaCancelar.Create(AOwer);
  try
    with frm do
    begin
      cdsVenda.Close;
      cdsVenda.ParamByName('anovenda').AsShort   := Ano;
      cdsVenda.ParamByName('numvenda').AsInteger := Numero;
      cdsVenda.Open;

      dbCancelUsuario.Text  := 'SYSDBA';
      dbCancelDataHora.Text := FormatDateTime('dd/mm/yyyy hh:mm:ss', Now);

//      if ( not cdsVenda.IsEmpty ) then
//      begin
//        cdsVenda.Edit;
//
//      end;

      Result := (ShowModal = mrOk);
    end;
  finally
    frm.Free;
  end;
end;

procedure TfrmGeVendaCancelar.btFecharClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

end.
