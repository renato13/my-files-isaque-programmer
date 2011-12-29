unit UGeCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadraoCadastro, ImgList, IBCustomDataSet, IBUpdateSQL, DB,
  Mask, DBCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls,
  ToolWin, IBTable, ToolEdit, RXDBCtrl;

type
  TfrmGeCliente = class(TfrmGrPadraoCadastro)
    IbDtstTabelaCODIGO: TIntegerField;
    IbDtstTabelaPESSOA_FISICA: TSmallintField;
    IbDtstTabelaCNPJ: TIBStringField;
    IbDtstTabelaENDER: TIBStringField;
    IbDtstTabelaCOMPLEMENTO: TIBStringField;
    IbDtstTabelaNUMERO_END: TIBStringField;
    IbDtstTabelaCEP: TIBStringField;
    IbDtstTabelaCIDADE: TIBStringField;
    IbDtstTabelaUF: TIBStringField;
    IbDtstTabelaFONE: TIBStringField;
    IbDtstTabelaTLG_TIPO: TSmallintField;
    IbDtstTabelaLOG_COD: TIntegerField;
    IbDtstTabelaBAI_COD: TIntegerField;
    IbDtstTabelaCID_COD: TIntegerField;
    IbDtstTabelaEST_COD: TSmallintField;
    IbDtstTabelaLOGRADOURO: TIBStringField;
    IbDtstTabelaBAIRRO: TIBStringField;
    IbDtstTabelaEMAIL: TIBStringField;
    dbPessoaFisica: TDBCheckBox;
    lblCNPJ: TLabel;
    dbCNPJ: TDBEdit;
    lblRazao: TLabel;
    dbRazao: TDBEdit;
    lblIE: TLabel;
    dbIE: TDBEdit;
    lblIM: TLabel;
    dbIM: TDBEdit;
    GroupBox1: TGroupBox;
    lblCidade: TLabel;
    dbCidade: TRxDBComboEdit;
    Bevel5: TBevel;
    lblEstado: TLabel;
    dbEstado: TRxDBComboEdit;
    pgcMaisDados: TPageControl;
    tbsContato: TTabSheet;
    tbsCondicoes: TTabSheet;
    lblBairro: TLabel;
    dbBairro: TRxDBComboEdit;
    lblLogradouro: TLabel;
    dbLogradouro: TRxDBComboEdit;
    lblCEP: TLabel;
    dbCEP: TDBEdit;
    lblNumero: TLabel;
    dbNumero: TDBEdit;
    lblComplemento: TLabel;
    dbComplemento: TDBEdit;
    lblFone: TLabel;
    dbFone: TDBEdit;
    lblEmail: TLabel;
    dbEmail: TDBEdit;
    lblHome: TLabel;
    dbHome: TDBEdit;
    IbDtstTabelaPAIS_ID: TIBStringField;
    IbDtstTabelaEST_NOME: TIBStringField;
    IbDtstTabelaCID_NOME: TIBStringField;
    IbDtstTabelaPAIS_NOME: TIBStringField;
    IbDtstTabelaNOME: TIBStringField;
    IbDtstTabelaINSCEST: TIBStringField;
    IbDtstTabelaINSCMUN: TIBStringField;
    IbDtstTabelaSITE: TIBStringField;
    lblPais: TLabel;
    dbPais: TRxDBComboEdit;
    procedure ProximoCampoKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure dbEstadoButtonClick(Sender: TObject);
    procedure dbCidadeButtonClick(Sender: TObject);
    procedure dbBairroButtonClick(Sender: TObject);
    procedure dbLogradouroButtonClick(Sender: TObject);
    procedure IbDtstTabelaNewRecord(DataSet: TDataSet);
    procedure DtSrcTabelaStateChange(Sender: TObject);
    procedure DtSrcTabelaDataChange(Sender: TObject; Field: TField);
    procedure btbtnSalvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGeCliente: TfrmGeCliente;

  procedure MostrarTabelaClientes(const AOwner : TComponent);

implementation

uses UDMBusiness, UGeBairro, UGeCidade, UGeDistrito, UGeEstado,
  UGeLogradouro, UGrPadrao;

{$R *.dfm}

procedure MostrarTabelaClientes(const AOwner : TComponent);
var
  frm : TfrmGeCliente;
begin
  frm := TfrmGeCliente.Create(AOwner);
  try
    frm.ShowModal;
  finally
    frm.Destroy;
  end;
end;

procedure TfrmGeCliente.FormCreate(Sender: TObject);
begin
  inherited;
  NomeTabela     := 'TBCLIENTE';
  CampoCodigo    := 'codigo';
  CampoDescricao := 'nome';

  UpdateGenerator;

  pgcMaisDados.ActivePageIndex := 0;
end;

