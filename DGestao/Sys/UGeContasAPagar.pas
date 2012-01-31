unit UGeContasAPagar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadraoCadastro, ImgList, IBCustomDataSet, IBUpdateSQL, DB,
  Mask, DBCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls,
  ToolWin, ToolEdit, RXDBCtrl, IBTable, IBQuery;

type
  TfrmGeContasAPagar = class(TfrmGrPadraoCadastro)
    lblEmpresa: TLabel;
    dbEmpresa: TDBEdit;
    IbDtstTabelaANOLANC: TSmallintField;
    IbDtstTabelaNUMLANC: TIntegerField;
    IbDtstTabelaPARCELA: TSmallintField;
    IbDtstTabelaCODFORN: TSmallintField;
    IbDtstTabelaNOMEFORN: TIBStringField;
    IbDtstTabelaCNPJ: TIBStringField;
    IbDtstTabelaNOTFISC: TIBStringField;
    IbDtstTabelaTIPPAG: TIBStringField;
    IbDtstTabelaDTEMISS: TDateField;
    IbDtstTabelaDTVENC: TDateField;
    IbDtstTabelaVALORPAG: TIBBCDField;
    IbDtstTabelaBANCO: TSmallintField;
    IbDtstTabelaBCO_NOME: TIBStringField;
    IbDtstTabelaNUMCHQ: TIBStringField;
    IbDtstTabelaPAGO_: TIBStringField;
    IbDtstTabelaDOCBAIX: TIBStringField;
    lblData: TLabel;
    edData: TDateTimePicker;
    btbtnEfetuarPagto: TBitBtn;
    IbDtstTabelaNOMEEMP: TIBStringField;
    Bevel5: TBevel;
    GrpBxDadosValores: TGroupBox;
    lblNotaFiscal: TLabel;
    dbNotaFiscal: TDBEdit;
    lblFornecedor: TLabel;
    dbFornecedor: TRxDBComboEdit;
    lblParcela: TLabel;
    dbParcela: TDBEdit;
    dbQuitado: TDBEdit;
    lblEmissao: TLabel;
    dbEmissao: TDBEdit;
    lblVencimento: TLabel;
    dbVencimento: TDBEdit;
    lblValorAPagar: TLabel;
    dbValorAPagar: TDBEdit;
    tblEmpresa: TIBTable;
    dtsEmpresa: TDataSource;
    tblFormaPagto: TIBTable;
    dtsFormaPagto: TDataSource;
    tblCondicaoPagto: TIBTable;
    dtsCondicaoPagto: TDataSource;
    lblFormaPagto: TLabel;
    dbFormaPagto: TDBLookupComboBox;
    lblCondicaoPagto: TLabel;
    dbCondicaoPagto: TDBLookupComboBox;
    pgcMaisDados: TPageControl;
    tbsHistorico: TTabSheet;
    dbObservacao: TDBMemo;
    IbDtstTabelaHISTORIC: TMemoField;
    IbDtstTabelaFORMA_PAGTO: TSmallintField;
    IbDtstTabelaCONDICAO_PAGTO: TSmallintField;
    IbDtstTabelaQUITADO: TSmallintField;
    IbDtstTabelaDTPAG: TDateField;
    lblQuitado: TLabel;
    Bevel6: TBevel;
    dbgPagamentos: TDBGrid;
    Bevel7: TBevel;
    cdsPagamentos: TIBDataSet;
    dtsPagamentos: TDataSource;
    cdsPagamentosANOLANC: TSmallintField;
    cdsPagamentosNUMLANC: TIntegerField;
    cdsPagamentosSEQ: TSmallintField;
    cdsPagamentosHISTORICO: TMemoField;
    cdsPagamentosDATA_PAGTO: TDateField;
    cdsPagamentosFORMA_PAGTO: TSmallintField;
    cdsPagamentosFORMA_PAGTO_DESC: TIBStringField;
    cdsPagamentosVALOR_BAIXA: TIBBCDField;
    cdsPagamentosNUMERO_CHEQUE: TIBStringField;
    cdsPagamentosBANCO: TSmallintField;
    cdsPagamentosBCO_NOME: TIBStringField;
    cdsPagamentosDOCUMENTO_BAIXA: TIBStringField;
    lblTipoDespesa: TLabel;
    dbTipoDespesa: TDBLookupComboBox;
    IbDtstTabelaCODTPDESP: TSmallintField;
    dtsTpDespesa: TDataSource;
    qryTpDespesa: TIBQuery;
    procedure FormCreate(Sender: TObject);
    procedure dbFornecedorButtonClick(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure IbDtstTabelaQUITADOGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure IbDtstTabelaNewRecord(DataSet: TDataSet);
    procedure btbtnEfetuarPagtoClick(Sender: TObject);
    procedure btbtnSalvarClick(Sender: TObject);
    procedure pgcGuiasChange(Sender: TObject);
    procedure btbtnAlterarClick(Sender: TObject);
    procedure btbtnExcluirClick(Sender: TObject);
    procedure IbDtstTabelaBeforeEdit(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    SQL_Pagamentos : TStringList;
    procedure AbrirPagamentos(const Ano : Smallint; const Numero : Integer);
    procedure HabilitarDesabilitar_Btns;
  public
    { Public declarations }
  end;

var
  frmGeContasAPagar: TfrmGeContasAPagar;

  procedure MostrarControleContasAPagar(const AOwner : TComponent);

implementation

uses UDMBusiness, UGeFornecedor, DateUtils, UGeEfetuarPagtoPAG;

{$R *.dfm}

procedure MostrarControleContasAPagar(const AOwner : TComponent);
var
  frm : TfrmGeContasAPagar;
  whr : String; 
begin
  frm := TfrmGeContasAPagar.Create(AOwner);
  try
    whr := 'cast(p.dtvenc as date) = ' + QuotedStr( FormatDateTime('yyyy-mm-dd', frm.edData.Date) );

    with frm, IbDtstTabela do
    begin
      Close;
      SelectSQL.Add('where ' + whr);
      SelectSQL.Add('order by ' + CampoOrdenacao);
      Open;
    end;

    frm.ShowModal;
  finally
    frm.Destroy;
  end;
end;

procedure TfrmGeContasAPagar.FormCreate(Sender: TObject);
begin
  IbDtstTabela.GeneratorField.Generator := 'GEN_CONTAPAG_NUM_' + FormatFloat('0000', YearOf(Date));

  inherited;

  SQL_Pagamentos := TStringList.Create;
  SQL_Pagamentos.AddStrings( cdsPagamentos.SelectSQL );

  edData.Date      := Date;
  ControlFirstEdit := dbFornecedor;

  tblEmpresa.Open;
  tblFormaPagto.Open;
  tblCondicaoPagto.Open;
  qryTpDespesa.Open;

  DisplayFormatCodigo := '###0000000';
  NomeTabela     := 'TBCONTPAG';
  CampoCodigo    := 'numlanc';
  CampoDescricao := 'NomeForn';
  CampoOrdenacao := 'p.dtvenc, f.NomeForn';

  UpdateGenerator( 'where anolanc = ' + FormatFloat('0000', YearOf(Date)) );

  UpdateGenerator;
end;

procedure TfrmGeContasAPagar.dbFornecedorButtonClick(Sender: TObject);
var
  iCodigo : Integer;
  sCNPJ   ,
  sNome   : String;
begin
  if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
    if ( SelecionarFornecedor(Self, iCodigo, sCNPJ, sNome) ) then
    begin
      IbDtstTabelaCODFORN.AsInteger := iCodigo;
      IbDtstTabelaCNPJ.AsString     := sCNPJ;
      IbDtstTabelaNOMEFORN.AsString := sNome;
    end;
end;

procedure TfrmGeContasAPagar.btnFiltrarClick(Sender: TObject);
begin
  WhereAdditional := 'cast(p.dtvenc as date) = ' + QuotedStr( FormatDateTime('yyyy-mm-dd', edData.Date) );
  inherited;
end;

procedure TfrmGeContasAPagar.IbDtstTabelaQUITADOGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  Case Sender.AsInteger of
    0 : Text := 'A Pagar';
    1 : Text := 'Pago';
    else
      Text := Sender.AsString;
  end;
end;

procedure TfrmGeContasAPagar.IbDtstTabelaNewRecord(DataSet: TDataSet);
begin
  inherited;
  IbDtstTabelaANOLANC.Value := YearOf(Date);
  IbDtstTabelaNOMEEMP.Value := GetEmpresaNomeDefault;
  IbDtstTabelaPARCELA.Value := 0;
  IbDtstTabelaDTEMISS.Value := Date;
  IbDtstTabelaQUITADO.Value := 0;
  IbDtstTabelaFORMA_PAGTO.Value    := GetFormaPagtoIDDefault;
  IbDtstTabelaCONDICAO_PAGTO.Value := GetCondicaoPagtoIDDefault;
end;

procedure TfrmGeContasAPagar.btbtnEfetuarPagtoClick(Sender: TObject);
var
  sSenha  : String;
  iNumero : Integer;
begin
  if ( IbDtstTabela.IsEmpty ) then
    Exit;

  sSenha := InputBox('Favor informar a senha de autorização', 'Senha de Autorização:', '');

  if ( Trim(sSenha) = EmptyStr ) then
    Exit;

  if ( sSenha <> GetSenhaAutorizacao ) then
  begin
    ShowWarning('Senha de autorização inválida');
    Exit;
  end;

  if PagamentoConfirmado(Self, IbDtstTabelaANOLANC.AsInteger, IbDtstTabelaNUMLANC.AsInteger, IbDtstTabelaNOMEFORN.AsString) then
  begin
    iNumero := IbDtstTabelaNUMLANC.AsInteger;

    IbDtstTabela.Close;
    IbDtstTabela.Open;

    IbDtstTabela.Locate('NUMLANC', iNumero, []);

    AbrirPagamentos( IbDtstTabelaANOLANC.AsInteger, IbDtstTabelaNUMLANC.AsInteger );
  end;
end;

procedure TfrmGeContasAPagar.HabilitarDesabilitar_Btns;
begin
  if ( pgcGuias.ActivePage = tbsCadastro ) then
    btbtnEfetuarPagto.Enabled := (IbDtstTabelaQUITADO.AsInteger = 0) and (not IbDtstTabela.IsEmpty)
  else
    btbtnEfetuarPagto.Enabled := False;
end;

procedure TfrmGeContasAPagar.btbtnSalvarClick(Sender: TObject);
begin
  inherited;
  HabilitarDesabilitar_Btns;
end;

procedure TfrmGeContasAPagar.pgcGuiasChange(Sender: TObject);
begin
  inherited;
  AbrirPagamentos( IbDtstTabelaANOLANC.AsInteger, IbDtstTabelaNUMLANC.AsInteger );
end;

procedure TfrmGeContasAPagar.AbrirPagamentos(const Ano: Smallint;
  const Numero: Integer);
begin
  cdsPagamentos.Close;

  with cdsPagamentos, SelectSQL do
  begin
    Clear;
    AddStrings( SQL_Pagamentos );
    Add('where p.Anolanc = ' + IntToStr(Ano));
    Add('  and p.Numlanc = ' + IntToStr(Numero));
    Add('order by p.seq');
  end;

  cdsPagamentos.Open;

  HabilitarDesabilitar_Btns;
end;

procedure TfrmGeContasAPagar.btbtnAlterarClick(Sender: TObject);
begin
  if ( IbDtstTabelaQUITADO.AsInteger = 1 ) then
  begin
    ShowWarning('O Lançamento não poderá ser alterado pois este já está quitado!');
    Abort;
  end
  else
  begin
    inherited;
    if ( not OcorreuErro ) then
      AbrirPagamentos( IbDtstTabelaANOLANC.AsInteger, IbDtstTabelaNUMLANC.AsInteger );
  end;
end;

procedure TfrmGeContasAPagar.btbtnExcluirClick(Sender: TObject);
begin
  if ( IbDtstTabelaQUITADO.AsInteger = 1 ) then
  begin
    ShowWarning('O Lançamento não poderá ser excluído pois este já está quitado!');
    Abort;
  end
  else
  begin
    inherited;
    if ( not OcorreuErro ) then
      AbrirPagamentos( IbDtstTabelaANOLANC.AsInteger, IbDtstTabelaNUMLANC.AsInteger );
  end;
end;

procedure TfrmGeContasAPagar.IbDtstTabelaBeforeEdit(DataSet: TDataSet);
begin
  inherited;
  if ( Trim(IbDtstTabelaNOMEEMP.AsString) = EmptyStr ) then
    IbDtstTabelaNOMEEMP.Value := GetEmpresaNomeDefault;
end;

procedure TfrmGeContasAPagar.FormShow(Sender: TObject);
begin
  inherited;
  qryTpDespesa.Prior;
  qryTpDespesa.Last;
end;

end.
