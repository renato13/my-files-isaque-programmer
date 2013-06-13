{******************************************************************************}
{ Projeto: Componentes ACBr                                                    }
{  Biblioteca multiplataforma de componentes Delphi para interação com equipa- }
{ mentos de Automação Comercial utilizados no Brasil                           }
{                                                                              }
{ Direitos Autorais Reservados (c) 2004 Daniel Simoes de Almeida               }
{                                       Régys Silveira                         }
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
|* 15/05/2013: Primeira Versao
|*    Régys Borges da Silveira
******************************************************************************}

{$I ACBr.inc}

unit ACBrIBPTax;

interface

uses
  Contnrs,  SysUtils, Variants, Classes,
  ACBrUtil, ACBrSocket;

type
  EACBrIBPTax = class(Exception);

  TACBrIBPTaxExporta = (exTXT, exCSV, exDSV, exXML, exHTML);

  TACBrIBPTaxTabela = (tabNCM, tabNBS);

  TACBrIBPTaxRegistro = class
  private
    FTabela: TACBrIBPTaxTabela;
    FExcecao: String;
    FNCM: string;
    FAliqNacional: Double;
    FAliqImportado: Double;
  public
    property NCM: string read FNCM write FNCM;
    property Excecao: String read FExcecao write FExcecao;
    property Tabela: TACBrIBPTaxTabela read FTabela write FTabela;
    property AliqNacional: Double read FAliqNacional write FAliqNacional;
    property AliqImportado: Double read FAliqImportado write FAliqImportado;
  end;

  TACBrIBPTaxRegistros = class(TObjectList)
  private
    function GetItem(Index: integer): TACBrIBPTaxRegistro;
    procedure SetItem(Index: integer; const Value: TACBrIBPTaxRegistro);
  public
    function New: TACBrIBPTaxRegistro;
    property Items[Index: integer]: TACBrIBPTaxRegistro read GetItem write SetItem; default;
  end;

  { TACBrIBPTax }

  TACBrIBPTax = class(TACBrHTTP)
  private
    FArquivo: TStringList;
    FVersaoArquivo: String;
    FURLDownload: String;
    FItens: TACBrIBPTaxRegistros;
    procedure ExportarCSV(const AArquivo: String);
    procedure ExportarDSV(const AArquivo: String);
    procedure ExportarHTML(const AArquivo: String);
    procedure ExportarXML(const AArquivo: String);
    procedure ExportarTXT(const AArquivo: String);
    procedure PopularItens;
  public
    destructor Destroy; override;
    constructor Create(AOwner: TComponent); override;

    function DownloadTabela: Boolean;
    function AbrirTabela(const AFileName: TFileName): Boolean;
    procedure Exportar(const AArquivo: String; ATipo: TACBrIBPTaxExporta); overload;
    procedure Exportar(const AArquivo, ADelimitador: String); overload;
    function Procurar(const ACodigo: String; var ex: String;
      var tabela: Integer; var aliqNac, aliqImp: Double ): Boolean;

    property Itens: TACBrIBPTaxRegistros read FItens;
  published
    property VersaoArquivo : String read FVersaoArquivo ;
    property URLDownload: String read FURLDownload write FURLDownload;
    property Arquivo: TStringList read FArquivo write FArquivo;
  end;

  function TabelaToString(const ATabela: TACBrIBPTaxTabela): String;
  function StringToTabela(const ATabela: String): TACBrIBPTaxTabela;

implementation

uses
  Math, StrUtils;

function TabelaToString(const ATabela: TACBrIBPTaxTabela): String;
begin
  case ATabela of
    tabNCM: Result := '0';
    tabNBS: Result := '1';
  end;
end;

function StringToTabela(const ATabela: String): TACBrIBPTaxTabela;
begin
  if ATabela = '0' then
    Result := tabNCM
  else
  if ATabela = '1' then
    Result := tabNBS
  else
    raise EACBrIBPTax.CreateFmt('Tipo de tabela desconhecido "%s".', [ATabela]);
