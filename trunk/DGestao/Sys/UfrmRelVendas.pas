unit UfrmRelVendas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, ExtCtrls, DB, IBCustomDataSet, IBQuery;

type
  TfrmRelVendas = class(TForm)
    qckrp: TQuickRep;
    TitleBand1: TQRBand;
    QRLabel6: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel2: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel3: TQRLabel;
    QRDBText10: TQRDBText;
    QRImage1: TQRImage;
    ColumnHeaderBand1: TQRBand;
    QRLabel5: TQRLabel;
    qrlblCliMot: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    PageFooterBand2: TQRBand;
    QRSysData2: TQRSysData;
    IBQuery1: TIBQuery;
    IBQuery1CODCONTROL: TIntegerField;
    IBQuery1DTVENDA: TDateTimeField;
    IBQuery1CODCLI: TIBStringField;
    IBQuery1TOTALVENDA: TIBBCDField;
    SummaryBand1: TQRBand;
    QRLabel11: TQRLabel;
    QRSysData3: TQRSysData;
    QRExpr1: TQRExpr;
    DetailBand1: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText8: TQRDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelVendas: TfrmRelVendas;

implementation

uses UDMBusiness;

{$R *.dfm}

end.
