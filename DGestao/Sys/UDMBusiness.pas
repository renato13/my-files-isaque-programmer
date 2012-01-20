unit UDMBusiness;

interface

uses
  Windows, Forms, SysUtils, Classes, IBDatabase, DB, IBCustomDataSet, IniFIles,
  IBQuery, RpDefine, RpRave, frxClass, frxDBSet;

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
    qryEmpresa: TIBQuery;
    qryEmpresaCODIGO: TIntegerField;
    qryEmpresaPESSOA_FISICA: TSmallintField;
    qryEmpresaCNPJ: TIBStringField;
    qryEmpresaRZSOC: TIBStringField;
    qryEmpresaNMFANT: TIBStringField;
    qryEmpresaIE: TIBStringField;
    qryEmpresaIM: TIBStringField;
    qryEmpresaFONE: TIBStringField;
    qryEmpresaLOGO: TBlobField;
    qryEmpresaTLG_TIPO: TSmallintField;
    qryEmpresaTLG_DESCRICAO: TIBStringField;
    qryEmpresaTLG_SIGLA: TIBStringField;
    qryEmpresaLOG_COD: TIntegerField;
    qryEmpresaLOG_NOME: TIBStringField;
    qryEmpresaCOMPLEMENTO: TIBStringField;
    qryEmpresaNUMERO_END: TIBStringField;
    qryEmpresaCEP: TIBStringField;
    qryEmpresaBAI_COD: TIntegerField;
    qryEmpresaBAI_NOME: TIBStringField;
    qryEmpresaCID_COD: TIntegerField;
    qryEmpresaCID_NOME: TIBStringField;
    qryEmpresaCID_SIAFI: TIntegerField;
    qryEmpresaCID_IBGE: TIntegerField;
    qryEmpresaCID_DDD: TSmallintField;
    qryEmpresaEST_COD: TSmallintField;
    qryEmpresaEST_NOME: TIBStringField;
    qryEmpresaEST_SIGLA: TIBStringField;
    qryEmpresaEST_SIAFI: TIntegerField;
    qryEmpresaEMAIL: TIBStringField;
    qryEmpresaHOME_PAGE: TIBStringField;
    qryEmpresaCHAVE_ACESSO_NFE: TIBStringField;
    qryEmpresaPAIS_ID: TIBStringField;
    qryEmpresaPAIS_NOME: TIBStringField;
    frdEmpresa: TfrxDBDataset;
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
  procedure UpdateSequence(GeneratorName, NomeTabela, CampoChave : String; const sWhr : String = '');

  function ShowConfirm(sMsg : String; const DefaultButton : Integer = MB_DEFBUTTON2) : Boolean;
  function GetPaisIDDefault : String;
  function GetEstadoIDDefault : Integer;
  function GetCidadeIDDefault : Integer;
  function GetCfopIDDefault : Integer;
  function GetEmpresaIDDefault : String;
  function GetClienteIDDefault : String;
  function GetVendedorIDDefault : Integer;
  function GetFormaPagtoIDDefault : Integer;
  function GetCondicaoPagtoIDDefault : Integer;

  function GetPaisNomeDefault : String;
  function GetEstadoNomeDefault : String;
  function GetCidadeNomeDefault : String;
  function GetCfopNomeDefault : String;
  function GetEmpresaNomeDefault : String;
  function GetClienteNomeDefault : String;
  function GetVendedorNomeDefault : String;
  function GetFormaPagtoNomeDefault : String;
  function GetCondicaoPagtoNomeDefault : String;
  function GetSenhaAutorizacao : String;
  function GetNextID(NomeTabela, CampoChave : String; const sWhere : String = '') : Largeint;

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

procedure UpdateSequence(GeneratorName, NomeTabela, CampoChave : String; const sWhr : String = '');
var
  ID : Largeint;
begin
  with DMBusiness, qryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select max(' + CampoChave + ') as ID from ' + NomeTabela + ' ' + sWhr);
    Open;

    ID := FieldByName('ID').AsInteger;

    Close;
    SQL.Clear;
    SQL.Add('ALTER SEQUENCE ' + GeneratorName + ' RESTART WITH ' + IntToStr(ID));
    ExecSQL;
  end;
end;

function ShowConfirm(sMsg : String; const DefaultButton : Integer = MB_DEFBUTTON2) : Boolean;
begin
  Result := ( Application.MessageBox(PChar(sMsg), 'Confirmar', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = ID_YES );
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

function GetCfopIDDefault : Integer;
begin
  Result := FileINI.ReadInteger('Default', 'CfopID', 5102);
end;

function GetEmpresaIDDefault : String;
begin
  Result := FileINI.ReadString('Default', 'EmpresaID', EmptyStr);
end;

function GetClienteIDDefault : String;
begin
  Result := FileINI.ReadString('Default', 'ClienteID', EmptyStr);
end;

function GetVendedorIDDefault : Integer;
begin
  Result := FileINI.ReadInteger('Default', 'VendedorID', 1);
end;

function GetFormaPagtoIDDefault : Integer;
begin
  Result := FileINI.ReadInteger('Default', 'FormaPagtoID', 1);
end;

function GetCondicaoPagtoIDDefault : Integer;
begin
  Result := FileINI.ReadInteger('Default', 'CondicaoPagtoID', 1);
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

function GetCfopNomeDefault : String;
begin
  with DMBusiness, qryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select cfop_descricao from TBCFOP where cfop_cod = ' + IntToStr(GetCfopIDDefault));
    Open;

    Result := FieldByName('cfop_descricao').AsString;

    Close;
  end;
end;

function GetEmpresaNomeDefault : String;
begin
  with DMBusiness, qryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select rzsoc from TBEMPRESA where Cnpj = ' + QuotedStr(GetEmpresaIDDefault));
    Open;

    Result := FieldByName('rzsoc').AsString;

    Close;
  end;
end;

function GetClienteNomeDefault : String;
begin
  with DMBusiness, qryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select nome from TBCLIENTE where Cnpj = ' + QuotedStr(GetClienteIDDefault));
    Open;

    Result := FieldByName('nome').AsString;

    Close;
  end;
end;

function GetVendedorNomeDefault : String;
begin
  with DMBusiness, qryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select nome from TBVENDEDOR where cod = ' + IntToStr(GetVendedorIDDefault));
    Open;

    Result := FieldByName('nome').AsString;

    Close;
  end;
end;

function GetFormaPagtoNomeDefault : String;
begin
  with DMBusiness, qryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select descri from TBFORMPAGTO where cod = ' + IntToStr(GetFormaPagtoIDDefault));
    Open;

    Result := FieldByName('descri').AsString;

    Close;
  end;
end;

function GetCondicaoPagtoNomeDefault : String;
begin
  with DMBusiness, qryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select cond_descricao_full from VW_CONDICAOPAGTO where cond_cod = ' + IntToStr(GetCondicaoPagtoIDDefault));
    Open;

    Result := FieldByName('cond_descricao_full').AsString;

    Close;
  end;
end;

function GetSenhaAutorizacao : String;
begin
  with DMBusiness, qryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select snh_descricao from TBSENHA_AUTORIZACAO');
    Open;

    if IsEmpty then
      ShowWarning('Não existe senha de autorização gravada na base.' + #13#13 + 'Favor solicitação a geração de uma senha de autorização');

    Result := FieldByName('snh_descricao').AsString;

    Close;
  end;
end;

function GetNextID(NomeTabela, CampoChave : String; const sWhere : String = '') : Largeint;
begin
  with DMBusiness, qryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select max(' + CampoChave + ') as ID from ' + NomeTabela + ' ' + sWhere);
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
