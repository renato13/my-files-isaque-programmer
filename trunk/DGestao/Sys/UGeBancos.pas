unit UGeBancos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadraoCadastro, ImgList, IBCustomDataSet, IBUpdateSQL, DB,
  Mask, DBCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls,
  ToolWin;

type
  TfrmGeBancos = class(TfrmGrPadraoCadastro)
    lblNome: TLabel;
    dbNome: TDBEdit;
    lblAgencia: TLabel;
    dbAgencia: TDBEdit;
    lblConta: TLabel;
    dbConta: TDBEdit;
    lblContrato: TLabel;
    dbContrato: TDBEdit;
    lblCarteira: TLabel;
    dbCarteira: TDBEdit;
    GrpBxDiretorios: TGroupBox;
    lblRemessa: TLabel;
    lblRetorno: TLabel;
    dbRemessa: TDBEdit;
    dbRetorno: TDBEdit;
    Bevel9: TBevel;
    GrpBxConfigCobreBemX: TGroupBox;
    lblConfiguracao1: TLabel;
    lblConfiguracao2: TLabel;
    lblNossoNumeroI: TLabel;
    lblNossoNumeroF: TLabel;
    lblNossoNumeroP: TLabel;
    lblProximaRemessa: TLabel;
    dbConfiguracao1: TDBEdit;
    dbConfiguracao2: TDBEdit;
    dbNossoNumeroI: TDBEdit;
    dbNossoNumeroF: TDBEdit;
    dbNossoNumeroP: TDBEdit;
    dbProximaRemessa: TDBEdit;
    IbDtstTabelaBCO_COD: TSmallintField;
    IbDtstTabelaBCO_CARTEIRA: TIBStringField;
    IbDtstTabelaBCO_NOME: TIBStringField;
    IbDtstTabelaBCO_CHAVE: TIBStringField;
    IbDtstTabelaBCO_AGENCIA: TIBStringField;
    IbDtstTabelaBCO_CC: TIBStringField;
    IbDtstTabelaBCO_NOSSO_NUM_INICIO: TIBStringField;
    IbDtstTabelaBCO_NOSSO_NUM_FINAL: TIBStringField;
    IbDtstTabelaBCO_NOSSO_NUM_PROXIMO: TIBStringField;
    IbDtstTabelaBCO_CONFG_1: TIBStringField;
    IbDtstTabelaBCO_CONFG_2: TIBStringField;
    IbDtstTabelaBCO_DIRETORIO_REMESSA: TIBStringField;
    IbDtstTabelaBCO_DIRETORIO_RETORNO: TIBStringField;
    IbDtstTabelaBCO_SEQUENCIAL_REM: TIntegerField;
    procedure FormCreate(Sender: TObject);
    procedure IbDtstTabelaNewRecord(DataSet: TDataSet);
    procedure IbDtstTabelaBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGeBancos: TfrmGeBancos;

  procedure MostrarTabelaBancos(const AOwner : TComponent);

implementation

uses UDMBusiness;

{$R *.dfm}

procedure MostrarTabelaBancos(const AOwner : TComponent);
var
  frm : TfrmGeBancos;
begin
  frm := TfrmGeBancos.Create(AOwner);
  try
    frm.ShowModal;
  finally
    frm.Destroy;
  end;
end;

procedure TfrmGeBancos.FormCreate(Sender: TObject);
begin
  inherited;
  ControlFirstEdit := dbCodigo;

  DisplayFormatCodigo := '0000';
  CampoCodigo    := 'bco_cod';
  CampoDescricao := 'bco_nome';
end;

procedure TfrmGeBancos.IbDtstTabelaNewRecord(DataSet: TDataSet);
begin
  inherited;
  IbDtstTabelaBCO_NOSSO_NUM_INICIO.Value  := FormatFloat('000000', 1);
  IbDtstTabelaBCO_NOSSO_NUM_FINAL.Value   := FormatFloat('000000', 999999);
  IbDtstTabelaBCO_NOSSO_NUM_PROXIMO.Value := FormatFloat('000000', 1);
  IbDtstTabelaBCO_SEQUENCIAL_REM.Value    := 1;
end;

procedure TfrmGeBancos.IbDtstTabelaBeforePost(DataSet: TDataSet);
begin
  try
    // Normalizando diretório de remessa

    IbDtstTabelaBCO_DIRETORIO_REMESSA.Value := Trim(IbDtstTabelaBCO_DIRETORIO_REMESSA.AsString);

    if ( IbDtstTabelaBCO_DIRETORIO_REMESSA.AsString = EmptyStr ) then
      IbDtstTabelaBCO_DIRETORIO_REMESSA.Value := 'C:\Remessa\';

    if ( Copy(IbDtstTabelaBCO_DIRETORIO_REMESSA.AsString, Length(IbDtstTabelaBCO_DIRETORIO_REMESSA.AsString), 1) <> '\' ) then
      IbDtstTabelaBCO_DIRETORIO_REMESSA.Value := IbDtstTabelaBCO_DIRETORIO_REMESSA.AsString + '\';

    ForceDirectories(IbDtstTabelaBCO_DIRETORIO_REMESSA.AsString);

    // Normalizando diretório de retorno

    IbDtstTabelaBCO_DIRETORIO_RETORNO.Value := Trim(IbDtstTabelaBCO_DIRETORIO_RETORNO.AsString);

    if ( IbDtstTabelaBCO_DIRETORIO_RETORNO.AsString = EmptyStr ) then
      IbDtstTabelaBCO_DIRETORIO_RETORNO.Value := 'C:\Retorno\';

    if ( Copy(IbDtstTabelaBCO_DIRETORIO_RETORNO.AsString, Length(IbDtstTabelaBCO_DIRETORIO_RETORNO.AsString), 1) <> '\' ) then
      IbDtstTabelaBCO_DIRETORIO_RETORNO.Value := IbDtstTabelaBCO_DIRETORIO_RETORNO.AsString + '\';

    ForceDirectories(IbDtstTabelaBCO_DIRETORIO_RETORNO.AsString);
    
    inherited;
  except
    On E : Exception do
    begin
      Application.MessageBox(PChar('Erro ao tentar salvar configurações de diretórios de arquivos.' + #13 + E.Message), 'Erro', MB_ICONERROR);
      Abort;
    end;
  end;
end;

end.