end;

{ TACBrIBPTaxRegistros }

function TACBrIBPTaxRegistros.GetItem(Index: integer): TACBrIBPTaxRegistro;
begin
  Result := TACBrIBPTaxRegistro(inherited Items[Index]);
end;

function TACBrIBPTaxRegistros.New: TACBrIBPTaxRegistro;
begin
  Result := TACBrIBPTaxRegistro.Create;
  Add(Result);
end;

procedure TACBrIBPTaxRegistros.SetItem(Index: integer;
  const Value: TACBrIBPTaxRegistro);
begin
  Put(Index, Value);
end;

{ TACBrIBPTax }

constructor TACBrIBPTax.Create(AOwner: TComponent);
begin
  inherited;

  FItens := TACBrIBPTaxRegistros.Create( True );
  FArquivo := TStringList.Create;
  FURLDownload := '';
  FVersaoArquivo := '';
end;

destructor TACBrIBPTax.Destroy;
begin
  FItens.Free;
  FArquivo.Free;
  inherited;
end;

procedure TACBrIBPTax.PopularItens;
var
  Item: TStringList;
  I: Integer;
begin
  if Arquivo.Count <= 0 then
    raise EACBrIBPTax.Create('Arquivo de itens não foi baixado!');

  FVersaoArquivo := '';
  Itens.Clear;

  Item := TStringList.Create;
  try
    Item.Delimiter := ';';

    // primeira linha contem os cabecalhos de campo e versão do arquivo
    Item.DelimitedText := Arquivo.Strings[0];
    if Item.Count = 6 then
      FVersaoArquivo := Item.Strings[5];

    // proximas linhas contem os registros
    for I := 1 to Arquivo.Count - 1 do
    begin
      Item.DelimitedText := Arquivo.Strings[I];
      if Item.Count = 6 then
      begin
        with Itens.New do
        begin
          NCM           := Item.Strings[0];
          Excecao       := Item.Strings[1];
          AliqNacional  := StringToFloatDef(Item.Strings[3], 0.00);
          AliqImportado := StringToFloatDef(Item.Strings[4], 0.00);
          Tabela        := TACBrIBPTaxTabela(StrToInt(Trim(Item.Strings[2])));
        end;
      end;
    end;
  finally
    Item.Free;
  end;
end;

function TACBrIBPTax.DownloadTabela: Boolean;
//Var
//  StreamHTML: TMemoryStream;
//  I, PosInicial, PosFinal: Integer;
//  HtmlRetorno: String;
begin
  { removido porque o site foi tirado do ar, ao invés disso agora
    confifure diretamente a url para baixar

  // descobrir primeiro o nome da tabela
  HTTPGet('http://www.impostometro.com.br/lei12741/ibptax');
  HtmlRetorno := '';
  for I := 0 to RespHTTP.Count - 1 do
  begin
    if Pos('.csv', RespHTTP.Strings[I]) > 0 then
    begin
      HtmlRetorno := RespHTTP.Strings[I];
      Break;
    end;
  end;

  Result := Trim(HtmlRetorno) <> '';
  if Result then
  begin
    PosInicial   := Pos('http:', HtmlRetorno);
    PosFinal     := (Pos('.csv', HtmlRetorno) + 4) - PosInicial;
    FURLDownload := Copy(HtmlRetorno, PosInicial, PosFinal);

    // baixar a tabela
    HTTPGet( FURLDownload );
    FArquivo.Text := RespHTTP.Text;
    Result := True;

    PopularItens;
  end;
  }

  if Trim(FURLDownload) = '' then
    raise EACBrIBPTax.Create('URL do arquivo .csv não foi informado em "URLDownload!"');

  // baixar a tabela
  HTTPGet( FURLDownload );
  FArquivo.Text := RespHTTP.Text;
  Result := True;

  PopularItens;
end;

