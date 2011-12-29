unit UGrBancos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, StdCtrls, Buttons, ExtCtrls, Grids,
  DBGrids, ComCtrls, ToolWin, Mask, DBCtrls, IBUpdateSQL, ImgList;

type
  TfrmGrBancos = class(TForm)
    Bevel1: TBevel;
    tlbBotoes: TToolBar;
    Bevel2: TBevel;
    Bevel3: TBevel;
    btbtnIncluir: TBitBtn;
    btbtnAlterar: TBitBtn;
    btbtnExcluir: TBitBtn;
    Bevel5: TBevel;
    btbtnLista: TBitBtn;
    Bevel6: TBevel;
    btbtnFechar: TBitBtn;
    pgcGuias: TPageControl;
    tbsTabela: TTabSheet;
    Bevel4: TBevel;
    dbgDados: TDBGrid;
    pnlFiltros: TPanel;
    grpBxFiltro: TGroupBox;
    Label1: TLabel;
    btnFiltrar: TSpeedButton;
    edtFiltrar: TEdit;
    tbsCadastro: TTabSheet;
    IbDtstBanco: TIBDataSet;
    DtSrcBanco: TDataSource;
    btbtnCancelar: TBitBtn;
    btbtnSalvar: TBitBtn;
    Bevel7: TBevel;
    IbDtstBancoBCO_COD: TSmallintField;
    IbDtstBancoBCO_CARTEIRA: TIBStringField;
    IbDtstBancoBCO_NOME: TIBStringField;
    IbDtstBancoBCO_CHAVE: TIBStringField;
    IbDtstBancoBCO_AGENCIA: TIBStringField;
    IbDtstBancoBCO_CC: TIBStringField;
    IbDtstBancoBCO_NOSSO_NUM_INICIO: TIBStringField;
    IbDtstBancoBCO_NOSSO_NUM_FINAL: TIBStringField;
    IbDtstBancoBCO_NOSSO_NUM_PROXIMO: TIBStringField;
    IbDtstBancoBCO_CONFG_1: TIBStringField;
    IbDtstBancoBCO_CONFG_2: TIBStringField;
    IbDtstBancoBCO_DIRETORIO_REMESSA: TIBStringField;
    IbDtstBancoBCO_DIRETORIO_RETORNO: TIBStringField;
    GrpBxDadosNominais: TGroupBox;
    Bevel8: TBevel;
    lblCodigo: TLabel;
    dbCodigo: TDBEdit;
    lblNome: TLabel;
    dbNome: TDBEdit;
    lblAgencia: TLabel;
    dbAgencia: TDBEdit;
    lblConta: TLabel;
    dbConta: TDBEdit;
    lblContrato: TLabel;
    dbContrato: TDBEdit;
    lblCarteira: TLabel;
    dbCarteira: TDBEdit;
    IbUpdBanco: TIBUpdateSQL;
    GrpBxDiretorios: TGroupBox;
    lblRemessa: TLabel;
    dbRemessa: TDBEdit;
    lblRetorno: TLabel;
    dbRetorno: TDBEdit;
    Bevel9: TBevel;
    GrpBxConfigCobreBemX: TGroupBox;
    lblConfiguracao1: TLabel;
    lblConfiguracao2: TLabel;
    dbConfiguracao1: TDBEdit;
    dbConfiguracao2: TDBEdit;
    lblNossoNumeroI: TLabel;
    dbNossoNumeroI: TDBEdit;
    lblNossoNumeroF: TLabel;
    dbNossoNumeroF: TDBEdit;
    lblNossoNumeroP: TLabel;
    dbNossoNumeroP: TDBEdit;
    lblProximaRemessa: TLabel;
    dbProximaRemessa: TDBEdit;
    IbDtstBancoBCO_SEQUENCIAL_REM: TIntegerField;
    ImgList: TImageList;
    procedure btbtnFecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbgDadosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbgDadosKeyPress(Sender: TObject; var Key: Char);
    procedure dbgDadosDblClick(Sender: TObject);
    procedure DtSrcBancoStateChange(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btbtnIncluirClick(Sender: TObject);
    procedure btbtnAlterarClick(Sender: TObject);
    procedure btbtnExcluirClick(Sender: TObject);
    procedure btbtnCancelarClick(Sender: TObject);
    procedure btbtnSalvarClick(Sender: TObject);
    procedure IbDtstBancoBeforePost(DataSet: TDataSet);
    procedure IbDtstBancoNewRecord(DataSet: TDataSet);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnFiltrarClick(Sender: TObject);
    procedure edtFiltrarKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    sSQL : TStringList;
  public
    { Public declarations }
  end;

var
  frmGrBancos: TfrmGrBancos;

implementation

uses UDmCoTransp;

{$R *.dfm}

procedure TfrmGrBancos.btbtnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmGrBancos.FormCreate(Sender: TObject);
begin
  sSQL := TStringList.Create;
  sSQL.AddStrings( IbDtstBanco.SelectSQL );
  
  IbDtstBanco.Close;
  IbDtstBanco.Open;

  pgcGuias.ActivePage := tbsTabela;
end;

procedure TfrmGrBancos.dbgDadosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
 TDbGrid(Sender).Canvas.font.Color := clBlack;

 if gdSelected in State then
 with (Sender as TDBGrid).Canvas do
 begin
   Brush.Color :=  clMoneyGreen;
   FillRect(Rect);
   Font.Style  := [fsbold]
 end;

 TDbGrid(Sender).DefaultDrawDataCell(Rect, TDbGrid(Sender).columns[datacol].field, State);
end;

procedure TfrmGrBancos.dbgDadosKeyPress(Sender: TObject; var Key: Char);
begin
  if ( Key = #13 ) then
    pgcGuias.SelectNextPage(False)
  else
  if ( Key in ['0'..'9', ' ', 'a'..'z', 'A'..'Z'] ) then
  begin
    edtFiltrar.Text := Trim(Key);
    edtFiltrar.SetFocus;
    edtFiltrar.SelStart := Length(edtFiltrar.Text);
  end;
end;

procedure TfrmGrBancos.dbgDadosDblClick(Sender: TObject);
begin
  pgcGuias.SelectNextPage(False);
end;

procedure TfrmGrBancos.DtSrcBancoStateChange(Sender: TObject);
begin
  btbtnIncluir.Enabled  := (IbDtstBanco.State in [dsBrowse]);
  btbtnAlterar.Enabled  := (IbDtstBanco.State in [dsBrowse]) and (IbDtstBanco.RecordCount > 0);
  btbtnExcluir.Enabled  := (IbDtstBanco.State in [dsBrowse]) and (IbDtstBanco.RecordCount > 0);
  btbtnCancelar.Enabled := (IbDtstBanco.State in [dsEdit, dsInsert]);
  btbtnSalvar.Enabled   := (IbDtstBanco.State in [dsEdit, dsInsert]);
  btbtnLista.Enabled    := (IbDtstBanco.State in [dsBrowse]);
  btbtnFechar.Enabled   := (IbDtstBanco.State in [dsBrowse]);

  DtSrcBanco.AutoEdit   := (IbDtstBanco.State in [dsEdit, dsInsert]);
  if ( DtSrcBanco.AutoEdit ) then
    pgcGuias.ActivePage := tbsCadastro;
end;

procedure TfrmGrBancos.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if ( not btbtnFechar.Enabled ) then
    Application.MessageBox('Existe registro em edição', 'Alerta', MB_ICONWARNING);

  CanClose := btbtnFechar.Enabled;
end;

procedure TfrmGrBancos.btbtnIncluirClick(Sender: TObject);
begin
  IbDtstBanco.Append;
end;

procedure TfrmGrBancos.btbtnAlterarClick(Sender: TObject);
begin
  IbDtstBanco.Edit;
end;

procedure TfrmGrBancos.btbtnExcluirClick(Sender: TObject);
begin
  if ( Application.MessageBox('Deseja excluir o registro selecionado?', 'Excluir', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = ID_YES ) then
  begin
    IbDtstBanco.Delete;
    IbDtstBanco.ApplyUpdates;
  end;
end;

procedure TfrmGrBancos.btbtnCancelarClick(Sender: TObject);
begin
  if ( Application.MessageBox('Deseja cancelar a inserção/edição do registro?', 'Cancelar', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = ID_YES ) then
    IbDtstBanco.Cancel;
end;

procedure TfrmGrBancos.btbtnSalvarClick(Sender: TObject);
begin
  try
    if ( Application.MessageBox('Deseja salvar a inserção/edição do registro?', 'Salvar', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = ID_YES ) then
    begin
      IbDtstBanco.Post;
      IbDtstBanco.ApplyUpdates;
    end;
  except
    On E : Exception do
    begin
      Application.MessageBox(PChar('Erro ao tentar salvar registro.' + #13 + E.Message), 'Erro', MB_ICONERROR);
      Abort;
    end;
  end;
end;

procedure TfrmGrBancos.IbDtstBancoBeforePost(DataSet: TDataSet);
begin
  try
    // Normalizando diretório de remessa
    IbDtstBancoBCO_DIRETORIO_REMESSA.Value := Trim(IbDtstBancoBCO_DIRETORIO_REMESSA.AsString);

    if ( IbDtstBancoBCO_DIRETORIO_REMESSA.AsString = EmptyStr ) then
      IbDtstBancoBCO_DIRETORIO_REMESSA.Value := 'C:\Remessa\';

    if ( Copy(IbDtstBancoBCO_DIRETORIO_REMESSA.AsString, Length(IbDtstBancoBCO_DIRETORIO_REMESSA.AsString), 1) <> '\' ) then
      IbDtstBancoBCO_DIRETORIO_REMESSA.Value := IbDtstBancoBCO_DIRETORIO_REMESSA.AsString + '\';

    ForceDirectories(IbDtstBancoBCO_DIRETORIO_REMESSA.AsString);

    // Normalizando diretório de retorno
    IbDtstBancoBCO_DIRETORIO_REMESSA.Value := Trim(IbDtstBancoBCO_DIRETORIO_RETORNO.AsString);

    if ( IbDtstBancoBCO_DIRETORIO_REMESSA.AsString = EmptyStr ) then
      IbDtstBancoBCO_DIRETORIO_REMESSA.Value := 'C:\Retorno\';

    if ( Copy(IbDtstBancoBCO_DIRETORIO_REMESSA.AsString, Length(IbDtstBancoBCO_DIRETORIO_REMESSA.AsString), 1) <> '\' ) then
      IbDtstBancoBCO_DIRETORIO_REMESSA.Value := IbDtstBancoBCO_DIRETORIO_REMESSA.AsString + '\';

    ForceDirectories(IbDtstBancoBCO_DIRETORIO_REMESSA.AsString);
  except
    On E : Exception do
    begin
      Application.MessageBox(PChar('Erro ao tentar salvar configurações de diretórios de arquivos.' + #13 + E.Message), 'Erro', MB_ICONERROR);
      Abort;
    end;
  end;
end;

procedure TfrmGrBancos.IbDtstBancoNewRecord(DataSet: TDataSet);
begin
  IbDtstBancoBCO_NOSSO_NUM_INICIO.Value  := FormatFloat('000000', 1);
  IbDtstBancoBCO_NOSSO_NUM_FINAL.Value   := FormatFloat('000000', 999999);
  IbDtstBancoBCO_NOSSO_NUM_PROXIMO.Value := FormatFloat('000000', 1);
  IbDtstBancoBCO_SEQUENCIAL_REM.Value    := 1;
end;

procedure TfrmGrBancos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Case Key of
    VK_ESCAPE : if ( pgcGuias.ActivePageIndex <> 0 ) then
                begin
                  pgcGuias.ActivePageIndex := 0;
                  dbgDados.SetFocus;
                end
                else
                if ( pgcGuias.ActivePageIndex = 0 ) then
                  if ( btbtnFechar.Enabled ) then
                    btbtnFechar.Click;

  end;
end;

procedure TfrmGrBancos.btnFiltrarClick(Sender: TObject);
begin
  with IbDtstBanco, SelectSQL do
  begin
    Close;
    Clear;
    AddStrings( sSQL );

    if ( Trim(edtFiltrar.Text) <> EmptyStr ) then
      if ( StrToIntDef(Trim(edtFiltrar.Text), 0) > 0 ) then
        Add( 'where b.bco_cod = ' + Trim(edtFiltrar.Text) )
      else
        Add( 'where b.bco_nome like ' + QuotedStr('%' + Trim(edtFiltrar.Text) + '%') );

    Add( 'order by b.bco_nome');

    Open;

    if ( not IsEmpty ) then
      dbgDados.SetFocus
    else
    begin
      Application.MessageBox('Não existe registros de bancos com esta descrição', 'Alerta', MB_ICONWARNING);

      edtFiltrar.SetFocus;
      edtFiltrar.SelectAll;
    end;
  end;
end;

procedure TfrmGrBancos.edtFiltrarKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if ( Key = 13 ) then
    btnFiltrar.Click;
end;

end.
