unit UGeEntradaEstoque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadraoCadastro, ImgList, IBCustomDataSet, IBUpdateSQL, DB,
  Mask, DBCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls,
  ToolWin, IBTable, ToolEdit, RXDBCtrl, IBStoredProc;

type
  TfrmGeEntradaEstoque = class(TfrmGrPadraoCadastro)
    lblData: TLabel;
    edData: TDateTimePicker;
    tblEmpresa: TIBTable;
    dtsEmpresa: TDataSource;
    lblDataHora: TLabel;
    dbDataHora: TDBEdit;
    lblEmpresa: TLabel;
    dbEmpresa: TDBLookupComboBox;
    lblFornecedor: TLabel;
    dbFornecedor: TRxDBComboEdit;
    lblDataEmissao: TLabel;
    dbDataEmissao: TDBEdit;
    lblNotaFiscal: TLabel;
    dbNotaFiscal: TDBEdit;
    lblSerie: TLabel;
    dbSerie: TDBEdit;
    lblDataEntrada: TLabel;
    dbDataEntrada: TDBEdit;
    lblCFOPNF: TLabel;
    dbCFOPNF: TRxDBComboEdit;
    dbCFOPNFDescricao: TDBEdit;
    qryProduto: TIBDataSet;
    qryCFOP: TIBDataSet;
    tblFormaPagto: TIBTable;
    dtsFormaPagto: TDataSource;
    tblCondicaoPagto: TIBTable;
    dtsCondicaoPagto: TDataSource;
    lblSituacao: TLabel;
    dbSituacao: TDBEdit;
    GrpBxDadosValores: TGroupBox;
    lblValorFrete: TLabel;
    dbValorFrete: TDBEdit;
    lblBaseICMS: TLabel;
    dbBaseICMS: TDBEdit;
    lblBaseICMSSubs: TLabel;
    dbBaseICMSSubs: TDBEdit;
    lblTotalProduto: TLabel;
    dbTotalProduto: TDBEdit;
    lblValorOutros: TLabel;
    dbValorOutros: TDBEdit;
    dbTotalNotaFiscal: TDBEdit;
    lblTotalNotaFiscal: TLabel;
    dbValorDesconto: TDBEdit;
    lblValorDesconto: TLabel;
    dbValorIPI: TDBEdit;
    lblValorIPI: TLabel;
    dbValorICMSSubs: TDBEdit;
    lblValorICMSSubs: TLabel;
    dbValorICMS: TDBEdit;
    lblValorICMS: TLabel;
    Bevel5: TBevel;
    pgcMaisDados: TPageControl;
    tbsPagamento: TTabSheet;
    lblObservacao: TLabel;
    lblFormaPagto: TLabel;
    lblCondicaoPagto: TLabel;
    lblPrazo01: TLabel;
    lblPrazo02: TLabel;
    lblPrazo03: TLabel;
    lblPrazo04: TLabel;
    lblPrazo05: TLabel;
    lblPrazo06: TLabel;
    lblPrazo07: TLabel;
    lblPrazo08: TLabel;
    lblPrazo09: TLabel;
    lblPrazo10: TLabel;
    lblPrazo11: TLabel;
    lblPrazo12: TLabel;
    dbObservacao: TDBMemo;
    dbFormaPagto: TDBLookupComboBox;
    dbCondicaoPagto: TDBLookupComboBox;
    dbPrazo01: TDBEdit;
    dbPrazo02: TDBEdit;
    dbPrazo03: TDBEdit;
    dbPrazo04: TDBEdit;
    dbPrazo05: TDBEdit;
    dbPrazo06: TDBEdit;
    dbPrazo07: TDBEdit;
    dbPrazo08: TDBEdit;
    dbPrazo09: TDBEdit;
    dbPrazo10: TDBEdit;
    dbPrazo11: TDBEdit;
    dbPrazo12: TDBEdit;
    tbsDuplicatas: TTabSheet;
    Bevel6: TBevel;
    Bevel7: TBevel;
    pnlBotoesTitulo: TPanel;
    btnRegerarTitulo: TBitBtn;
    btnTituloEditar: TBitBtn;
    btnTituloExcluir: TBitBtn;
    dbgTitulos: TDBGrid;
    Bevel9: TBevel;
    cdsTabelaItens: TIBDataSet;
    cdsTabelaItensANO: TSmallintField;
    cdsTabelaItensCODCONTROL: TIntegerField;
    cdsTabelaItensSEQ: TSmallintField;
    cdsTabelaItensCODPROD: TIBStringField;
    cdsTabelaItensCODEMP: TIBStringField;
    cdsTabelaItensCODCLI: TIBStringField;
    cdsTabelaItensDTVENDA: TDateTimeField;
    cdsTabelaItensQTDE: TIntegerField;
    cdsTabelaItensPUNIT: TIBBCDField;
    cdsTabelaItensDESCONTO: TIBBCDField;
    cdsTabelaItensPFINAL: TIBBCDField;
    cdsTabelaItensQTDEFINAL: TIntegerField;
    cdsTabelaItensUNID_COD: TSmallintField;
    cdsTabelaItensCFOP_COD: TIntegerField;
    cdsTabelaItensALIQUOTA: TIBBCDField;
    cdsTabelaItensVALOR_IPI: TIBBCDField;
    cdsTabelaItensDESCRI: TIBStringField;
    cdsTabelaItensESTOQUE: TIntegerField;
    cdsTabelaItensUNP_SIGLA: TIBStringField;
    cdsTabelaItensTOTAL_BRUTO: TIBBCDField;
    cdsTabelaItensVALOR_DESCONTO: TIBBCDField;
    cdsTabelaItensTOTAL_DESCONTO: TIBBCDField;
    cdsTabelaItensTOTAL_LIQUIDO: TIBBCDField;
    cdsTabelaItensCFOP_DESCRICAO: TIBStringField;
    cdsTabelaItensCST: TIBStringField;
    IbUpdTabelaItens: TIBUpdateSQL;
    DtSrcTabelaItens: TDataSource;
    qryTitulos: TIBDataSet;
    qryTitulosANOLANC: TSmallintField;
    qryTitulosNUMLANC: TIntegerField;
    qryTitulosPARCELA: TSmallintField;
    qryTitulosCODBANCO: TIntegerField;
    qryTitulosNOSSONUMERO: TIBStringField;
    qryTitulosCNPJ: TIBStringField;
    qryTitulosTIPPAG: TIBStringField;
    qryTitulosDTEMISS: TDateField;
    qryTitulosDTVENC: TDateField;
    qryTitulosVALORREC: TIBBCDField;
    qryTitulosPERCENTJUROS: TIBBCDField;
    qryTitulosPERCENTMULTA: TIBBCDField;
    qryTitulosPERCENTDESCONTO: TIBBCDField;
    qryTitulosVALORRECTOT: TIBBCDField;
    qryTitulosVALORSALDO: TIBBCDField;
    qryTitulosDATAPROCESSOBOLETO: TDateField;
    qryTitulosBAIXADO: TSmallintField;
    qryTitulosBAIXADO_: TIBStringField;
    qryTitulosDTREC: TDateField;
    qryTitulosLancamento: TStringField;
    dtsTitulos: TDataSource;
    IbStrPrcGerarTitulos: TIBStoredProc;
    GrpBxDadosProduto: TGroupBox;
    lblProduto: TLabel;
    lblQuantidade: TLabel;
    lblValorUnit: TLabel;
    lblUnidade: TLabel;
    lblCFOP: TLabel;
    lblParticipacao: TLabel;
    lblTotalBruto: TLabel;
    lblValorIPIProduto: TLabel;
    Bevel10: TBevel;
    dbProduto: TRxDBComboEdit;
    dbProdutoNome: TDBEdit;
    dbQuantidade: TDBEdit;
    dbValorUnit: TDBEdit;
    dbUnidade: TDBEdit;
    dbCFOP: TRxDBComboEdit;
    dbParticipacao: TDBEdit;
    dbTotalBruto: TDBEdit;
    dbValorIPIProduto: TDBEdit;
    dbCFOPDescricao: TDBEdit;
    pnlBotoesProduto: TPanel;
    btnProdutoInserir: TBitBtn;
    btnProdutoEditar: TBitBtn;
    btnProdutoExcluir: TBitBtn;
    btnProdutoSalvar: TBitBtn;
    Bevel11: TBevel;
    dbgProdutos: TDBGrid;
    lblFrete: TLabel;
    dbFrete: TDBEdit;
    lblDesconto: TLabel;
    dbDesconto: TDBEdit;
    lblOutros: TLabel;
    dbOutros: TDBEdit;
    lblCustoMedio: TLabel;
    dbCustoMedio: TDBEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGeEntradaEstoque: TfrmGeEntradaEstoque;

implementation

uses DateUtils, UDMBusiness, UGeCondicaoPagto, UGeProduto, UGeTabelaCFOP;

{$R *.dfm}

end.
