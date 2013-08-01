unit UGeProdutoRotatividadePRC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadrao, StdCtrls, Buttons, ExtCtrls, ToolWin, ComCtrls,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSharp,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridBandedTableView, cxGridDBBandedTableView,
  cxClasses, cxGridLevel, cxGrid, DBClient, Provider, IBCustomDataSet,
  IBQuery, IBStoredProc, DBCtrls, Gauges, Grids, DBGrids;

type
  TFrmProdutoRotatividadePRC = class(TfrmGrPadrao)
    pnlPesquisa: TPanel;
    BvlTipoPesquisa: TBevel;
    GrpBxTipoPesquisa: TGroupBox;
    lblTipoProcesso: TLabel;
    edTipoProcesso: TComboBox;
    GrpBxPesquisar: TGroupBox;
    BtnPesquisar: TSpeedButton;
    lblPesquisar: TLabel;
    edPesquisar: TEdit;
    BtnProcessar: TSpeedButton;
    pnlDados: TPanel;
    Bevel1: TBevel;
    tlbBotoes: TToolBar;
    Bevel2: TBevel;
    btbtnIncluir: TBitBtn;
    Bevel3: TBevel;
    PgcTabelas: TPageControl;
    TbsProduto: TTabSheet;
    TbsGrupo: TTabSheet;
    TbsFabricante: TTabSheet;
    dbgProdutoLvl: TcxGridLevel;
    dbgProduto: TcxGrid;
    dbgProdutoTbl: TcxGridDBBandedTableView;
    QryListaProduto: TIBQuery;
    QryProduto: TIBQuery;
    dsProduto: TDataSource;
    DspListaProduto: TDataSetProvider;
    CdsListaProduto: TClientDataSet;
    setProdutoRotatividade: TIBStoredProc;
    pnlProcesso: TPanel;
    Label3: TLabel;
    gagProcesso: TGauge;
    Bevel4: TBevel;
    Bevel5: TBevel;
    dbProduto: TDBText;
    dsListaProduto: TDataSource;
    DspProduto: TDataSetProvider;
    CdsProduto: TClientDataSet;
    CdsProdutoCODIGO: TStringField;
    CdsProdutoDESCRICAO: TStringField;
    CdsProdutoDATA_ULTIMA_COMPRA: TDateField;
    CdsProdutoDATA_ULTIMA_VENDA: TDateField;
    CdsProdutoCOMPRA_QTDE_01: TBCDField;
    CdsProdutoCOMPRA_VALOR_01: TBCDField;
    CdsProdutoVENDA_QTDE_01: TBCDField;
    CdsProdutoVENDA_VALOR_01: TBCDField;
    CdsProdutoCOMPRA_QTDE_03: TBCDField;
    CdsProdutoCOMPRA_VALOR_03: TBCDField;
    CdsProdutoVENDA_QTDE_03: TBCDField;
    CdsProdutoVENDA_VALOR_03: TBCDField;
    CdsProdutoCOMPRA_QTDE_06: TBCDField;
    CdsProdutoCOMPRA_VALOR_06: TBCDField;
    CdsProdutoVENDA_QTDE_06: TBCDField;
    CdsProdutoVENDA_VALOR_06: TBCDField;
    CdsProdutoCOMPRA_QTDE_09: TBCDField;
    CdsProdutoCOMPRA_VALOR_09: TBCDField;
    CdsProdutoVENDA_QTDE_09: TBCDField;
    CdsProdutoVENDA_VALOR_09: TBCDField;
    CdsProdutoCOMPRA_QTDE_12: TBCDField;
    CdsProdutoCOMPRA_VALOR_12: TBCDField;
    CdsProdutoVENDA_QTDE_12: TBCDField;
    CdsProdutoVENDA_VALOR_12: TBCDField;
    CdsProdutoCOMPRA_QTDE_99: TBCDField;
    CdsProdutoCOMPRA_VALOR_99: TBCDField;
    CdsProdutoVENDA_QTDE_99: TBCDField;
    CdsProdutoVENDA_VALOR_99: TBCDField;
    CdsProdutoMOVIMENTADO: TSmallintField;
    CdsProdutoPROCESSO_DATA: TDateField;
    CdsProdutoPROCESSO_HORA: TTimeField;
    CdsProdutoPROCESSO_USUARIO: TStringField;
    dbgProdutoTblColumn1: TcxGridDBBandedColumn;
    dbgProdutoTblColumn2: TcxGridDBBandedColumn;
    dbgProdutoTblColumn3: TcxGridDBBandedColumn;
    dbgProdutoTblColumn4: TcxGridDBBandedColumn;
    dbgProdutoTblColumn5: TcxGridDBBandedColumn;
    dbgProdutoTblColumn6: TcxGridDBBandedColumn;
    dbgProdutoTblColumn7: TcxGridDBBandedColumn;
    dbgProdutoTblColumn8: TcxGridDBBandedColumn;
    dbgProdutoTblColumn9: TcxGridDBBandedColumn;
    dbgProdutoTblColumn10: TcxGridDBBandedColumn;
    dbgProdutoTblColumn11: TcxGridDBBandedColumn;
    dbgProdutoTblColumn12: TcxGridDBBandedColumn;
    dbgProdutoTblColumn13: TcxGridDBBandedColumn;
    dbgProdutoTblColumn14: TcxGridDBBandedColumn;
    dbgProdutoTblColumn15: TcxGridDBBandedColumn;
    dbgProdutoTblColumn16: TcxGridDBBandedColumn;
    dbgProdutoTblColumn17: TcxGridDBBandedColumn;
    dbgProdutoTblColumn18: TcxGridDBBandedColumn;
    dbgProdutoTblColumn19: TcxGridDBBandedColumn;
    dbgProdutoTblColumn20: TcxGridDBBandedColumn;
    dbgProdutoTblColumn21: TcxGridDBBandedColumn;
    dbgProdutoTblColumn22: TcxGridDBBandedColumn;
    dbgProdutoTblColumn23: TcxGridDBBandedColumn;
    dbgProdutoTblColumn24: TcxGridDBBandedColumn;
    dbgProdutoTblColumn25: TcxGridDBBandedColumn;
    dbgProdutoTblColumn26: TcxGridDBBandedColumn;
    dbgProdutoTblColumn27: TcxGridDBBandedColumn;
    dbgProdutoTblColumn28: TcxGridDBBandedColumn;
    CdsProdutoQTDE: TIntegerField;
    CdsProdutoUNP_DESCRICAO: TStringField;
    CdsProdutoUNP_SIGLA: TStringField;
    dbgProdutoTblColumn29: TcxGridDBBandedColumn;
    dbgProdutoTblColumn30: TcxGridDBBandedColumn;
    QryGrupo: TIBQuery;
    DspGrupo: TDataSetProvider;
    CdsGrupo: TClientDataSet;
    dsGrupo: TDataSource;
    CdsGrupoCODIGO: TSmallintField;
    CdsGrupoDESCRICAO: TStringField;
    CdsGrupoQTDE: TLargeintField;
    CdsGrupoITENS: TIntegerField;
    CdsGrupoDATA_ULTIMA_COMPRA: TDateField;
    CdsGrupoDATA_ULTIMA_VENDA: TDateField;
    CdsGrupoCOMPRA_QTDE_01: TBCDField;
    CdsGrupoCOMPRA_VALOR_01: TBCDField;
    CdsGrupoVENDA_QTDE_01: TBCDField;
    CdsGrupoVENDA_VALOR_01: TBCDField;
    CdsGrupoCOMPRA_QTDE_03: TBCDField;
    CdsGrupoCOMPRA_VALOR_03: TBCDField;
    CdsGrupoVENDA_QTDE_03: TBCDField;
    CdsGrupoVENDA_VALOR_03: TBCDField;
    CdsGrupoCOMPRA_QTDE_06: TBCDField;
    CdsGrupoCOMPRA_VALOR_06: TBCDField;
    CdsGrupoVENDA_QTDE_06: TBCDField;
    CdsGrupoVENDA_VALOR_06: TBCDField;
    CdsGrupoCOMPRA_QTDE_09: TBCDField;
    CdsGrupoCOMPRA_VALOR_09: TBCDField;
    CdsGrupoVENDA_QTDE_09: TBCDField;
    CdsGrupoVENDA_VALOR_09: TBCDField;
    CdsGrupoCOMPRA_QTDE_12: TBCDField;
    CdsGrupoCOMPRA_VALOR_12: TBCDField;
    CdsGrupoVENDA_QTDE_12: TBCDField;
    CdsGrupoVENDA_VALOR_12: TBCDField;
    CdsGrupoCOMPRA_QTDE_99: TBCDField;
    CdsGrupoCOMPRA_VALOR_99: TBCDField;
    CdsGrupoVENDA_QTDE_99: TBCDField;
    CdsGrupoVENDA_VALOR_99: TBCDField;
    StyleRepository: TcxStyleRepository;
    StyleSelecao: TcxStyle;
    StyleContent: TcxStyle;
    StyleContentEven: TcxStyle;
    QryTotal: TIBQuery;
    DspTotal: TDataSetProvider;
    CdsTotal: TClientDataSet;
    dsTotal: TDataSource;
    CdsTotalQTDE: TLargeintField;
    CdsTotalITENS: TIntegerField;
    CdsTotalDATA_ULTIMA_COMPRA: TDateField;
    CdsTotalDATA_ULTIMA_VENDA: TDateField;
    CdsTotalCOMPRA_QTDE_01: TBCDField;
    CdsTotalCOMPRA_VALOR_01: TBCDField;
    CdsTotalVENDA_QTDE_01: TBCDField;
    CdsTotalVENDA_VALOR_01: TBCDField;
    CdsTotalCOMPRA_QTDE_03: TBCDField;
    CdsTotalCOMPRA_VALOR_03: TBCDField;
    CdsTotalVENDA_QTDE_03: TBCDField;
    CdsTotalVENDA_VALOR_03: TBCDField;
    CdsTotalCOMPRA_QTDE_06: TBCDField;
    CdsTotalCOMPRA_VALOR_06: TBCDField;
    CdsTotalVENDA_QTDE_06: TBCDField;
    CdsTotalVENDA_VALOR_06: TBCDField;
    CdsTotalCOMPRA_QTDE_09: TBCDField;
    CdsTotalCOMPRA_VALOR_09: TBCDField;
    CdsTotalVENDA_QTDE_09: TBCDField;
    CdsTotalVENDA_VALOR_09: TBCDField;
    CdsTotalCOMPRA_QTDE_12: TBCDField;
    CdsTotalCOMPRA_VALOR_12: TBCDField;
    CdsTotalVENDA_QTDE_12: TBCDField;
    CdsTotalVENDA_VALOR_12: TBCDField;
    CdsTotalCOMPRA_QTDE_99: TBCDField;
    CdsTotalCOMPRA_VALOR_99: TBCDField;
    CdsTotalVENDA_QTDE_99: TBCDField;
    CdsTotalVENDA_VALOR_99: TBCDField;
    pnlTotal: TPanel;
    dbgTotal: TcxGrid;
    dbgTotalTbl: TcxGridDBBandedTableView;
    cxGridDBBandedColumn3: TcxGridDBBandedColumn;
    cxGridDBBandedColumn4: TcxGridDBBandedColumn;
    cxGridDBBandedColumn5: TcxGridDBBandedColumn;
    cxGridDBBandedColumn6: TcxGridDBBandedColumn;
    cxGridDBBandedColumn7: TcxGridDBBandedColumn;
    cxGridDBBandedColumn8: TcxGridDBBandedColumn;
    cxGridDBBandedColumn9: TcxGridDBBandedColumn;
    cxGridDBBandedColumn10: TcxGridDBBandedColumn;
    cxGridDBBandedColumn11: TcxGridDBBandedColumn;
    cxGridDBBandedColumn12: TcxGridDBBandedColumn;
    cxGridDBBandedColumn13: TcxGridDBBandedColumn;
    cxGridDBBandedColumn14: TcxGridDBBandedColumn;
    cxGridDBBandedColumn15: TcxGridDBBandedColumn;
    cxGridDBBandedColumn16: TcxGridDBBandedColumn;
    cxGridDBBandedColumn17: TcxGridDBBandedColumn;
    cxGridDBBandedColumn18: TcxGridDBBandedColumn;
    cxGridDBBandedColumn19: TcxGridDBBandedColumn;
    cxGridDBBandedColumn20: TcxGridDBBandedColumn;
    cxGridDBBandedColumn21: TcxGridDBBandedColumn;
    cxGridDBBandedColumn22: TcxGridDBBandedColumn;
    cxGridDBBandedColumn23: TcxGridDBBandedColumn;
    cxGridDBBandedColumn24: TcxGridDBBandedColumn;
    cxGridDBBandedColumn25: TcxGridDBBandedColumn;
    cxGridDBBandedColumn26: TcxGridDBBandedColumn;
    cxGridDBBandedColumn27: TcxGridDBBandedColumn;
    cxGridDBBandedColumn28: TcxGridDBBandedColumn;
    cxGridDBBandedColumn29: TcxGridDBBandedColumn;
    cxGridDBBandedColumn30: TcxGridDBBandedColumn;
    dbgTotalLvl: TcxGridLevel;
    dbgGrupo: TcxGrid;
    dbgGrupoTbl: TcxGridDBBandedTableView;
    cxGridDBBandedColumn1: TcxGridDBBandedColumn;
    cxGridDBBandedColumn2: TcxGridDBBandedColumn;
    cxGridDBBandedColumn31: TcxGridDBBandedColumn;
    cxGridDBBandedColumn32: TcxGridDBBandedColumn;
    cxGridDBBandedColumn33: TcxGridDBBandedColumn;
    cxGridDBBandedColumn34: TcxGridDBBandedColumn;
    cxGridDBBandedColumn35: TcxGridDBBandedColumn;
    cxGridDBBandedColumn36: TcxGridDBBandedColumn;
    cxGridDBBandedColumn37: TcxGridDBBandedColumn;
    cxGridDBBandedColumn38: TcxGridDBBandedColumn;
    cxGridDBBandedColumn39: TcxGridDBBandedColumn;
    cxGridDBBandedColumn40: TcxGridDBBandedColumn;
    cxGridDBBandedColumn41: TcxGridDBBandedColumn;
    cxGridDBBandedColumn42: TcxGridDBBandedColumn;
    cxGridDBBandedColumn43: TcxGridDBBandedColumn;
    cxGridDBBandedColumn44: TcxGridDBBandedColumn;
    cxGridDBBandedColumn45: TcxGridDBBandedColumn;
    cxGridDBBandedColumn46: TcxGridDBBandedColumn;
    cxGridDBBandedColumn47: TcxGridDBBandedColumn;
    cxGridDBBandedColumn48: TcxGridDBBandedColumn;
    cxGridDBBandedColumn49: TcxGridDBBandedColumn;
    cxGridDBBandedColumn50: TcxGridDBBandedColumn;
    cxGridDBBandedColumn51: TcxGridDBBandedColumn;
    cxGridDBBandedColumn52: TcxGridDBBandedColumn;
    cxGridDBBandedColumn53: TcxGridDBBandedColumn;
    cxGridDBBandedColumn54: TcxGridDBBandedColumn;
    cxGridDBBandedColumn55: TcxGridDBBandedColumn;
    cxGridDBBandedColumn56: TcxGridDBBandedColumn;
    cxGridDBBandedColumn57: TcxGridDBBandedColumn;
    cxGridDBBandedColumn58: TcxGridDBBandedColumn;
    dbgGrupoLvl: TcxGridLevel;
    dbgGrupoTblColumn1: TcxGridDBBandedColumn;
    dbgGrupoTblColumn2: TcxGridDBBandedColumn;
    dbgGrupoTblColumn3: TcxGridDBBandedColumn;
    dbgGrupoTblColumn4: TcxGridDBBandedColumn;
    dbgGrupoTblColumn5: TcxGridDBBandedColumn;
    dbgGrupoTblColumn6: TcxGridDBBandedColumn;
    dbgGrupoTblColumn7: TcxGridDBBandedColumn;
    dbgGrupoTblColumn8: TcxGridDBBandedColumn;
    dbgGrupoTblColumn9: TcxGridDBBandedColumn;
    dbgGrupoTblColumn10: TcxGridDBBandedColumn;
    dbgGrupoTblColumn11: TcxGridDBBandedColumn;
    dbgGrupoTblColumn12: TcxGridDBBandedColumn;
    dbgGrupoTblColumn13: TcxGridDBBandedColumn;
    dbgGrupoTblColumn14: TcxGridDBBandedColumn;
    dbgGrupoTblColumn15: TcxGridDBBandedColumn;
    dbgGrupoTblColumn16: TcxGridDBBandedColumn;
    dbgGrupoTblColumn17: TcxGridDBBandedColumn;
    dbgGrupoTblColumn18: TcxGridDBBandedColumn;
    dbgGrupoTblColumn19: TcxGridDBBandedColumn;
    dbgGrupoTblColumn20: TcxGridDBBandedColumn;
    dbgGrupoTblColumn21: TcxGridDBBandedColumn;
    dbgGrupoTblColumn22: TcxGridDBBandedColumn;
    dbgGrupoTblColumn23: TcxGridDBBandedColumn;
    dbgGrupoTblColumn24: TcxGridDBBandedColumn;
    CdsGrupoPERCENT_CQ01: TBCDField;
    CdsGrupoPERCENT_CV01: TBCDField;
    CdsGrupoPERCENT_VQ01: TBCDField;
    CdsGrupoPERCENT_VV01: TBCDField;
    CdsGrupoPERCENT_CQ03: TBCDField;
    CdsGrupoPERCENT_CV03: TBCDField;
    CdsGrupoPERCENT_VQ03: TBCDField;
    CdsGrupoPERCENT_VV03: TBCDField;
    CdsGrupoPERCENT_CQ06: TBCDField;
    CdsGrupoPERCENT_CV06: TBCDField;
    CdsGrupoPERCENT_VQ06: TBCDField;
    CdsGrupoPERCENT_VV06: TBCDField;
    CdsGrupoPERCENT_CQ09: TBCDField;
    CdsGrupoPERCENT_CV09: TBCDField;
    CdsGrupoPERCENT_VQ09: TBCDField;
    CdsGrupoPERCENT_VV09: TBCDField;
    CdsGrupoPERCENT_CQ12: TBCDField;
    CdsGrupoPERCENT_CV12: TBCDField;
    CdsGrupoPERCENT_VQ12: TBCDField;
    CdsGrupoPERCENT_VV12: TBCDField;
    CdsGrupoPERCENT_CQ99: TBCDField;
    CdsGrupoPERCENT_CV99: TBCDField;
    CdsGrupoPERCENT_VQ99: TBCDField;
    CdsGrupoPERCENT_VV99: TBCDField;
    svdArquivo: TSaveDialog;
    lblTipoFiltro: TLabel;
    edTipoFiltro: TComboBox;
    procedure NovaPesquisaKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure edTipoProcessoChange(Sender: TObject);
    procedure BtnProcessarClick(Sender: TObject);
    procedure BtnPesquisarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgGrupoTblDblClick(Sender: TObject);
    procedure btbtnIncluirClick(Sender: TObject);
  private
    { Private declarations }
    FSQLTotal   ,
    FSQLGrupo   ,
    FSQLProduto : TStringList;
    procedure HabilitarGuia(const TipoProcesso : Integer);
    procedure ExecutarPesquisa(const TipoProcesso : Integer);
    procedure CalcularPercentuais( cdsTabela : TClientDataSet );
  public
    { Public declarations }
  end;

