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
unit ACBrNFeDANFeEventoRLRetrato;

interface

uses
  SysUtils, Variants, Classes,
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QExtCtrls, Qt, QStdCtrls,
  {$ELSE}
  Windows, Messages, Graphics, Controls, Forms, Dialogs, ExtCtrls, MaskUtils, StdCtrls,
  {$ENDIF}
  RLReport, RLFilters, RLPDFFilter, {$IFDEF BORLAND} XMLIntf, XMLDoc, jpeg, {$ENDIF}
  ACBrNFeDANFeEventoRL, pcnConversao, RLBarcode, DB, StrUtils, ACBrNFeDANFeRL;

type
  TfrlDANFeEventoRLRetrato = class(TfrlDANFeEventoRL)
    rlbUsuario: TRLBand;
    rlbEvento: TRLBand;
    rllNomeEvento: TRLLabel;
    RLLabel32: TRLLabel;
    rllOrgao: TRLLabel;
    RLLabel35: TRLLabel;
    rllEvento: TRLLabel;
    RLLabel39: TRLLabel;
    rllStatusEvento: TRLLabel;
    RLLabel40: TRLLabel;
    rllProtocoloEvento: TRLLabel;
    RLLabel36: TRLLabel;
    rllDescrEvento: TRLLabel;
    RLLabel33: TRLLabel;
    rllAmbiente: TRLLabel;
    RLLabel37: TRLLabel;
    rllSeqEvento: TRLLabel;
    RLLabel42: TRLLabel;
    rllDataHoraRegistro: TRLLabel;
    RLLabel38: TRLLabel;
    rllVersaoEvento: TRLLabel;
    RLDraw16: TRLDraw;
    RLDraw17: TRLDraw;
    RLDraw22: TRLDraw;
    RLDraw20: TRLDraw;
    RLDraw19: TRLDraw;
    RLDraw24: TRLDraw;
    RLDraw21: TRLDraw;
    RLDraw15: TRLDraw;
    rlbNFe: TRLBand;
    RLLabel20: TRLLabel;
    RLLabel44: TRLLabel;
    rllModeloNF: TRLLabel;
    RLLabel45: TRLLabel;
    rllSerieNF: TRLLabel;
    RLLabel46: TRLLabel;
    rllMesAnoEmissaoNF: TRLLabel;
    RLDraw30: TRLDraw;
    RLDraw32: TRLDraw;
    RLDraw31: TRLDraw;
    RLDraw29: TRLDraw;
    RLDraw37: TRLDraw;
    rlbCondUso: TRLBand;
    RLLabel21: TRLLabel;
    rliMarcaDagua1: TRLImage;
    rlbCabecalho: TRLBand;
    RLDraw3: TRLDraw;
    rliLogo: TRLImage;
    rllTitulo: TRLLabel;
    rllCabecalhoLinha1: TRLLabel;
    rllCabecalhoLinha2: TRLLabel;
    rlbCodigoBarras: TRLBarcode;
    rllChaveNFe: TRLLabel;
    RLLabel4: TRLLabel;
    RLDraw4: TRLDraw;
    rllDataHoraEvento: TRLLabel;
    RLLabel5: TRLLabel;
    RLDraw5: TRLDraw;
    RLDraw50: TRLDraw;
    rlmCondUso: TRLMemo;
    rllUsuario: TRLLabel;
    rllSistema: TRLLabel;
    rlbJustificativa: TRLBand;
    RLLabel3: TRLLabel;
    rllJustificativa: TRLLabel;
    RLDraw1: TRLDraw;
    RLDraw2: TRLDraw;
    RLDraw6: TRLDraw;
    rlbCorrecao: TRLBand;
    RLLabel6: TRLLabel;
    RLDraw7: TRLDraw;
    rlmCorrecao: TRLMemo;
    RLLabel1: TRLLabel;
    RLDraw8: TRLDraw;
    rllNumNF: TRLLabel;
    procedure RLEventoBeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    procedure InitDados;
    procedure AjustaLayout;
  public

  end;

