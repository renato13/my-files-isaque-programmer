{******************************************************************************}
{ Projeto: Componente ACBrNFe                                                  }
{  Biblioteca multiplataforma de componentes Delphi para emissão de Nota Fiscal}
{ eletrônica - NFe - http://www.nfe.fazenda.gov.br                          }
{                                                                              }
{ Direitos Autorais Reservados (c) 2008 Wemerson Souto                         }
{                                       Daniel Simoes de Almeida               }
{                                       André Ferreira de Moraes               }
{                                                                              }
{ Colaboradores nesse arquivo:                                                 }
{                                                                              }
{  Você pode obter a última versão desse arquivo na pagina do Projeto ACBr     }
{ Componentes localizado em http://www.sourceforge.net/projects/acbr           }
{                                                                              }
{                                                                              }
{  Esta biblioteca é software livre; você pode redistribuí-la e/ou modificá-la }
{ sob os termos da Licença Pública Geral Menor do GNU conforme publicada pela  }
{ Free Software Foundation; tanto a versão 2.1 da Licença, ou (a seu critério) }
{ qualquer versão posterior.                                                   }
{                                                                              }
{  Esta biblioteca é distribuída na expectativa de que seja útil, porém, SEM   }
{ NENHUMA GARANTIA; nem mesmo a garantia implícita de COMERCIABILIDADE OU      }
{ ADEQUAÇÃO A UMA FINALIDADE ESPECÍFICA. Consulte a Licença Pública Geral Menor}
{ do GNU para mais detalhes. (Arquivo LICENÇA.TXT ou LICENSE.TXT)              }
{                                                                              }
{  Você deve ter recebido uma cópia da Licença Pública Geral Menor do GNU junto}
{ com esta biblioteca; se não, escreva para a Free Software Foundation, Inc.,  }
{ no endereço 59 Temple Street, Suite 330, Boston, MA 02111-1307 USA.          }
{ Você também pode obter uma copia da licença em:                              }
{ http://www.opensource.org/licenses/lgpl-license.php                          }
{                                                                              }
{ Daniel Simões de Almeida  -  daniel@djsystem.com.br  -  www.djsystem.com.br  }
{              Praça Anita Costa, 34 - Tatuí - SP - 18270-410                  }
{                                                                              }
{******************************************************************************}

{******************************************************************************
|* Historico
|*
|* 19/03/2013: André Ferreira de Moraes
|*  - Versão inicial da classe ACBrCertificado
|* 20/03/2013: Rafael Batiati
|*  - Inclusão do comando SelecionarCertificado
******************************************************************************}
unit ACBrCertificado;

interface

uses
  Classes, Windows, SysUtils, Variants, WinCrypt, ACBrUtil;

type

  TACBrCertificado = class
  private
    FCertContext : PCCERT_CONTEXT;
    FEmitidoPara: string;
    FEmitidoPor: string;
    FNomeAmigavel: string;
    FEmail: string;
    FValidoDe: TDateTime;
    FValidoAte: TDateTime;
    FNumeroSerial: string;
  public
    constructor Create(ACertContext: PCCERT_CONTEXT);
    destructor Destroy; override;
    property CertContext: PCCERT_CONTEXT read FCertContext;
    property EmitidoPara: string read FEmitidoPara;
    property EmitidoPor: string read FEmitidoPor;
    property NomeAmigavel: string read FNomeAmigavel;
    property Email: string read FEmail;
    property ValidoDe: TDateTime read FValidoDe;
    property ValidoAte: TDateTime read FValidoAte;
    property NumeroSerial: string read FNumeroSerial;
  end;



  TACBrStore = class(TComponent)
  private
    FStore: HCERTSTORE;
    FStoreName: string;
    FCertificados: TList;

    xCryptUIDlgSelectCertificateFromStore:Function(hCertStore: HCERTSTORE; hwnd: HWND; pwszTitle, pwszDisplayString: LPCWSTR;
  dwDontUseColumn, dwFlags: DWORD; pvReserved: Pointer):PCCERT_CONTEXT;StdCall;

    function GetCount: Integer;
    function GetItem(Index: Integer): TACBrCertificado;
    procedure CarregaCertificados(hStore: HCERTSTORE);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Add(Certificado: TACBrCertificado);
    procedure AbrirCertificados(const AStoreName: string);
    property Items[Index: Integer]: TACBrCertificado read GetItem; default;
    property Count: Integer read GetCount;
    function SelecionarCertificado: string;
  published
    property StoreName: string read FStoreName write FStoreName;
  end;

implementation

function ByteArrayToStr(pbData: PByte; cbData: DWORD): String;
var
  I, J: Integer;
  S: String;
begin
  Result := '';
  if not Assigned(pbData) or (cbData <= 0) then
    Exit;
  for I := 0 to cbData - 1 do
  begin
    J := PByteArray(pbData)^[I];
    S := IntToHex(J, 2);
    if (I > 0) and (I and 1 = 0) then
      S := S + ' ';
    Result := S + Result;
  end;
end;

{ TACBrCertificado }
constructor TACBrCertificado.Create(ACertContext: PCCERT_CONTEXT);
var
  Valor: array[0..255] of Char;
  chString: DWORD;
  szString: PWideChar;
  systemTime: TSystemTime;
begin
  FCertContext := CertDuplicateCertificateContext(ACertContext);
  CertGetNameString(CertContext, CERT_NAME_SIMPLE_DISPLAY_TYPE, 0, nil, Valor, 256);
  FEmitidoPara := Valor;
  CertGetNameString(CertContext, CERT_NAME_SIMPLE_DISPLAY_TYPE, CERT_NAME_ISSUER_FLAG, nil, Valor, 256);
  FEmitidoPor := Valor;

  chString := 0;
  CertGetCertificateContextProperty(CertContext, CERT_FRIENDLY_NAME_PROP_ID, nil, chString);
  GetMem(szString, chString);
  CertGetCertificateContextProperty(FCertContext, CERT_FRIENDLY_NAME_PROP_ID, PAnsiChar(szString), chString);
  FNomeAmigavel := string(system.Copy(szString, 1, chString));

  CertGetNameString(CertContext, CERT_NAME_EMAIL_TYPE, 0, nil, Valor, 256);
  FEmail := Valor;

  FileTimeToSystemTime(CertContext.pCertInfo.NotBefore, systemTime);
  FValidoDe  := SystemTimeToDateTime(systemTime) ;
  FileTimeToSystemTime(CertContext.pCertInfo.NotAfter, systemTime);
  FValidoAte := SystemTimeToDateTime(systemTime) ;

  FNumeroSerial := RemoveString(' ',ByteArrayToStr(CertContext.pCertInfo.SerialNumber.pbData,CertContext.pCertInfo.SerialNumber.cbData));
end;

destructor TACBrCertificado.Destroy;
begin
  CertFreeCertificateContext(FCertContext);
  inherited;
end;

{ TACBrStore }
procedure TACBrStore.Add(Certificado: TACBrCertificado);
begin
  FCertificados.Add(Certificado);
end;

procedure TACBrStore.CarregaCertificados(hStore: HCERTSTORE);
var
  CertContext: PCCERT_CONTEXT;
begin
  CertContext := nil;
  CertContext := CertEnumCertificatesInStore(hStore, CertContext);
  while CertContext <> nil do
   begin
     if (CertContext <> nil) then
      begin
        Add(TACBrCertificado.Create(CertContext));
      end;
     CertContext := CertEnumCertificatesInStore(hStore, CertContext);
   end;
end;

constructor TACBrStore.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FCertificados := TList.Create();
  FStoreName := '';

  if not FunctionDetect( 'cryptui.dll', 'CryptUIDlgSelectCertificateFromStore', @xCryptUIDlgSelectCertificateFromStore) then
   begin
     xCryptUIDlgSelectCertificateFromStore := NIL ;
     raise Exception.Create( ACBrStr( 'Erro ao carregar a função CryptUIDlgSelectCertificateFromStore de: cryptui.dll' ) ) ;
   end ;
end;

destructor TACBrStore.Destroy;
var
  i: Integer;
begin
  for i := 0 to Count - 1 do
  begin
    Items[i].Free;
  end;

  FCertificados.Clear;

  if (FStore <> nil) then
  begin
    CertCloseStore(FStore, 0);
    FStore := nil;
  end;

  FCertificados.Free;
  inherited Destroy;
end;

function TACBrStore.GetCount: Integer;
begin
  Result := FCertificados.Count;
end;

function TACBrStore.GetItem(Index: Integer): TACBrCertificado;
begin
  Result := TACBrCertificado(FCertificados[Index]);
end;

procedure TACBrStore.AbrirCertificados(const AStoreName: string);
begin
  FStoreName := AStoreName;
  FStore := CertOpenSystemStore(0, PChar(StoreName));
  if FStore <> nil then
    CarregaCertificados(FStore);
end;

function TACBrStore.SelecionarCertificado: string;
var
  hCtx: PCCERT_CONTEXT;
  Titulo, Pergunta : PWideChar;
begin
  if FStore = nil then
    raise Exception.Create( ACBrStr( 'Execute o comando AbrirCertificados' ) ) ;
    
  try
    begin
      Titulo   := PWideChar(WideString('Certificado(s) Digital(is) disponível(is)'));
      Pergunta := PWideChar(WideString('Selecione o Certificado Digital para uso no aplicativo'));
      hCtx := xCryptUIDlgSelectCertificateFromStore(FStore, 0,
        Titulo, Pergunta, $000000010, 0, nil);

      if (Assigned(hCtx)) then
      begin
        Result := RemoveString(' ',ByteArrayToStr(hCtx^.pCertInfo^.serialNumber.pbData,hCtx^.pCertInfo^.serialNumber.cbData));
      end;
    end;
  finally
    begin
      CertFreeCertificateContext(hCtx);
    end;
  end;
end;

end.
