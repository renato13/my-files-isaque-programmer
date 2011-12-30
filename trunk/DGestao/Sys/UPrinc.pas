unit UPrinc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls, BarMenus, SpeedBar, RXCtrls, ExtCtrls, jpeg;

type
  TfrmPrinc = class(TForm)
    BcBarMainMenu: TBcBarMainMenu;
    StatusBar1: TStatusBar;
    Cadastro1: TMenuItem;
    Cliente1: TMenuItem;
    Produto1: TMenuItem;
    Vendedor1: TMenuItem;
    mnBanco: TMenuItem;
    Vendas1: TMenuItem;
    Financeiro1: TMenuItem;
    ContasaPagar1: TMenuItem;
    ContasaReceber1: TMenuItem;
    Depistos1: TMenuItem;
    FluxodeCaixa1: TMenuItem;
    esouraria1: TMenuItem;
    Relatrio1: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    US1: TMenuItem;
    Entrada1: TMenuItem;
    Empresa1: TMenuItem;
    SpeedBar1: TSpeedBar;
    RxSpeedButtonEmpresa: TRxSpeedButton;
    RxSpeedBtnCRec: TRxSpeedButton;
    RxSpeedButton4: TRxSpeedButton;
    RxSpeedButton5: TRxSpeedButton;
    RxSpeedBtnCPag: TRxSpeedButton;
    RxSpeedBtnProd: TRxSpeedButton;
    RxSpeedBtnCliente: TRxSpeedButton;
    SpeedbarSection1: TSpeedbarSection;
    Sobre1: TMenuItem;
    Panel1: TPanel;
    Fornecedor1: TMenuItem;
    Image1: TImage;
    FormasdePagamento1: TMenuItem;
    RxSpeedButton2: TRxSpeedButton;
    N3: TMenuItem;
    RxSpeedButton1: TRxSpeedButton;
    ppEstoque: TPopupMenu;
    Entradas1: TMenuItem;
    AjusteManual1: TMenuItem;
    Kardex1: TMenuItem;
    AjusteEstoque1: TMenuItem;
    Kardex2: TMenuItem;
    Faturamento1: TMenuItem;
    Vendas2: TMenuItem;
    Cliente2: TMenuItem;
    Fornecedor2: TMenuItem;
    Produto2: TMenuItem;
    Financeiro2: TMenuItem;
    ContasaReceber2: TMenuItem;
    ContasaPagar2: TMenuItem;
    RxSpeedButton3: TRxSpeedButton;
    oDGESTO1: TMenuItem;
    Vendas3: TMenuItem;
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
    procedure RxSpeedButton8Click(Sender: TObject);
    procedure RxSpeedButtonEmpresaClick(Sender: TObject);
    procedure RxSpeedBtnClienteClick(Sender: TObject);
    procedure RxSpeedBtnCRecClick(Sender: TObject);
    procedure RxSpeedBtnCPagClick(Sender: TObject);
    procedure Fornecedor1Click(Sender: TObject);
    procedure RxSpeedButton2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormasdePagamento1Click(Sender: TObject);
    procedure RxSpeedBtnProdClick(Sender: TObject);
    procedure Entrada1Click(Sender: TObject);
    procedure AjusteManual1Click(Sender: TObject);
    procedure Kardex1Click(Sender: TObject);
    procedure Vendas2Click(Sender: TObject);
    procedure Cliente2Click(Sender: TObject);
    procedure Fornecedor2Click(Sender: TObject);
    procedure Produto2Click(Sender: TObject);
    procedure ContasaReceber2Click(Sender: TObject);
    procedure ContasaPagar2Click(Sender: TObject);
    procedure oDGESTO1Click(Sender: TObject);
    procedure Vendas3Click(Sender: TObject);
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
  UGeTabelaCFOP;

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
// Application.CreateForm(TfrmGrCliente, frmGrCliente);
// frmGrCliente.ShowModal;
// frmGrCliente.Destroy;
  MostrarTabelaClientes(Self);
end;

procedure TfrmPrinc.RxSpeedBtnCRecClick(Sender: TObject);
begin
  Application.CreateForm(TfrmGrContReceb, frmGrContReceb);
  frmGrContReceb.ShowModal;
  frmGrContReceb.Destroy;
end;

