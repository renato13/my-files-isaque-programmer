program GerarBoleto;

uses
  Forms,
  UGrGerarBoletos in 'UGrGerarBoletos.pas' {frmGrGerarBoleto},
  UDmCoTransp in 'UDmCoTransp.pas' {Dm: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDm, Dm);
  Application.CreateForm(TfrmGrGerarBoleto, frmGrGerarBoleto);
  Application.Run;
end.
