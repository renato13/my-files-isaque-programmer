unit UPrinc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls, BarMenus, SpeedBar, RXCtrls, ExtCtrls, jpeg,
  EUserAcs, StdCtrls, Buttons;

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
    SpeedBar1: TSpeedBar;
    RxSpeedButtonEmpresa: TRxSpeedButton;
    RxSpeedBtnCRec: TRxSpeedButton;
    RxSpeedButton4: TRxSpeedButton;
    RxSpeedButton5: TRxSpeedButton;
    RxSpeedBtnCPag: TRxSpeedButton;
    RxSpeedBtnProd: TRxSpeedButton;
    RxSpeedBtnCliente: TRxSpeedButton;
    SpeedbarSection1: TSpeedbarSection;
    menuSobre: TMenuItem;
    pnlMain: TPanel;
    nmFornecedor: TMenuItem;
    Image1: TImage;
    nmTipoDespesa: TMenuItem;
    RxSpeedButton2: TRxSpeedButton;
    N3: TMenuItem;
    RxSpeedButton1: TRxSpeedButton;
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
    nmRelatorioFinanceiro: TMenuItem;
    nmRelatorioContasAReceber: TMenuItem;
    nmRelatorioContasAPagar: TMenuItem;
    RxSpeedButton3: TRxSpeedButton;
    nmAbout: TMenuItem;
    nmRelatorioVenda: TMenuItem;
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
    EvUAfrmPrinc: TEvUserAccess;
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
    Faturamento1: TMenuItem;
    procedure RxSpeedButton8Click(Sender: TObject);
    procedure RxSpeedButtonEmpresaClick(Sender: TObject);
    procedure RxSpeedBtnClienteClick(Sender: TObject);
    procedure RxSpeedBtnCRecClick(Sender: TObject);
    procedure RxSpeedBtnCPagClick(Sender: TObject);
    procedure nmFornecedorClick(Sender: TObject);
    procedure RxSpeedButton2Click(Sender: TObject);
    procedure RxSpeedBtnProdClick(Sender: TObject);
    procedure nmEntradaClick(Sender: TObject);
    procedure nmAjusteManualClick(Sender: TObject);
    procedure nmKardexClick(Sender: TObject);
    procedure nmVendasClick(Sender: TObject);
    procedure nmRelatorioClienteClick(Sender: TObject);
    procedure nmRelatorioFornecedorClick(Sender: TObject);
    procedure nmRelatorioProdutoClick(Sender: TObject);
    procedure nmRelatorioContasAReceberClick(Sender: TObject);
    procedure nmRelatorioContasAPagarClick(Sender: TObject);
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
    procedure nmRelatorioVendaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrinc: TfrmPrinc;

implementation

uses UGrCliente, UGrEmpresa, UGrContPagar, UGrContReceber,
  UGridFornec, UGrupoProd, UGrProduto, UGrEntradaEstoq, uAjustEstoq,
  uKardex, uGrVendas, uRelCli, uRelFornec, uRelProdutos, uGerRelCR,
  uGerRelCP, USobre, UfrmRelVendas, UGeBancos, UGeTipoLogradouro,
  UGeEstado, UGeCidade, UGeDistrito, UGeBairro, UGeLogradouro, UGeEmpresa,
  UGeCliente, UGeFornecedor, UGeGrupoProduto, UGeSecaoProduto, UGeUnidade,
  UGeTabelaCFOP, UGeFormaPagto, UGeProduto, UGeVendedor, UGeVenda,
  UGeCondicaoPagto, UGeTeste, UGeEntradaEstoque, UGeContasAPagar,
  UGeContasAReceber, UDMNFe, UDMBusiness, UGeTipoDespesa,
  UfrmAcessoSistema, UGeGerarBoletos, UGeRemessaBoletos, UGeRetornoBoletos,
  UGePromocao, UGeContaCorrente, UGeCaixa, UGeFluxoCaixa, UFuncoes;

{$R *.dfm}

procedure TfrmPrinc.RxSpeedButton8Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmPrinc.RxSpeedButtonEmpresaClick(Sender: TObject);
begin
  MostrarTabelaEmpresas(Self);
end;

procedure TfrmPrinc.RxSpeedBtnClienteClick(Sender: TObject);
begin
  MostrarTabelaClientes(Self);
end;

