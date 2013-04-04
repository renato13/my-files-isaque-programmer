{******************************************************************************}
{ Projeto: Componente ACBrNFe                                                  }
{  Biblioteca multiplataforma de componentes Delphi para emissão de Nota Fiscal}
{ eletrônica - NFe - http://www.nfe.fazenda.gov.br                             }
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
|* 14/03/2013: Peterson de Cerqueira Matos
|*  - Início da impressão dos eventos em Fortes Report
******************************************************************************}
{$I ACBr.inc}
unit ACBrNFeDANFeEventoRL;

interface

uses
  SysUtils, Variants, Classes,
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QExtCtrls, Qt,
  {$ELSE}
  Windows, Messages, Graphics, Controls, Forms, Dialogs, ExtCtrls,
  {$ENDIF}
  RLReport, RLPDFFilter, RLConsts,
  pcnEnvEventoNFe, pcnConversao,
  ACBrNFe, ACBrNFeDANFeRL, RLFilters, RLPrinters,
  DB, MaskUtils, {$IFDEF BORLAND} DBClient{$ELSE} BufDataset{$ENDIF};

type
  TfrlDANFeEventoRL = class(TForm)
    RLEvento: TRLReport;
    RLPDFFilter1: TRLPDFFilter;
  private
    { Private declarations }
  protected
    FACBrNFe: TACBrNFe;
    FEventoNFe: TEventoNFe;
    FLogo: String;
    FMarcaDagua: String;
    FNumCopias: Integer;
    FSsitema: String;
    FUsuario: String;
    FMostrarPreview: Boolean;
    FFonteDANFEEvento: TFonteDANFE;
    FMargemSuperior: Double;
    FMargemInferior: Double;
    FMargemEsquerda: Double;
    FMargemDireita: Double;
    FImpressora: String;
    FItemAtual: Integer;

  public
    { Public declarations }
    class procedure Imprimir(AEventoNFe: TEventoNFe; ALogo: String = '';
                    AMarcaDagua: String = ''; ANumCopias: Integer = 1;
                    ASistema: String = ''; AUsuario: String = '';
                    AMostrarPreview: Boolean = True;
                    AFonteDANFEEvento: TFonteDANFE = fdTimesNewRoman;
                    AMargemSuperior: Double = 0.7;
                    AMargemInferior: Double = 0.7;
                    AMargemEsquerda: Double = 0.7;
                    AMargemDireita: Double = 0.7;
                    AImpressora: String = '';
                    AItemAtual: Integer = 0);

    class procedure SavePDF(AEventoNFe: TEventoNFe; ALogo: String = '';
                    AMarcaDagua: String = ''; AFile: String = '';
                    ASistema: String = ''; AUsuario: String = '';
                    AFonteDANFEEvento: TFonteDANFE = fdTimesNewRoman;
                    AMargemSuperior: Double = 0.7;
                    AMargemInferior: Double = 0.7;
                    AMargemEsquerda: Double = 0.7;
                    AMargemDireita: Double = 0.7;
                    AItemAtual: Integer = 0);
  end;

implementation


{$R *.dfm}

class procedure TfrlDANFeEventoRL.Imprimir(AEventoNFe: TEventoNFe; ALogo: String = '';
                    AMarcaDagua: String = ''; ANumCopias: Integer = 1;
                    ASistema: String = ''; AUsuario: String = '';
                    AMostrarPreview: Boolean = True;
                    AFonteDANFEEvento: TFonteDANFE = fdTimesNewRoman;
                    AMargemSuperior: Double = 0.7;
                    AMargemInferior: Double = 0.7;
                    AMargemEsquerda: Double = 0.7;
                    AMargemDireita: Double = 0.7;
                    AImpressora: String = '';
                    AItemAtual: Integer = 0);

begin
  with Create ( nil ) do
    try
      FEventoNFe := AEventoNFe;
      FLogo := ALogo;
      FMarcaDagua := AMarcaDagua;
      FNumCopias := ANumCopias;
      FSsitema := ASistema;
      FUsuario := AUsuario;
      FMostrarPreview := AMostrarPreview;
      FFonteDANFEEvento := AFonteDANFEEvento;
      FMargemSuperior := AMargemSuperior;
      FMargemInferior := AMargemInferior;
      FMargemEsquerda := AMargemEsquerda;
      FMargemDireita := AMargemDireita;
      FImpressora := AImpressora;
      FItemAtual := AItemAtual;

      if FImpressora > '' then
        RLPrinter.PrinterName := FImpressora;

      if FNumCopias > 0 then
        RLPrinter.Copies := FNumCopias
      else
        RLPrinter.Copies := 1;

      if FMostrarPreview = True then
        RLEvento.PreviewModal
      else
        RLEvento.Print;

    finally
      Free ;
    end ;
end;

class procedure TfrlDANFeEventoRL.SavePDF(AEventoNFe: TEventoNFe; ALogo: String = '';
                    AMarcaDagua: String = ''; AFile: String = '';
                    ASistema: String = ''; AUsuario: String = '';
                    AFonteDANFEEvento: TFonteDANFE = fdTimesNewRoman;
                    AMargemSuperior: Double = 0.7;
                    AMargemInferior: Double = 0.7;
                    AMargemEsquerda: Double = 0.7;
                    AMargemDireita: Double = 0.7;
                    AItemAtual: Integer = 0);

begin
  with Create ( nil ) do
    try
      FEventoNFe := AEventoNFe;
      FLogo := ALogo;
      FMarcaDagua := AMarcaDagua;
      FSsitema := ASistema;
      FUsuario := AUsuario;
      FFonteDANFEEvento := AFonteDANFEEvento;
      FMargemSuperior := AMargemSuperior;
      FMargemInferior := AMargemInferior;
      FMargemEsquerda := AMargemEsquerda;
      FMargemDireita := AMargemDireita;
      FItemAtual := AItemAtual;

      RLEvento.SaveToFile(AFile);

    finally
      Free ;
    end ;
end;

end.
