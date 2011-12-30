unit UDMBusiness;

interface

uses
  Windows, Forms, SysUtils, Classes, IBDatabase, DB, IBCustomDataSet, IniFIles,
  IBQuery, RpDefine, RpRave;

type
  TDMBusiness = class(TDataModule)
    ibdtbsBusiness: TIBDatabase;
    ibtrnsctnBusiness: TIBTransaction;
    dtsrcAjustEstoq: TDataSource;
    ibdtstAjustEstoq: TIBDataSet;
    ibdtstProduto: TIBDataSet;
    ibdtstFornec: TIBDataSet;
    ibdtstAjustEstoqCODPROD: TIBStringField;
    ibdtstAjustEstoqCODFORN: TIntegerField;
    ibdtstAjustEstoqQTDEATUAL: TIntegerField;
    ibdtstAjustEstoqQTDENOVA: TIntegerField;
    ibdtstAjustEstoqQTDEFINAL: TIntegerField;
    ibdtstAjustEstoqMOTIVO: TIBStringField;
    ibdtstAjustEstoqDOC: TIBStringField;
    ibdtstAjustEstoqDTAJUST: TDateTimeField;
    ibdtstAjustEstoqLookProdNome: TStringField;
    ibdtstAjustEstoqLookProdQtde: TIntegerField;
    ibdtstAjustEstoqLookFornec: TStringField;
    qryBusca: TIBQuery;
    raveReport: TRvProject;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMBusiness: TDMBusiness;

  FileINI : TIniFile;

  procedure ShowInformation(sMsg : String);
  procedure ShowWarning(sMsg : String);
  procedure ShowError(sMsg : String);
  procedure UpdateSequence(GeneratorName, NomeTabela, CampoChave : String);

  function GetPaisIDDefault : String;
  function GetEstadoIDDefault : Integer;
  function GetCidadeIDDefault : Integer;
  function GetPaisNomeDefault : String;
  function GetEstadoNomeDefault : String;
  function GetCidadeNomeDefault : String;
  function GetNextID(NomeTabela, CampoChave : String) : Largeint;

const
  DB_USER_NAME     = 'SYSDBA';
  DB_USER_PASSWORD = 'masterkey';
  DB_LC_CTYPE      = 'ISO8859_2';

implementation

{$R *.dfm}

procedure ShowInformation(sMsg : String);
begin
  Application.MessageBox(PChar(sMsg), 'Informação', MB_ICONINFORMATION);
end;

procedure ShowWarning(sMsg : String);
begin
  Application.MessageBox(PChar(sMsg), 'Alerta', MB_ICONWARNING);
end;

procedure ShowError(sMsg : String);
begin
  Application.MessageBox(PChar(sMsg), 'Erro', MB_ICONERROR);
end;

procedure UpdateSequence(GeneratorName, NomeTabela, CampoChave : String);
var
  ID : Largeint;
begin
  with DMBusiness, qryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select max(' + CampoChave + ') as ID from ' + NomeTabela);
    Open;

    ID := FieldByName('ID').AsInteger;

    Close;
    SQL.Clear;
    SQL.Add('ALTER SEQUENCE ' + GeneratorName + ' RESTART WITH ' + IntToStr(ID));
    ExecSQL;
  end;
end;

function GetPaisIDDefault : String;
begin
  Result := FileINI.ReadString('Default', 'PaisID', '01058');
end;

function GetEstadoIDDefault : Integer;
begin
  Result := FileINI.ReadInteger('Default', 'EstadoID', 15);
end;

function GetCidadeIDDefault : Integer;
begin
  Result := FileINI.ReadInteger('Default', 'CidadeID', 170);
end;

function GetPaisNomeDefault : String;
begin
  with DMBusiness, qryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select pais_nome from TBPAIS where pais_id = ' + QuotedStr(GetPaisIDDefault));
    Open;

    Result := FieldByName('pais_nome').AsString;

    Close;
  end;
end;

function GetEstadoNomeDefault : String;
begin
  with DMBusiness, qryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select est_nome from TBESTADO where est_cod = ' + IntToStr(GetEstadoIDDefault));
    Open;

    Result := FieldByName('est_nome').AsString;

    Close;
  end;
end;

function GetCidadeNomeDefault : String;
begin
  with DMBusiness, qryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select cid_nome from TBCIDADE where cid_cod = ' + IntToStr(GetCidadeIDDefault));
    Open;

    Result := FieldByName('cid_nome').AsString;

    Close;
  end;
end;


function GetNextID(NomeTabela, CampoChave : String) : Largeint;
begin
  with DMBusiness, qryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select max(' + CampoChave + ') as ID from ' + NomeTabela);
    Open;

    Result := FieldByName('ID').AsInteger + 1;
  end;
end;

procedure TDMBusiness.DataModuleCreate(Sender: TObject);
begin
  try

    with ibdtbsBusiness, FileINI do
    begin
      Connected    := False;
      DatabaseName := ReadString('Conexao', 'Servidor', EmptyStr) + ':' + ReadString('Conexao', 'Base', EmptyStr);
      Params.Clear;
      Params.Add('user_name=' + DB_USER_NAME);
      Params.Add('password='  + DB_USER_PASSWORD);
      Params.Add('lc_ctype='  + DB_LC_CTYPE);
      Connected    := True;
    end;

  except
    On E : Exception do
      ShowError('Erro ao tentar conectar no Servidor/Base.' + #13#13 + E.Message);
  end;
end;

end.
