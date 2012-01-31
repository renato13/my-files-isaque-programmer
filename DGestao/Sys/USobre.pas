unit USobre;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls;

type
  TfrmSobre = class(TForm)
    Panel1: TPanel;
    ProductName: TLabel;
    Version: TLabel;
    Copyright: TLabel;
    Comments: TLabel;
    OKButton: TButton;
    Label1: TLabel;
    Image1: TImage;
    Bevel1: TBevel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSobre: TfrmSobre;

implementation

uses UDMBusiness;

{$R *.dfm}

procedure TfrmSobre.FormCreate(Sender: TObject);
var
  sCNPJ : String;
begin
  if ( StrIsCNPJ(GetEmpresaIDDefault) ) then
    sCNPJ := StrFormatarCnpj(GetEmpresaIDDefault)
  else
    sCNPJ := StrFormatarCpf(GetEmpresaIDDefault);

  Version.Caption  := 'Versão ' + GetExeVersion( Application.ExeName );
  Comments.Caption := 'Licenciado a empresa ' + GetEmpresaNomeDefault + ' CPF/CNPJ.: ' + sCNPJ + ' em 01/02/2012.';
end;

end.
 