var
  FrmProdutoRotatividadePRC: TFrmProdutoRotatividadePRC;

implementation

uses
  UDMBusiness, UConstantesDGE, cxGridExportLink;

{$R *.dfm}

const
  TIPO_GRP = 0;
  TIPO_PRD = 1;
  TIPO_FAB = 2;

  WHR_DEFAULT = 'where 1=1'; 

  MES_01 = 30 * 1;
  MES_03 = 30 * 3;
  MES_06 = 30 * 6;
  MES_09 = 30 * 9;
  MES_12 = 30 * 12;
  MES_99 = MES_12 + 1;

{ TFrmProdutoRotatividadePRC }

procedure TFrmProdutoRotatividadePRC.HabilitarGuia(
  const TipoProcesso: Integer);
var
  I : Integer;
begin
  for I := 0 to PgcTabelas.PageCount - 1 do
    PgcTabelas.Pages[I].TabVisible := False;

  if ( TipoProcesso < PgcTabelas.PageCount ) then
  begin
    PgcTabelas.Pages[TipoProcesso].TabVisible := True;
    PgcTabelas.Pages[TipoProcesso].Caption    := edTipoProcesso.Items.Strings[TipoProcesso];

    if (PgcTabelas.Pages[TipoProcesso] = TbsGrupo) or (PgcTabelas.Pages[TipoProcesso] = TbsFabricante) then
      pnlTotal.Parent := PgcTabelas.Pages[TipoProcesso];
  end;