procedure TfrmPrinc.RxSpeedBtnCPagClick(Sender: TObject);
begin
  Application.CreateForm(TfrmGrContPagar, frmGrContPagar);
  frmGrContPagar.ShowModal;
  frmGrContPagar.Destroy;
end;

procedure TfrmPrinc.Fornecedor1Click(Sender: TObject);
begin
  MostrarTabelaFornecedores(Self);
end;

procedure TfrmPrinc.RxSpeedButton2Click(Sender: TObject);
begin
if Application.MessageBox('Deseja SAIR do Sistema?',
      'Confirmação ...', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = idYes
   then Application.Terminate;


end;

procedure TfrmPrinc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Application.Terminate;
end;

procedure TfrmPrinc.FormasdePagamento1Click(Sender: TObject);
begin
   Application.CreateForm(TfrmGridFornec, frmGridFornec);
  frmGridFornec.ShowModal;
  frmGridFornec.Destroy;

end;

procedure TfrmPrinc.RxSpeedBtnProdClick(Sender: TObject);
begin
  Application.CreateForm(TfrmGrProdutos, frmGrProdutos);
  frmGrProdutos.ShowModal;
  frmGrProdutos.Destroy;

end;

procedure TfrmPrinc.Entrada1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmGrEntradaEstoq, frmGrEntradaEstoq);
  frmGrEntradaEstoq.ShowModal;
  frmGrEntradaEstoq.Destroy;
end;

procedure TfrmPrinc.AjusteManual1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmAjustEstoq, frmAjustEstoq);
  frmAjustEstoq.ShowModal;
  frmAjustEstoq.Destroy;
end;

procedure TfrmPrinc.Kardex1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmKardex, frmKardex);
  frmKardex.ShowModal;
  frmKardex.Destroy;
end;

procedure TfrmPrinc.Vendas2Click(Sender: TObject);
begin
  Application.CreateForm(TfrmGrVendas, frmGrVendas);
  frmGrVendas.ShowModal;
  frmGrVendas.Destroy;
end;

procedure TfrmPrinc.Cliente2Click(Sender: TObject);
begin
  Application.CreateForm(TfrmRelCli, frmRelCli);
  frmRelCli.IBQuery1.Open;
  frmRelCli.ibqryEmpresa.Open;
  frmRelCli.qckrp.preview;
  frmRelCli.IBQuery1.Close;
  frmRelCli.ibqryEmpresa.Close;
  frmRelCli.Destroy;
end;

procedure TfrmPrinc.Fornecedor2Click(Sender: TObject);
begin
  Application.CreateForm(TfrmRelFornec, frmRelFornec);
  frmRelFornec.IBQuery1.Open;
  frmRelFornec.ibqryEmpresa.Open;
  frmRelFornec.qckrp.preview;
  frmRelFornec.IBQuery1.Close;
  frmRelFornec.ibqryEmpresa.Close;
  frmRelFornec.Destroy;
end;

procedure TfrmPrinc.Produto2Click(Sender: TObject);
begin
  Application.CreateForm(TfrmRelProdutos, frmRelProdutos);
  frmRelProdutos.IBQuery1.Open;
  frmRelProdutos.ibqryEmpresa.Open;
  frmRelProdutos.qckrp.preview;
  frmRelProdutos.IBQuery1.Close;
  frmRelProdutos.ibqryEmpresa.Close;
  frmRelProdutos.Destroy;
end;

procedure TfrmPrinc.ContasaReceber2Click(Sender: TObject);
begin
  Application.CreateForm(TfrmGerRelCR, frmGerRelCR);
  frmGerRelCR.ShowModal;
  frmGerRelCR.Destroy;
end;

procedure TfrmPrinc.ContasaPagar2Click(Sender: TObject);
begin
  Application.CreateForm(TfrmGerRelCP, frmGerRelCP);
  frmGerRelCP.ShowModal;
  frmGerRelCP.Destroy;
end;

procedure TfrmPrinc.oDGESTO1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmSobre, frmSobre);
  frmSobre.ShowModal;
  frmSobre.Destroy;
end;

procedure TfrmPrinc.Vendas3Click(Sender: TObject);
begin
 frmRelVendas.IBQuery1.Open;
 frmRelVendas.qckrp.Preview;
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

end.
