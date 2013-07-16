unit UGeProdutoRotatividade;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadraoPesquisa, DB, IBCustomDataSet, IBQuery, Grids, DBGrids,
  StdCtrls, Buttons, ExtCtrls, Mask, rxToolEdit;

type
  TFrmGeProdutoRotatividade = class(TfrmGrPadraoPesquisa)
    lblData: TLabel;
    e1Data: TDateEdit;
    e2Data: TDateEdit;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure ConfigurarColunas;
  public
    { Public declarations }
  end;

var
  FrmGeProdutoRotatividade: TFrmGeProdutoRotatividade;

implementation

uses
  UDMBusiness, UConstantesDGE, UGrPadrao;

{$R *.dfm}

const
  TIPO_PRD = 0;
  TIPO_GRP = 1;
  TIPO_FOR = 2;

procedure TFrmGeProdutoRotatividade.ConfigurarColunas;
begin
  ;
end;

procedure TFrmGeProdutoRotatividade.FormCreate(Sender: TObject);
begin
  inherited;
  e1Data.Date := Date - 30;
  e2Data.Date := Date;

  ConfigurarColunas;
end;

initialization
  FormFunction.RegisterForm('FrmGeProdutoRotatividade', TFrmGeProdutoRotatividade);

end.