end;

procedure TFrmProdutoRotatividadePRC.FormCreate(Sender: TObject);
begin
  {$IFDEF DGE}
  dbgProduto.LookAndFeel.AssignedValues := [lfvKind,lfvNativeStyle,lfvSkinName];
  dbgProduto.LookAndFeel.Kind           := lfStandard;
  dbgProduto.LookAndFeel.NativeStyle    := True;
  {$ENDIF}

  inherited;
  FSQLTotal := TStringList.Create;
  FSQLTotal.AddStrings( QryTotal.SQL );

  FSQLGrupo := TStringList.Create;
  FSQLGrupo.AddStrings( QryGrupo.SQL );

  FSQLProduto := TStringList.Create;
  FSQLProduto.AddStrings( QryProduto.SQL );

  edTipoFiltro.ItemIndex   := 0;
  edTipoProcesso.ItemIndex := 0;
  HabilitarGuia(edTipoProcesso.ItemIndex);
end;

procedure TFrmProdutoRotatividadePRC.edTipoProcessoChange(Sender: TObject);
begin
  HabilitarGuia(edTipoProcesso.ItemIndex);
end;

procedure TFrmProdutoRotatividadePRC.BtnProcessarClick(Sender: TObject);
begin
  if ( not ShowConfirm('Deseja processar a rotatividade dos produtos?', 'Processar') ) then
    Exit;

  Screen.Cursor        := crSQLWait;
  pnlProcesso.Visible  := True;
  gagProcesso.MinValue := 0;
  gagProcesso.Progress := 0;

  try
    Application.ProcessMessages;

    CdsListaProduto.Close;
    CdsListaProduto.Params.ParamByName('empresa').AsString := GetEmpresaIDDefault;
    CdsListaProduto.Open;

    gagProcesso.MaxValue := CdsListaProduto.RecordCount;
    gagProcesso.Progress := 1;

    with CdsListaProduto do
    begin

      First;
      while not Eof do
      begin
        gagProcesso.Progress := gagProcesso.Progress + 1;
        Application.ProcessMessages;

        // Processar Compra

        with setProdutoRotatividade do
        begin
          ParamByName('produto').AsString      := CdsListaProduto.FieldByName('Codigo').AsString;
          ParamByName('data').AsDateTime       := CdsListaProduto.FieldByName('data_ultima_compra').AsDateTime;
          ParamByName('usuario').AsString      := GetUserApp;
          ParamByName('excluir_rot').AsInteger := 1;
          ParamByName('tipo_rotati').AsInteger := 0;
          ParamByName('ultima_compra').AsDateTime := CdsListaProduto.FieldByName('data_ultima_compra').AsDateTime;
          ParamByName('ultima_venda').AsDateTime  := CdsListaProduto.FieldByName('data_ultima_venda').AsDateTime;
          ExecProc;
        end;

        // Processar venda

        with setProdutoRotatividade do
        begin
          ParamByName('produto').AsString      := CdsListaProduto.FieldByName('Codigo').AsString;
          ParamByName('data').AsDateTime       := CdsListaProduto.FieldByName('data_ultima_venda').AsDateTime;
          ParamByName('usuario').AsString      := GetUserApp;
          ParamByName('excluir_rot').AsInteger := 0;
          ParamByName('tipo_rotati').AsInteger := 1;
          ParamByName('ultima_compra').AsDateTime := CdsListaProduto.FieldByName('data_ultima_compra').AsDateTime;
          ParamByName('ultima_venda').AsDateTime  := CdsListaProduto.FieldByName('data_ultima_venda').AsDateTime;
          ExecProc;
        end;

        CommitTransaction;

        Next;
      end;

      gagProcesso.Progress := gagProcesso.MaxValue;

    end;

  finally
    pnlProcesso.Visible := False;
    Screen.Cursor       := crDefault;
  end;
