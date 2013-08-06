unit UGeConfiguracaoEmpresa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadraoCadastro, ImgList, IBCustomDataSet, IBUpdateSQL, DB,
  Mask, DBCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls,
  ToolWin;

type
  TfrmGeConfiguracaoEmpresa = class(TfrmGrPadraoCadastro)
    lblNome: TLabel;
    dbNome: TDBEdit;
    IbDtstTabelaEMPRESA: TIBStringField;
    IbDtstTabelaEMAIL_CONTA: TIBStringField;
    IbDtstTabelaEMAIL_SENHA: TIBStringField;
    IbDtstTabelaEMAIL_POP: TIBStringField;
    IbDtstTabelaEMAIL_SMTP: TIBStringField;
    IbDtstTabelaEMAIL_ASSUNTO_PADRAO: TIBStringField;
    IbDtstTabelaEMAIL_MENSAGEM_PADRAO: TIBStringField;
    IbDtstTabelaRZSOC: TIBStringField;
    IbDtstTabelaNMFANT: TIBStringField;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses UConstantesDGE, UDMBusiness;

{$R *.dfm}

procedure TfrmGeConfiguracaoEmpresa.FormCreate(Sender: TObject);
begin
  inherited;
  ControlFirstEdit := dbNome;
  
  NomeTabela     := 'TBCONFIGURACAO';
  CampoCodigo    := 'EMPRESA';
  CampoDescricao := 'e.RZSOC';

  UpdateGenerator;
end;

initialization
  FormFunction.RegisterForm('frmGeConfiguracaoEmpresa', TfrmGeConfiguracaoEmpresa);

end.
