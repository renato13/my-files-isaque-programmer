unit UGeUnidade;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadraoCadastro, ImgList, IBCustomDataSet, IBUpdateSQL, DB,
  Mask, DBCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls,
  ToolWin;

type
  TfrmGeUnidade = class(TfrmGrPadraoCadastro)
    lblNome: TLabel;
    dbNome: TDBEdit;
    IbDtstTabelaUNP_COD: TSmallintField;
    IbDtstTabelaUNP_DESCRICAO: TIBStringField;
    IbDtstTabelaUNP_SIGLA: TIBStringField;
    lblSigla: TLabel;
    dbSigla: TDBEdit;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGeUnidade: TfrmGeUnidade;

  procedure MostrarTabelaUnidades(const AOwner : TComponent);
  function SelecionarUnidade(const AOwner : TComponent; var Codigo : Integer; var Nome : String) : Boolean;

implementation

uses UDMBusiness;

{$R *.dfm}

procedure MostrarTabelaUnidades(const AOwner : TComponent);
var
  frm : TfrmGeUnidade;
begin
  frm := TfrmGeUnidade.Create(AOwner);
  try
    frm.ShowModal;
  finally
    frm.Destroy;
  end;
end;

function SelecionarUnidade(const AOwner : TComponent; var Codigo : Integer; var Nome : String) : Boolean;
var
  frm : TfrmGeUnidade;
begin
  frm := TfrmGeUnidade.Create(AOwner);
  try
    Result := frm.SelecionarRegistro(Codigo, Nome);
  finally
    frm.Destroy;
  end;
end;

procedure TfrmGeUnidade.FormCreate(Sender: TObject);
begin
  inherited;
  DisplayFormatCodigo := '000';
  NomeTabela     := 'TBUNIDADEPROD';
  CampoCodigo    := 'UNP_COD';
  CampoDescricao := 'UNP_DESCRICAO';

  UpdateGenerator;
end;

end.
