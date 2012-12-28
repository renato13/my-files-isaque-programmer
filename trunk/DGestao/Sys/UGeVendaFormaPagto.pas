unit UGeVendaFormaPagto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadrao, DB, IBCustomDataSet, IBTable, StdCtrls, Mask, DBCtrls;

type
  TfrmGeVendaFormaPagto = class(TfrmGrPadrao)
    tblFormaPagto: TIBTable;
    dtsFormaPagto: TDataSource;
    tblCondicaoPagto: TIBTable;
    dtsCondicaoPagto: TDataSource;
    lblPrazo01: TLabel;
    dbPrazo01: TDBEdit;
    dbPrazo02: TDBEdit;
    lblPrazo02: TLabel;
    lblPrazo03: TLabel;
    dbPrazo03: TDBEdit;
    dbPrazo04: TDBEdit;
    lblPrazo04: TLabel;
    lblPrazo05: TLabel;
    dbPrazo05: TDBEdit;
    dbPrazo06: TDBEdit;
    lblPrazo06: TLabel;
    lblPrazo07: TLabel;
    dbPrazo07: TDBEdit;
    dbPrazo08: TDBEdit;
    lblPrazo08: TLabel;
    lblPrazo09: TLabel;
    dbPrazo09: TDBEdit;
    dbPrazo10: TDBEdit;
    lblPrazo10: TLabel;
    lblPrazo11: TLabel;
    dbPrazo11: TDBEdit;
    dbPrazo12: TDBEdit;
    lblPrazo12: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGeVendaFormaPagto: TfrmGeVendaFormaPagto;

implementation

uses UDMBusiness, UDMNFe;

{$R *.dfm}

end.