procedure TfrmGeCliente.ProximoCampoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if ( Key = #13 ) then
  begin
    if ( Sender = dbHome ) then
      pgcMaisDados.SelectNextPage(False);
  end;
end;

procedure TfrmGeCliente.dbEstadoButtonClick(Sender: TObject);
var
  iEstado : Integer;
  sEstado ,
  sUF     : String;
begin
  if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
    if ( SelecionarEstado(Self, iEstado, sEstado, sUF) ) then
    begin
      IbDtstTabelaEST_COD.AsInteger := iEstado;
      IbDtstTabelaEST_NOME.AsString := sEstado;
      IbDtstTabelaUF.AsString       := sUF;
    end;
end;

procedure TfrmGeCliente.dbCidadeButtonClick(Sender: TObject);
var
  iCidade : Integer;
  sCidade : String;
begin
  if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
    if ( IbDtstTabelaEST_COD.AsInteger = 0 ) then
    begin
      ShowWarning('Favor informar o Estado primeiramente!');
      dbEstado.SetFocus;
    end
    else
    if ( SelecionarCidade(Self, IbDtstTabelaEST_COD.AsInteger, iCidade, sCidade) ) then
    begin
      IbDtstTabelaCID_COD.AsInteger := iCidade;
      IbDtstTabelaCID_NOME.AsString := sCidade;
      IbDtstTabelaCIDADE.AsString   := sCidade + ' (' + IbDtstTabelaUF.AsString + ')';
    end;
end;

procedure TfrmGeCliente.dbBairroButtonClick(Sender: TObject);
var
  iBairro : Integer;
  sBairro : String;
begin
  if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
    if ( IbDtstTabelaCID_COD.AsInteger = 0 ) then
    begin
      ShowWarning('Favor informar a Cidade primeiramente!');
      dbCidade.SetFocus;
    end
    else
    if ( SelecionarBairro(Self, IbDtstTabelaCID_COD.AsInteger, iBairro, sBairro) ) then
    begin
      IbDtstTabelaBAI_COD.AsInteger := iBairro;
      IbDtstTabelaBAIRRO.AsString   := sBairro;
    end;
end;

procedure TfrmGeCliente.dbLogradouroButtonClick(Sender: TObject);
var
  iTipo : Smallint;
  sTipo : String;
  iLogradouro : Integer;
  sLogradouro : String;
begin
  if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
    if ( IbDtstTabelaCID_COD.AsInteger = 0 ) then
    begin
      ShowWarning('Favor informar a Cidade primeiramente!');
      dbCidade.SetFocus;
    end
    else
    if ( SelecionarLogradouro(Self, IbDtstTabelaCID_COD.AsInteger, iTipo, sTipo, iLogradouro, sLogradouro) ) then
    begin
      IbDtstTabelaTLG_TIPO.AsInteger  := iTipo;
      IbDtstTabelaLOG_COD.AsInteger   := iLogradouro;
      IbDtstTabelaLOGRADOURO.AsString := Trim(sTipo + ' ' + sLogradouro);
      IbDtstTabelaENDER.AsString      := Trim(sTipo + ' ' + sLogradouro);
    end;
end;

procedure TfrmGeCliente.IbDtstTabelaNewRecord(DataSet: TDataSet);
begin
  inherited;
  IbDtstTabelaPESSOA_FISICA.AsInteger := 1;
  IbDtstTabelaPAIS_ID.AsString        := GetPaisIDDefault;
  IbDtstTabelaPAIS_NOME.AsString      := GetPaisNomeDefault;
end;

procedure TfrmGeCliente.DtSrcTabelaStateChange(Sender: TObject);
begin
  inherited;
  if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
    if ( IbDtstTabelaPESSOA_FISICA.AsInteger = 1 ) then
      IbDtstTabelaCNPJ.EditMask := '000.000.000-00;0; '
    else
      IbDtstTabelaCNPJ.EditMask := '00.000.000/0000-00;0; '
  else
    IbDtstTabelaCNPJ.EditMask := '';
end;

procedure TfrmGeCliente.DtSrcTabelaDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  if ( Field = IbDtstTabela.FieldByName('PESSOA_FISICA') ) then
    if ( IbDtstTabelaPESSOA_FISICA.AsInteger = 1 ) then
      IbDtstTabelaCNPJ.EditMask := '000.000.000-00;0; '
    else
      IbDtstTabelaCNPJ.EditMask := '00.000.000/0000-00;0; ';
end;

procedure TfrmGeCliente.btbtnSalvarClick(Sender: TObject);
begin
  if ( IbDtstTabelaPESSOA_FISICA.AsInteger = 1 ) then
    if ( not FuncoesString.StrIsCPF(IbDtstTabelaCNPJ.AsString) ) then
    begin
      ShowWarning('Favor informar um CPF válido.');
      Abort;
    end;

  if ( IbDtstTabelaPESSOA_FISICA.AsInteger = 0 ) then
    if ( not FuncoesString.StrIsCNPJ(IbDtstTabelaCNPJ.AsString) ) then
    begin
      ShowWarning('Favor informar um CNPJ válido.');
      Abort;
    end;

  inherited;
end;

end.
