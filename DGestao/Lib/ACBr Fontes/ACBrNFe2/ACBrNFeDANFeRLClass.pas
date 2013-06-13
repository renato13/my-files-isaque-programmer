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
|* 16/12/2008: Wemerson Souto
|*  - Doação do componente para o Projeto ACBr
|* 20/08/2009: Caique Rodrigues
|*  - Doação units para geração do Danfe via QuickReport
|* 20/11/2009: Peterson de Cerqueira Matos
|*             E-mail: peterson161@yahoo.com - Tel: (11) 7197-1474 / 8059-4055
|*  - Componente e Units do QuickReport clonados
|*    e transformados em FORTES REPORT
|* 27/01/2010: Peterson de Cerqueira Matos
|*  - Acréscimo da propriedade "LarguraCodProd", que definirá a largura da
|*    "Código do Produto" no DANFE
|* 15/03/2010: Felipe Feltes
|*  - Adequação na seção 'USES' para ser utilizado em CLX
|* 19/03/2010: Peterson de Cerqueira Matos
|*  - Tratamento das propriedades "FormularioContinuo", "ExpandirLogoMarca" e
|*    "MostrarPreview" de "ACBrNFeDANFeClass"
|*  - Acréscimo da propriedade "PosCanhoto", que permite ao usuário escolher
|*    entre "pcCabecalho" e "pcRodape"
|* 22/03/2010: Peterson de Cerqueira Matos
|*  - Tratamento das margens em "ACBrNFeDANFeClass"
|*  - Acréscimo da propriedade "FonteDANFE", que permite ao usuário escolher
|*    entre "fdArial", "fdTimesNewRoman" e "fdCourierNew"
|* 13/04/2010: Peterson de Cerqueira Matos
|*  - Adequação à NF-e 2.0, Manual de Integração do Contribuinte 4.0.1NT2009.006
|*  - Tratamento das casas decimais em "ACBrNFeDANFeClass"
|* 06/07/2010: Peterson de Cerqueira Matos
|*  - Tratamento da quantidade de produtos por página em "ACBrNFeDANFeClass"
|*  - Exibição do DANFe em modo paisagem
|* 20/07/2010: Peterson de Cerqueira Matos
|*  - Envia o DANFe para a impressora informada em "Impressora" de
|*  - "ACBrNFeDANFeClass"
|* 28/07/2010: Peterson de Cerqueira Matos
|*  - Alteração do sulfixo do arquivo PDF de '-nfe.pdf' para '.pdf'
|* 10/08/2010: Peterson de Cerqueira Matos
|*  - Tratamento do tamanho da fonte da razão social do emitente
|* 25/11/2010: Peterson de Cerqueira Matos
|*  - Acréscimo da propriedade "ExibirEAN"
|* 16/02/2011: Fernando Emiliano David Nunes
|*  - Acrescentado ao Método ImprimeDANFEPDF a condição ELSE quando NFE <> NIL
|* 01/03/2011: Fernando Emiliano David Nunes
|*  - Quando DPEC, nao estava imprimindo o valor FProtocoloNFe, acrescentei o
|*    envio do Atributo: ProtocoloNFe
|* 20/05/2010: Peterson de Cerqueira Matos
|*  - Tratamento da propriedade "ExibirResumoCanhoto_Texto"
|* 23/05/2011: Waldir Paim
|*  - Início da preparação para Lazarus: Somente utiliza TClientDataSet quando
|*    estiver no Delphi. Obrigatória a utilização da versão 3.70B ou superior
|*    do Fortes Report. Download disponível em
|*    http://sourceforge.net/projects/fortesreport/files/
|* 14/03/2013: Peterson de Cerqueira Matos
|*  - Início da impressão dos eventos em Fortes Report
|* 22/03/2013: Peterson de Cerqueira Matos
|*  - Impressão dos detalhamentos específicos e do desconto em percentual
******************************************************************************}
{$I ACBr.inc}
unit ACBrNFeDANFeRLClass;

