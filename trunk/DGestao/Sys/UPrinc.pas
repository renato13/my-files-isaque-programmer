unit UPrinc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls, BarMenus, RXCtrls, ExtCtrls, jpeg, // , SpeedBar
  EUserAcs, StdCtrls, Buttons, rxSpeedbar;

type
  TfrmPrinc = class(TForm)
    BcBarMainMenu: TBcBarMainMenu;
    stbMain: TStatusBar;
    menuCadastro: TMenuItem;
    nmCliente: TMenuItem;
    nmProduto: TMenuItem;
    nmVendedor: TMenuItem;
    mnBanco: TMenuItem;
    menuEstoque: TMenuItem;
    menuFinanceiro: TMenuItem;
    nmContasAPagar: TMenuItem;
    nmContasAReceber: TMenuItem;
    nmDeposito: TMenuItem;
    nmFluxoDeCaixa: TMenuItem;
    menuRelatorio: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    nmUsuario: TMenuItem;
    nmEntrada: TMenuItem;
    nmEmpresa: TMenuItem;
    spbBarraAcessoRapido: TSpeedBar;
    btnContaAReceber: TRxSpeedButton;
    btnFornecedor: TRxSpeedButton;
    btnTesouraria: TRxSpeedButton;
    btnContaAPagar: TRxSpeedButton;
    btnProduto: TRxSpeedButton;
    btnCliente: TRxSpeedButton;
    SpeedbarSection1: TSpeedbarSection;
    menuSobre: TMenuItem;
    pnlMain: TPanel;
    nmFornecedor: TMenuItem;
    imgFundo: TImage;
    nmTipoDespesa: TMenuItem;
    btnSair: TRxSpeedButton;
    N3: TMenuItem;
    btnEstoque: TRxSpeedButton;
    ppEstoque: TPopupMenu;
    popEntrada: TMenuItem;
    nmAjusteManual: TMenuItem;
    nmKardex: TMenuItem;
    popAjusteEstoque: TMenuItem;
    popKardex: TMenuItem;
    menuFaturamento: TMenuItem;
    nmVendas: TMenuItem;
    nmRelatorioCliente: TMenuItem;
    nmRelatorioFornecedor: TMenuItem;
    nmRelatorioProduto: TMenuItem;
    mnRelatorioFinanceiro: TMenuItem;
    mnRelatorioFinanceiroContasAPagar: TMenuItem;
    mnRelatorioFinanceiroContasAReceber: TMenuItem;
    btnVenda: TRxSpeedButton;
    nmAbout: TMenuItem;
    mnRelatorioFaturamentoVendas: TMenuItem;
    mnTabelasAuxiliares: TMenuItem;
    nmEstados: TMenuItem;
    nmCidades: TMenuItem;
    nmBairros: TMenuItem;
    nmTiposdeLogradouros: TMenuItem;
    nmLogradouros: TMenuItem;
    N5: TMenuItem;
    N4: TMenuItem;
    nmDistritos: TMenuItem;
    nmGruposProduto: TMenuItem;
    nmSecaoProduto: TMenuItem;
    nmUnidade: TMenuItem;
    nmTributacao: TMenuItem;
    nmFormaPagto: TMenuItem;
    nmCondicaoPagto: TMenuItem;
    N6: TMenuItem;
    nmTabelaCFOP: TMenuItem;
    nmSenhaAutorizacao: TMenuItem;
    nmConfigurarNFeACBr: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    nmNotaFiscal: TMenuItem;
    N9: TMenuItem;
    nmEnviarLoteNFe: TMenuItem;
    N10: TMenuItem;
    nmGerarBoleto: TMenuItem;
    nmCancelarNFe: TMenuItem;
    nmInutilizarNumeroNFe: TMenuItem;
    EvAcessUserPrincipal: TEvUserAccess;
    SpeedbarSection2: TSpeedbarSection;
    SpeedItem1: TSpeedItem;
    SpeedItem2: TSpeedItem;
    nmImprimirDANFE: TMenuItem;
    N11: TMenuItem;
    nmRemessaBoleto: TMenuItem;
    nmRetornoBoleto: TMenuItem;
    nmPromocoes: TMenuItem;
    nmContaCorrente: TMenuItem;
    nmAberturaCaixa: TMenuItem;
    N12: TMenuItem;
    nmEncerramentoCaixa: TMenuItem;
    nmGerenciaCaixa: TMenuItem;
    mnRelatorioFaturamento: TMenuItem;
    imgEmpresa: TImage;
    ProductName: TLabel;
    Copyright: TLabel;
    FileDescription: TLabel;
    Version: TLabel;
    nmFabricanteProduto: TMenuItem;
    nmUsuarioAlterarSenha: TMenuItem;
    btnEmpresa: TRxSpeedButton;
    procedure btnEmpresaClick(Sender: TObject);
    procedure btnClienteClick(Sender: TObject);
    procedure btnContaAReceberClick(Sender: TObject);
    procedure btnContaAPagarClick(Sender: TObject);
    procedure nmFornecedorClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnProdutoClick(Sender: TObject);
    procedure nmEntradaClick(Sender: TObject);
    procedure nmAjusteManualClick(Sender: TObject);
    procedure nmKardexClick(Sender: TObject);
    procedure nmVendasClick(Sender: TObject);
    procedure nmRelatorioClienteClick(Sender: TObject);
    procedure nmRelatorioFornecedorClick(Sender: TObject);
    procedure nmRelatorioProdutoClick(Sender: TObject);
    procedure mnRelatorioFinanceiroContasAPagarClick(Sender: TObject);
    procedure mnRelatorioFinanceiroContasAReceberClick(Sender: TObject);
    procedure nmAboutClick(Sender: TObject);
    procedure mnBancoClick(Sender: TObject);
    procedure nmTiposdeLogradourosClick(Sender: TObject);
    procedure nmEstadosClick(Sender: TObject);
    procedure nmCidadesClick(Sender: TObject);
    procedure nmDistritosClick(Sender: TObject);
    procedure nmBairrosClick(Sender: TObject);
    procedure nmLogradourosClick(Sender: TObject);
    procedure nmGruposProdutoClick(Sender: TObject);
    procedure nmSecaoProdutoClick(Sender: TObject);
    procedure nmUnidadeClick(Sender: TObject);
    procedure nmTabelaCFOPClick(Sender: TObject);
    procedure nmFormaPagtoClick(Sender: TObject);
    procedure nmVendedorClick(Sender: TObject);
    procedure nmCondicaoPagtoClick(Sender: TObject);
    procedure nmConfigurarNFeACBrClick(Sender: TObject);
    procedure nmTipoDespesaClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure nmGerarBoletoClick(Sender: TObject);
    procedure nmRemessaBoletoClick(Sender: TObject);
    procedure nmRetornoBoletoClick(Sender: TObject);
    procedure nmPromocoesClick(Sender: TObject);
    procedure nmContaCorrenteClick(Sender: TObject);
    procedure nmGerenciaCaixaClick(Sender: TObject);
    procedure nmAberturaCaixaClick(Sender: TObject);
    procedure nmEncerramentoCaixaClick(Sender: TObject);
    procedure nmFluxoDeCaixaClick(Sender: TObject);
    procedure mnRelatorioFaturamentoVendasClick(Sender: TObject);
    procedure nmFabricanteProdutoClick(Sender: TObject);
    procedure nmUsuarioAlterarSenhaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrinc: TfrmPrinc;

