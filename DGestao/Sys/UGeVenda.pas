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
    GrpBxDadosProduto: TGroupBox;
    Bevel5: TBevel;
    Bevel6: TBevel;
    pgcMaisDados: TPageControl;
    tbsRecebimento: TTabSheet;
    tbsTitulo: TTabSheet;
    lblProduto: TLabel;
    dbProduto: TRxDBComboEdit;
    dbProdutoNome: TDBEdit;
    dbgProdutos: TDBGrid;
    dbObservacao: TDBMemo;
    lblQuantidade: TLabel;
    dbQuantidade: TDBEdit;
    lblValorUnit: TLabel;
    dbValorUnit: TDBEdit;
    lblDesconto: TLabel;
    dbDesconto: TDBEdit;
    lblValorLiq: TLabel;
    dbValorLiq: TDBEdit;
    lblUnidade: TLabel;
    dbUnidade: TDBEdit;
    lblCFOP: TLabel;
    dbCFOP: TRxDBComboEdit;
    lblAliquota: TLabel;
    dbAliquota: TDBEdit;
    lblCST: TLabel;
    dbCST: TDBEdit;
    lblValorIPI: TLabel;
    dbValorIPI: TDBEdit;
    dbCFOPDescricao: TDBEdit;
    Bevel7: TBevel;
    pnlBotoesProduto: TPanel;
    btnProdutoInserir: TBitBtn;
    btnProdutoEditar: TBitBtn;
    btnProdutoSalvar: TBitBtn;
    btnProdutoExcluir: TBitBtn;
    lblObservacao: TLabel;
    lblFormaPagto: TLabel;
    dbFormaPagto: TDBLookupComboBox;
    lblCondicaoPagto: TLabel;
    dbCondicaoPagto: TDBLookupComboBox;
    lblPrazo01: TLabel;
    dbPrazo01: TDBEdit;
    lblPrazo02: TLabel;
    dbPrazo02: TDBEdit;
    lblPrazo03: TLabel;
    dbPrazo03: TDBEdit;
    lblPrazo04: TLabel;
    dbPrazo04: TDBEdit;
    lblPrazo05: TLabel;
    dbPrazo05: TDBEdit;
    lblPrazo06: TLabel;
    dbPrazo06: TDBEdit;
    lblPrazo07: TLabel;
    dbPrazo07: TDBEdit;
    lblPrazo08: TLabel;
    dbPrazo08: TDBEdit;
    lblPrazo09: TLabel;
    dbPrazo09: TDBEdit;
    lblPrazo10: TLabel;
    dbPrazo10: TDBEdit;
    lblPrazo11: TLabel;
    dbPrazo11: TDBEdit;
    lblPrazo12: TLabel;
    dbPrazo12: TDBEdit;
    lblSerie: TLabel;
    dbSerie: TDBEdit;
    lblNFe: TLabel;
    dbNFe: TDBEdit;
    lblDataEmissao: TLabel;
    dbDataEmissao: TDBEdit;
    lblSituacao: TLabel;
    dbSituacao: TDBEdit;
    pnlBotoesTitulo: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    dbgTitulos: TDBGrid;
    Bevel9: TBevel;
    Bevel10: TBevel;
    lblVendedor: TLabel;
    dbVendedor: TDBLookupComboBox;
    lblValorTotal: TLabel;
    dbValorTotal: TDBEdit;
    lblValorDesconto: TLabel;
    dbValorDesconto: TDBEdit;
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