function TACBrIBPTax.AbrirTabela(const AFileName: TFileName): Boolean;
begin
  if Trim(AFileName) <> '' then
  begin
    Arquivo.LoadFromFile(AFileName);
    PopularItens;
  end
  else
  begin
    if Arquivo.Count <= 0 then
      DownloadTabela;
  end;

  Result := Itens.Count > 0;
end;

function TACBrIBPTax.Procurar(const ACodigo: String; var ex: String;
  var tabela: Integer; var aliqNac, aliqImp: Double ): Boolean;
var
  I: Integer;
begin
  if Itens.Count <= 0 then
    EACBrIBPTax.Create('Tabela de itens ainda não foi aberta!');

  Result := False;
  for I := 0 to Itens.Count - 1 do
  begin
    if Trim(ACodigo) = Trim(Itens[I].NCM) Then
     begin
       ex      := Itens[I].Excecao ;
       tabela  := Integer(Itens[I].Tabela) ;
       aliqNac := Itens[I].AliqNacional ;
       aliqImp := Itens[I].AliqImportado ;

       Result := True;
       Exit;
     end;
  end;
end;

procedure TACBrIBPTax.Exportar(const AArquivo: String; ATipo: TACBrIBPTaxExporta);
begin
  if Itens.Count <= 0 then
    EACBrIBPTax.Create('Tabela de itens ainda não foi aberta!');

  case ATipo of
    exTXT:  ExportarTXT(AArquivo);
    exCSV:  ExportarCSV(AArquivo);
    exDSV:  ExportarDSV(AArquivo);
    exXML:  ExportarXML(AArquivo);
    exHTML: ExportarHTML(AArquivo);
  end;
end;

procedure TACBrIBPTax.Exportar(const AArquivo, ADelimitador: String);
var
  I: Integer;
  Texto: String;
begin
  if Itens.Count <= 0 then
    EACBrIBPTax.Create('Tabela de itens ainda não foi aberta!');

  Texto := '';
  for I := 0 to Itens.Count - 1 do
  begin
    Texto := Texto +
      Itens[I].NCM + ADelimitador +
      Itens[I].Excecao + ADelimitador +
      IntToStr(Integer(Itens[I].Tabela)) + ADelimitador +
      FloatToString(Itens[I].AliqNacional) + ADelimitador +
      FloatToString(Itens[I].AliqImportado) + ADelimitador +
      sLineBreak;
  end;

  if Trim(Texto) <> '' then
    WriteToTXT(AnsiString(AArquivo), AnsiString(Texto), False, False);
end;

procedure TACBrIBPTax.ExportarTXT(const AArquivo: String);
var
  I: Integer;
  Texto: String;
begin
  if Itens.Count <= 0 then
    EACBrIBPTax.Create('Tabela de itens ainda não foi aberta!');

  Texto := '';
  for I := 0 to Itens.Count - 1 do
  begin
    Texto := Texto +
      PadL(Itens[I].NCM, 10) +
      PadL(Itens[I].Excecao, 2) +
      PadL(IntToStr(Integer(Itens[I].Tabela)), 1) +
      PadR(FloatToString(Itens[I].AliqNacional * 100), 4, '0') +
      PadR(FloatToString(Itens[I].AliqImportado * 100), 4, '0') +
      sLineBreak;
  end;

  if Trim(Texto) <> '' then
    WriteToTXT(AnsiString(AArquivo), AnsiString(Texto), False, False);
end;

procedure TACBrIBPTax.ExportarCSV(const AArquivo: String);
begin
  Exportar(AArquivo, ';');
end;

procedure TACBrIBPTax.ExportarDSV(const AArquivo: String);
var
  I: Integer;
  Texto: String;

  function AddAspasDuplas(const ATexto: String): String;
  begin
    Result := '"' + ATexto + '"';
  end;

