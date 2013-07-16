unit UGeEfetuarLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, StdCtrls, Buttons,
  ExtCtrls, dxGDIPlusClasses;

type
  TFrmEfetuarLogin = class(TfrmGrPadraoLogin)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmEfetuarLogin: TFrmEfetuarLogin;

implementation

uses UDMBusiness, UPrinc;

{$R *.dfm}

procedure TFrmEfetuarLogin.FormCreate(Sender: TObject);
begin
  inherited;
  if ( DelphiIsRunning ) then
  begin
    Usuario := 'VIEIRA';
    Senha   := '12345';

    BtnEntrar.Click;
  end;
end;

end.
