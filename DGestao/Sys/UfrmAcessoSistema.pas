unit UfrmAcessoSistema;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadrao, StdCtrls, ExtCtrls, Buttons, DB;

type
  TfrmAcessoSistema = class(TfrmGrPadrao)
    lblNome: TLabel;
    lblSenha: TLabel;
    imgLogo: TImage;
    edNome: TEdit;
    edSenha: TEdit;
    pnlMensagem: TPanel;
    Bevel1: TBevel;
    btbtnEntrar: TBitBtn;
    procedure spdbtnEntrarClick(Sender: TObject);
    procedure edNomeExit(Sender: TObject);
    procedure btbtnEntrarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edSenhaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAcessoSistema: TfrmAcessoSistema;

implementation

uses UPrinc, UDMBusiness;

var Contador :integer;

{$R *.dfm}

procedure TfrmAcessoSistema.spdbtnEntrarClick(Sender: TObject);
var
  vSenha : TstringField;
begin
  inherited;

 if not DMBusiness.ibdtstUsers.Locate('NOME',edNome.Text,[]) then
   begin
    pnlMensagem.Caption:='Entrada recusada ... USUÁRIO DESCONHECIDO!';
    inc(Contador);
    if contador=3 then frmPrinc.close;
    edNome.setfocus;
    Exit;
   end;

 vSenha := DMBusiness.ibdtstUsersSENHA as tStringfield;

 if vSenha.Value<> edSenha.Text then
   begin
    pnlMensagem.Caption:='Entrada recusada ... SENHA INVÁLIDA!';
    inc(Contador);
    if Contador=3 then frmPrinc.close;
    edSenha.setfocus;
    Exit;
   end;
 frmPrinc.Enabled := True;
 frmPrinc.stbMain.Panels[1].Text := 'Usuário: ' + edNome.Text;
 frmAcessoSistema.Release;

end;

procedure TfrmAcessoSistema.edNomeExit(Sender: TObject);
begin
  inherited;
 pnlMensagem.Caption :=''
end;

procedure TfrmAcessoSistema.btbtnEntrarClick(Sender: TObject);
var vSenha :TstringField;
begin
  inherited;

 if not DMBusiness.ibdtstUsers.Locate('NOME',edNome.Text,[]) then
   begin
    pnlMensagem.Caption:='Entrada recusada ... USUÁRIO DESCONHECIDO!';
    inc(Contador);
    if contador=3 then frmPrinc.close;
    edNome.setfocus;
    Exit;
   end;

 vSenha := DMBusiness.ibdtstUsersSENHA as tStringfield;

 if vSenha.Value<>edSenha.Text then
   begin
    pnlMensagem.Caption:='Entrada recusada ... SENHA INVÁLIDA!';
    inc(Contador);
    if Contador=3 then frmPrinc.close;
    edSenha.setfocus;
    Exit;
   end;
 frmPrinc.Enabled := True;
 frmPrinc.stbMain.Panels[1].Text := 'Usuário: ' + edNome.Text;
 frmAcessoSistema.Release;

end;

procedure TfrmAcessoSistema.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Application.Terminate;
end;

procedure TfrmAcessoSistema.edSenhaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = 13 then
    btbtnEntrarClick(Sender);
end;

procedure TfrmAcessoSistema.FormShow(Sender: TObject);
begin
  inherited;
  if ( DelphiIsRunning ) then
  begin
//    edNome.Text  := 'FERREIRA';
//    edSenha.Text := 'PONTOLUZ';
    edNome.Text  := 'ISAQUE';
    edSenha.Text := '123';

    btbtnEntrar.Click;
  end;
end;

end.
