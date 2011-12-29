program RemessaBoleto;

uses
  Forms,
  UGrRemessaBoletos in 'UGrRemessaBoletos.pas' {frmGrRemessaBoleto},
  UDmCoTransp in 'UDmCoTransp.pas' {Dm: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmGrRemessaBoleto, frmGrRemessaBoleto);
  Application.CreateForm(TDm, Dm);
  Application.Run;
end.
