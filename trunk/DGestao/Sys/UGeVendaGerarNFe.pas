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
    GrpBxTributacao: TGroupBox;
    Bevel2: TBevel;
    btnConfirmar: TBitBtn;
    btnCancelar: TBitBtn;
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGeVendaGerarNFe: TfrmGeVendaGerarNFe;

implementation

uses UDMBusiness, UDMNFe;

{$R *.dfm}

procedure TfrmGeVendaGerarNFe.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

end.
