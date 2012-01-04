unit UGeProduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadraoCadastro, ImgList, IBCustomDataSet, IBUpdateSQL, DB,
  Mask, DBCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls,
  ToolWin, IBTable, ToolEdit, RXDBCtrl;

type
  TfrmGeProduto = class(TfrmGrPadraoCadastro)
    IbDtstTabelaCODIGO: TIntegerField;
    IbDtstTabelaCOD: TIBStringField;
    IbDtstTabelaDESCRI: TIBStringField;
    IbDtstTabelaMODELO: TIBStringField;
    IbDtstTabelaPRECO: TIBBCDField;
    IbDtstTabelaREFERENCIA: TIBStringField;
    IbDtstTabelaSECAO: TIBStringField;
    IbDtstTabelaQTDE: TIntegerField;
    IbDtstTabelaUNIDADE: TIBStringField;
    IbDtstTabelaESTOQMIN: TSmallintField;
    IbDtstTabelaCODGRUPO: TSmallintField;
    IbDtstTabelaCUSTOMEDIO: TIBBCDField;
    IbDtstTabelaCODEMP: TIBStringField;
    IbDtstTabelaCODSECAO: TSmallintField;
    IbDtstTabelaCODORIGEM: TIBStringField;
    IbDtstTabelaCODTRIBUTACAO: TIBStringField;
    IbDtstTabelaCST: TIBStringField;
    IbDtstTabelaCODCFOP: TIntegerField;
    IbDtstTabelaCODBARRA_EAN: TIBStringField;
    IbDtstTabelaCODUNIDADE: TSmallintField;
    IbDtstTabelaDESCRICAO_GRUPO: TIBStringField;
    IbDtstTabelaDESCRICAO_SECAO: TIBStringField;
    IbDtstTabelaDESCRICAO_UNIDADE: TIBStringField;
    lblDescricao: TLabel;
    dbDescricao: TDBEdit;
    lblReferencia: TLabel;
    dbReferencia: TDBEdit;
    tblEmpresa: TIBTable;
    dtsEmpresa: TDataSource;
    lblModelo: TLabel;
    dbModelo: TDBEdit;
    lblSecao: TLabel;
    dbSecao: TRxDBComboEdit;
    lblGrupo: TLabel;
    dbGrupo: TRxDBComboEdit;
    lblUnidade: TLabel;
    dbUnidade: TRxDBComboEdit;
    GrpBxDadosTributo: TGroupBox;
    lblOrigem: TLabel;
    dbOrigem: TDBLookupComboBox;
    lblTipoTributacao: TLabel;
    dbTipoTributacao: TDBLookupComboBox;
    lblCFOP: TLabel;
    dbCFOP: TRxDBComboEdit;
    lblAliquota: TLabel;
    dbAliquota: TDBEdit;
    IbDtstTabelaALIQUOTA: TIBBCDField;
    IbDtstTabelaCFOP_DESCRICAO: TIBStringField;
    IbDtstTabelaCFOP_ESPECIFICACAO: TMemoField;
    Bevel5: TBevel;
    tblOrigem: TIBTable;
    dtsOrigem: TDataSource;
    tblTributacao: TIBTable;
    dtsTributacao: TDataSource;
    pgcMaisDados: TPageControl;
    tbsValores: TTabSheet;
    tbsHistorico: TTabSheet;
    IbDtstTabelaUNP_SIGLA: TIBStringField;
    Bevel6: TBevel;
    GrpBxDadosEstoque: TGroupBox;
    lblEstoqueQtde: TLabel;
    dbEstoqueQtde: TDBEdit;
    lblEstoqueMinimo: TLabel;
    dbEstoqueMinimo: TDBEdit;
    lblEmpresa: TLabel;
    dbEmpresa: TDBLookupComboBox;
    lblCusto: TLabel;
    dbCusto: TDBEdit;
    lblPreco: TLabel;
    dbPreco: TDBEdit;
    lblCodigoEAN: TLabel;
    dbCodigoEAN: TDBEdit;
    lblIPI: TLabel;
    dbIPI: TDBEdit;
    dbAliquotaTipo: TDBLookupComboBox;
    lblAliquotaTipo: TLabel;
    tblAliquota: TIBTable;
    dtsAliquota: TDataSource;
    IbDtstTabelaALIQUOTA_TIPO: TSmallintField;
    IbDtstTabelaVALOR_IPI: TIBBCDField;
    procedure FormCreate(Sender: TObject);
    procedure dbGrupoButtonClick(Sender: TObject);
    procedure dbSecaoButtonClick(Sender: TObject);
    procedure IbDtstTabelaBeforePost(DataSet: TDataSet);
    procedure dbUnidadeButtonClick(Sender: TObject);
    procedure dbCFOPButtonClick(Sender: TObject);
    procedure IbDtstTabelaNewRecord(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    fOrdenado : Boolean;
  public
    { Public declarations }
  end;

var
  frmGeProduto: TfrmGeProduto;

  procedure MostrarTabelaProdutos(const AOwner : TComponent);

implementation

uses UDMBusiness, UGeSecaoProduto, UGeGrupoProduto, UGeUnidade,
  UGeTabelaCFOP;

{$R *.dfm}

procedure MostrarTabelaProdutos(const AOwner : TComponent);
var
  frm : TfrmGeProduto;
begin
  frm := TfrmGeProduto.Create(AOwner);
  try
    frm.ShowModal;
  finally
    frm.Destroy;
  end;
end;

procedure TfrmGeProduto.FormCreate(Sender: TObject);
begin
  inherited;
  ControlFirstEdit := dbCodigoEAN;

  fOrdenado := False;
   
  tblEmpresa.Open;
  tblOrigem.Open;
  tblTributacao.Open;
  tblAliquota.Open;

  DisplayFormatCodigo := '0000000';

  NomeTabela     := 'TBPRODUTO';
  CampoCodigo    := 'Codigo';
  CampoDescricao := 'p.Descri';

  UpdateGenerator;

  pgcMaisDados.ActivePageIndex := 0;
end;

procedure TfrmGeProduto.dbGrupoButtonClick(Sender: TObject);
var
  iCodigo    : Integer;
  sDescricao : String;
begin
  if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
    if ( SelecionarGrupoProduto(Self, iCodigo, sDescricao) ) then
    begin
      IbDtstTabelaCODGRUPO.AsInteger       := iCodigo;
      IbDtstTabelaDESCRICAO_GRUPO.AsString := sDescricao;
    end;
end;

procedure TfrmGeProduto.dbSecaoButtonClick(Sender: TObject);
var
  iCodigo    : Integer;
  sDescricao : String;
begin
  if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
    if ( SelecionarSecaoProduto(Self, iCodigo, sDescricao) ) then
    begin
      IbDtstTabelaCODSECAO.AsInteger       := iCodigo;
      IbDtstTabelaSECAO.AsString           := sDescricao;
      IbDtstTabelaDESCRICAO_SECAO.AsString := sDescricao;
    end;
end;

procedure TfrmGeProduto.IbDtstTabelaBeforePost(DataSet: TDataSet);
begin
  inherited;
  IbDtstTabelaCST.Value := IbDtstTabelaCODORIGEM.AsString + IbDtstTabelaCODTRIBUTACAO.AsString;

  if ( IbDtstTabela.State = dsInsert ) then
    if ( Trim(IbDtstTabelaCOD.AsString) = EmptyStr ) then
      IbDtstTabelaCOD.Value := FormatFloat(DisplayFormatCodigo, IbDtstTabelaCODIGO.AsInteger);
end;

procedure TfrmGeProduto.dbUnidadeButtonClick(Sender: TObject);
var
  iCodigo    : Integer;
  sDescricao,
  sSigla    : String;
begin
  if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
    if ( SelecionarUnidade(Self, iCodigo, sDescricao, sSigla) ) then
    begin
      IbDtstTabelaCODUNIDADE.AsInteger       := iCodigo;
      IbDtstTabelaUNIDADE.AsString           := sDescricao;
      IbDtstTabelaDESCRICAO_UNIDADE.AsString := sDescricao;
      IbDtstTabelaUNP_SIGLA.AsString         := sSigla;
    end;
end;

procedure TfrmGeProduto.dbCFOPButtonClick(Sender: TObject);
var
  iCodigo    : Integer;
  sDescricao : String;
begin
  if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
    if ( SelecionarCFOP(Self, iCodigo, sDescricao) ) then
    begin
      IbDtstTabelaCODCFOP.AsInteger       := iCodigo;
      IbDtstTabelaCFOP_DESCRICAO.AsString := sDescricao;
    end;
end;

procedure TfrmGeProduto.IbDtstTabelaNewRecord(DataSet: TDataSet);
begin
  inherited;
  if ( not tblEmpresa.IsEmpty ) then
    IbDtstTabelaCODEMP.Value := tblEmpresa.FieldByName('CNPJ').AsString;

  if ( not tblOrigem.IsEmpty ) then
    IbDtstTabelaCODORIGEM.Value := tblOrigem.FieldByName('ORP_COD').AsString;

  if ( not tblTributacao.IsEmpty ) then
    IbDtstTabelaCODTRIBUTACAO.Value := tblTributacao.FieldByName('TPT_COD').AsString;

  IbDtstTabelaCST.Value      := IbDtstTabelaCODORIGEM.AsString + IbDtstTabelaCODTRIBUTACAO.AsString;
  IbDtstTabelaESTOQMIN.Value := 0;
  IbDtstTabelaQTDE.Value     := 0;
  IbDtstTabelaCUSTOMEDIO.Value := 0;
  IbDtstTabelaPRECO.Value      := 0;
  IbDtstTabelaCODCFOP.Value        := GetCfopIDDefault;
  IbDtstTabelaCFOP_DESCRICAO.Value := GetCfopNomeDefault;
  IbDtstTabelaALIQUOTA_TIPO.Value  := 0; // ICMS
  IbDtstTabelaALIQUOTA.Value       := 0;
  IbDtstTabelaVALOR_IPI.Value      := 0;
end;

procedure TfrmGeProduto.FormShow(Sender: TObject);
begin
  if (not fOrdenado) then
  begin
    IbDtstTabela.SelectSQL.Add( 'order by ' + CampoDescricao );
    fOrdenado := True;
  end;

  inherited;
end;

end.
