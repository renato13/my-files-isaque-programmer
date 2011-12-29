program Bancos;

uses
  Forms,
  UGrBancos in 'UGrBancos.pas' {frmGrBancos},
  UDmCoTransp in 'UDmCoTransp.pas' {Dm: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDm, Dm);
  Application.CreateForm(TfrmGrBancos, frmGrBancos);
  Application.Run;
end.