end;

procedure TFrmProdutoRotatividadePRC.BtnPesquisarClick(Sender: TObject);
begin
  ExecutarPesquisa(edTipoProcesso.ItemIndex);
end;

procedure TFrmProdutoRotatividadePRC.ExecutarPesquisa(
  const TipoProcesso: Integer);
var
  sWhr : String;
begin
  sWhr := 'where (p.codemp = ' + QuotedStr(GetEmpresaIDDefault) + ')';

  Case edTipoFiltro.ItemIndex of
    1 : sWhr := sWhr + ' and (r.movimentado = 1)';
    2 : sWhr := sWhr + ' and (r.movimentado = 0)';
    3 : sWhr := sWhr + ' and (r.data_ultima_compra is null)';
    4 : sWhr := sWhr + ' and (r.data_ultima_venda is null)';
    5 : sWhr := sWhr + ' and (r.data_ultima_venda <=' + QuotedStr(FormatDateTime('yyyy.mm.dd', Date - MES_01)) + ')';
    6 : sWhr := sWhr + ' and (r.data_ultima_venda <=' + QuotedStr(FormatDateTime('yyyy.mm.dd', Date - MES_03)) + ')';
    7 : sWhr := sWhr + ' and (r.data_ultima_venda <=' + QuotedStr(FormatDateTime('yyyy.mm.dd', Date - MES_06)) + ')';
    8 : sWhr := sWhr + ' and (r.data_ultima_venda <=' + QuotedStr(FormatDateTime('yyyy.mm.dd', Date - MES_09)) + ')';
    9 : sWhr := sWhr + ' and (r.data_ultima_venda <=' + QuotedStr(FormatDateTime('yyyy.mm.dd', Date - MES_12)) + ')';
    10: sWhr := sWhr + ' and (r.data_ultima_venda <=' + QuotedStr(FormatDateTime('yyyy.mm.dd', Date - MES_99)) + ')';
  end;

  CdsTotal.Close;
  with QryTotal do
  begin
    SQL.Clear;
    SQL.AddStrings( FSQLTotal );
    SQL.Text := StringReplace(SQL.Text, WHR_DEFAULT, sWhr, [rfReplaceAll]);
  end;
  CdsTotal.Open;

  Case TipoProcesso of
    TIPO_PRD:
      begin
        CdsProduto.Close;
        with QryProduto do
        begin
          SQL.Clear;
          SQL.AddStrings( FSQLProduto );

          if ( Trim(edPesquisar.Text) <> EmptyStr ) then
            if ( StrToIntDef(Trim(edPesquisar.Text), 0) > 0 ) then
              sWhr := sWhr + ' and (p.cod like ' + QuotedStr('%' + edPesquisar.Text + '%') + ')'
            else
              sWhr := sWhr + ' and (upper(p.descri) like ' + QuotedStr(edPesquisar.Text + '%') + ')';

          SQL.Text := StringReplace(SQL.Text, WHR_DEFAULT, sWhr, [rfReplaceAll]);
        end;
        CdsProduto.Open;

        if ( CdsProduto.IsEmpty ) then
          ShowWarning('Dados não encontados de acordo com o filtro informado!');
      end;

    TIPO_GRP:
      begin
        CdsGrupo.Close;
        with QryGrupo do
        begin
          SQL.Clear;
          SQL.AddStrings( FSQLGrupo );

          if ( Trim(edPesquisar.Text) <> EmptyStr ) then
            if ( StrToIntDef(Trim(edPesquisar.Text), 0) > 0 ) then
              sWhr := sWhr + ' and (p.codgrupo = ' + edPesquisar.Text + ')'
            else
              sWhr := sWhr + ' and (upper(g.descri) like ' + QuotedStr(edPesquisar.Text + '%') + ')';

          SQL.Text := StringReplace(SQL.Text, WHR_DEFAULT, sWhr, [rfReplaceAll]);  
        end;
        CdsGrupo.Open;

        if ( CdsGrupo.IsEmpty ) then
          ShowWarning('Dados não encontados de acordo com o filtro informado!')
        else
          CalcularPercentuais( CdsGrupo );
      end;

    TIPO_FAB:
      ;
  end;
