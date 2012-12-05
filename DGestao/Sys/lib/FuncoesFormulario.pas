unit FuncoesFormulario;

interface

uses Classes, Forms, Controls;{, ConexaoDB, Basico, BasicoTela,  Windows, Messages, SysUtils, Variants,
Graphics, Dialogs, StdCtrls;
}

type
  TFormularios = class
  private

  public
    class function EstaAberto(sForm: String): Boolean;
    class function ShowModalForm(const AOnwer : TComponent; NomeForm: String): Boolean;
    class procedure ShowForm(const AOnwer : TComponent; NomeForm: String);
    class procedure RegisterForm(const aFormName: string; aFormClass: TComponentClass);
    class procedure FecharTodosForm;
end;

var
FForm: TForm;

implementation

uses FormFactoryU;

class function TFormularios.EstaAberto(sForm: String): Boolean;
var
  I: Integer;
begin
  // Verificar se já foi Chamada
  Result := True;
  for I := Screen.FormCount - 1 downto 0 do
    if Screen.Forms[i].name  = sForm then
    begin
      Result := False;
      Exit;
    end;
end;

class procedure TFormularios.FecharTodosForm;
var
I: Integer;
FForm: TForm;
begin
  // Fecha todos os formulários Abertos
  for I := Screen.FormCount - 1 downto 0 do
    if Screen.Forms[i].Name <> 'frmPrincipal' then
      if Assigned(Screen.Forms[i]) then
      begin
         FForm := Screen.Forms[i];
         FForm.Close;
      end;
end;

class procedure TFormularios.RegisterForm(const aFormName: string;
  aFormClass: TComponentClass);
begin
  _FormFactory.RegisterForm(aFormName, aFormClass);
end;

class procedure TFormularios.ShowForm(const AOnwer : TComponent; NomeForm: String);
begin
  if TFormularios.EstaAberto(NomeForm) then
    FForm := _FormFactory.CreateForm(AOnwer, NomeForm);
  FForm.Show;
end;

class function TFormularios.ShowModalForm(const AOnwer: TComponent;
  NomeForm: String): Boolean;
begin
  if TFormularios.EstaAberto(NomeForm) then
    FForm := _FormFactory.CreateForm(AOnwer, NomeForm);
  Result := (FForm.ShowModal = mrOk);
end;

end.