begin
  if Itens.Count <= 0 then
    EACBrIBPTax.Create('Tabela de itens ainda não foi aberta!');

  Texto := '';
  for I := 0 to Itens.Count - 1 do
  begin
    Texto := Texto +
      AddAspasDuplas(Itens[I].NCM) + ',' +
      AddAspasDuplas(Itens[I].Excecao) + ',' +
      AddAspasDuplas(IntToStr(Integer(Itens[I].Tabela))) + ',' +
      AddAspasDuplas(FloatToString(Itens[I].AliqNacional)) + ',' +
      AddAspasDuplas(FloatToString(Itens[I].AliqImportado)) +
      sLineBreak;
  end;

  if Trim(Texto) <> '' then
    WriteToTXT(AnsiString(AArquivo), AnsiString(Texto), False, False);
end;

procedure TACBrIBPTax.ExportarXML(const AArquivo: String);
var
  I: Integer;
  Texto: String;
begin
  if Itens.Count <= 0 then
    EACBrIBPTax.Create('Tabela de itens ainda não foi aberta!');

  Texto := '<?xml version="1.0" encoding="ISO-8859-1"?><IBPTax>';
  for I := 0 to Itens.Count - 1 do
  begin
    Texto := Texto +
      '<imposto>' +
      '<ncm>' + Itens[I].NCM + '</ncm>' +
      '<ex>' + Itens[I].Excecao + '</ex>' +
      '<tabela>' + IntToStr(Integer(Itens[I].Tabela)) + '</tabela>' +
      '<aliqNac>' + FloatToString(Itens[I].AliqNacional) + '</aliqNac>' +
      '<aliqImp>' + FloatToString(Itens[I].AliqImportado) + '</aliqImp>' +
      '</imposto>';
  end;
  Texto := Texto + '</IBPTax>';

  if Trim(Texto) <> '' then
    WriteToTXT(AnsiString(AArquivo), AnsiString(Texto), False, True);
end;

procedure TACBrIBPTax.ExportarHTML(const AArquivo: String);
var
  I: Integer;
  Texto: String;
begin
  if Itens.Count <= 0 then
    EACBrIBPTax.Create('Tabela de itens ainda não foi aberta!');

  Texto :=
    '<html>' + slineBreak +
    '<head>' + slineBreak +
    '    <title>Tabela Imposto no Cupom</title>' + slineBreak +
    '    <style type="text/css">' + slineBreak +
    '        body{font-family: Arial;}' + slineBreak +
    '        th{color:white; font-size:8pt; background-color: black;}' + slineBreak +
		'        tr{font-size:8pt;}' + slineBreak +
    '        tr:nth-child(2n+1) {background-color: #DCDCDC;}' + slineBreak +
    '    </style>' + slineBreak +
    '</head>' + slineBreak +
    '<body>' + slineBreak +
    '    <table>' + slineBreak +
		'        <tr>' + slineBreak +
    '          <th>NCM</th>' + slineBreak +
    '          <th>Exceção</th>' + slineBreak +
    '          <th>Tabela</th>' + slineBreak +
    '          <th>Aliq. Nacional</th>' + slineBreak +
    '          <th>Aliq. Importado</th>' + slineBreak +
		'        </tr>' + slineBreak;

  for I := 0 to Itens.Count - 1 do
  begin
    Texto := Texto +
      '<tr>' + slineBreak +
        '<td>' + Itens[I].NCM + '</td>' + slineBreak +
        '<td>' + Itens[I].Excecao + '</td>' + slineBreak +
        '<td>' + IntToStr(Integer(Itens[I].Tabela)) + '</td>' + slineBreak +
        '<td>' + FloatToStr(Itens[I].AliqNacional) + '</td>' + slineBreak +
        '<td>' + FloatToStr(Itens[I].AliqImportado) + '</td>' + slineBreak +
      '</tr>' + slineBreak;
  end;

  Texto := Texto +
    '    </table>' + slineBreak +
    '</body>' + slineBreak +
    '</html>' + slineBreak;

  if Trim(Texto) <> '' then
    WriteToTXT(AnsiString(AArquivo), AnsiString(Texto), False, True);
end;

end.