interface

uses SysUtils, Classes,
  {$IFDEF CLX}
  QForms, QDialogs,
  {$ELSE}
  Forms, Dialogs,
  {$ENDIF}
  ACBrNFeDANFEClass, RLConsts,
  ACBrNFeDANFeRL, ACBrNFeDANFeRLRetrato, ACBrNFeDANFeRLPaisagem,
  ACBrNFeDANFeEventoRL, ACBrNFeDANFeEventoRLRetrato,
  pcnNFe, pcnConversao, StrUtils;

type
  TACBrNFeDANFeRL = class( TACBrNFeDANFEClass )
  private
    FMarcadagua: string;
    FLarguraCodProd: Integer;
    FPosCanhoto: TPosCanhoto;
    FFonteDANFE: TFonteDANFE;
    FTamanhoFonte_RazaoSocial: Integer;
    FExibirEAN: Boolean;
    FDetVeiculos: TDetVeiculos;
    FDetMedicamentos: TDetMedicamentos;
    FDetArmamentos: TDetArmamentos;
    FDetCombustiveis: TDetCombustiveis;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure ImprimirDANFE(NFE : TNFe = nil); override ;
    procedure ImprimirDANFEPDF(NFE : TNFe = nil); override ;
    procedure ImprimirEVENTO(NFE : TNFe = nil); override ;
    procedure ImprimirEVENTOPDF(NFE : TNFe = nil); override ;
    procedure SetExibirEAN(Value: Boolean); virtual;
  published
    property MarcadAgua : String read FMarcadagua write FMarcadagua ;
    property LarguraCodProd: Integer read FLarguraCodProd write FLarguraCodProd;
    property PosCanhoto: TPosCanhoto read FPosCanhoto write FPosCanhoto
                                                          default pcCabecalho;
    property FonteDANFE: TFonteDANFE read FFonteDANFE write FFonteDANFE
                                                      default fdTimesNewRoman;
    property TamanhoFonte_RazaoSocial: Integer read FTamanhoFonte_RazaoSocial
                                              write FTamanhoFonte_RazaoSocial;
    property ExibirEAN: Boolean read FExibirEAN write SetExibirEAN;
    property DetVeiculos: TDetVeiculos read FDetVeiculos write FDetVeiculos default
                          [dv_chassi, dv_xCor, dv_nSerie, dv_tpComb, dv_nMotor, dv_anoMod, dv_anoFab];
    property DetMedicamentos: TDetMedicamentos read FDetMedicamentos write FDetMedicamentos default
                              [dm_nLote, dm_qLote, dm_dFab, dm_dVal, dm_vPMC];
    property DetArmamentos: TDetArmamentos read FDetArmamentos write FDetArmamentos default
                            [da_tpArma, da_nSerie, da_nCano, da_descr];
    property DetCombustiveis: TDetCombustiveis read FDetCombustiveis write FDetCombustiveis default
                            [dc_cProdANP, dc_CODIF, dc_qTemp, dc_UFCons, dc_CIDE, dc_qBCProd, dc_vAliqProd, dc_vCIDE];
  end;

implementation

uses ACBrNFe, ACBrNFeUtil, ACBrUtil;

var
  i : Integer;
  frlDANFeRL: TfrlDANFeRL;
  frlDANFeEventoRL: TfrlDANFeEventoRL;

