unit UDMBusiness;

interface

uses
  Windows, Forms, SysUtils, Classes, IBDatabase, DB, IBCustomDataSet, IniFIles,
  IBQuery, RpDefine, RpRave, frxClass, frxDBSet, EMsgDlg;

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
    ibdtstUsers: TIBDataSet;
    ibdtstUsersNOME: TIBStringField;
    ibdtstUsersSENHA: TIBStringField;
    ibdtstUsersNOMECOMPLETO: TIBStringField;
    ibdtstUsersCODFUNCAO: TSmallintField;
    EvMsgDialog: TEvMsgDlg;
    dtsrcUsers: TDataSource;
    ibdtstUsersLIMIDESC: TIBBCDField;
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
  procedure UpdateSequence(GeneratorName, NomeTabela, CampoChave : String; const sWhr : String = '');
  procedure CommitTransaction;

  function ShowConfirm(sMsg : String; const sTitle : String = ''; const DefaultButton : Integer = MB_DEFBUTTON2) : Boolean;
  function GetPaisIDDefault : String;
  function GetEstadoIDDefault : Integer;
  function GetCidadeIDDefault : Integer;
  function GetCfopIDDefault : Integer;
  function GetEmpresaIDDefault : String;
  function GetClienteIDDefault : String;
  function GetVendedorIDDefault : Integer;
  function GetFormaPagtoIDDefault : Integer;
  function GetCondicaoPagtoIDDefault : Integer;
  
  function GetExeVersion(const FileName : TFileName) : String;
  function StrIsCNPJ(const Num: string): Boolean;
  function StrIsCPF(const Num: string): Boolean;
  function StrFormatarCnpj(sCnpj: String): String;
  function StrFormatarCpf(sCpf: String): String;

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
  function GetDateTimeDB : TDateTime;
  function GetDateDB : TDateTime;
  function GetTimeDB : TDateTime;
  function GetUserApp : String;
  function GetLimiteDescontoUser : Currency;

const
  DB_USER_NAME     = 'SYSDBA';
  DB_USER_PASSWORD = 'masterkey';
  DB_LC_CTYPE      = 'ISO8859_2';

  STATUS_VND_AND = 1;
  STATUS_VND_ABR = 2;
  STATUS_VND_FIN = 3;
  STATUS_VND_NFE = 4;
  STATUS_VND_CAN = 5;

  STATUS_CMP_ABR = 1;
  STATUS_CMP_FIN = 2;
  STATUS_CMP_CAN = 3;

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

    CommitTransaction;
  end;
end;

procedure CommitTransaction;
begin
  with DMBusiness do
  begin
    ibtrnsctnBusiness.CommitRetaining;
  end;
end;

function ShowConfirm(sMsg : String; const sTitle : String = ''; const DefaultButton : Integer = MB_DEFBUTTON2) : Boolean;
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

function GetExeVersion(const FileName : TFileName) : String;
type
  PFFI = ^vs_FixedFileInfo;
var
  F     : PFFI;
  Handle: Dword;
  Len : Longint;
  Data: Pchar;
  Buffer   : Pointer;
  Tamanho  : Dword;
  PFileName: Pchar;
