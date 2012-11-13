unit UGeProduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadraoCadastro, ImgList, IBCustomDataSet, IBUpdateSQL, DB,
  Mask, DBCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls,
  ToolWin, IBTable, ToolEdit, RXDBCtrl, EUserAcs;

type
  TAliquota = (taICMS, taISS);
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
    lblTipoTributacaoNM: TLabel;
    dbTipoTributacaoNM: TDBLookupComboBox;
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
    tblTributacaoNM: TIBTable;
    dtsTributacaoNM: TDataSource;
    pgcMaisDados: TPageControl;
    tbsValores: TTabSheet;
    tbsHistoricoVeiculo: TTabSheet;
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
    lblReserva: TLabel;
    dbReserva: TDBEdit;
    IbDtstTabelaRESERVA: TIntegerField;
    IbDtstTabelaDISPONIVEL: TLargeintField;
    lblNCM_SH: TLabel;
    dbNCM_SH: TDBEdit;
    IbDtstTabelaNCM_SH: TIBStringField;
    EvUA: TEvUserAccess;
    tblTributacaoSN: TIBTable;
    dtsTributacaoSN: TDataSource;
    IbDtstTabelaCSOSN: TIBStringField;
    IbDtstTabelaALIQUOTA_CSOSN: TIBBCDField;
    lblTipoTributacaoSN: TLabel;
    dbTipoTributacaoSN: TDBLookupComboBox;
    lblAliquotaSN: TLabel;
    dbAliquotaSN: TDBEdit;
    IbDtstTabelaPRECO_PROMOCAO: TIBBCDField;
    lblPrecoPromocao: TLabel;
    dbPrecoPromocao: TDBEdit;
    lblProdutoPromocao: TLabel;
    lblProdutoSemEstoque: TLabel;
    Label1: TLabel;
    lblFabricante: TLabel;
    dbFabricante: TRxDBComboEdit;
    IbDtstTabelaCODFABRICANTE: TIntegerField;
    IbDtstTabelaNOME_FABRICANTE: TIBStringField;
    IbDtstTabelaAPRESENTACAO: TIBStringField;
    IbDtstTabelaDESCRI_APRESENTACAO: TIBStringField;
    IbDtstTabelaPRODUTO_NOVO: TSmallintField;
    tbsEspecificacaoVeiculo: TTabSheet;
    lblApresentacao: TLabel;
    dbApresentacao: TDBEdit;
    dbProdutoNovo: TDBCheckBox;
    IbDtstTabelaCOR_VEICULO: TIBStringField;
    IbDtstTabelaCOMBUSTIVEL_VEICULO: TIBStringField;
    IbDtstTabelaTIPO_VEICULO: TIBStringField;
    IbDtstTabelaRENAVAM_VEICULO: TIBStringField;
    IbDtstTabelaCHASSI_VEICULO: TIBStringField;
    IbDtstTabelaANO_MODELO_VEICULO: TSmallintField;
    IbDtstTabelaANO_FABRICACAO_VEICULO: TSmallintField;
    IbDtstTabelaKILOMETRAGEM_VEICULO: TIntegerField;
    IbDtstTabelaDESCRICAO_COR: TIBStringField;
    IbDtstTabelaDESCRICAO_COMBUSTIVEL: TIBStringField;
    IbDtstTabelaMODELO_FABRICACAO: TIBStringField;
    tblCor: TIBTable;
    dtsCor: TDataSource;
    tblCombustivel: TIBTable;
    dtsCombustivel: TDataSource;
    tblTipoVeiculo: TIBTable;
    dtsTipoVeiculo: TDataSource;
    lblTipoVeiculo: TLabel;
    dbTipoVeiculo: TDBLookupComboBox;
    lblCorVeiculo: TLabel;
    dbCorVeiculo: TDBLookupComboBox;
    lblTipoCombustivel: TLabel;
    dbTipoCombustivel: TDBLookupComboBox;
    lblRenavam: TLabel;
    dbRenavam: TDBEdit;
    lblChassi: TLabel;
    dbChassi: TDBEdit;
    lblAnoModelo: TLabel;
    dbAnoModelo: TDBEdit;
    lblAnoFabricacao: TLabel;
    dbAnoFabricacao: TDBEdit;
    lblKilometragem: TLabel;
    dbKilometragem: TDBEdit;
    IbDtstTabelaSITUACAO_ATUAL_VEICULO: TIBStringField;
    IbDtstTabelaSITUACAO_HISTORICO_VEICULO: TMemoField;
    lblSituacaoVeiculo: TLabel;
    dbSituacaoVeiculo: TDBEdit;
    lblHistoricoSituacaoVeiculo: TLabel;
    dbHistoricoSituacaoVeiculo: TDBMemo;
    procedure FormCreate(Sender: TObject);
    procedure dbGrupoButtonClick(Sender: TObject);
    procedure dbSecaoButtonClick(Sender: TObject);
    procedure IbDtstTabelaBeforePost(DataSet: TDataSet);
    procedure dbUnidadeButtonClick(Sender: TObject);
    procedure dbCFOPButtonClick(Sender: TObject);
    procedure IbDtstTabelaNewRecord(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure DtSrcTabelaStateChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dbgDadosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbFabricanteButtonClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    fOrdenado : Boolean;
    fAliquota : TAliquota;
  public
    { Public declarations }
  end;

var
  frmGeProduto: TfrmGeProduto;

  procedure MostrarTabelaProdutos(const AOwner : TComponent; const TipoAliquota : TAliquota);

  function SelecionarProduto(const AOwner : TComponent; var Codigo : Integer; var Nome : String) : Boolean; overload;
  function SelecionarProduto(const AOwner : TComponent; var Codigo : Integer; var CodigoAlfa, Nome : String; const TipoAliquota : TAliquota = taICMS) : Boolean; overload;
  function SelecionarProduto(const AOwner : TComponent; var Codigo : Integer; var CodigoAlfa, Nome, sUnidade, CST : String; var iUnidade, CFOP : Integer; var Aliquota, ValorVenda, ValorPromocao, ValorIPI : Currency;
    var Estoque, Reserva : Integer; const TipoAliquota : TAliquota = taICMS) : Boolean; overload;
  function SelecionarProduto(const AOwner : TComponent; var Codigo : Integer; var CodigoAlfa, CodigoEAN, Nome : String; const TipoAliquota : TAliquota = taICMS) : Boolean; overload;
  function SelecionarProduto(const AOwner : TComponent; var Codigo : Integer; var CodigoAlfa, Nome, Unidade : String; var ValorVenda, ValorPromocao : Currency; const TipoAliquota : TAliquota = taICMS) : Boolean; overload;

implementation

uses UDMBusiness, UGeSecaoProduto, UGeGrupoProduto, UGeUnidade,
  UGeTabelaCFOP, UGeFabricante, UConstantesDGE;

{$R *.dfm}

procedure MostrarTabelaProdutos(const AOwner : TComponent; const TipoAliquota : TAliquota);
var
  frm : TfrmGeProduto;
begin
  frm := TfrmGeProduto.Create(AOwner);
  try
    frm.fAliquota := TipoAliquota;
    frm.ShowModal;
  finally
    frm.Destroy;
  end;
end;

function SelecionarProduto(const AOwner : TComponent; var Codigo : Integer; var Nome : String) : Boolean;
var
  frm : TfrmGeProduto;
begin
  frm := TfrmGeProduto.Create(AOwner);
  try
    Result := frm.SelecionarRegistro(Codigo, Nome);
  finally
    frm.Destroy;
  end;
end;

function SelecionarProduto(const AOwner : TComponent; var Codigo : Integer; var CodigoAlfa, Nome : String; const TipoAliquota : TAliquota = taICMS) : Boolean;
var
  frm : TfrmGeProduto;
  whr : String;
begin
  frm := TfrmGeProduto.Create(AOwner);
  try
    frm.fAliquota := TipoAliquota;

    frm.lblAliquotaTipo.Enabled := False;
    frm.dbAliquotaTipo.Enabled  := False;

    whr := 'p.Aliquota_tipo = ' + IntToStr(Ord(TipoAliquota));

    Result := frm.SelecionarRegistro(Codigo, Nome, whr);

    if ( Result ) then
      CodigoAlfa := frm.IbDtstTabelaCOD.Value;
  finally
    frm.Destroy;
  end;
end;

function SelecionarProduto(const AOwner : TComponent; var Codigo : Integer; var CodigoAlfa, Nome, sUnidade, CST : String; var iUnidade, CFOP : Integer; var Aliquota, ValorVenda, ValorPromocao, ValorIPI : Currency;
  var Estoque, Reserva : Integer; const TipoAliquota : TAliquota = taICMS) : Boolean; overload;
var
  frm : TfrmGeProduto;
  whr : String;
begin
  frm := TfrmGeProduto.Create(AOwner);
  try
    frm.fAliquota := TipoAliquota;

    frm.lblAliquotaTipo.Enabled := False;
    frm.dbAliquotaTipo.Enabled  := False;

    whr := 'p.Aliquota_tipo = ' + IntToStr(Ord(TipoAliquota));

    Result := frm.SelecionarRegistro(Codigo, Nome, whr);

    if ( Result ) then
    begin
      CodigoAlfa := frm.IbDtstTabelaCOD.AsString;
      iUnidade   := frm.IbDtstTabelaCODUNIDADE.AsInteger;
      sUnidade   := frm.IbDtstTabelaUNP_SIGLA.AsString;
      CST        := frm.IbDtstTabelaCST.AsString;
      CFOP       := frm.IbDtstTabelaCODCFOP.AsInteger;
      Aliquota   := frm.IbDtstTabelaALIQUOTA.AsCurrency;
      ValorVenda := frm.IbDtstTabelaPRECO.AsCurrency;
      ValorPromocao := frm.IbDtstTabelaPRECO_PROMOCAO.AsCurrency;
      ValorIPI   := frm.IbDtstTabelaVALOR_IPI.AsCurrency;

      Estoque := frm.IbDtstTabelaQTDE.AsInteger;
      Reserva := frm.IbDtstTabelaRESERVA.AsInteger;
    end;
  finally
    frm.Destroy;
  end;
end;

function SelecionarProduto(const AOwner : TComponent; var Codigo : Integer; var CodigoAlfa, CodigoEAN, Nome : String; const TipoAliquota : TAliquota = taICMS) : Boolean;
var
  frm : TfrmGeProduto;
  whr : String;
begin
  frm := TfrmGeProduto.Create(AOwner);
  try
    frm.fAliquota := TipoAliquota;

    frm.lblAliquotaTipo.Enabled := False;
    frm.dbAliquotaTipo.Enabled  := False;

    whr := 'p.Aliquota_tipo = ' + IntToStr(Ord(TipoAliquota));

    Result := frm.SelecionarRegistro(Codigo, Nome, whr);

    if ( Result ) then
    begin
      CodigoAlfa := frm.IbDtstTabelaCOD.Value;
      CodigoEAN  := frm.IbDtstTabelaCODBARRA_EAN.Value;
    end;
  finally
    frm.Destroy;
  end;
end;

function SelecionarProduto(const AOwner : TComponent; var Codigo : Integer; var CodigoAlfa, Nome, Unidade : String; var ValorVenda, ValorPromocao : Currency; const TipoAliquota : TAliquota = taICMS) : Boolean;
var
  frm : TfrmGeProduto;
  whr : String;
begin
  frm := TfrmGeProduto.Create(AOwner);
  try
    frm.fAliquota := TipoAliquota;

    frm.lblAliquotaTipo.Enabled := False;
    frm.dbAliquotaTipo.Enabled  := False;

    whr := 'p.Aliquota_tipo = ' + IntToStr(Ord(TipoAliquota));

    Result := frm.SelecionarRegistro(Codigo, Nome, whr);

    if ( Result ) then
    begin
      CodigoAlfa := frm.IbDtstTabelaCOD.AsString;
      Unidade    := frm.IbDtstTabelaUNIDADE.AsString;
      ValorVenda := frm.IbDtstTabelaPRECO.AsCurrency;
      ValorPromocao := frm.IbDtstTabelaPRECO_PROMOCAO.AsCurrency;
    end;
  finally
    frm.Destroy;
  end;
end;

procedure TfrmGeProduto.FormCreate(Sender: TObject);
begin
  inherited;
  ControlFirstEdit := dbCodigoEAN;

  fOrdenado := False;
  fAliquota := taICMS;

  tblEmpresa.Open;
  tblOrigem.Open;
  tblTributacaoNM.Open;
  tblTributacaoSN.Open;
  tblAliquota.Open;

  if ( GetSegmentoID(GetEmpresaIDDefault) = SEGMENTO_MERCADO_CARRO_ID ) then
  begin
    tblCor.Open;
    tblCombustivel.Open;
    tblTipoVeiculo.Open;
  end;

  DisplayFormatCodigo := '###0000000';

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
  IbDtstTabelaDESCRI_APRESENTACAO.AsString := Trim(IbDtstTabelaDESCRI.AsString + ' ' + IbDtstTabelaAPRESENTACAO.AsString);

  if ( IbDtstTabelaQTDE.AsInteger < 0 ) then
    IbDtstTabelaQTDE.Value := 0;

  if ( (IbDtstTabelaRESERVA.AsInteger < 0) or (IbDtstTabelaRESERVA.AsInteger > IbDtstTabelaQTDE.AsInteger) ) then
    IbDtstTabelaRESERVA.Value := 0;

  if ( IbDtstTabelaPRODUTO_NOVO.IsNull ) then
    IbDtstTabelaPRODUTO_NOVO.Value := 0;
    
  IbDtstTabelaDISPONIVEL.Value := IbDtstTabelaQTDE.Value - IbDtstTabelaRESERVA.Value;

  IbDtstTabelaCST.Value := IbDtstTabelaCODORIGEM.AsString + IbDtstTabelaCODTRIBUTACAO.AsString;

  if ( IbDtstTabela.State = dsInsert ) then
    if ( Trim(IbDtstTabelaCOD.AsString) = EmptyStr ) then
      IbDtstTabelaCOD.Value := FormatFloat(DisplayFormatCodigo, IbDtstTabelaCODIGO.AsInteger);

  if Trim(VarToStr(IbDtstTabelaSITUACAO_ATUAL_VEICULO.OldValue)) <> Trim(VarToStr(IbDtstTabelaSITUACAO_ATUAL_VEICULO.NewValue)) then
    if (Trim(VarToStr(IbDtstTabelaSITUACAO_ATUAL_VEICULO.OldValue)) <> EmptyStr) and (Trim(VarToStr(IbDtstTabelaSITUACAO_ATUAL_VEICULO.NewValue)) <> EmptyStr) then
      IbDtstTabelaSITUACAO_HISTORICO_VEICULO.AsString :=
        FormatDateTime('dd/mm/yyyy hh:mm', GetDateTimeDB)           + ' - '  +
        Trim(VarToStr(IbDtstTabelaSITUACAO_ATUAL_VEICULO.OldValue)) + ' -> ' +
        Trim(VarToStr(IbDtstTabelaSITUACAO_ATUAL_VEICULO.NewValue)) + ' (' + GetUserApp + ')' + #13 +
        Trim(IbDtstTabelaSITUACAO_HISTORICO_VEICULO.AsString);

  IbDtstTabelaDESCRICAO_COR.AsString         := dbCorVeiculo.Text;
  IbDtstTabelaDESCRICAO_COMBUSTIVEL.AsString := dbTipoCombustivel.Text;
  IbDtstTabelaMODELO_FABRICACAO.AsString     := dbAnoFabricacao.Text + '/' + dbAnoModelo.Text;
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

  if ( not tblTributacaoNM.IsEmpty ) then
    IbDtstTabelaCODTRIBUTACAO.Value := tblTributacaoNM.FieldByName('TPT_COD').AsString;

  IbDtstTabelaCST.Value      := IbDtstTabelaCODORIGEM.AsString + IbDtstTabelaCODTRIBUTACAO.AsString;
  IbDtstTabelaESTOQMIN.Value := 0;
  IbDtstTabelaQTDE.Value     := 0;
  IbDtstTabelaCUSTOMEDIO.Value := 0;
  IbDtstTabelaPRECO.Value      := 0;
  IbDtstTabelaCODCFOP.Value        := GetCfopIDDefault;
  IbDtstTabelaCFOP_DESCRICAO.Value := GetCfopNomeDefault;
  IbDtstTabelaALIQUOTA_TIPO.Value  := Ord(fAliquota);
  IbDtstTabelaALIQUOTA.Value       := 0;
  IbDtstTabelaALIQUOTA_CSOSN.Value := 0;
  IbDtstTabelaVALOR_IPI.Value      := 0;
  IbDtstTabelaRESERVA.Value        := 0;
  IbDtstTabelaPRODUTO_NOVO.Value   := 0;

  IbDtstTabelaCOR_VEICULO.Clear;
  IbDtstTabelaCOMBUSTIVEL_VEICULO.Clear;
  IbDtstTabelaTIPO_VEICULO.Clear;
  IbDtstTabelaRENAVAM_VEICULO.Clear;
  IbDtstTabelaCHASSI_VEICULO.Clear;
  IbDtstTabelaANO_MODELO_VEICULO.Clear;
  IbDtstTabelaANO_FABRICACAO_VEICULO.Clear;
end;

procedure TfrmGeProduto.FormShow(Sender: TObject);
var
  S : String;
begin
  S := StrDescricaoProduto;
  Case fAliquota of
    taICMS :
      Caption := 'Cadastro de ' + S;
    taISS :
      Caption := 'Cadastro de Serviços';
    else
      Caption := 'Cadastro de ' + S + '/Serviços';
  end;

  if (not fOrdenado) then
  begin
    IbDtstTabela.SelectSQL.Add( 'order by ' + CampoDescricao );
    fOrdenado := True;
  end;

  inherited;

  // Configurar Legendas de acordo com o segmento
  tbsEspecificacaoVeiculo.TabVisible := (GetSegmentoID(GetEmpresaIDDefault) = SEGMENTO_MERCADO_CARRO_ID);
  tbsHistoricoVeiculo.TabVisible     := (GetSegmentoID(GetEmpresaIDDefault) = SEGMENTO_MERCADO_CARRO_ID);

  if ( tbsEspecificacaoVeiculo.TabVisible ) then
  begin
    lblReferencia.Caption               := 'Placa:';
    IbDtstTabelaREFERENCIA.DisplayLabel := 'Placa';
  end;

  IbDtstTabelaCOR_VEICULO.Required         := tbsEspecificacaoVeiculo.TabVisible;
  IbDtstTabelaCOMBUSTIVEL_VEICULO.Required := tbsEspecificacaoVeiculo.TabVisible;
  IbDtstTabelaTIPO_VEICULO.Required    := tbsEspecificacaoVeiculo.TabVisible;
  IbDtstTabelaRENAVAM_VEICULO.Required := tbsEspecificacaoVeiculo.TabVisible;
  IbDtstTabelaCHASSI_VEICULO.Required  := tbsEspecificacaoVeiculo.TabVisible;
  IbDtstTabelaKILOMETRAGEM_VEICULO.Required   := tbsEspecificacaoVeiculo.TabVisible;
  IbDtstTabelaANO_MODELO_VEICULO.Required     := tbsEspecificacaoVeiculo.TabVisible;
  IbDtstTabelaANO_FABRICACAO_VEICULO.Required := tbsEspecificacaoVeiculo.TabVisible;

  with dbgDados do
  begin
    Columns[2].Visible  := not tbsEspecificacaoVeiculo.TabVisible;
    Columns[4].Visible  := tbsEspecificacaoVeiculo.TabVisible;
    Columns[5].Visible  := tbsEspecificacaoVeiculo.TabVisible;
    Columns[6].Visible  := tbsEspecificacaoVeiculo.TabVisible;
    Columns[7].Visible  := tbsEspecificacaoVeiculo.TabVisible;
    Columns[8].Visible  := tbsEspecificacaoVeiculo.TabVisible;
    Columns[9].Visible  := not tbsEspecificacaoVeiculo.TabVisible;
    Columns[12].Visible := not tbsEspecificacaoVeiculo.TabVisible;
  end;
end;

procedure TfrmGeProduto.DtSrcTabelaStateChange(Sender: TObject);
begin
  inherited;
  if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
    pgcMaisDados.ActivePageIndex := 0;
end;

procedure TfrmGeProduto.FormActivate(Sender: TObject);
begin
  inherited;

  case DMBusiness.ibdtstUsersCODFUNCAO.Value of
    1 : EvUA.UserID := 1;   // Diretoria
    2 : EvUA.UserID := 2;   // Gerente de Vendas
    3 : EvUA.UserID := 3;   // Gerente Financeiro
    4 : EvUA.UserID := 4;   // Vendedor
    5 : EvUA.UserID := 5;   // Gerente ADM
    6 : EvUA.UserID := 6;   // Caixa
    7 : EvUA.UserID := 7;   // Aux.Financeiro 1
    8 : EvUA.UserID := 8;   // Aux.Financeiro 2
    9 : EvUA.UserID := 9;   // Supervisor Caixa
    10: EvUA.UserID := 10;  // Estoquista
    11: EvUA.UserID := 11;  // TI
    12: EvUA.UserID := 12;  // Masterdados-Supervisor
  else
    ShowWarning('Falta cruzar nova função com EvUserID!');
  end;
  
end;

procedure TfrmGeProduto.dbgDadosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  // Destacar produtos em Promocao
  if ( IbDtstTabelaQTDE.AsInteger <= 0 ) then
    dbgDados.Canvas.Font.Color := lblProdutoSemEstoque.Font.Color
  else
  // Destacar produtos em Promocao
  if ( IbDtstTabelaPRECO_PROMOCAO.AsCurrency > 0 ) then
    dbgDados.Canvas.Font.Color := lblProdutoPromocao.Font.Color;
    
  dbgDados.DefaultDrawDataCell(Rect, dbgDados.Columns[DataCol].Field, State);
end;

procedure TfrmGeProduto.dbFabricanteButtonClick(Sender: TObject);
var
  iCodigo : Integer;
  sNome   : String;
begin
  if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
    if ( SelecionarFabricante(Self, iCodigo, sNome) ) then
    begin
      IbDtstTabelaCODFABRICANTE.AsInteger  := iCodigo;
      IbDtstTabelaNOME_FABRICANTE.AsString := sNome;
    end;
end;

procedure TfrmGeProduto.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    if ( (ActiveControl = dbProdutoNovo) and tbsEspecificacaoVeiculo.TabVisible ) then
    begin
      pgcMaisDados.ActivePage := tbsEspecificacaoVeiculo;
      dbTipoVeiculo.SetFocus;
      Exit;
    end
    else
    if ( (ActiveControl = dbKilometragem) and tbsHistoricoVeiculo.TabVisible ) then
    begin
      pgcMaisDados.ActivePage := tbsHistoricoVeiculo;
      dbSituacaoVeiculo.SetFocus;
      Exit;
    end;

  inherited;

end;

end.