end;

procedure TFrmProdutoRotatividadePRC.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if ( (Key = VK_RETURN) and (ActiveControl = edPesquisar) ) then
    BtnPesquisar.Click
  else
  if ( Key = VK_F5 ) then
    BtnProcessar.Click
  else
  if ( Key = VK_ESCAPE ) then
  begin
    if ( PgcTabelas.ActivePageIndex <> edTipoProcesso.ItemIndex ) then
      HabilitarGuia( edTipoProcesso.ItemIndex );
  end;

  inherited;
end;

procedure TFrmProdutoRotatividadePRC.NovaPesquisaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if ( Key in ['0'..'9', 'a'..'z', 'A'..'Z', ' '] ) then
  begin
    edPesquisar.Text := Trim(Key);
    edPesquisar.SetFocus;
    edPesquisar.SelStart := Length(edPesquisar.Text) + 1;

    Key := #0;
  end
end;

procedure TFrmProdutoRotatividadePRC.CalcularPercentuais(
  cdsTabela: TClientDataSet);
var
  I ,
  X : Integer;
  sOrigem  ,
  sDestino : String;
const
  // Coompra
  FIELD_CMP_QTDE   = 'compra_qtde_';
  FIELD_CMP_VALOR  = 'compra_valor_';
  FIELD_PERCENT_CQ = 'percent_cq';
  FIELD_PERCENT_CV = 'percent_cv';
  // Venda
  FIELD_VND_QTDE   = 'venda_qtde_';
  FIELD_VND_VALOR  = 'venda_valor_';
  FIELD_PERCENT_VQ = 'percent_vq';
  FIELD_PERCENT_VV = 'percent_vv';
  // Controlles Fields
  FIELDS_CONTADOR : Array[1..6] of String = ('01', '03', '06', '09', '12', '99');
  FIELDS_ORIGEM   : Array[1..4] of String = (FIELD_CMP_QTDE,   FIELD_CMP_VALOR,  FIELD_VND_QTDE,   FIELD_VND_VALOR);
  FIELDS_DESTINO  : Array[1..4] of String = (FIELD_PERCENT_CQ, FIELD_PERCENT_CV, FIELD_PERCENT_VQ, FIELD_PERCENT_VV);
