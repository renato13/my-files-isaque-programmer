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

  procedure ShowAbout(const AOwer : TComponent);

implementation

uses UDMBusiness, UFuncoes;

{$R *.dfm}

procedure ShowAbout(const AOwer : TComponent);
var
  frm : TfrmSobre;
begin
  frm := TfrmSobre.Create(AOwer);
  try
    frm.ShowModal;
  finally
    frm.Free;
  end;
end;

procedure TfrmSobre.FormCreate(Sender: TObject);
var
  sCNPJ : String;
begin
  if ( StrIsCNPJ(GetEmpresaIDDefault) ) then
    sCNPJ := StrFormatarCnpj(GetEmpresaIDDefault)
  else
    sCNPJ := StrFormatarCpf(GetEmpresaIDDefault);

  Version.Caption  := 'Versão ' + GetExeVersion;
  Comments.Caption := 'Licenciado a empresa ' + GetEmpresaNomeDefault + ' CPF/CNPJ.: ' + sCNPJ + ' em 01/02/2012.';
end;

end.
 
