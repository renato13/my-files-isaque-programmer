unit UfrmRelVendasFormPag;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls;

type
  TfrmRelVendasFormPag = class(TForm)
    qckrpVendas: TQuickRep;
    TitleBand1: TQRBand;
    lblNomeSistema: TQRLabel;
    QRSysData1: TQRSysData;
    qrlblPeriodo: TQRLabel;
    QRLabel2: TQRLabel;
    QRDBText5: TQRDBText;
    ColumnHeaderBand1: TQRBand;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    qrlblCliMot: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel3: TQRLabel;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText3: TQRDBText;
    PageFooterBand1: TQRBand;
    QRLabel11: TQRLabel;
    QRExpr1: TQRExpr;
    QRSysData3: TQRSysData;
    PageFooterBand2: TQRBand;
    QRSysData2: TQRSysData;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelVendasFormPag: TfrmRelVendasFormPag;

implementation

uses
  UFuncoes;

{$R *.dfm}

procedure TfrmRelVendasFormPag.FormCreate(Sender: TObject);
begin
  lblNomeSistema.Caption := GetProductName;
end;

end.
