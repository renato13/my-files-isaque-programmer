{******************************************************************************}
{ Projeto: Componentes ACBr                                                    }
{  Biblioteca multiplataforma de componentes Delphi para interação com equipa- }
{ mentos de Automação Comercial utilizados no Brasil                           }
{                                                                              }
{ Direitos Autorais Reservados (c) 2004 Daniel Simoes de Almeida               }
{                                                                              }
{ Colaboradores nesse arquivo:                                                 }
{                                                                              }
{  Você pode obter a última versão desse arquivo na pagina do  Projeto ACBr    }
{ Componentes localizado em      http://www.sourceforge.net/projects/acbr      }
{                                                                              }
{ Esse arquivo usa a classe  SynaSer   Copyright (c)2001-2003, Lukas Gebauer   }
{  Project : Ararat Synapse     (Found at URL: http://www.ararat.cz/synapse/)  }
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
|* 25/05/2013: Primeira Versao
|*    Fernando - fernando-mm@hotmail.com
******************************************************************************}

{$I ACBr.inc}

unit ACBrConsultaCNPJ;

interface

uses
  SysUtils, Classes, ACBrSocket;

type
  EACBrConsultaCNPJException = class ( Exception );

  TACBrConsultaCNPJ = class(TACBrHTTP)
  private
    Html: String;
    FViewState: String;
    FEmpresaTipo: String;
    FAbertura: String;
    FRazaoSocial: String;
    FFantasia: String;
    FEndereco: String;
    FNumero: String;
    FComplemento: String;
    FCEP: String;
    FBairro: String;
    FCidade: String;
    FUF: String;
    FSituacao: String;
    FCNPJ: String;
    procedure MyHttpGetStream(URL: String; var Stream: TStream);
    function  MyHttpGet(URL: String): String;
    function  MyHttpPost(URL: String; Post: TStringStream): String;
    Function CaptchaGetURL: String;
    function GetEmpresaTipo: String;
    function GetAbertura: String;
    function GetRazaoSocial: String;
    function GetFantasia: String;
    function GetEndereco: String;
    function GetNumero: String;
    function GetComplemento: String;
    function GetCEP: String;
    function GetBairro: String;
    function GetCidade: String;
    function GetUF: String;
    function GetSituacao: String;
  public
    procedure Captcha(Stream: TStream);
    function Consulta(CNPJ, Captcha: String): Boolean;
  published
    property CNPJ: String Read FCNPJ Write FCNPJ;
    property EmpresaTipo: String Read FEmpresaTipo;
    property Abertura: String Read FAbertura;
    property RazaoSocial: String Read FRazaoSocial;
    property Fantasia: String Read FFantasia;
    property Endereco: String Read FEndereco;
    property Numero: String Read FNumero;
    property Complemento: String Read FComplemento;
    property CEP: String Read FCEP;
    property Bairro: String Read FBairro;
    property Cidade: String Read FCidade;
    property UF: String Read FUF;
    property Situacao: String Read FSituacao;
  end;

implementation

uses
  ACBrUtil;

function HTTPEncode(const AStr: AnsiString): AnsiString;
// The NoConversion set contains characters as specificed in RFC 1738 and
// should not be modified unless the standard changes.
const
  NoConversion = ['A'..'Z','a'..'z','*','@','.','_','-',
                  '0'..'9','$','!','''','(',')'];
var
  Sp, Rp: PAnsiChar;
begin
  SetLength(Result, Length(AStr) * 3);
  Sp := PAnsiChar(AStr);
  Rp := PAnsiChar(Result);
  while Sp^ <> #0 do
  begin
    if Sp^ in NoConversion then
      Rp^ := Sp^
    else
      if Sp^ = ' ' then
        Rp^ := '+'
      else
      begin
        FormatBuf(Rp^, 3, AnsiString('%%%.2x'), 6, [Ord(Sp^)]);
        Inc(Rp,2);
      end;
    Inc(Rp);
    Inc(Sp);
  end;
  SetLength(Result, Rp - PAnsiChar(Result));
end;

function PosEx(const SubStr, S: string; Offset: Cardinal = 1): Integer;
var
  I,X: Integer;
  Len, LenSubStr: Integer;
begin
  if Offset = 1 then
    Result := Pos(SubStr, S)
  else
  begin
    I := Offset;
    LenSubStr := Length(SubStr);
    Len := Length(S) - LenSubStr + 1;
    while I <= Len do
    begin
      if S[I] = SubStr[1] then
      begin
        X := 1;
        while (X < LenSubStr) and (S[I + X] = SubStr[X + 1]) do
          Inc(X);
        if (X = LenSubStr) then
        begin
          Result := I;
          exit;
        end;
      end;
      Inc(I);
    end;

    Result := 0;
  end;
end;

function HeadersGetValue(Nome: String; Headers: TStringList): String;
var
  I: Integer;
  Res: String;
begin
  for I := 0 to Headers.Count -1 do
  begin
    if Pos(UpperCase(Nome+':'), UpperCase(Headers[i])) > 0 then
    begin
      Res:= Headers[i];
      Res:= Copy(Res, Pos(':', Res) + 2, Length(Res));
      Break;
    end;
  end;

  Result:= Res;
end;

function GetURLSepara(URL: String): String;
  var
    I, R: Integer;
begin
  R:= Length(URL);
  for I := 0 to Length(URL) do
    if URL[i] = '/' then
      R:= I;
  Result:= Copy(URL, 1, R);
end;

function StrEntreStr(Str, StrInicial, StrFinal: String; ComecarDe: Integer = 1): String;
var
  Ini, Fim: Integer;
begin
  Ini:= PosEx(StrInicial, Str, ComecarDe) + Length(StrInicial);
  if Ini > 0 then
  begin
    Fim:= PosEx(StrFinal, Str, Ini);
    if Fim > 0 then
      Result:= Copy(Str, Ini, Fim - Ini)
    else
      Result:= '';
  end
  else
    Result:= '';
end;

function StrPularStr(Str, StrPular: String): String;
  var
    Ini: Integer;
begin
  Ini:= Pos(StrPular, Str);
  if Ini > 0 then
    Result:= Copy(Str, Ini + Length(StrPular), Length(Str))
  else
    Result:= Str;
end;

procedure TACBrConsultaCNPJ.MyHttpGetStream(URL: String; var Stream: TStream);
begin
  HttpSend.Headers.Clear;
  HttpSend.Document.Clear;
  HttpSend.HTTPMethod('GET', URL);
  if HttpSend.ResultCode = 200 then
  begin
    Stream.CopyFrom(HttpSend.Document, HttpSend.Document.Size);
    Stream.Position:= 0;
  end;
end;

function TACBrConsultaCNPJ.MyHttpGet(URL: String): String;
var
  Res: TStringList;
  Red: String;
begin
  Res:= TStringList.Create;
  try
    HttpSend.Headers.Clear;
    HttpSend.Document.Clear;
    HttpSend.HTTPMethod('GET', URL);

    if HttpSend.ResultCode = 200 then
    begin
      Res.LoadFromStream(HttpSend.Document);
      Result:= Res.Text;
    end;

    if HttpSend.ResultCode = 302 then
    begin
      Red:= GetURLSepara(URL) + HeadersGetValue('location', HttpSend.Headers);
      Result:= MyHttpGet(Red);
    end;
  finally
    Res.Free;
  end;
end;

function TACBrConsultaCNPJ.MyHttpPost(URL: String; Post: TStringStream): String;
var
  Res: TStringList;
  Red: String;
begin
  Res:= TStringList.Create;
  try
    HttpSend.Headers.Clear;
    HttpSend.Document.Clear;
    Post.Position:= 0;
    HttpSend.Document.Position:= 0;
    HttpSend.Document.CopyFrom(Post, Post.Size);
    HttpSend.MimeType:= 'application/x-www-form-urlencoded';
    HttpSend.HTTPMethod('POST', URL);

    if HttpSend.ResultCode = 200 then
    begin
      Res.LoadFromStream(HttpSend.Document);
      Result:= Res.Text;
    end;

    if HttpSend.ResultCode = 302 then
    begin
      Red:= GetURLSepara(URL) + HeadersGetValue('location', HttpSend.Headers);
      Result:= MyHttpGet(Red);
    end;
  finally
    Res.Free;
  end;
end;

function TACBrConsultaCNPJ.GetEmpresaTipo: String;
var
  S: String;
begin
  S:= Html;
  S:= StrPularStr(S, '<font face="Arial" style="font-size: 6pt">		NÚMERO DE INSCRIÇÃO		</font>');
  S:= StrPularStr(S, '<br>');
  S:= StrPularStr(S, '<br>');
  S:= StrEntreStr(S, '<b>', '</b>');
  Result:= Trim(S);
end;

function TACBrConsultaCNPJ.GetAbertura: String;
var
  S: String;
begin
  S:= Html;
  S:= StrPularStr(S, '<font face="Arial" style="font-size: 6pt">		DATA DE ABERTURA		</font>');
  S:= StrEntreStr(S, '<b>', '</b>');

  if Trim(S) <> '' then
  begin
    try
      Result:= FormatDateTime('DD/MM/YYYY', StrToDate(Trim(S)));
    except
      Result:= '';
    end;
  end
  else
    Result:= '';
end;

function TACBrConsultaCNPJ.GetRazaoSocial: String;
var
  S: String;
begin
  S:= Html;
  S:= StrPularStr(S, '<font face="Arial" style="font-size: 6pt">		NOME EMPRESARIAL		</font>');
  S:= StrPularStr(S, '<br>');
  S:= StrEntreStr(S, '<b>', '</b>');
  Result:= Trim(S);
end;

function TACBrConsultaCNPJ.GetFantasia: String;
var
  S: String;
begin
  S:= Html;
  S:= StrPularStr(S, '<font face="Arial" style="font-size: 6pt">		TÍTULO DO ESTABELECIMENTO (NOME DE FANTASIA)		</font>');
  S:= StrPularStr(S, '<br>');
  S:= StrEntreStr(S, '<b>', '</b>');
  Result:= Trim(S);
end;

//Endereco, Numero, Complemento, CEP, Bairro, Cidade, UF, Situacao

function TACBrConsultaCNPJ.GetEndereco: String;
  var
    S: String;
begin
  S:= Html;
  S:= StrPularStr(S, '<font face="Arial" style="font-size: 6pt">		LOGRADOURO		</font>');
  S:= StrPularStr(S, '<br>');
  S:= StrEntreStr(S, '<b>', '</b>');
  Result:= Trim(S);
end;

function TACBrConsultaCNPJ.GetNumero: String;
  var
    S: String;
begin
  S:= Html;
  S:= StrPularStr(S, '<font face="Arial" style="font-size: 6pt">		NÚMERO		</font>');
  S:= StrPularStr(S, '<br>');
  S:= StrEntreStr(S, '<b>', '</b>');
  Result:= Trim(S);
end;

function TACBrConsultaCNPJ.GetComplemento: String;
  var
    S: String;
begin
  S:= Html;
  S:= StrPularStr(S, '<font face="Arial" style="font-size: 6pt">		COMPLEMENTO		</font>');
  S:= StrPularStr(S, '<br>');
  S:= StrEntreStr(S, '<b>', '</b>');
  Result:= Trim(S);
end;

function TACBrConsultaCNPJ.GetCEP: String;
  var
    S: String;
begin
  S:= Html;
  S:= StrPularStr(S, '<font face="Arial" style="font-size: 6pt">		CEP		</font>');
  S:= StrPularStr(S, '<br>');
  S:= StrEntreStr(S, '<b>', '</b>');
  Result:= Trim(S);
end;

function TACBrConsultaCNPJ.GetBairro: String;
  var
    S: String;
begin
  S:= Html;
  S:= StrPularStr(S, '<font face="Arial" style="font-size: 6pt">		BAIRRO/DISTRITO		</font>');
  S:= StrPularStr(S, '<br>');
  S:= StrEntreStr(S, '<b>', '</b>');
  Result:= Trim(S);
end;

function TACBrConsultaCNPJ.GetCidade: String;
  var
    S: String;
begin
  S:= Html;
  S:= StrPularStr(S, '<font face="Arial" style="font-size: 6pt">		MUNICÍPIO		</font>');
  S:= StrPularStr(S, '<br>');
  S:= StrEntreStr(S, '<b>', '</b>');
  Result:= Trim(S);
end;

function TACBrConsultaCNPJ.GetUF: String;
  var
    S: String;
begin
  S:= Html;
  S:= StrPularStr(S, '<font face="Arial" style="font-size: 6pt">		UF		</font>');
  S:= StrPularStr(S, '<br>');
  S:= StrEntreStr(S, '<b>', '</b>');
  Result:= Trim(S);
end;

function TACBrConsultaCNPJ.GetSituacao: String;
  var
    S: String;
begin
  S:= Html;
  S:= StrPularStr(S, '<font face="Arial" style="font-size: 6pt">		SITUAÇÃO CADASTRAL		</font>');
  S:= StrPularStr(S, '<br>');
  S:= StrEntreStr(S, '<b>', '</b>');
  Result:= Trim(S);
end;

Function TACBrConsultaCNPJ.CaptchaGetURL: String;
  var
    URL: String;
begin
  try
    Html:= MyHttpGet('http://www.receita.fazenda.gov.br/pessoajuridica/cnpj/cnpjreva/cnpjreva_solicitacao2.asp');

    URL := 'http://www.receita.fazenda.gov.br' +
      StrEntreStr(Html, 'alt='+
      QuotedStr('Imagem com os caracteres anti robô') + ' src='+'''', '''');

    FViewState := StrEntreStr(Html, '<input type=hidden id=viewstate name=viewstate value='+'''', '''');

    Result := StringReplace(URL, 'amp;', '', []);
  except
    on E: Exception do
    begin
      raise EACBrConsultaCNPJException.Create('Erro na hora de obter a URL do captcha.'+#13#10+E.Message);
    end;
  end;
end;

procedure TACBrConsultaCNPJ.Captcha(Stream: TStream);
begin
  try
    MyHttpGetStream(CaptchaGetURL, Stream);
  Except on E: Exception do begin
    raise EACBrConsultaCNPJException.Create('Erro na hora de fazer o download da imagem do captcha.'+#13#10+E.Message);
  end;
  end;
end;

function VerificarErros(Str: String): String;
  var
    Res: String;
begin
  Res:= '';
  if Res = '' then
    if Pos('Erro na Consulta', Str) > 0 then
      Res:= 'Catpcha errado.';

  if Res = '' then
    if Pos('O número do CNPJ não é válido. Verifique se o mesmo foi digitado c'+
    'orretamente.', Str) > 0 then
      Res:= 'O número do CNPJ não é válido. Verifique se o mesmo foi digitado'+
      ' corretamente.';

  if Res = '' then
    if Pos('Não existe no Cadastro de Pessoas Jurídicas o número de CNPJ infor'+
    'mado. Verifique se o mesmo foi digitado corretamente.', Str) > 0 then
      Res:= 'Não existe no Cadastro de Pessoas Jurídicas o número de CNPJ info'+
      'rmado. Verifique se o mesmo foi digitado corretamente.';

  if Res = '' then
    if Pos('a. No momento não podemos atender a sua solicitaão. Por favor tent'+
    'e mais tarde.', Str) > 0 then
      Res:= 'Erro no site da receita federal. Tente mais tarde.';

  Result:= Res;
end;

function TACBrConsultaCNPJ.Consulta(CNPJ, Captcha: String): Boolean;
  var
    Post: TStringStream;
begin
  Post:= TStringStream.Create('');
  try
    Post.WriteString('origem=comprovante&');
    Post.WriteString('viewstate=' + HttpEncode(fviewstate)+'&');
    Post.WriteString('cnpj='+OnlyNumber(CNPJ)+'&');
    Post.WriteString('captcha='+Captcha+'&');
    Post.WriteString('captchaAudio=&');
    Post.WriteString('submit1=Consultar&');
    Post.WriteString('search_type=cnpj');

    Html:= MyHttpPost('http://www.receita.fazenda.gov.br/pessoajuridica/cnpj/cnpjreva/valida.asp', Post);
    Html:= StringReplace(Html, #13#10, '', [rfReplaceAll]);

    if VerificarErros(Html) = '' then
    begin
      Result:= True;

      FEmpresaTipo:= GetEmpresaTipo;
      FAbertura:= GetAbertura;
      FRazaoSocial:= GetRazaoSocial;
      FEndereco:= GetEndereco;
      FNumero:= GetNumero;
      FComplemento:= GetComplemento;
      FCEP:= GetCEP;
      FBairro:= GetBairro;
      FCidade:= GetCidade;
      FUF:= GetUF;
      FSituacao:= GetSituacao;
      FFantasia:= GetFantasia;

      if Trim(FRazaoSocial) = '' then
        raise EACBrConsultaCNPJException.Create('Não foi possível obter os dados.');
    end
    else
    begin
      Result:= False;
      raise EACBrConsultaCNPJException.Create(VerificarErros(Html));
    end;
  finally
    Post.Free;
  end;
end;

end.
