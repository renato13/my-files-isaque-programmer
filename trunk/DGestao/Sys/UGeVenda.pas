unit UGeVenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadraoCadastro, ImgList, IBCustomDataSet, IBUpdateSQL, DB,
  Mask, DBCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls,
  ToolWin, IBTable, ToolEdit, RXDBCtrl;

type
  TfrmGeVenda = class(TfrmGrPadraoCadastro)
    lblData: TLabel;
    edData: TDateTimePicker;
    tblEmpresa: TIBTable;
    dtsEmpresa: TDataSource;
    lblEmpresa: TLabel;
    dbEmpresa: TDBLookupComboBox;
    lblCliente: TLabel;
    dbCliente: TRxDBComboEdit;
    lblDataHora: TLabel;
    dbDataHora: TDBEdit;
    Label1: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    Label2: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    Label4: TLabel;
    DBEdit2: TDBEdit;
    Label5: TLabel;
    DBEdit3: TDBEdit;
    Label6: TLabel;
    DBEdit4: TDBEdit;
    Label7: TLabel;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    Label8: TLabel;
    Label9: TLabel;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    Label10: TLabel;
    Label11: TLabel;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    Label12: TLabel;
    Label13: TLabel;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    Label14: TLabel;
    GroupBox1: TGroupBox;
    Bevel5: TBevel;
    Bevel6: TBevel;
    pgcMaisDados: TPageControl;
    tbsObservacao: TTabSheet;
    tbsTitulo: TTabSheet;
    Label15: TLabel;
    RxDBComboEdit1: TRxDBComboEdit;
    DBEdit13: TDBEdit;
    DBGrid1: TDBGrid;
    dbObservacao: TDBMemo;
    Label17: TLabel;
    DBEdit14: TDBEdit;
    Label18: TLabel;
    DBEdit15: TDBEdit;
    Label19: TLabel;
    DBEdit16: TDBEdit;
    Label20: TLabel;
    DBEdit17: TDBEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label21: TLabel;
    DBEdit18: TDBEdit;
    Label22: TLabel;
    RxDBComboEdit2: TRxDBComboEdit;
    Label23: TLabel;
    DBEdit19: TDBEdit;
    Label24: TLabel;
    DBEdit20: TDBEdit;
    Label25: TLabel;
    DBEdit21: TDBEdit;
    DBEdit22: TDBEdit;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGeVenda: TfrmGeVenda;

  procedure MostrarControleVendas(const AOwner : TComponent);

implementation

uses UDMBusiness;

{$R *.dfm}

procedure MostrarControleVendas(const AOwner : TComponent);
var
  frm : TfrmGeVenda;
  whr : String;
begin
  frm := TfrmGeVenda.Create(AOwner);
  try
    whr := 'cast(v.dtvenda as date) = ' + QuotedStr( FormatDateTime('yyyy-mm-dd', frm.edData.Date) );

    with frm, IbDtstTabela do
    begin
      Close;
      SelectSQL.Add('where ' + whr);
      Open;
    end;

    frm.ShowModal;
  finally
    frm.Destroy;
  end;
end;

procedure TfrmGeVenda.FormCreate(Sender: TObject);
begin
  inherited;
  edData.Date := Date;
  ControlFirstEdit := dbEmpresa;

  tblEmpresa.Open;
//  tblOrigem.Open;
//  tblTributacao.Open;
//  tblAliquota.Open;

  DisplayFormatCodigo := '###0000000';
  NomeTabela     := 'TBVENDAS';
  CampoCodigo    := 'Codcontrol';
  CampoDescricao := 'c.NOME';
  CampoOrdenacao := 'v.dtvenda, c.Nome';

  UpdateGenerator;
end;

procedure TfrmGeVenda.btnFiltrarClick(Sender: TObject);
begin
  WhereAdditional := 'cast(v.dtvenda as date) = ' + QuotedStr( FormatDateTime('yyyy-mm-dd', edData.Date) );
  inherited;
end;

end.
