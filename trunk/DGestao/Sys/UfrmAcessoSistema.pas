unit UfrmAcessoSistema;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadrao, StdCtrls, ExtCtrls, Buttons, DB;

type
  TfrmAcessoSistema = class(TfrmGrPadrao)
    iblnome: TLabel;
    iblsenha: TLabel;
    Image2: TImage;
    edtNome: TEdit;
    edtSenha: TEdit;
    pnlMensagem: TPanel;
    Bevel1: TBevel;
    btbtnEntrar: TBitBtn;
    procedure spdbtnEntrarClick(Sender: TObject);
    procedure edtNomeExit(Sender: TObject);
    procedure btbtnEntrarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
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
var vSenha :TstringField;
begin
  inherited;

 if not DMBusiness.ibdtstUsers.Locate('NOME',edtNome.Text,[]) then
   begin
    pnlMensagem.Caption:='Entrada recusada ... USUÁRIO DESCONHECIDO!';
    inc(Contador);
    if contador=3 then frmPrinc.close;
    edtNome.setfocus;
    Exit;
   end;

 vSenha := DMBusiness.ibdtstUsersSENHA as tStringfield;

 if vSenha.Value<>edtSenha.Text then
   begin
    pnlMensagem.Caption:='Entrada recusada ... SENHA INVÁLIDA!';
    inc(Contador);
    if Contador=3 then frmPrinc.close;
    edtSenha.setfocus;
    Exit;
   end;
 frmPrinc.Enabled := True;
 frmPrinc.StatusBar1.Panels[1].Text := 'Usuário: ' + edtNome.Text;
 frmAcessoSistema.Release;

end;

procedure TfrmAcessoSistema.edtNomeExit(Sender: TObject);
begin
  inherited;
 pnlMensagem.Caption :=''
end;

procedure TfrmAcessoSistema.btbtnEntrarClick(Sender: TObject);
var vSenha :TstringField;
begin
  inherited;

 if not DMBusiness.ibdtstUsers.Locate('NOME',edtNome.Text,[]) then
   begin
    pnlMensagem.Caption:='Entrada recusada ... USUÁRIO DESCONHECIDO!';
    inc(Contador);
    if contador=3 then frmPrinc.close;
    edtNome.setfocus;
    Exit;
   end;

 vSenha := DMBusiness.ibdtstUsersSENHA as tStringfield;

 if vSenha.Value<>edtSenha.Text then
   begin
    pnlMensagem.Caption:='Entrada recusada ... SENHA INVÁLIDA!';
    inc(Contador);
    if Contador=3 then frmPrinc.close;
    edtSenha.setfocus;
    Exit;
   end;
 frmPrinc.Enabled := True;
 frmPrinc.StatusBar1.Panels[1].Text := 'Usuário: ' + edtNome.Text;
 frmAcessoSistema.Release;

end;

procedure TfrmAcessoSistema.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Application.Terminate;
end;

end.