procedure TfrmPrinc.RxSpeedBtnCRecClick(Sender: TObject);
begin
  MostrarControleContasAReceber(Self);
end;

procedure TfrmPrinc.RxSpeedBtnCPagClick(Sender: TObject);
begin
  MostrarControleContasAPagar(Self);
end;

procedure TfrmPrinc.nmFornecedorClick(Sender: TObject);
begin
  MostrarTabelaFornecedores(Self);
end;

procedure TfrmPrinc.RxSpeedButton2Click(Sender: TObject);
begin
  if Application.MessageBox('Deseja SAIR do Sistema?', 'Confirmação ...', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = ID_YES then
    Application.Terminate;
end;

procedure TfrmPrinc.RxSpeedBtnProdClick(Sender: TObject);
begin
  MostrarTabelaProdutos(Self);
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

procedure TfrmPrinc.nmRelatorioContasAReceberClick(Sender: TObject);
begin
  Application.CreateForm(TfrmGerRelCR, frmGerRelCR);
  frmGerRelCR.ShowModal;
  frmGerRelCR.Destroy;
end;

procedure TfrmPrinc.nmRelatorioContasAPagarClick(Sender: TObject);
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
  MostrarTabelaTiposLogradouros(Self);
end;

procedure TfrmPrinc.nmEstadosClick(Sender: TObject);
begin
  MostrarTabelaEstados(Self);
end;

procedure TfrmPrinc.nmCidadesClick(Sender: TObject);
begin
  MostrarTabelaCidades(Self);
end;

procedure TfrmPrinc.nmDistritosClick(Sender: TObject);
begin
  MostrarTabelaDistritos(Self);
end;

procedure TfrmPrinc.nmBairrosClick(Sender: TObject);
begin
  MostrarTabelaBairros(Self);
end;

procedure TfrmPrinc.nmLogradourosClick(Sender: TObject);
begin
  MostrarTabelaLogradouros(Self);
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

  stbMain.Panels.Items[2].Text := 'Licenciado a empresa ' + GetEmpresaNomeDefault;

  case DMBusiness.ibdtstUsersCODFUNCAO.Value of
    1 : EvUAfrmPrinc.UserID := 1 ;  //Diretoria

    2 : begin
         EvUAfrmPrinc.UserID := 2;   // Gerente de Vendas
         RxSpeedButton5.Enabled := false;
         RxSpeedBtnCRec.Enabled := false;
         RxSpeedBtnCPag.Enabled := false;
       end;
    3 : EvUAfrmPrinc.UserID := 3;   // Gerente Financeiro

    4 : begin
         EvUAfrmPrinc.UserID := 4;   // Vendedor
         RxSpeedButtonEmpresa.Visible := false;
         RxSpeedBtnProd.Enabled := false;
         RxSpeedButton4.Enabled := false;
         RxSpeedButton1.Enabled := false;
         RxSpeedButton5.Enabled := false;
         RxSpeedBtnCRec.Enabled := false;
         RxSpeedBtnCPag.Enabled := false;
       end;

    5 : EvUAfrmPrinc.UserID := 5;   // Gerente ADM
    6 : EvUAfrmPrinc.UserID := 6;   // Caixa
    7 : EvUAfrmPrinc.UserID := 7;   // Aux.Financeiro 1
    8 : EvUAfrmPrinc.UserID := 8;   // Aux.Financeiro 2
    9 : EvUAfrmPrinc.UserID := 9;   // Supervisor Caixa
    10: EvUAfrmPrinc.UserID := 10;  // Estoquista
    11: EvUAfrmPrinc.UserID := 11;  // TI
    12: EvUAfrmPrinc.UserID := 12;  // Masterdados-Supervisor
  else
    begin
     ShowWarning('Falta cruzar nova função com UserID!');
     Application.Terminate;
    end
  end;

end;

procedure TfrmPrinc.FormCreate(Sender: TObject);
begin
  Self.Caption := 'DGE - Sistema Integrado de Gestão Empresarial  v1.0.1.4' //[ v' + GetExeVersion( Application.ExeName ) + ' ]';
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

procedure TfrmPrinc.nmRelatorioVendaClick(Sender: TObject);
begin
 Application.CreateForm(TfrmRelVendas, frmRelVendas);
 frmRelVendas.ShowModal;
end;

end.