begin

  with cdsTabela do
  begin

  if ( IsEmpty ) then
    Exit;

    DisableControls;
    First;

    while not Eof do
    begin
      Edit;

      for I := Low(FIELDS_CONTADOR) to High(FIELDS_CONTADOR) do
      begin
        for X := Low(FIELDS_ORIGEM) to High(FIELDS_ORIGEM) do
        begin
          sOrigem  := FIELDS_ORIGEM[X]  + FIELDS_CONTADOR[I];
          sDestino := FIELDS_DESTINO[X] + FIELDS_CONTADOR[I];

          if ( FieldByName(sOrigem).AsCurrency = 0 ) then
            FieldByName(sDestino).AsCurrency := 0
          else
            FieldByName(sDestino).AsCurrency := (FieldByName(sOrigem).AsCurrency / CdsTotal.FieldByName(sOrigem).AsCurrency) * 100;
        end;
      end;

      Post;

      Next;
    end;

    First;
    EnableControls;

  end;

end;

procedure TFrmProdutoRotatividadePRC.dbgGrupoTblDblClick(Sender: TObject);
var
  sWhr : String;
begin
  sWhr := 'where (p.codemp = ' + QuotedStr(GetEmpresaIDDefault) + ')';

  Case edTipoFiltro.ItemIndex of
    1 : sWhr := sWhr + ' and (r.movimentado = 1)';
    2 : sWhr := sWhr + ' and (r.movimentado = 0)';
    3 : sWhr := sWhr + ' and (r.data_ultima_compra is null)';
    4 : sWhr := sWhr + ' and (r.data_ultima_venda is null)';
    5 : sWhr := sWhr + ' and (r.data_ultima_venda <=' + QuotedStr(FormatDateTime('yyyy.mm.dd', Date - MES_01)) + ')';
    6 : sWhr := sWhr + ' and (r.data_ultima_venda <=' + QuotedStr(FormatDateTime('yyyy.mm.dd', Date - MES_03)) + ')';
    7 : sWhr := sWhr + ' and (r.data_ultima_venda <=' + QuotedStr(FormatDateTime('yyyy.mm.dd', Date - MES_06)) + ')';
    8 : sWhr := sWhr + ' and (r.data_ultima_venda <=' + QuotedStr(FormatDateTime('yyyy.mm.dd', Date - MES_09)) + ')';
    9 : sWhr := sWhr + ' and (r.data_ultima_venda <=' + QuotedStr(FormatDateTime('yyyy.mm.dd', Date - MES_12)) + ')';
    10: sWhr := sWhr + ' and (r.data_ultima_venda <=' + QuotedStr(FormatDateTime('yyyy.mm.dd', Date - MES_99)) + ')';
  end;

  Case edTipoProcesso.ItemIndex of
    TIPO_GRP:
      begin
        if ( CdsGrupo.IsEmpty ) then
          Exit;

        CdsProduto.Close;
        with QryProduto do
        begin
          SQL.Clear;
          SQL.AddStrings( FSQLProduto );

          if ( CdsGrupoCODIGO.IsNull ) then
            sWhr := sWhr + ' and (p.codgrupo is null)'
          else
            sWhr := sWhr + ' and (p.codgrupo = ' + CdsGrupoCODIGO.AsString + ')';

          SQL.Text := StringReplace(SQL.Text, WHR_DEFAULT, sWhr, [rfReplaceAll]);
        end;
        CdsProduto.Open;

        if ( not CdsProduto.IsEmpty ) then
          HabilitarGuia( TIPO_PRD );
      end;

  end;
end;

procedure TFrmProdutoRotatividadePRC.btbtnIncluirClick(Sender: TObject);
begin
  Case PgcTabelas.ActivePageIndex of
    TIPO_GRP:
      if ( CdsGrupo.IsEmpty ) then
      begin
        ShowWarning('Sem dados para exportar!');
        Exit;
      end;

    TIPO_PRD:
      if ( CdsProduto.IsEmpty ) then
      begin
        ShowWarning('Sem dados para exportar!');
        Exit;
      end;
  end;

  if ( svdArquivo.Execute ) then
    Case PgcTabelas.ActivePageIndex of
      TIPO_GRP: ExportGridToExcel(svdArquivo.FileName, dbgGrupo);
      TIPO_PRD: ExportGridToExcel(svdArquivo.FileName, dbgProduto);
    end;
end;

initialization
  FormFunction.RegisterForm('FrmProdutoRotatividadePRC', TFrmProdutoRotatividadePRC);

end.
