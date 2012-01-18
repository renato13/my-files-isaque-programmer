unit UDMNFe;

interface

uses
  SysUtils, Classes, ACBrNFeDANFEClass, ACBrNFeDANFERave, ACBrNFe;

type
  TDMNFe = class(TDataModule)
    ACBrNFe: TACBrNFe;
    rvDANFE: TACBrNFeDANFERave;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMNFe: TDMNFe;

implementation

{$R *.dfm}

end.