constructor TACBrNFeDANFeRL.Create(AOwner: TComponent);
begin
  //SetVersion(CommercialVersion,ReleaseVersion,CommentVersion);
  inherited create( AOwner );
  FLarguraCodProd := 54;
  FMargemSuperior := 0.70;
  FMargemInferior := 0.70;
  FMargemEsquerda := 0.70;
  FMargemDireita := 0.70;
  FCasasDecimais._qCom := 4;
  FCasasDecimais._vUnCom := 4;
  FProdutosPorPagina := 0;
  FTamanhoFonte_RazaoSocial := 8;
  FExibirEAN := False;
  FTipoDANFE := tiRetrato;  
  FDetVeiculos := [dv_chassi, dv_xCor, dv_nSerie, dv_tpComb, dv_nMotor, dv_anoMod, dv_anoFab];
  FDetMedicamentos := [dm_nLote, dm_qLote, dm_dFab, dm_dVal, dm_vPMC];
  FDetArmamentos := [da_tpArma, da_nSerie, da_nCano, da_descr];
  FDetCombustiveis := [dc_cProdANP, dc_CODIF, dc_qTemp, dc_UFCons, dc_CIDE, dc_qBCProd, dc_vAliqProd, dc_vCIDE];
end;

destructor TACBrNFeDANFeRL.Destroy;
begin
  inherited Destroy ;
end;

procedure TACBrNFeDANFeRL.ImprimirDANFE(NFE : TNFe = nil);
begin
  case FTipoDANFE of
    tiRetrato:   frlDANFeRL := TfrlDANFeRLRetrato.Create(Self);
    tiPaisagem:  frlDANFeRL := TfrlDANFeRLPaisagem.Create(Self);
  end;

  if NFE = nil then
    begin
      for i:= 0 to TACBrNFe(ACBrNFe).NotasFiscais.Count - 1 do
        begin
          frlDANFeRL.Imprimir(TACBrNFe(ACBrNFe).NotasFiscais.Items[i].NFe,
          Logo, MarcaDagua, LarguraCodProd, Email, ExibirResumoCanhoto, Fax,
          NumCopias, Sistema, Site, Usuario, PosCanhoto, FormularioContinuo,
          ExpandirLogoMarca, MostrarPreview, FonteDANFE, MargemSuperior,
          MargemInferior, MargemEsquerda, MargemDireita, CasasDecimais._qCom,
          CasasDecimais._vUnCom, ProdutosPorPagina, Impressora,
          TamanhoFonte_RazaoSocial, ExibirEAN, ProtocoloNFe,
          ExibirResumoCanhoto_Texto, NFeCancelada,
          ImprimirDetalhamentoEspecifico, ImprimirDescPorc,
          DetVeiculos, DetMedicamentos, DetArmamentos, DetCombustiveis);
        end;
    end
  else
    begin
      frlDANFeRL.Imprimir(NFE,
      Logo, MarcaDagua, LarguraCodProd, Email, ExibirResumoCanhoto, Fax,
      NumCopias, Sistema, Site, Usuario, PosCanhoto, FormularioContinuo,
      ExpandirLogoMarca, MostrarPreview, FonteDANFE, MargemSuperior,
      MargemInferior, MargemEsquerda, MargemDireita, CasasDecimais._qCom,
      CasasDecimais._vUnCom, ProdutosPorPagina, Impressora,
      TamanhoFonte_RazaoSocial, ExibirEAN, ProtocoloNFe,
      ExibirResumoCanhoto_Texto, NFeCancelada,
      ImprimirDetalhamentoEspecifico, ImprimirDescPorc,
      DetVeiculos, DetMedicamentos, DetArmamentos, DetCombustiveis);
    end;

  frlDANFeRL.Free;
end;

