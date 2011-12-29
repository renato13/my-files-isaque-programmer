unit UGrRemessaBoletos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, DB, IBCustomDataSet, IBTable, ComCtrls,
  IBSQL, DBClient, Provider, IBUpdateSQL, IBQuery, Buttons, ToolWin, Grids,
  DBGrids, ComObj, frxClass, frxDBSet;

type
  TfrmGrRemessaBoleto = class(TForm)
    pnlFiltro: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    cmbBanco: TComboBox;
    IbTblBancos: TIBTable;
    IbTblBancosBCO_COD: TSmallintField;
    IbTblBancosBCO_CARTEIRA: TIBStringField;
    IbTblBancosBCO_NOME: TIBStringField;
    IbTblBancosBCO_CHAVE: TIBStringField;
    IbTblBancosBCO_AGENCIA: TIBStringField;
    IbTblBancosBCO_CC: TIBStringField;
    IbTblBancosBCO_NOSSO_NUM_INICIO: TIBStringField;
    IbTblBancosBCO_NOSSO_NUM_FINAL: TIBStringField;
    IbTblBancosBCO_NOSSO_NUM_PROXIMO: TIBStringField;
    IbTblBancosBCO_CONFG_1: TIBStringField;
    IbTblBancosBCO_CONFG_2: TIBStringField;
    datInicio: TDateTimePicker;
    Label2: TLabel;
    Label3: TLabel;
    datFinal: TDateTimePicker;
    edtArquivoRemessa: TEdit;
    Label4: TLabel;
    IbQryTitulos: TIBQuery;
    IbUpdTitulos: TIBUpdateSQL;
    DspTitulos: TDataSetProvider;
    CdsTitulos: TClientDataSet;
    CdsTitulosNUMLANC: TLargeintField;
    CdsTitulosPARCELA: TSmallintField;
    CdsTitulosCODBANCO: TIntegerField;
    CdsTitulosNOSSONUMERO: TStringField;
    CdsTitulosCNPJ: TStringField;
    CdsTitulosTIPPAG: TStringField;
    CdsTitulosDTEMISS: TDateField;
    CdsTitulosDTVENC: TDateField;
    CdsTitulosVALORREC: TBCDField;
    CdsTitulosPERCENTJUROS: TBCDField;
    CdsTitulosPERCENTMULTA: TBCDField;
    CdsTitulosPERCENTDESCONTO: TBCDField;
    CdsTitulosVALORRECTOT: TBCDField;
    CdsTitulosVALORSALDO: TBCDField;
    CdsTitulosDATAPROCESSOBOLETO: TDateField;
    DtsTitulos: TDataSource;
    UpdateLanc: TIBSQL;
    pnlTitulos: TPanel;
    Shape1: TShape;
    Bevel2: TBevel;
    Bevel1: TBevel;
    tlbBotoes: TToolBar;
    Bevel3: TBevel;
    btnFechar: TBitBtn;
    Bevel4: TBevel;
    btnGerarRemessa: TBitBtn;
    Bevel5: TBevel;
    Bevel6: TBevel;
    dbgTitulos: TDBGrid;
    Label5: TLabel;
    CdsTitulosCNPJ1: TStringField;
    CdsTitulosINSCEST: TStringField;
    CdsTitulosNOME: TStringField;
    CdsTitulosFONE: TStringField;
    CdsTitulosENDER: TStringField;
    CdsTitulosBAIRRO: TStringField;
    CdsTitulosCIDADE: TStringField;
    CdsTitulosUF: TStringField;
    CdsTitulosCEP: TStringField;
    CdsTitulosEMAIL: TStringField;
    IbTblBancosBCO_SEQUENCIAL_REM: TIntegerField;
    IbTblBancosBCO_DIRETORIO_REMESSA: TIBStringField;
    IbTblBancosBCO_DIRETORIO_RETORNO: TIBStringField;
    frrRemessa: TfrxReport;
    frdRemessa: TfrxDBDataset;
    procedure FormShow(Sender: TObject);
    procedure cmbBancoChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnGerarRemessaClick(Sender: TObject);
    procedure datInicioChange(Sender: TObject);
    procedure dbgTitulosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure frrRemessaGetValue(const VarName: String;
      var Value: Variant);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    CobreBemX : Variant;
    procedure CarregarBancos;
    procedure DefinirNomeArquivo( iBanco : Integer );
    procedure CarregarTitulos( iBanco : Integer; DataInicial, DataFinal : TDate);
    procedure GravarHistoricoRemessa;

    function DefinirCedente( Banco, Carteira : Integer; var Objeto : Variant ) : Boolean;
    function InserirBoleto( var Objeto : Variant ) : Boolean;
  public
    { Public declarations }
  end;

