unit UDmCoTransp;

interface

uses
  SysUtils, Classes, IBDatabase, DB, IBCustomDataSet, IBQuery, IniFiles, Forms, Dialogs;

type
  TDm = class(TDataModule)
    ibDtbsDVM: TIBDatabase;
    ibTrnsctnDVM: TIBTransaction;
    qryEmpresa: TIBQuery;
    dtsrcEmpresa: TDataSource;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Dm: TDm;

implementation

  type
    IniExcecao = class(Exception);

{$R *.dfm}

procedure TDm.DataModuleCreate(Sender: TObject);
var
  IniConf : TIniFile;
  sCaminho, sIPServidor : String;

begin
 iniConf     := TiniFile.Create( ExtractFilePath ( Application.ExeName) + 'ConexaoBD.ini');
 sIPServidor := iniConf.ReadString('BANCO DE DADOS','Servidor','');
 sCaminho    := iniConf.ReadString('BANCO DE DADOS','Caminho','');

 if not FileExists('ConexaoBD.ini') then raise IniExcecao.Create('Arquivo CONEXAOBD.INI inexistente!!!');

 try
   ibDtbsDVM.DatabaseName := sIPServidor +':'+sCaminho;
   ibDtbsDVM.Params.Clear;
//   ibDtbsDVM.Params.Add('user_name=sysdba');
//   ibDtbsDVM.Params.Add('password=meio=a1/2');
   ibDtbsDVM.Params.Add('user_name=sysdba');
   ibDtbsDVM.Params.Add('password=masterkey');
   ibDtbsDVM.Params.Add('lc_ctype=ISO8859_2');
   ibDtbsDVM.LoginPrompt := false;
   ibDtbsDVM.Open;
   ibTrnsctnDVM.Active := True;
   qryEmpresa.Open;

 except
   on e:EDatabaseError do Application.MessageBox('NÃO FOI POSSÍVEL CONECTAR COM O BANCO DE DADOS!!!'+#13+
   '* Verifique os parâmetros ou ligue para Suporte da Masterdados (91)3031-7707 *', 'ERRO BANCO DE DADOS...');
 end; //try;

   {ibDtbsDVM.Params.Add('user_name=sysdba');
   ibDtbsDVM.Params.Add('password=meio=a1/2');
   ibDtbsDVM.Params.Add('lc_ctype=ISO8859_2');
   ibDtbsDVM.DatabaseName := 'C:\Masterdados\MERCSALES.FDB';
   ibDtbsDVM.LoginPrompt := false;
   ibDtbsDVM.Open;
   ibTrnsctnDVM.Active := True;
   qryEmpresa.Open;}

end;

end.