implementation

uses ACBrNFeUtil, ACBrDFeUtil, pcnEnvEventoNFe, Math;

{$R *.dfm}

procedure TfrlDANFeEventoRLRetrato.InitDados;
var i, b, h: Integer;
begin
  // Carrega logomarca
  if (FLogo <> '') and FileExists (FLogo) then
     rliLogo.Picture.LoadFromFile(FLogo);

  // Carrega marca d'água
  if (FMarcaDagua <> '') and FileExists (FMarcaDagua) then
    begin
      rliMarcaDagua1.Picture.LoadFromFile(FMarcaDagua);
    end;

  with FEventoNFe.Evento.Items[FItemAtual] do
    begin
      // Preeche os campos - Quadro NF-e
      rllModeloNF.Caption := Copy(InfEvento.chNFe, 21, 2);
      rllSerieNF.Caption := Copy(InfEvento.chNFe, 23, 3);
      rllNumNF.Caption := Copy(InfEvento.chNFe, 26, 3) + '.' +
                          Copy(InfEvento.chNFe, 29, 3) + '.' +
                          Copy(InfEvento.chNFe, 32, 3);
      rllMesAnoEmissaoNF.Caption := Copy(InfEvento.chNFe, 5, 2) + '/' +
                                    Copy(InfEvento.chNFe, 3, 2);
      rllChaveNFe.Caption := NotaUtil.FormatarChaveAcesso(InfEvento.chNFe);
      rlbCodigoBarras.Caption := InfEvento.chNFe;

      // Preenche os campos - Quadro Evento
      rllOrgao.Caption := IntToStr(InfEvento.cOrgao);
      case InfEvento.tpAmb of
        taProducao:    rllAmbiente.Caption := 'PRODUÇÃO';
        taHomologacao: rllAmbiente.Caption := 'HOMOLOGAÇÃO - SEM VALOR FISCAL';
      end;
      rllDataHoraEvento.Caption := DateTimeToStr(InfEvento.dhEvento);
      rllEvento.Caption := InfEvento.TipoEvento;
      rllDescrEvento.Caption := InfEvento.DescEvento;
      rllSeqEvento.Caption := IntToStr(InfEvento.nSeqEvento);
      rllVersaoEvento.Caption := InfEvento.versaoEvento;
      rllStatusEvento.Caption := IntToStr(RetInfEvento.cStat) + ' - ' +
                                          RetInfEvento.xMotivo;
      rllProtocoloEvento.Caption := RetInfEvento.nProt;
      rllDataHoraRegistro.Caption := DateTimeToStr(RetInfEvento.dhRegEvento);

      // Preenche os campos espcíficos de acordo com o evento
      case InfEvento.tpEvento of
        teCCe:
          begin
            rllTitulo.Caption := 'CARTA DE CORREÇÃO ELETRÔNICA';

            // Prrenche os campos - "Condições de uso"
            rlmCondUso.Lines.Add(StringReplace(InfEvento.detEvento.xCondUso,
                                  '; ', ';'#13#10, [rfReplaceAll, rfIgnoreCase]));
            rlmCondUso.Lines.Text := StringReplace(rlmCondUso.Lines.Text,
                                  ': I', ':'#13#10'I', [rfReplaceAll, rfIgnoreCase]);

            // Prrenche os campos - "Correção"
            rlmCorrecao.Lines.Add(StringReplace(InfEvento.detEvento.xCorrecao,
                                  '; ', ';'#13#10, [rfReplaceAll, rfIgnoreCase]));
          end;

        teCancelamento:
          begin
            rllTitulo.Caption := 'CANCELAMENTO DE NF-E';
            rllJustificativa.Caption := InfEvento.detEvento.xJust;
          end;
      end; // case InfEvento.tpEvento

      rllNomeEvento.Caption := rllTitulo.Caption;
    end; // with FEventoNFe.Evento.Items[FItemAtual].InfEvento


  // Exibe o desenvolvedor do sistema
  if FSsitema <> '' then
    begin
      rllSistema.Caption := FSsitema;
      rllSistema.Visible := True;
    end
  else
    rllSistema.Visible := False;

  // Exibe o nome do usuário
  if FUsuario <> '' then
    begin
      rllUsuario.Caption := 'DATA / HORA DA IMPRESSÃO: ' +
                            DateTimeToStr(Now) + ' - ' + FUsuario;
      rllUsuario.Visible := True;
    end
  else
    rllUsuario.Visible := False;

end;

procedure TfrlDANFeEventoRLRetrato.AjustaLayout;
var b, i: Integer;
begin
  // Ajuste das margens
  with RLEvento.Margins do
    begin
      TopMargin := FMargemSuperior * 10;
      BottomMargin := FMargemInferior * 10;
      LeftMargin := FMargemEsquerda * 10;
      RightMargin := FMargemDireita * 10;
    end;

  // Ajuste da fone
  case FFonteDANFEEvento of
    fdArial:
      for b := 0 to (RLEvento.ControlCount - 1) do
        for i := 0 to ((TRLBand(RLEvento.Controls[b]).ControlCount) - 1) do
          begin
            TRLLabel((TRLBand(RLEvento.Controls[b])).Controls[i]).Font.Name :=
                                                                      'Arial';
          end;

    fdCourierNew:
      begin
        for b := 0 to (RLEvento.ControlCount - 1) do
          for i := 0 to ((TRLBand(RLEvento.Controls[b]).ControlCount) - 1) do
            begin
              TRLLabel((TRLBand(RLEvento.Controls[b])).Controls[i]).Font.Name :=
                                                                'Courier New';
                TRLLabel((TRLBand(RLEvento.Controls[b])).Controls[i]).Font.Size :=
               (TRLLabel((TRLBand(RLEvento.Controls[b])).Controls[i]).Font.Size) - 1;

            end;
      end;

    fdTimesNewRoman:
      for b := 0 to (RLEvento.ControlCount - 1) do
        for i := 0 to ((TRLBand(RLEvento.Controls[b]).ControlCount) - 1) do
          begin
            TRLLabel((TRLBand(RLEvento.Controls[b])).Controls[i]).Font.Name :=
                                                             'Times New Roman';
          end;
  end;

  // Centraliza as linhas do cabeçalho caso o logo não seja informado
  if (FLogo <> '') and FileExists (FLogo) then
    begin
      rllTitulo.Left := 88;
      rllCabecalhoLinha1.Left := 88;
      rllCabecalhoLinha2.Left := 88;

      rllTitulo.Width := 650;
      rllCabecalhoLinha1.Width := 650;
      rllCabecalhoLinha2.Width := 650;
    end
  else
    begin
      rllTitulo.Left := 8;
      rllCabecalhoLinha1.Left := 8;
      rllCabecalhoLinha2.Left := 8;

      rllTitulo.Width := 730;
      rllCabecalhoLinha1.Width := 730;
      rllCabecalhoLinha2.Width := 730;
    end;

  // Exibe os itens específicos de cada evento e ajusta a posição
  // da marca dágua, de acordo com o evento

  case FEventoNFe.Evento.Items[FItemAtual].InfEvento.tpEvento of
    teCCe:
      begin
        rlbJustificativa.Visible := False;
        rlbCondUso.Visible := True;
        rlbCorrecao.Visible := True;
        rliMarcaDagua1.Top := 300;
      end;

    teCancelamento:
      begin
        rlbJustificativa.Visible := True;
        rlbCondUso.Visible := False;
        rlbCorrecao.Visible := False;
        rliMarcaDagua1.Top := 70;
      end;
  end; // case FEventoNFe.Evento.Items[0].InfEvento.tpEvento
end;

procedure TfrlDANFeEventoRLRetrato.RLEventoBeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  AjustaLayout;
  InitDados;
end;

end.