implementation

uses uAjustEstoq, uKardex, uRelCli, uRelFornec, uRelProdutos, uGerRelCR,
  uGerRelCP, USobre, UfrmRelVendas, UGeBancos, 
  UGeGrupoProduto, UGeSecaoProduto, UGeUnidade,
  UGeTabelaCFOP, UGeFormaPagto, UGeProduto, UGeVendedor, UGeVenda,
  UGeCondicaoPagto, UGeTeste, UGeEntradaEstoque, UGeContasAPagar,
  UGeContasAReceber, UDMNFe, UDMBusiness, UGeTipoDespesa,
  UfrmAcessoSistema, UGeGerarBoletos, UGeRemessaBoletos, UGeRetornoBoletos,
  UGePromocao, UGeContaCorrente, UGeCaixa, UGeFluxoCaixa, UFuncoes,
  UGeFabricante, UConstantesDGE;

{$R *.dfm}

procedure TfrmPrinc.btnEmpresaClick(Sender: TObject);
begin
  FormFunction.ShowForm(Self, 'frmGeEmpresa');
end;

procedure TfrmPrinc.btnClienteClick(Sender: TObject);
begin
  FormFunction.ShowForm(Self, 'frmGeCliente');
end;

procedure TfrmPrinc.btnContaAReceberClick(Sender: TObject);
begin
  MostrarControleContasAReceber(Self);