begin
   PFileName := StrAlloc(Length(FileName) + 1);
   StrPcopy(PFileName, FileName);
   Len := GetFileVersionInfoSize(PFileName, Handle);
   Result := '';
   if (Len > 0) then
   begin
     Data := StrAlloc(Len + 1);
     if GetFileVersionInfo(PFileName, Handle, Len, Data) then
     begin
       VerQueryValue(Data, '\', Buffer, Tamanho);
       F := PFFI(Buffer);
       Result := Format('%d.%d.%d.%d ', [HiWord(F^.dwFileVersionMs),
                                         LoWord(F^.dwFileVersionMs),
                                         HiWord(F^.dwFileVersionLs),
                                         Loword(F^.dwFileVersionLs)]);
     end;
     StrDispose(Data)
   end;
   StrDispose(PFileName);
end;

function StrIsCNPJ(const Num: string): Boolean;
var
  Dig: array [1..14] of Byte;
  I, Resto: Byte;
  Dv1, Dv2: Byte;
  Total1, Total2: Integer;
  Valor: string;
begin
  if ( StrToIntDef(Copy(Num, 1, 2), -1) = -1 ) then
  begin
    Result := False;
    Exit;
  end;

  Valor := Num;

  for I := 1 to Length(Valor) do
    if not (Valor[I] in ['0'..'9']) then
      Delete(Valor, I, 1);

  if ( StrToIntDef(Copy(Valor, 1, 5), 0) = 0 ) then
  begin
    Result := False;
    Exit;
  end;

  try
    StrToInt(Copy(Valor, 1, 5));
  except
    Result := True;
    Exit;
  end;

  Result := False;

  if Length(Valor) = 14 then
  begin
    for I := 1 to 14 do
      try
        Dig[I] := StrToInt (Valor[I]);
      except
        Dig[i] := 0;
      end;

    Total1 := Dig[1]  * 5 + Dig[2]  * 4 + Dig[3]  * 3 +
              Dig[4]  * 2 + Dig[5]  * 9 + Dig[6]  * 8 +
              Dig[7]  * 7 + Dig[8]  * 6 + Dig[9]  * 5 +
              Dig[10] * 4 + Dig[11] * 3 + Dig[12] * 2 ;

    Resto := Total1 mod 11;

    if Resto > 1 then
      Dv1 := 11 - Resto
    else
      Dv1 := 0;

    Total2 := Dig[1]  * 6 + Dig[2]  * 5 + Dig[3]  * 4 +
              Dig[4]  * 3 + Dig[5]  * 2 + Dig[6]  * 9 +
              Dig[7]  * 8 + Dig[8]  * 7 + Dig[9]  * 6 +
              Dig[10] * 5 + Dig[11] * 4 + Dig[12] * 3 + Dv1 * 2 ;

    Resto := Total2 mod 11;

    if Resto > 1 then
      Dv2 := 11 - Resto
    else
      Dv2 := 0;

    if (Dv1 = Dig[13]) and (Dv2 = Dig[14]) then
      Result := True;
  end;

end;

function StrIsCPF(const Num: string): Boolean;
var
  I, Numero, Resto: Byte ;
  Dv1, Dv2: Byte ;
  Total, Soma: Integer ;
  Valor: string;
begin
  if ( StrToIntDef(Copy(Num, 1, 2), -1) = -1 ) then
  begin
    Result := False;
    Exit;
  end;

  Valor := Num;
  for I := 1 to Length(Valor) do
    if not (Valor[I] in ['0'..'9']) then Delete(Valor, I, 1);
  try
    StrToInt(Copy(Valor, 1, 5));
  except
    Result := True;
    Exit;
  end;
  Result := False;
  if Length(Valor) = 11 then
  begin
    Total := 0 ;
    Soma := 0 ;
    for I := 1 to 9 do
    begin
      try
        Numero := StrToInt (Valor[I]);
      except
        Numero := 0;
      end;
      Total := Total + (Numero * (11 - I)) ;
      Soma := Soma + Numero;
    end;
    Resto := Total mod 11;
    if Resto > 1
      then Dv1 := 11 - Resto
      else Dv1 := 0;
    Total := Total + Soma + 2 * Dv1;
    Resto := Total mod 11;
    if Resto > 1
      then Dv2 := 11 - Resto
      else Dv2 := 0;
    if (IntToStr (Dv1) = Valor[10]) and (IntToStr (Dv2) = Valor[11])
      then Result := True;
  end;
end;

function StrFormatarCnpj(sCnpj: String): String;
var
  S : String;
begin
  S := Trim(sCnpj);

  if ( Copy(S, 3, 1) <> '.' ) then
    S := Copy(S, 1, 2) + '.' + Copy(S, 3, Length(S));

  if ( Copy(S, 7, 1) <> '.' ) then
    S := Copy(S, 1, 6) + '.' + Copy(S, 7, Length(S));

  if ( Copy(S, 11, 1) <> '/' ) then
    S := Copy(S, 1, 10) + '/' + Copy(S, 11, Length(S));

  if ( Copy(S, 16, 1) <> '-' ) then
    S := Copy(S, 1, 15) + '-' + Copy(S, 16, Length(S));

  Result := S;
end;

function StrFormatarCpf(sCpf: String): String;
var
  S : String;
begin
  S := Trim(sCpf); // 000.000.000-00

  if ( Copy(S, 4, 1) <> '.' ) then
    S := Copy(S, 1, 3) + '.' + Copy(S, 4, Length(S));

  if ( Copy(S, 8, 1) <> '.' ) then
    S := Copy(S, 1, 7) + '.' + Copy(S, 8, Length(S));

  if ( Copy(S, 12, 1) <> '-' ) then
    S := Copy(S, 1, 11) + '-' + Copy(S, 12, Length(S));

  Result := S;
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

function GetDateTimeDB : TDateTime;
begin
  with DMBusiness, qryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select First 1 Current_timestamp as DataHora from TBEMPRESA');
    Open;

    Result := FieldByName('DataHora').AsDateTime;
  end;
end;

function GetDateDB : TDateTime;
begin
  with DMBusiness, qryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select First 1 Current_date as Data from TBEMPRESA');
    Open;

    Result := FieldByName('Data').AsDateTime;
  end;
end;

function GetTimeDB : TDateTime;
begin
  with DMBusiness, qryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select First 1 Current_time as Hora from TBEMPRESA');
    Open;

    Result := FieldByName('Hora').AsDateTime;
  end;
end;

function GetUserApp : String;
begin
  with DMBusiness, ibdtstUsers do
    Result := UpperCase( Trim(ibdtstUsersNOME.AsString) );
end;

function GetLimiteDescontoUser : Currency;
begin
  with DMBusiness, ibdtstUsers do
    Result := ibdtstUsersLIMIDESC.AsCurrency;
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
      Connected := True;

      if ( Connected ) then
        ibdtstUsers.Open;
    end;

  except
    On E : Exception do
      ShowError('Erro ao tentar conectar no Servidor/Base.' + #13#13 + E.Message);
  end;
end;

end.
