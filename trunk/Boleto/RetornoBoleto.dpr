program RetornoBoleto;

uses
  Forms,
  UGrRetornoBoletos in 'UGrRetornoBoletos.pas' {frmGrRetornoBoleto},
  UDmCoTransp in 'UDmCoTransp.pas' {Dm: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDm, Dm);
  Application.CreateForm(TfrmGrRetornoBoleto, frmGrRetornoBoleto);
  Application.Run;
end.