var
  frmGrRemessaBoleto: TfrmGrRemessaBoleto;

const
  feeSMTPBoletoHTML              = $00000000;
  feeSMTPMensagemBoletoHTMLAnexo = $00000001;
  feeSMTPMensagemBoletoPDFAnexo  = $00000002;
  feeSMTPMensagemLinhaDigitavelURLCobreBemECommerce = $00000003;
  feeSMTPMensagemURLCobreBemECommerce = $00000004;
  feeSMTPMensagemLinhaDigitavel       = $00000005;
  feeOutlookBoletoHTML                = $00000006;
  feeOutlookMensagemBoletoHTMLAnexo   = $00000007;
  feeOutlookMensagemBoletoPDFAnexo    = $00000008;
  feeOutlookMensagemLinhaDigitavelURLCobreBemECommerce = $00000009;
  feeOutlookMensagemURLCobreBemECommerce = $0000000A;
  feeOutlookMensagemLinhaDigitavel       = $0000000B;
  scpExecutar = $00000000;
  scpOK       = $00000001;
  scpInvalido = $00000002;
  scpErro     = $00000003;

  procedure GerarArquivoRemessa;
  
implementation

{$R *.dfm}

{ TfrmGrRemessaBoleto }

procedure GerarArquivoRemessa;
var
  f : TfrmGrRemessaBoleto;
begin
  try
    f := TfrmGrRemessaBoleto.Create(Application);
    f.ShowModal;
  finally
    f.Free;
  end;
end;

procedure TfrmGrRemessaBoleto.CarregarBancos;
begin
  with IbTblBancos, cmbBanco do
  begin
    Close;
    Open;
    if ( not IsEmpty ) then
      Clear;

    while not Eof do
    begin
      Items.Add( FormatFloat('000', IbTblBancosBCO_COD.AsInteger) + ' - ' + IbTblBancosBCO_NOME.AsString );

      Next;
    end;

    First;

    cmbBanco.Tag       := IbTblBancosBCO_COD.AsInteger;
    cmbBanco.ItemIndex := 0;
  end;
end;

procedure TfrmGrRemessaBoleto.FormShow(Sender: TObject);
begin
  CarregarBancos;
  cmbBancoChange(cmbBanco);
end;

procedure TfrmGrRemessaBoleto.cmbBancoChange(Sender: TObject);
begin
  if ( not IbTblBancos.Active ) then
    IbTblBancos.Open;

  if ( IbTblBancos.Locate('BCO_COD', StrToIntDef(Copy(cmbBanco.Text, 1, 3), 0), []) ) then
    cmbBanco.Tag := IbTblBancosBCO_COD.AsInteger;

  DefinirNomeArquivo( cmbBanco.Tag );

  CarregarTitulos( cmbBanco.Tag, datInicio.Date, datFinal.Date );
end;

procedure TfrmGrRemessaBoleto.FormCreate(Sender: TObject);
begin
  datInicio.Date := Date;
  datFinal.Date  := Date;
  CobreBemX := CreateOleObject('CobreBemX.ContaCorrente');
end;

