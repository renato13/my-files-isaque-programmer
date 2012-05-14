unit UfrmRelVendas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, ExtCtrls, DB, IBCustomDataSet, IBQuery,
  ComCtrls, StdCtrls, Buttons, Menus;

type
  TfrmRelVendas = class(TForm)
    Label3: TLabel;
    Panel1: TPanel;
    BitBtn2: TBitBtn;
    cmbbxSerie: TComboBox;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    dttmpcIni: TDateTimePicker;
    dttmpcFim: TDateTimePicker;
    qckrpVendas: TQuickRep;
    TitleBand1: TQRBand;
    QRLabel6: TQRLabel;
    QRSysData1: TQRSysData;
    qrlblPeriodo: TQRLabel;
    QRLabel2: TQRLabel;
    qrlblVendedor: TQRLabel;
    QRDBText5: TQRDBText;
    qrlblStatus: TQRLabel;
    ColumnHeaderBand1: TQRBand;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    qrlblCliMot: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel1: TQRLabel;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText7: TQRDBText;
    PageFooterBand1: TQRBand;
    QRLabel11: TQRLabel;
    QRExpr1: TQRExpr;
    QRSysData3: TQRSysData;
    PageFooterBand2: TQRBand;
    QRSysData2: TQRSysData;
    grpbxVendedor: TGroupBox;
    ComboBox1: TComboBox;
    ibqryVendedor: TIBQuery;
    ibqryVendedorNOME: TIBStringField;
    GroupBox2: TGroupBox;
    ComboBox2: TComboBox;
    ibqryVendas: TIBQuery;
    btbtnLista: TBitBtn;
    PopupMenu1: TPopupMenu;
    Analtico1: TMenuItem;
    Sinttico1: TMenuItem;
    procedure nmImprimirAnaliticoClick(Sender: TObject);
    procedure Analtico1Click(Sender: TObject);
    procedure btbtnListaClick(Sender: TObject);
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

procedure TfrmRelVendas.nmImprimirAnaliticoClick(Sender: TObject);
begin
 qckrpVendas.Preview
end;

procedure TfrmRelVendas.Analtico1Click(Sender: TObject);
begin
 ibqryVendas.Open;
 qckrpVendas.Preview;
end;

procedure TfrmRelVendas.btbtnListaClick(Sender: TObject);
begin
  PopupMenu1.Popup(btbtnLista.ClientOrigin.X, btbtnLista.ClientOrigin.Y + btbtnLista.Height);
end;

end.