end;

procedure TfrmPrinc.btnContaAPagarClick(Sender: TObject);
begin
  MostrarControleContasAPagar(Self);
end;

procedure TfrmPrinc.nmFornecedorClick(Sender: TObject);
begin
  FormFunction.ShowForm(Self, 'frmGeFornecedor');
end;

procedure TfrmPrinc.btnSairClick(Sender: TObject);
begin
  if Application.MessageBox('Deseja SAIR do Sistema?', 'Confirmação ...', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = ID_YES then
    Application.Terminate;
end;

procedure TfrmPrinc.btnProdutoClick(Sender: TObject);
begin
  MostrarTabelaProdutos(Self, taICMS);
end;

procedure TfrmPrinc.nmEntradaClick(Sender: TObject);
begin
  MostrarControleCompras(Self);
end;

procedure TfrmPrinc.nmAjusteManualClick(Sender: TObject);
begin
  Application.CreateForm(TfrmAjustEstoq, frmAjustEstoq);
  frmAjustEstoq.ShowModal;
  frmAjustEstoq.Destroy;
end;

procedure TfrmPrinc.nmKardexClick(Sender: TObject);
begin
  Application.CreateForm(TfrmKardex, frmKardex);
  frmKardex.ShowModal;
  frmKardex.Destroy;
end;

procedure TfrmPrinc.nmVendasClick(Sender: TObject);
begin
  MostrarControleVendas(Self);
end;

procedure TfrmPrinc.nmRelatorioClienteClick(Sender: TObject);
begin
  Application.CreateForm(TfrmRelCli, frmRelCli);
  frmRelCli.IBQuery1.Open;
  frmRelCli.ibqryEmpresa.Open;
  frmRelCli.qckrp.preview;
  frmRelCli.IBQuery1.Close;
  frmRelCli.ibqryEmpresa.Close;
  frmRelCli.Destroy;
end;

procedure TfrmPrinc.nmRelatorioFornecedorClick(Sender: TObject);
begin
  Application.CreateForm(TfrmRelFornec, frmRelFornec);
  frmRelFornec.IBQuery1.Open;
  frmRelFornec.ibqryEmpresa.Open;
  frmRelFornec.qckrp.preview;
  frmRelFornec.IBQuery1.Close;
  frmRelFornec.ibqryEmpresa.Close;
  frmRelFornec.Destroy;
end;

procedure TfrmPrinc.nmRelatorioProdutoClick(Sender: TObject);
begin
  Application.CreateForm(TfrmRelProdutos, frmRelProdutos);
  frmRelProdutos.IBQuery1.Open;
  frmRelProdutos.ibqryEmpresa.Open;
  frmRelProdutos.qckrp.preview;
  frmRelProdutos.IBQuery1.Close;
  frmRelProdutos.ibqryEmpresa.Close;
  frmRelProdutos.Destroy;
end;

procedure TfrmPrinc.mnRelatorioFinanceiroContasAPagarClick(Sender: TObject);
begin
  Application.CreateForm(TfrmGerRelCR, frmGerRelCR);
  frmGerRelCR.ShowModal;
  frmGerRelCR.Destroy;
end;

procedure TfrmPrinc.mnRelatorioFinanceiroContasAReceberClick(Sender: TObject);
begin
  Application.CreateForm(TfrmGerRelCP, frmGerRelCP);
  frmGerRelCP.ShowModal;
  frmGerRelCP.Destroy;
end;

procedure TfrmPrinc.nmAboutClick(Sender: TObject);
begin
  ShowAbout(Self);
end;

procedure TfrmPrinc.mnBancoClick(Sender: TObject);
begin
  MostrarTabelaBancos(Self);
end;

procedure TfrmPrinc.nmTiposdeLogradourosClick(Sender: TObject);
begin
  FormFunction.ShowForm(Self, 'frmGeTipoLogradouro');
end;

procedure TfrmPrinc.nmEstadosClick(Sender: TObject);
begin
  FormFunction.ShowForm(Self, 'frmGeEstado');
end;

procedure TfrmPrinc.nmCidadesClick(Sender: TObject);
begin
  FormFunction.ShowForm(Self, 'frmGeCidade');
end;

procedure TfrmPrinc.nmDistritosClick(Sender: TObject);
begin
  FormFunction.ShowForm(Self, 'frmGeDistrito');
end;

procedure TfrmPrinc.nmBairrosClick(Sender: TObject);
begin
  FormFunction.ShowForm(Self, 'frmGeBairro');
end;

procedure TfrmPrinc.nmLogradourosClick(Sender: TObject);
begin
  FormFunction.ShowForm(Self, 'frmGeLogradouro');
end;

procedure TfrmPrinc.nmGruposProdutoClick(Sender: TObject);
begin
  MostrarTabelaGrupoProdutos(Self);
end;

procedure TfrmPrinc.nmSecaoProdutoClick(Sender: TObject);
begin
  MostrarTabelaSecaoProdutos(Self);
end;

procedure TfrmPrinc.nmUnidadeClick(Sender: TObject);
begin
  MostrarTabelaUnidades(Self);
end;

procedure TfrmPrinc.nmTabelaCFOPClick(Sender: TObject);
begin
  MostrarTabelaCFOP(Self);
end;

procedure TfrmPrinc.nmFormaPagtoClick(Sender: TObject);
begin
  MostrarTabelaFormaPagtos(Self);
end;

procedure TfrmPrinc.nmVendedorClick(Sender: TObject);
begin
  MostrarTabelaVendedores(Self);
end;

procedure TfrmPrinc.nmCondicaoPagtoClick(Sender: TObject);
begin
  MostrarTabelaCondicoesPagto(Self);
end;

procedure TfrmPrinc.nmConfigurarNFeACBrClick(Sender: TObject);
begin
  ConfigurarNFeACBr;
end;

procedure TfrmPrinc.nmTipoDespesaClick(Sender: TObject);
begin
  MostrarTipoDespesas(Self);
end;

procedure TfrmPrinc.Button1Click(Sender: TObject);
begin
  frmAcessoSistema.ShowModal
end;

procedure TfrmPrinc.FormActivate(Sender: TObject);
var
  sCNPJ : String;
begin
  if ( StrIsCNPJ(GetEmpresaIDDefault) ) then
    sCNPJ := ' CPF.: ' + StrFormatarCnpj(GetEmpresaIDDefault)
  else
    sCNPJ := ' CNPJ.: ' + StrFormatarCpf(GetEmpresaIDDefault);

  stbMain.Panels.Items[2].Text  := 'Licenciado a empresa ' + GetEmpresaNomeDefault;
  nmUsuarioAlterarSenha.Caption := Format('Alteração de Senha (%s)', [GetUserApp]);

  EvAcessUserPrincipal.UserID := GetUserFunctionID;

  RegistrarControleAcesso(Self, EvAcessUserPrincipal);
  GetControleAcesso(Self, EvAcessUserPrincipal);

  Case GetUserFunctionID of
    FUNCTION_USER_ID_DIRETORIA :
      EvAcessUserPrincipal.UserID := FUNCTION_USER_ID_DIRETORIA;

    FUNCTION_USER_ID_GERENTE_VND :
      begin
        EvAcessUserPrincipal.UserID := FUNCTION_USER_ID_GERENTE_VND;
        btnTesouraria.Enabled    := False;
        btnContaAReceber.Enabled := False;
        btnContaAPagar.Enabled   := False;
      end;

    FUNCTION_USER_ID_GERENTE_FIN :
      EvAcessUserPrincipal.UserID := FUNCTION_USER_ID_GERENTE_FIN;

    FUNCTION_USER_ID_VENDEDOR :
      begin
        EvAcessUserPrincipal.UserID := FUNCTION_USER_ID_VENDEDOR;

        mnRelatorioFinanceiro.Enabled := False;
        nmRelatorioProduto.Enabled    := False;

        btnEmpresa.Enabled       := False;
        btnProduto.Enabled       := False;
        btnFornecedor.Enabled    := False;
        btnEstoque.Enabled       := False;
        btnTesouraria.Enabled    := False;
        btnContaAReceber.Enabled := False;
        btnContaAPagar.Enabled   := False;
      end;

    FUNCTION_USER_ID_GERENTE_ADM :
      EvAcessUserPrincipal.UserID := FUNCTION_USER_ID_GERENTE_ADM;

    FUNCTION_USER_ID_CAIXA :
      EvAcessUserPrincipal.UserID := FUNCTION_USER_ID_CAIXA;

    FUNCTION_USER_ID_AUX_FINANC1 :
      EvAcessUserPrincipal.UserID := FUNCTION_USER_ID_AUX_FINANC1;

    FUNCTION_USER_ID_AUX_FINANC2 :
      EvAcessUserPrincipal.UserID := FUNCTION_USER_ID_AUX_FINANC2;

    FUNCTION_USER_ID_SUPERV_CX :
      EvAcessUserPrincipal.UserID := FUNCTION_USER_ID_SUPERV_CX;

    FUNCTION_USER_ID_ESTOQUISTA :
      EvAcessUserPrincipal.UserID := FUNCTION_USER_ID_ESTOQUISTA;

    FUNCTION_USER_ID_SUPORTE_TI :
      EvAcessUserPrincipal.UserID := FUNCTION_USER_ID_SUPORTE_TI;

    FUNCTION_USER_ID_SYSTEM_ADM :
      EvAcessUserPrincipal.UserID := FUNCTION_USER_ID_SYSTEM_ADM;
  else
    ShowWarning('Falta cruzar nova função com UserID!');
    Application.Terminate;
  end;

  Self.WindowState := wsMaximized;
end;

procedure TfrmPrinc.FormCreate(Sender: TObject);
var
  sFileImage : String;
begin
  {$IFDEF DGE}
  Self.Caption := 'DGE - Sistema Integrado de Gestão Empresarial ' + VERSION_NUMBER;
  Self.Version.Caption   := 'Versão ' + VERSION_NUMBER; 
  {$ELSE}
  Self.Caption := 'DGE - Sistema Integrado de Gestão Empresarial [ v' + GetExeVersion + ' ]';
  Self.Version.Caption   := 'Versão ' + GetExeVersion;
  {$ENDIF}
  Self.Copyright.Caption := GetCopyright;

  // Carregar Imagem de Fundo da Tele Principal

  sFileImage := ExtractFilePath(Application.ExeName) + 'Logo_Principal.jpg';

  if ( FileExists(sFileImage) ) then
    imgFundo.Picture.LoadFromFile(sFileImage)
  else
  begin
    imgEmpresa.Visible  := False;
    ProductName.Visible := False;
    Version.Visible     := False;
    FileDescription.Visible := False;
    Copyright.Visible       := False;
  end;

  // Configurar Legendas de acordo com o segmento
  nmProduto.Caption  := Copy(StrDescricaoProduto, 1, Length(StrDescricaoProduto) - 1);
  btnProduto.Caption := Copy(StrDescricaoProduto, 1, Length(StrDescricaoProduto) - 1);
end;

procedure TfrmPrinc.nmGerarBoletoClick(Sender: TObject);
begin
  GerarBoleto(Self);
end;

procedure TfrmPrinc.nmRemessaBoletoClick(Sender: TObject);
begin
  GerarArquivoRemessa(Self);
end;

procedure TfrmPrinc.nmRetornoBoletoClick(Sender: TObject);
begin
  ProcessarRetorno(Self);
end;

procedure TfrmPrinc.nmPromocoesClick(Sender: TObject);
begin
  MostrarTabelaPromocoes(Self);
end;

procedure TfrmPrinc.nmContaCorrenteClick(Sender: TObject);
begin
  MostrarTabelaContaCorrente(Self);
end;

procedure TfrmPrinc.nmGerenciaCaixaClick(Sender: TObject);
begin
  MostrarTabelaCaixa(Self);
end;

procedure TfrmPrinc.nmAberturaCaixaClick(Sender: TObject);
begin
  if ( AbrirCaixa(Self, GetUserApp) ) then
    ShowInformation('Caixa aberto com sucesso!');
end;

procedure TfrmPrinc.nmEncerramentoCaixaClick(Sender: TObject);
begin
  if ( FecharCaixa(Self, GetUserApp) ) then
    ShowInformation('Caixa encerrado com sucesso!');
end;

procedure TfrmPrinc.nmFluxoDeCaixaClick(Sender: TObject);
begin
  MostrarTabelaFluxoCaixas(Self);
end;

procedure TfrmPrinc.mnRelatorioFaturamentoVendasClick(Sender: TObject);
begin
 Application.CreateForm(TfrmRelVendas, frmRelVendas);
 frmRelVendas.ShowModal;
end;

procedure TfrmPrinc.nmFabricanteProdutoClick(Sender: TObject);
begin
  MostrarTabelaFabricantes(Self);
end;

procedure TfrmPrinc.nmUsuarioAlterarSenhaClick(Sender: TObject);
begin
  if ( FormFunction.ShowModalForm(Self, 'frmGrUsuarioAlterarSenha') ) then
    Self.Update;
end;

end.