procedure TfrmGrRemessaBoleto.DefinirNomeArquivo(iBanco: Integer);
begin
  if ( DirectoryExists(Trim(IbTblBancosBCO_DIRETORIO_REMESSA.AsString)) ) then
    edtArquivoRemessa.Text := Trim(IbTblBancosBCO_DIRETORIO_REMESSA.AsString) + FormatFloat('000', iBanco) + '\' + FormatFloat('000', iBanco) + '_' + FormatDateTime('yyyymmdd-hhmmss', Now) + '.rem'
  else
    edtArquivoRemessa.Text := ExtractFilePath(ParamStr(0)) + 'Remessa\' + FormatFloat('000', iBanco) + '\' + FormatFloat('000', iBanco) + '_' + FormatDateTime('yyyymmdd-hhmmss', Now) + '.rem';
    
  ForceDirectories( ExtractFilePath(edtArquivoRemessa.Text) );
end;

procedure TfrmGrRemessaBoleto.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmGrRemessaBoleto.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose := ( Application.MessageBox('Deseja abandonar processo de geração de remessas?','Fechar', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = ID_YES );
end;

procedure TfrmGrRemessaBoleto.btnGerarRemessaClick(Sender: TObject);
var
  IBanco    ,
  ICarteira : Integer;
begin
  try

    if ( CdsTitulos.IsEmpty ) then
    begin
      Application.MessageBox('Não existe relação de boletos para gerar arquivo de remessa.','Alerta', MB_ICONEXCLAMATION);
      Exit;
    end;

    if ( Application.MessageBox('Confirma a geração de arquivo de remessa?','Gerar Remessa', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) <> ID_YES ) then
      Exit;

    if ( cmbBanco.ItemIndex < 0 ) then
    begin
      Application.MessageBox(PChar('Favor selecionar a entidade financeira para geração dos boletos.'), 'Alerta', MB_ICONWARNING);
      Exit;
    end;

    IBanco    := StrToIntDef( Copy(cmbBanco.Text, 1, 3), 0 );
    ICarteira := IbTblBancosBCO_CARTEIRA.AsInteger;

    if DefinirCedente( IBanco, ICarteira, CobreBemX ) then
    begin
      CdsTitulos.First;

      if ( InserirBoleto( CobreBemX ) ) then
      begin
        CobreBemX.GravaArquivoRemessa;

        GravarHistoricoRemessa;

        frrRemessa.ShowReport;
        
        Application.MessageBox('Arquivo de remessa gerado com sucesso.', 'Remessa', MB_ICONINFORMATION);

        CarregarTitulos( cmbBanco.Tag, datInicio.Date, datFinal.Date );
      end;

    end;

  except
    On E : Exception do
      Application.MessageBox(PChar('Erro na tentativa de gerar o arquivo de remessa.' + #13 + E.Message), 'Erro', MB_ICONERROR);
  end;
end;

procedure TfrmGrRemessaBoleto.CarregarTitulos(iBanco: Integer; DataInicial,
  DataFinal: TDate);
begin
  with CdsTitulos, Params do
  begin
    Close;
    ParamByName('banco').Value        := iBanco;
    ParamByName('dataInicial').AsDate := DataInicial;
    ParamByName('dataFinal').AsDate   := DataFinal;
    Open;

    btnGerarRemessa.Enabled := not IsEmpty;
  end;
end;

procedure TfrmGrRemessaBoleto.datInicioChange(Sender: TObject);
begin
  CarregarTitulos( cmbBanco.Tag, datInicio.Date, datFinal.Date );
end;

procedure TfrmGrRemessaBoleto.dbgTitulosDrawColumnCell(Sender: TObject;
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

function TfrmGrRemessaBoleto.DefinirCedente(Banco, Carteira: Integer;
  var Objeto: Variant): Boolean;
var
  sAppPath     ,
  sFileLisence : String;
begin
  try
    sAppPath     := ExtractFilePath(ParamStr(0));
    sFileLisence := sAppPath + 'Licencas\' + FormatFloat('000', Banco)  + '-' + FormatFloat('00', Carteira) + '.conf';

    if ( not FileExists(sFileLisence) ) then
      raise Exception.Create('Arquivo de licença ' + QuotedStr(sFileLisence) + ' não encontrado');

    // Parâmetros obrigatórios da conta corrente do Cedente

    Objeto.ArquivoLicenca         := sFileLisence;
    Objeto.CodigoAgencia          := IbTblBancosBCO_AGENCIA.AsString;
    Objeto.NumeroContaCorrente    := IbTblBancosBCO_CC.AsString;
    Objeto.CodigoCedente          := IbTblBancosBCO_CHAVE.AsString;
    Objeto.InicioNossoNumero      := IbTblBancosBCO_NOSSO_NUM_INICIO.AsString;
    Objeto.FimNossoNumero         := IbTblBancosBCO_NOSSO_NUM_FINAL.AsString;
    Objeto.OutroDadoConfiguracao1 := Trim(IbTblBancosBCO_CONFG_1.AsString);
    Objeto.OutroDadoConfiguracao2 := Trim(IbTblBancosBCO_CONFG_2.AsString);

    if ( Trim(IbTblBancosBCO_NOSSO_NUM_PROXIMO.AsString) = EmptyStr ) then
      Objeto.ProximoNossoNumero  := '1'
    else
      Objeto.ProximoNossoNumero  := IbTblBancosBCO_NOSSO_NUM_PROXIMO.AsString;

    // Parâmetros obrigatórios para a geração de arquivos de remessa

    Objeto.ArquivoRemessa.Arquivo      := ExtractFileName(edtArquivoRemessa.Text);
    Objeto.ArquivoRemessa.Diretorio    := ExtractFilePath(edtArquivoRemessa.Text);
    Objeto.ArquivoRemessa.Sequencia    := IbTblBancosBCO_SEQUENCIAL_REM.AsInteger;
    Objeto.ArquivoRemessa.DataGravacao := FormatDateTime('dd/mm/yyyy', Date);

    Objeto.PadroesBoleto.PadroesBoletoImpresso.ArquivoLogotipo            := sAppPath + 'Imagens\BannerCBX.gif';
    Objeto.PadroesBoleto.PadroesBoletoImpresso.CaminhoImagensCodigoBarras := sAppPath + 'Imagens\';

    Result := True;
  except
    On E : Exception do
    begin
      Application.MessageBox(PChar('Erro ao tentar iniciar processo de geração de arquivo de remessa.' + #13 + E.Message), 'Erro', MB_ICONERROR);
      Result := False;
    end;
  end;
end;

function TfrmGrRemessaBoleto.InserirBoleto(var Objeto: Variant): Boolean;
var
  Boleto      ,
  EmailSacado : Variant;
begin
  try
    Objeto.DocumentosCobranca.Clear;

    CdsTitulos.First;

    while not CdsTitulos.Eof do
    begin
      Boleto := Objeto.DocumentosCobranca.Add;

      Boleto.NumeroDocumento := FormatFloat('0000000000', CdsTitulosNUMLANC.AsInteger) + FormatFloat('000', CdsTitulosPARCELA.AsInteger);
      Boleto.NomeSacado      := Trim(CdsTitulosNOME.AsString);

      if Length(Trim(CdsTitulosCNPJ.AsString)) > 11 then
        Boleto.CNPJSacado := Trim(CdsTitulosCNPJ.AsString)
      else
        Boleto.CPFSacado  := Trim(CdsTitulosCNPJ.AsString);

      Boleto.EnderecoSacado := Trim(CdsTitulosENDER.AsString);
      Boleto.BairroSacado   := Trim(CdsTitulosBAIRRO.AsString);
      Boleto.CidadeSacado   := Trim(CdsTitulosCIDADE.AsString);
      Boleto.EstadoSacado   := Trim(CdsTitulosUF.AsString);
      Boleto.CepSacado      := Trim(CdsTitulosCEP.AsString);
      Boleto.DataDocumento  := FormatDateTime('dd/mm/yyyy', CdsTitulosDATAPROCESSOBOLETO.AsDateTime);

      if not CdsTitulosDTVENC.IsNull then
        Boleto.DataVencimento  := FormatDateTime('dd/mm/yyyy', CdsTitulosDTVENC.AsDateTime);

      Boleto.DataProcessamento := FormatDateTime('dd/mm/yyyy', CdsTitulosDATAPROCESSOBOLETO.AsDateTime);

      Boleto.ValorDocumento                := CdsTitulosVALORREC.AsFloat;
      Boleto.PercentualJurosDiaAtraso      := CdsTitulosPERCENTJUROS.AsFloat;
      Boleto.PercentualMultaAtraso         := CdsTitulosPERCENTMULTA.AsFloat;
      Boleto.PercentualDesconto            := CdsTitulosPERCENTDESCONTO.AsFloat;
      Boleto.ValorOutrosAcrescimos         := 0;
      Boleto.PadroesBoleto.Demonstrativo   := 'Referente a compra de produtos <br>e/ou a contratação de serviços';
      Boleto.PadroesBoleto.InstrucoesCaixa := '<br>Não receber pagamento após o vencimento.';

      EmailSacado          := Boleto.EnderecosEmailSacado.Add;
      EmailSacado.Nome     := Boleto.NomeSacado;
      EmailSacado.Endereco := Trim(CdsTitulosEMAIL.AsString);

      Boleto.ControleProcessamentoDocumento.Imprime      := scpExecutar;
      Boleto.ControleProcessamentoDocumento.EnviaEmail   := scpExecutar;
      Boleto.ControleProcessamentoDocumento.GravaRemessa := scpExecutar;

      Boleto.NossoNumero := CdsTitulosNOSSONUMERO.AsString;

      CdsTitulos.Next;
    end;

    Result := True;
  except
    On E : Exception do
    begin
      Application.MessageBox(PChar('Erro ao tentar inserir boleto no arquivo de remessa.' + #13 + E.Message), 'Erro', MB_ICONERROR);
      Result := False;
    end;
  end;
end;

procedure TfrmGrRemessaBoleto.GravarHistoricoRemessa;
var
  sSQL : TStringList;
begin
  try
    sSQL := TStringList.Create;
    
    if ( FileExists(edtArquivoRemessa.Text) ) then
    begin

      sSQL.BeginUpdate;
      sSQL.Clear;
      sSQL.Add( ' Update TBCONTREC Set ' );
      sSQL.Add( '     enviado = 1, remessa = ' + IbTblBancosBCO_SEQUENCIAL_REM.AsString );
      sSQL.Add( ' where codbanco = '   + IntToStr(cmbBanco.Tag) );
      sSQL.Add( '   and baixado  = 0' );
      sSQL.Add( '   and enviado  = 0' );
      sSQL.Add( '   and dataprocessoboleto between ' + QuotedStr(FormatDateTime('yyyy-mm-dd', datInicio.Date)) + ' and ' + QuotedStr(FormatDateTime('yyyy-mm-dd', datFinal.Date))) ;
      sSQL.EndUpdate;

      with UpdateLanc, SQL  do
      begin
        Clear;
        AddStrings( sSQL );
        ExecQuery;
      end;

      IbTblBancos.Edit;
      IbTblBancosBCO_SEQUENCIAL_REM.Value := IbTblBancosBCO_SEQUENCIAL_REM.AsInteger + 1;
      IbTblBancos.Post;

    end;
  finally
    sSQL.Free;
  end;
end;

procedure TfrmGrRemessaBoleto.frrRemessaGetValue(const VarName: String;
  var Value: Variant);
begin
  if ( VarName = 'Banco' ) then
    Value := cmbBanco.Text;
  if ( VarName = 'Arquivo' ) then
    Value := ExtractFileName(edtArquivoRemessa.Text);
end;

procedure TfrmGrRemessaBoleto.FormDestroy(Sender: TObject);
begin
  CobreBemX := Unassigned;
end;

end.
