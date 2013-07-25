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
  IBQuery, IBStoredProc, DBCtrls, Gauges;

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
    TbsFornecedor: TTabSheet;
    dbgProdutoLvl: TcxGridLevel;
    dbgProduto: TcxGrid;
    dbgProdutoTbl: TcxGridDBBandedTableView;
    Label1: TLabel;
    Label2: TLabel;
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
    procedure NovaPesquisaKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure edTipoProcessoChange(Sender: TObject);
    procedure BtnProcessarClick(Sender: TObject);
    procedure BtnPesquisarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    FSQLProduto : TStringList;
    procedure HabilitarGuia(const TipoProcesso : Integer);
    procedure ExecutarPesquisa(const TipoProcesso : Integer);
  public
    { Public declarations }
  end;

var
  FrmProdutoRotatividadePRC: TFrmProdutoRotatividadePRC;

implementation

uses
  UDMBusiness, UConstantesDGE;

{$R *.dfm}

const
  TIPO_PRD = 0;
  TIPO_GRP = 1;
  TIPO_FOR = 2;

  WHR_DEFAULT = 'where 1=1';
  
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
  FSQLProduto := TStringList.Create;
  FSQLProduto.AddStrings( QryProduto.SQL );
  
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
  sWhr := WHR_DEFAULT;
  
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
              sWhr := sWhr + ' and (r.cod_produto like ' + QuotedStr('%' + edPesquisar.Text + '%') + ')'
            else
              sWhr := sWhr + ' and (upper(p.descri) like ' + QuotedStr(edPesquisar.Text + '%') + ')';

          SQL.Text := StringReplace(SQL.Text, WHR_DEFAULT, sWhr, [rfReplaceAll]);
        end;
        CdsProduto.Open;

        if ( CdsProduto.IsEmpty ) then
          ShowWarning('Dados não encontados de acordo com o filtro informado!');
      end;

    TIPO_GRP:
      ;

    TIPO_FOR:
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
    BtnProcessar.Click;
    
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

initialization
  FormFunction.RegisterForm('FrmProdutoRotatividadePRC', TFrmProdutoRotatividadePRC);

end.