procedure TACBrNFeDANFeRL.ImprimirDANFEPDF(NFE : TNFe = nil);
var sFile: String;
begin
  case FTipoDANFE of
    tiRetrato:   frlDANFeRL := TfrlDANFeRLRetrato.Create(Self);
    tiPaisagem:  frlDANFeRL := TfrlDANFeRLPaisagem.Create(Self);
  end;

  if NFE = nil then
    begin
      for i:= 0 to TACBrNFe(ACBrNFe).NotasFiscais.Count-1 do
        begin
          sFile := TACBrNFe(ACBrNFe).DANFE.PathPDF +
                   Copy(TACBrNFe(ACBrNFe).NotasFiscais.Items[i].NFe.infNFe.ID,
                   4, 44) + '.pdf';
          frlDANFeRL.SavePDF(TACBrNFe(ACBrNFe).NotasFiscais.Items[i].NFe,
          Logo, MarcaDagua, LarguraCodProd, Email, ExibirResumoCanhoto, Fax,
          NumCopias, Sistema, Site, Usuario, sFile, PosCanhoto, FormularioContinuo,
          ExpandirLogoMarca, FonteDANFE, MargemSuperior,
          MargemInferior, MargemEsquerda, MargemDireita, CasasDecimais._qCom,
          CasasDecimais._vUnCom, ProdutosPorPagina, TamanhoFonte_RazaoSocial,
          ExibirEAN, ProtocoloNFe, ExibirResumoCanhoto_Texto, NFeCancelada,
          ImprimirDetalhamentoEspecifico, ImprimirDescPorc,
          DetVeiculos, DetMedicamentos, DetArmamentos, DetCombustiveis);
        end;
    end
  else
    begin
      sFile := Self.PathPDF + Copy(NFe.infNFe.ID, 4, 44) + '.pdf';
      frlDANFeRL.SavePDF(NFe, Logo, MarcaDagua, LarguraCodProd, Email,
      ExibirResumoCanhoto, Fax, NumCopias, Sistema, Site, Usuario, sFile,
      PosCanhoto, FormularioContinuo, ExpandirLogoMarca, FonteDANFE,
      MargemSuperior, MargemInferior, MargemEsquerda, MargemDireita,
      CasasDecimais._qCom, CasasDecimais._vUnCom, ProdutosPorPagina,
      TamanhoFonte_RazaoSocial, ExibirEAN, ProtocoloNFe,
      ExibirResumoCanhoto_Texto, NFeCancelada,
      ImprimirDetalhamentoEspecifico, ImprimirDescPorc,
      DetVeiculos, DetMedicamentos, DetArmamentos, DetCombustiveis);
    end;


  frlDANFeRL.Free;
end;

procedure TACBrNFeDANFeRL.SetExibirEAN(Value: Boolean);
begin
  if FTipoDANFE = tiRetrato then
    FExibirEAN := False
  else
    FExibirEAN := Value;
end;

procedure TACBrNFeDANFeRL.ImprimirEVENTO(NFE: TNFe);
begin
  case FTipoDANFE of
    tiRetrato, tiPaisagem:
              frlDANFeEventoRL := TfrlDANFeEventoRLRetrato.Create(Self);
  end;

  for i := 0 to (TACBrNFe(ACBrNFe).EventoNFe.Evento.Count - 1) do
    begin
      frlDANFeEventoRL.Imprimir(TACBrNFe(ACBrNFe).EventoNFe,
      FLogo, FMarcadagua, FNumCopias, FSistema, FUsuario, FMostrarPreview,
      FFonteDANFE, FMargemSuperior, FMargemInferior, FMargemEsquerda,
      FMargemDireita, FImpressora, i);
    end;
end;

procedure TACBrNFeDANFeRL.ImprimirEVENTOPDF(NFE: TNFe);
var sFile: String;
begin
  case FTipoDANFE of
    tiRetrato, tiPaisagem:
              frlDANFeEventoRL := TfrlDANFeEventoRLRetrato.Create(Self);
  end;

  for i := 0 to (TACBrNFe(ACBrNFe).EventoNFe.Evento.Count - 1) do
    begin
      sFile := TACBrNFe(ACBrNFe).DANFE.PathPDF +
      Copy(TACBrNFe(ACBrNFe).EventoNFe.Evento.Items[i].InfEvento.id, 3, 52) + '.pdf';
      frlDANFeEventoRL.SavePDF(TACBrNFe(ACBrNFe).EventoNFe,
      FLogo, FMarcadagua, sFile, FSistema, FUsuario, FFonteDANFE,
      FMargemSuperior, FMargemInferior, FMargemEsquerda, FMargemDireita, i);
    end;
end;

end.
