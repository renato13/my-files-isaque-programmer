unit UDMNFe;

interface

uses
  Windows, SysUtils, Classes, ACBrNFeDANFEClass, ACBrNFeDANFERave, ACBrNFe, DB,
  IBCustomDataSet, IBQuery, frxClass, frxDBSet, frxExportRTF, frxExportXLS,
  frxExportPDF, frxExportMail, UGeConfigurarNFeACBr,

  ACBrUtil, pcnConversao, pcnNFeW, pcnNFeRTXT, pcnAuxiliar, ACBrNFeUtil, SHDocVw,
  IBUpdateSQL;

type
  TDMNFe = class(TDataModule)
    ACBrNFe: TACBrNFe;
    rvDANFE: TACBrNFeDANFERave;
    qryEmitente: TIBQuery;
    qryEmitenteCODIGO: TIntegerField;
    qryEmitentePESSOA_FISICA: TSmallintField;
    qryEmitenteCNPJ: TIBStringField;
    qryEmitenteRZSOC: TIBStringField;
    qryEmitenteNMFANT: TIBStringField;
    qryEmitenteIE: TIBStringField;
    qryEmitenteIM: TIBStringField;
    qryEmitenteFONE: TIBStringField;
    qryEmitenteLOGO: TBlobField;
    qryEmitenteTLG_TIPO: TSmallintField;
    qryEmitenteTLG_DESCRICAO: TIBStringField;
    qryEmitenteTLG_SIGLA: TIBStringField;
    qryEmitenteLOG_COD: TIntegerField;
    qryEmitenteLOG_NOME: TIBStringField;
    qryEmitenteCOMPLEMENTO: TIBStringField;
    qryEmitenteNUMERO_END: TIBStringField;
    qryEmitenteCEP: TIBStringField;
    qryEmitenteBAI_COD: TIntegerField;
    qryEmitenteBAI_NOME: TIBStringField;
    qryEmitenteCID_COD: TIntegerField;
    qryEmitenteCID_NOME: TIBStringField;
    qryEmitenteCID_SIAFI: TIntegerField;
    qryEmitenteCID_IBGE: TIntegerField;
    qryEmitenteCID_DDD: TSmallintField;
    qryEmitenteEST_COD: TSmallintField;
    qryEmitenteEST_NOME: TIBStringField;
    qryEmitenteEST_SIGLA: TIBStringField;
    qryEmitenteEST_SIAFI: TIntegerField;
    qryEmitenteEMAIL: TIBStringField;
    qryEmitenteHOME_PAGE: TIBStringField;
    qryEmitenteCHAVE_ACESSO_NFE: TIBStringField;
    qryEmitentePAIS_ID: TIBStringField;
    qryEmitentePAIS_NOME: TIBStringField;
    qryDestinatario: TIBQuery;
    qryDestinatarioCODIGO: TIntegerField;
    qryDestinatarioPESSOA_FISICA: TSmallintField;
    qryDestinatarioCNPJ: TIBStringField;
    qryDestinatarioNOME: TIBStringField;
    qryDestinatarioINSCEST: TIBStringField;
    qryDestinatarioINSCMUN: TIBStringField;
    qryDestinatarioFONE: TIBStringField;
    qryDestinatarioEMAIL: TIBStringField;
    qryDestinatarioSITE: TIBStringField;
    qryDestinatarioTLG_TIPO: TSmallintField;
    qryDestinatarioTLG_DESCRICAO: TIBStringField;
    qryDestinatarioTLG_SIGLA: TIBStringField;
    qryDestinatarioLOG_COD: TIntegerField;
    qryDestinatarioLOG_NOME: TIBStringField;
    qryDestinatarioCOMPLEMENTO: TIBStringField;
    qryDestinatarioNUMERO_END: TIBStringField;
    qryDestinatarioCEP: TIBStringField;
    qryDestinatarioBAI_COD: TIntegerField;
    qryDestinatarioBAI_NOME: TIBStringField;
    qryDestinatarioCID_COD: TIntegerField;
    qryDestinatarioCID_NOME: TIBStringField;
    qryDestinatarioCID_SIAFI: TIntegerField;
    qryDestinatarioCID_IBGE: TIntegerField;
    qryDestinatarioCID_DDD: TSmallintField;
    qryDestinatarioEST_COD: TSmallintField;
    qryDestinatarioEST_NOME: TIBStringField;
    qryDestinatarioEST_SIGLA: TIBStringField;
    qryDestinatarioEST_SIAFI: TIntegerField;
    qryDestinatarioPAIS_ID: TIBStringField;
    qryDestinatarioPAIS_NOME: TIBStringField;
    qryDuplicatas: TIBQuery;
    qryDuplicatasANOLANC: TSmallintField;
    qryDuplicatasNUMLANC: TIntegerField;
    qryDuplicatasPARCELA: TSmallintField;
    qryDuplicatasDTEMISS: TDateField;
    qryDuplicatasDTVENC: TDateField;
    qryDuplicatasVALORREC: TIBBCDField;
    qryDuplicatasVALORMULTA: TIBBCDField;
    qryDuplicatasPERCENTDESCONTO: TIBBCDField;
    qryCalculoImporto: TIBQuery;
    qryDadosProduto: TIBQuery;
    frdEmpresa: TfrxDBDataset;
    frdCliente: TfrxDBDataset;
    frrVenda: TfrxReport;
    frdVenda: TfrxDBDataset;
    frdItens: TfrxDBDataset;
    frdTitulo: TfrxDBDataset;
    qryDadosProdutoANO: TSmallintField;
    qryDadosProdutoCODCONTROL: TIntegerField;
    qryDadosProdutoSEQ: TSmallintField;
    qryDadosProdutoCODPROD: TIBStringField;
    qryDadosProdutoDESCRI: TIBStringField;
    qryDadosProdutoREFERENCIA: TIBStringField;
    qryDadosProdutoCODEMP: TIBStringField;
    qryDadosProdutoCODCLI: TIBStringField;
    qryDadosProdutoDTVENDA: TDateTimeField;
    qryDadosProdutoQTDE: TIntegerField;
    qryDadosProdutoPUNIT: TIBBCDField;
    qryDadosProdutoDESCONTO: TIBBCDField;
    qryDadosProdutoPFINAL: TIBBCDField;
    qryDadosProdutoQTDEFINAL: TIntegerField;
    qryDadosProdutoUNID_COD: TSmallintField;
    qryDadosProdutoUNP_DESCRICAO: TIBStringField;
    qryDadosProdutoUNP_SIGLA: TIBStringField;
    qryDadosProdutoCFOP_COD: TIntegerField;
    qryDadosProdutoALIQUOTA: TIBBCDField;
    qryDadosProdutoVALOR_IPI: TIBBCDField;
    qryDadosProdutoESTOQUE: TIntegerField;
    qryDadosProdutoRESERVA: TIntegerField;
    qryDadosProdutoDISPONIVEL: TLargeintField;
    qryDadosProdutoTOTAL_BRUTO: TIBBCDField;
    qryDadosProdutoTOTAL_LIQUIDO: TIBBCDField;
    frxPDF: TfrxPDFExport;
    frxXLS: TfrxXLSExport;
    frxRTF: TfrxRTFExport;
    frxMailExport: TfrxMailExport;
    qryEmitenteTIPO_REGIME_NFE: TSmallintField;
    qryEmitenteSERIE_NFE: TSmallintField;
    qryEmitenteNUMERO_NFE: TIntegerField;
    qryDadosProdutoCODBARRA_EAN: TIBStringField;
    qryDadosProdutoNCM_SH: TIBStringField;
    qryDadosProdutoCODORIGEM: TIBStringField;
    qryDadosProdutoCODTRIBUTACAO: TIBStringField;
    qryDadosProdutoCST: TIBStringField;
    qryEmitenteLOTE_ANO_NFE: TSmallintField;
    qryEmitenteLOTE_NUM_NFE: TIntegerField;
    updEmitente: TIBUpdateSQL;
    updCalculoImporto: TIBUpdateSQL;
    qryCalculoImportoANO: TSmallintField;
    qryCalculoImportoCODCONTROL: TIntegerField;
    qryCalculoImportoCODEMP: TIBStringField;
    qryCalculoImportoCODCLI: TIBStringField;
    qryCalculoImportoDTVENDA: TDateTimeField;
    qryCalculoImportoSTATUS: TSmallintField;
    qryCalculoImportoDESCONTO: TIBBCDField;
    qryCalculoImportoTOTALVENDA: TIBBCDField;
    qryCalculoImportoTOTALVENDABRUTA: TIBBCDField;
    qryCalculoImportoDTFINALIZACAO_VENDA: TDateField;
    qryCalculoImportoOBS: TMemoField;
    qryCalculoImportoFORMAPAG: TIBStringField;
    qryCalculoImportoFATDIAS: TSmallintField;
    qryCalculoImportoSERIE: TIBStringField;
    qryCalculoImportoNFE: TLargeintField;
    qryCalculoImportoLOTE_NFE_ANO: TSmallintField;
    qryCalculoImportoLOTE_NFE_NUMERO: TIntegerField;
    qryCalculoImportoDATAEMISSAO: TDateField;
    qryCalculoImportoHORAEMISSAO: TTimeField;
    qryCalculoImportoCANCEL_DATAHORA: TDateTimeField;
    qryCalculoImportoCANCEL_MOTIVO: TMemoField;
    qryCalculoImportoCFOP: TIntegerField;
    qryCalculoImportoCFOP_DESCRICAO: TIBStringField;
    qryCalculoImportoVERIFICADOR_NFE: TIBStringField;
    qryCalculoImportoXML_NFE_FILENAME: TIBStringField;
    qryCalculoImportoXML_NFE: TMemoField;
    qryCalculoImportoVENDEDOR_COD: TIntegerField;
    qryCalculoImportoVENDEDOR_NOME: TIBStringField;
    qryCalculoImportoVENDEDOR_CPF: TIBStringField;
    qryCalculoImportoUSUARIO: TIBStringField;
    qryCalculoImportoFORMAPAGTO_COD: TSmallintField;
    qryCalculoImportoDESCRI: TIBStringField;
    qryCalculoImportoACRESCIMO: TFloatField;
    qryCalculoImportoCONDICAOPAGTO_COD: TSmallintField;
    qryCalculoImportoCOND_DESCRICAO: TIBStringField;
    qryCalculoImportoCOND_DESCRICAO_FULL: TIBStringField;
    qryCalculoImportoVENDA_PRAZO: TSmallintField;
    qryCalculoImportoPRAZO_01: TSmallintField;
    qryCalculoImportoPRAZO_02: TSmallintField;
    qryCalculoImportoPRAZO_03: TSmallintField;
    qryCalculoImportoPRAZO_04: TSmallintField;
    qryCalculoImportoPRAZO_05: TSmallintField;
    qryCalculoImportoPRAZO_06: TSmallintField;
    qryCalculoImportoPRAZO_07: TSmallintField;
    qryCalculoImportoPRAZO_08: TSmallintField;
    qryCalculoImportoPRAZO_09: TSmallintField;
    qryCalculoImportoPRAZO_10: TSmallintField;
    qryCalculoImportoPRAZO_11: TSmallintField;
    qryCalculoImportoPRAZO_12: TSmallintField;
    qryCalculoImportoNFE_VALOR_BASE_ICMS: TIBBCDField;
    qryCalculoImportoNFE_VALOR_ICMS: TIBBCDField;
    qryCalculoImportoNFE_VALOR_BASE_ICMS_SUBST: TIBBCDField;
    qryCalculoImportoNFE_VALOR_ICMS_SUBST: TIBBCDField;
    qryCalculoImportoNFE_VALOR_TOTAL_PRODUTO: TIBBCDField;
    qryCalculoImportoNFE_VALOR_FRETE: TIBBCDField;
    qryCalculoImportoNFE_VALOR_SEGURO: TIBBCDField;
    qryCalculoImportoNFE_VALOR_DESCONTO: TIBBCDField;
    qryCalculoImportoNFE_VALOR_TOTAL_II: TIBBCDField;
    qryCalculoImportoNFE_VALOR_TOTAL_IPI: TIBBCDField;
    qryCalculoImportoNFE_VALOR_PIS: TIBBCDField;
    qryCalculoImportoNFE_VALOR_COFINS: TIBBCDField;
    qryCalculoImportoNFE_VALOR_OUTROS: TIBBCDField;
    qryCalculoImportoNFE_VALOR_TOTAL_NOTA: TIBBCDField;
    qryCalculoImportoNFE_ENVIADA: TSmallintField;
    qryDadosProdutoCSOSN: TIBStringField;
    qryDadosProdutoALIQUOTA_CSOSN: TIBBCDField;
    qryDadosProdutoVALOR_DESCONTO: TIBBCDField;
    procedure SelecionarCertificado(Sender : TObject);
    procedure TestarServico(Sender : TObject);
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
    frmACBr : TfrmGeConfigurarNFeACBr;
    procedure UpdateNumeroNFe(const Serie, Numero : Integer);
    procedure UpdateLoteNFe(const Ano, Numero : Integer);
    procedure UpdateVendaNFe(const SerieNFE : Integer; const NumeroNFE : Int64; const DataHoraEmissao : TDateTime; const FileNameNFE : String); overload;
    procedure UpdateVendaNFe(const SerieNFE : Integer; const NumeroNFE : Int64; const DataHoraEmissao : TDateTime; const FileNameNFE, ChaveNFE : String; const AnoLoteNFE, NumeroLoteNFE : Integer); overload;

    procedure GerarNFEACBr(const sCNPJEmitente, sCNPJDestinatario : String; const iAnoVenda, iNumVenda : Integer;
      var DtHoraEmiss : TDateTime; var iSerieNFe, iNumeroNFe : Integer; var FileNameXML : String);
  public
    { Public declarations }
    property ConfigACBr : TfrmGeConfigurarNFeACBr read frmACBr write frmACBr;
    procedure LoadXML(MyMemo: TStringList; MyWebBrowser: TWebBrowser);

    procedure LerConfiguracao;
    procedure GravarConfiguracao;

    procedure AbrirEmitente(sCNPJ : String);
    procedure AbrirDestinatario(sCNPJ : String);
    procedure AbrirVenda(AnoVenda, NumeroVenda : Integer);

    function GerarNFeOnLine : Boolean;
    function GetInformacaoFisco : String;

    function GerarNFeOnLineACBr(const sCNPJEmitente, sCNPJDestinatario : String; const iAnoVenda, iNumVenda : Integer;
      const Imprimir : Boolean = TRUE) : Boolean;
    function GerarNFeOffLineACBr(const sCNPJEmitente, sCNPJDestinatario : String; const iAnoVenda, iNumVenda : Integer;
      const Imprimir : Boolean = TRUE) : Boolean;
    function CancelarNFeACBr(const sCNPJEmitente, sCNPJDestinatario : String; const iAnoVenda, iNumVenda : Integer; const Motivo : String) : Boolean;
    function ImprimirDANFEACBr(const sCNPJEmitente, sCNPJDestinatario : String; const iAnoVenda, iNumVenda : Integer; 
      const IsPDF : Boolean = FALSE) : Boolean;
  end;

var
  DMNFe: TDMNFe;

const
  SELDIRHELP   = 1000;
  FILENAME_NFE = 'Report\NotaFiscalEletronica.rav';

  procedure ConfigurarNFeACBr;

implementation

uses UDMBusiness, Forms, FileCtrl, ACBrNFeConfiguracoes,
  ACBrNFeNotasFiscais, ACBrNFeWebServices, StdCtrls, pcnNFe;

{$R *.dfm}

procedure ConfigurarNFeACBr;
var
 I : Integer;
begin
  try

    I := ID_ABORT;

    with DMNFe do
    begin

      if ( not Assigned(ConfigACBr) ) then
        ConfigACBr := TfrmGeConfigurarNFeACBr.Create(Application);

      LerConfiguracao;

      if ( not ConfigACBr.Showing ) then
        I := ConfigACBr.ShowModal;

      ConfigACBr.pgcGuias.ActivePageIndex := 0;

      if ( I = ID_OK ) then
      begin
        GravarConfiguracao;
        LerConfiguracao;
      end;

    end;

  finally
  end;
end;

procedure TDMNFe.AbrirEmitente(sCNPJ: String);
begin
  with qryEmitente do
  begin
    Close;
    ParamByName('Cnpj').AsString := sCNPJ;
    Open;

    if ( not qryEmitenteLOGO.IsNull ) then
      qryEmitenteLOGO.SaveToFile(ExtractFilePath(Application.ExeName) + sCNPJ + '.bmp');
  end;
end;

procedure TDMNFe.AbrirDestinatario(sCNPJ : String);
begin
  with qryDestinatario do
  begin
    Close;
    ParamByName('Cnpj').AsString := sCNPJ;
    Open;
  end;
end;

procedure TDMNFe.AbrirVenda(AnoVenda, NumeroVenda : Integer);
begin
  with qryCalculoImporto do
  begin
    Close;
    ParamByName('anovenda').AsInteger := AnoVenda;
    ParamByName('numvenda').AsInteger := NumeroVenda;
    Open;
  end;

  with qryDadosProduto do
  begin
    Close;
    ParamByName('anovenda').AsInteger := AnoVenda;
    ParamByName('numvenda').AsInteger := NumeroVenda;
    Open;
  end;

  with qryDuplicatas do
  begin
    Close;
    ParamByName('anovenda').AsInteger := AnoVenda;
    ParamByName('numvenda').AsInteger := NumeroVenda;
    Open;
  end;
end;

procedure TDMNFe.DataModuleCreate(Sender: TObject);
begin
  AbrirEmitente( GetEmpresaIDDefault );
  ConfigACBr := TfrmGeConfigurarNFeACBr.Create(Application);

  ConfigACBr.sbtnGetCert.OnClick := SelecionarCertificado;
  ConfigACBr.btnServico.OnClick  := TestarServico;

  LerConfiguracao;
end;

procedure TDMNFe.GravarConfiguracao;
Var
  StreamMemo : TMemoryStream;
begin
  try

    with ConfigACBr, FileINI do
    begin
      WriteString( 'Certificado', 'Caminho' , edtCaminho.Text) ;
      WriteString( 'Certificado', 'Senha'   , edtSenha.Text) ;
      WriteString( 'Certificado', 'NumSerie', edtNumSerie.Text) ;

      WriteInteger( 'Geral', 'DANFE'       , rgTipoDanfe.ItemIndex) ;
      WriteInteger( 'Geral', 'FormaEmissao', rgFormaEmissao.ItemIndex) ;
      WriteString ( 'Geral', 'LogoMarca'   , edtLogoMarca.Text) ;
      WriteBool   ( 'Geral', 'Salvar'      , ckSalvar.Checked) ;
      WriteString ( 'Geral', 'PathSalvar'  , edtPathLogs.Text) ;
      WriteInteger( 'Geral', 'ModoGerarNFe', rgModoGerarNFe.ItemIndex) ;

      WriteString ( 'WebService', 'UF'        ,cbUF.Text) ;
      WriteInteger( 'WebService', 'Ambiente'  ,rgTipoAmb.ItemIndex) ;
      WriteBool   ( 'WebService', 'Visualizar',ckVisualizar.Checked) ;

      WriteString( 'Proxy', 'Host'   , edtProxyHost.Text) ;
      WriteString( 'Proxy', 'Porta'  , edtProxyPorta.Text) ;
      WriteString( 'Proxy', 'User'   , edtProxyUser.Text) ;
      WriteString( 'Proxy', 'Pass'   , edtProxySenha.Text) ;

      WriteString( 'Emitente', 'CNPJ'       , edtEmitCNPJ.Text) ;
      WriteString( 'Emitente', 'IE'         , edtEmitIE.Text) ;
      WriteString( 'Emitente', 'RazaoSocial', edtEmitRazao.Text) ;
      WriteString( 'Emitente', 'Fantasia'   , edtEmitFantasia.Text) ;
      WriteString( 'Emitente', 'Fone'       , edtEmitFone.Text) ;
      WriteString( 'Emitente', 'CEP'        , edtEmitCEP.Text) ;
      WriteString( 'Emitente', 'Logradouro' , edtEmitLogradouro.Text) ;
      WriteString( 'Emitente', 'Numero'     , edtEmitNumero.Text) ;
      WriteString( 'Emitente', 'Complemento', edtEmitComp.Text) ;
      WriteString( 'Emitente', 'Bairro'     , edtEmitBairro.Text) ;
      WriteString( 'Emitente', 'CodCidade'  , edtEmitCodCidade.Text) ;
      WriteString( 'Emitente', 'Cidade'     , edtEmitCidade.Text) ;
      WriteString( 'Emitente', 'UF'         , edtEmitUF.Text) ;
      WriteString( 'Emitente', 'InfoFisco'  , edInfoFisco.Text) ;

      WriteString( 'Email', 'Host'    ,edtSmtpHost.Text) ;
      WriteString( 'Email', 'Port'    ,edtSmtpPort.Text) ;
      WriteString( 'Email', 'User'    ,edtSmtpUser.Text) ;
      WriteString( 'Email', 'Pass'    ,edtSmtpPass.Text) ;
      WriteString( 'Email', 'Assunto' ,edtEmailAssunto.Text) ;
      WriteBool(   'Email', 'SSL'     ,cbEmailSSL.Checked ) ;

      StreamMemo := TMemoryStream.Create;

      mmEmailMsg.Lines.SaveToStream(StreamMemo);
      StreamMemo.Seek(0,soFromBeginning);

      WriteBinaryStream( 'Email', 'Mensagem',StreamMemo) ;

      StreamMemo.Free;
    end;

  finally
  end;
end;

procedure TDMNFe.LerConfiguracao;
Var
  Ok : Boolean;
  StreamMemo : TMemoryStream;
  sFileNFE : String;
begin
  try

    with ConfigACBr, FileINI do
    begin

      {$IFDEF ACBrNFeOpenSSL}
         edtCaminho.Text  := ReadString( 'Certificado', 'Caminho' , '') ;
         edtSenha.Text    := ReadString( 'Certificado', 'Senha'   , '') ;
         ACBrNFe.Configuracoes.Certificados.Certificado  := edtCaminho.Text;
         ACBrNFe.Configuracoes.Certificados.Senha        := edtSenha.Text;
         edtNumSerie.Visible := False;
         Label25.Visible     := False;
         sbtnGetCert.Visible := False;
      {$ELSE}
         edtNumSerie.Text := ReadString( 'Certificado', 'NumSerie', '') ;
         ACBrNFe.Configuracoes.Certificados.NumeroSerie := edtNumSerie.Text;
         edtNumSerie.Text := ACBrNFe.Configuracoes.Certificados.NumeroSerie;
         lbltCaminho.Caption := 'Informe o número de série do certificado'#13+
                                'Disponível no Internet Explorer no menu'#13+
                                'Ferramentas - Opções da Internet - Conteúdo '#13+
                                'Certificados - Exibir - Detalhes - '#13+
                                'Número do certificado';
         lbltSenha.Visible  := False;
         edtCaminho.Visible := False;
         edtSenha.Visible   := False;
         sbtnCaminhoCert.Visible := False;
      {$ENDIF}

      rgFormaEmissao.ItemIndex := ReadInteger( 'Geral', 'FormaEmissao', 0) ;
      rgModoGerarNFe.ItemIndex := 1; // ReadInteger( 'Geral', 'ModoGerarNFe', 1) ;
      
      ckSalvar.Checked := ReadBool  ( 'Geral', 'Salvar'      ,True) ;
      edtPathLogs.Text := ReadString( 'Geral', 'PathSalvar'  ,'') ;

      ACBrNFe.Configuracoes.Geral.FormaEmissao := StrToTpEmis(OK, IntToStr(rgFormaEmissao.ItemIndex + 1));
      ACBrNFe.Configuracoes.Geral.Salvar       := ckSalvar.Checked;
      ACBrNFe.Configuracoes.Geral.PathSalvar   := edtPathLogs.Text;

      cbUF.ItemIndex       := cbUF.Items.IndexOf(ReadString( 'WebService','UF','SP')) ;
      rgTipoAmb.ItemIndex  := ReadInteger( 'WebService', 'Ambiente'  , 0) ;
      ckVisualizar.Checked := ReadBool   ( 'WebService', 'Visualizar', False) ;

      ACBrNFe.Configuracoes.WebServices.UF         := cbUF.Text;
      ACBrNFe.Configuracoes.WebServices.Ambiente   := StrToTpAmb(Ok,IntToStr(rgTipoAmb.ItemIndex + 1));
      ACBrNFe.Configuracoes.WebServices.Visualizar := ckVisualizar.Checked;

      edtProxyHost.Text  := ReadString( 'Proxy', 'Host'  , '') ;
      edtProxyPorta.Text := ReadString( 'Proxy', 'Porta' , '') ;
      edtProxyUser.Text  := ReadString( 'Proxy', 'User'  , '') ;
      edtProxySenha.Text := ReadString( 'Proxy', 'Pass'  , '') ;

      ACBrNFe.Configuracoes.WebServices.ProxyHost := edtProxyHost.Text;
      ACBrNFe.Configuracoes.WebServices.ProxyPort := edtProxyPorta.Text;
      ACBrNFe.Configuracoes.WebServices.ProxyUser := edtProxyUser.Text;
      ACBrNFe.Configuracoes.WebServices.ProxyPass := edtProxySenha.Text;

      rgTipoDanfe.ItemIndex := ReadInteger( 'Geral', 'DANFE'     , 0) ;
      edtLogoMarca.Text     := ReadString ( 'Geral', 'LogoMarca' , '') ;

      if ACBrNFe.DANFE <> nil then
      begin
        ACBrNFe.DANFE.TipoDANFE := StrToTpImp(OK, IntToStr(rgTipoDanfe.ItemIndex + 1));
        ACBrNFe.DANFE.Logo      := edtLogoMarca.Text;
      end;

      edtEmitCNPJ.Text       := ReadString( 'Emitente', 'CNPJ'       , '' ) ;
      edtEmitIE.Text         := ReadString( 'Emitente', 'IE'         , '' ) ;
      edtEmitRazao.Text      := ReadString( 'Emitente', 'RazaoSocial', '' ) ;
      edtEmitFantasia.Text   := ReadString( 'Emitente', 'Fantasia'   , '' ) ;
      edtEmitFone.Text       := ReadString( 'Emitente', 'Fone'       , '' ) ;
      edtEmitCEP.Text        := ReadString( 'Emitente', 'CEP'        , '' ) ;
      edtEmitLogradouro.Text := ReadString( 'Emitente', 'Logradouro' , '' ) ;
      edtEmitNumero.Text     := ReadString( 'Emitente', 'Numero'     , '' ) ;
      edtEmitComp.Text       := ReadString( 'Emitente', 'Complemento', '' ) ;
      edtEmitBairro.Text     := ReadString( 'Emitente', 'Bairro'     , '' ) ;
      edtEmitCodCidade.Text  := ReadString( 'Emitente', 'CodCidade'  , '' ) ;
      edtEmitCidade.Text     := ReadString( 'Emitente', 'Cidade'     , '' ) ;
      edtEmitUF.Text         := ReadString( 'Emitente', 'UF'         , '' ) ;
      edInfoFisco.Text       := ReadString( 'Emitente', 'InfoFisco'  , 'EMPRESA OPTANTE PELO SIMPLES DE ACORDO COM A LEI COMPLEMENTAR 123, DE DEZEMBRO DE 2006' ) ;

      edtSmtpHost.Text      := ReadString( 'Email', 'Host'   ,'') ;
      edtSmtpPort.Text      := ReadString( 'Email', 'Port'   ,'') ;
      edtSmtpUser.Text      := ReadString( 'Email', 'User'   ,'') ;
      edtSmtpPass.Text      := ReadString( 'Email', 'Pass'   ,'') ;
      edtEmailAssunto.Text  := ReadString( 'Email', 'Assunto','') ;
      cbEmailSSL.Checked    := ReadBool(   'Email', 'SSL'    ,False) ;

      StreamMemo := TMemoryStream.Create;

      ReadBinaryStream( 'Email', 'Mensagem', StreamMemo ) ;

      mmEmailMsg.Lines.LoadFromStream(StreamMemo);
      StreamMemo.Free;

      if ( (Trim(edtEmitCNPJ.Text) = EmptyStr) and (not qryEmitente.IsEmpty) ) then
      begin
        edtEmitCNPJ.Text       := qryEmitenteCNPJ.AsString;
        edtEmitIE.Text         := qryEmitenteIE.AsString;
        edtEmitRazao.Text      := qryEmitenteRZSOC.AsString;
        edtEmitFantasia.Text   := qryEmitenteNMFANT.AsString;
        edtEmitFone.Text       := qryEmitenteFONE.AsString;
        edtEmitCEP.Text        := qryEmitenteCEP.AsString;
        edtEmitLogradouro.Text := qryEmitenteTLG_SIGLA.AsString + ' ' + qryEmitenteLOG_NOME.AsString;
        edtEmitNumero.Text     := qryEmitenteNUMERO_END.AsString;
        edtEmitComp.Text       := qryEmitenteCOMPLEMENTO.AsString;
        edtEmitBairro.Text     := qryEmitenteBAI_NOME.AsString;
        edtEmitCodCidade.Text  := qryEmitenteCID_IBGE.AsString;
        edtEmitCidade.Text     := qryEmitenteCID_NOME.AsString;
        edtEmitUF.Text         := qryEmitenteEST_SIGLA.AsString;
      end;
    end;

    sFileNFE := ExtractFilePath(ParamStr(0)) + FILENAME_NFE;

    if ( not FileExists(sFileNFE) ) then
      ShowError( 'Arquivo ' + QuotedStr(sFileNFE) + ' não encontrado!' )
    else
      rvDANFE.RavFile := sFileNFE;
    
  finally
  end;
end;

procedure TDMNFe.SelecionarCertificado(Sender: TObject);
begin
  {$IFNDEF ACBrNFeOpenSSL}
  ConfigACBr.edtNumSerie.Text := ACBrNFe.Configuracoes.Certificados.SelecionarCertificado;
  {$ENDIF}
end;

procedure TDMNFe.TestarServico(Sender: TObject);
var
  memResp  ,
  memRespWS,
  memInfo : TStringList;
begin
  memResp   := TStringList.Create;
  memRespWS := TStringList.Create;
  memInfo   := TStringList.Create;
  try

    with ConfigACBr, ACBrNFe, memInfo do
    begin

      WebServices.StatusServico.Executar;

      memResp.Add  ( UTF8Encode(WebServices.StatusServico.RetWS) );
      memRespWS.Add( UTF8Encode(WebServices.StatusServico.RetornoWS) );

      LoadXML(memResp, WBResposta);

      Add('');
      Add('Status Serviço');
      Add('tpAmb : '    + TpAmbToStr(WebServices.StatusServico.tpAmb));
      Add('verAplic : ' + WebServices.StatusServico.verAplic);
      Add('cStat : '    + IntToStr(WebServices.StatusServico.cStat));
      Add('xMotivo : '  + WebServices.StatusServico.xMotivo);
      Add('cUF : '      + IntToStr(WebServices.StatusServico.cUF));
      Add('dhRecbto : ' + DateTimeToStr(WebServices.StatusServico.dhRecbto));
      Add('tMed : '     + IntToStr(WebServices.StatusServico.TMed));
      Add('dhRetorno : '+ DateTimeToStr(WebServices.StatusServico.dhRetorno));
      Add('xObs : '     + WebServices.StatusServico.xObs);
      Add('');

    end;

    ShowInformation( memInfo.Text );
  finally
    memResp.Free;
    memRespWS.Free;
    memInfo.Free;
  end;
end;

procedure TDMNFe.LoadXML(MyMemo: TStringList; MyWebBrowser: TWebBrowser);
begin
  MyMemo.SaveToFile( PathWithDelim(ExtractFileDir(application.ExeName))     + 'temp.xml' );
  MyWebBrowser.Navigate( PathWithDelim(ExtractFileDir(application.ExeName)) + 'temp.xml' );
end;

function TDMNFe.GerarNFeOnLine : Boolean;
begin
  Result := ( ConfigACBr.rgModoGerarNFe.ItemIndex = 1 );
end;

function TDMNFe.GetInformacaoFisco : String;
begin
  Result := ( ConfigACBr.edInfoFisco.Text );
end;

function TDMNFe.GerarNFeOnLineACBr(const sCNPJEmitente, sCNPJDestinatario : String; const iAnoVenda, iNumVenda: Integer;
  const Imprimir : Boolean = TRUE): Boolean;
var
  DtHoraEmiss : TDateTime;
  iSerieNFe,
  iNumeroNFe  : Integer;
  FileNameXML ,
  ChaveNFE    ,
  ProtocoloNFE,
  ReciboNFE   : String;
  NumeroLote  : Int64;
begin

  try

    GerarNFEACBr(sCNPJEmitente, sCNPJDestinatario, iAnoVenda, iNumVenda, DtHoraEmiss, iSerieNFe, iNumeroNFe, FileNameXML);

    NumeroLote := GetNextID('TBEMPRESA', 'LOTE_NUM_NFE', 'where CNPJ = ' + QuotedStr(sCNPJEmitente) + ' and LOTE_ANO_NFE = ' + qryEmitenteLOTE_ANO_NFE.AsString);

    Result := ACBrNFe.Enviar( NumeroLote );

    if ( Result ) then
    begin
      ChaveNFE     := ACBrNFe.WebServices.Retorno.ChaveNFe;
      ProtocoloNFE := ACBrNFe.WebServices.Retorno.Protocolo;
      ReciboNFE    := ACBrNFe.WebServices.Retorno.Recibo;

      UpdateVendaNFe(iSerieNFe, iNumeroNFe, DtHoraEmiss, FileNameXML, ChaveNFE, qryEmitenteLOTE_ANO_NFE.AsInteger, NumeroLote);
      UpdateLoteNFe (qryEmitenteLOTE_ANO_NFE.AsInteger, NumeroLote);

      if ( Imprimir ) then
        ACBrNFe.NotasFiscais.Imprimir;
    end;

  except
    On E : Exception do
    begin
      ShowError('Erro ao tentar gerar NF-e.' + #13#13 + 'GerarNFeOnLineACBr() --> ' + e.Message);
      Result := False;
    end;
  end;

end;

function TDMNFe.GerarNFeOffLineACBr(const sCNPJEmitente, sCNPJDestinatario : String; const iAnoVenda, iNumVenda : Integer;
  const Imprimir : Boolean = TRUE) : Boolean;
var
  DtHoraEmiss : TDateTime;
  iSerieNFe,
  iNumeroNFe  : Integer;
  FileNameXML ,
  ChaveNFE    : String;
begin

  try

    GerarNFEACBr(sCNPJEmitente, sCNPJDestinatario, iAnoVenda, iNumVenda, DtHoraEmiss, iSerieNFe, iNumeroNFe, FileNameXML);

    UpdateVendaNFe(iSerieNFe, iNumeroNFe, DtHoraEmiss, FileNameXML);

    Result := True;

    if ( Imprimir ) then
      ACBrNFe.NotasFiscais.Imprimir;
      
  except
    On E : Exception do
    begin
      ShowError('Erro ao tentar gerar NF-e.' + #13#13 + 'GerarNFeOffLineACBr() --> ' + e.Message);
      Result := False;
    end;
  end;

end;

function TDMNFe.CancelarNFeACBr(const sCNPJEmitente, sCNPJDestinatario : String; const iAnoVenda, iNumVenda : Integer; const Motivo : String) : Boolean;
var
  FileNameXML ,
  ChaveNFE    : String;
begin

  try

    AbrirEmitente( sCNPJEmitente );
    AbrirDestinatario( sCNPJDestinatario );
    AbrirVenda( iAnoVenda, iNumVenda );

    FileNameXML := ExtractFilePath( ParamStr(0) ) + qryCalculoImportoXML_NFE_FILENAME.AsString;

    ForceDirectories( ExtractFilePath(FileNameXML) );

    qryCalculoImportoXML_NFE.SaveToFile( FileNameXML );

    with ACBrNFe do
    begin
      NotasFiscais.Clear;
      NotasFiscais.LoadFromFile( FileNameXML );

      Result := Cancelamento( Motivo );
    end;

  except
    On E : Exception do
    begin
      ShowError('Erro ao tentar cancelar NF-e.' + #13#13 + 'CancelarNFeACBr() --> ' + e.Message);
      Result := False;
    end;
  end;

end;

function TDMNFe.ImprimirDANFEACBr(const sCNPJEmitente, sCNPJDestinatario : String; const iAnoVenda, iNumVenda : Integer; 
  const IsPDF : Boolean = FALSE) : Boolean;
var
  FileNameXML : String;
begin

  try

    AbrirEmitente( sCNPJEmitente );
    AbrirDestinatario( sCNPJDestinatario );
    AbrirVenda( iAnoVenda, iNumVenda );

    FileNameXML := ExtractFilePath( ParamStr(0) ) + qryCalculoImportoXML_NFE_FILENAME.AsString;

    ForceDirectories( ExtractFilePath(FileNameXML) );

    qryCalculoImportoXML_NFE.SaveToFile( FileNameXML );

    with ACBrNFe do
    begin
      NotasFiscais.Clear;
      NotasFiscais.LoadFromFile( FileNameXML );

      if NotasFiscais.Items[0].NFe.Ide.tpEmis = teDPEC then
      begin
       WebServices.ConsultaDPEC.NFeChave := NotasFiscais.Items[0].NFe.infNFe.ID;
       WebServices.ConsultaDPEC.Executar;

       DANFE.ProtocoloNFe := WebServices.ConsultaDPEC.nRegDPEC +' '+ DateTimeToStr(WebServices.ConsultaDPEC.dhRegDPEC);
      end;

      if ( IsPDF ) then
        NotasFiscais.ImprimirPDF
      else
        NotasFiscais.Imprimir;

      Result := True;
    end;

  except
    On E : Exception do
    begin
      ShowError('Erro ao tentar imprimir DANFE.' + #13#13 + 'ImprimirDANFEACBr() --> ' + e.Message);
      Result := False;
    end;
  end;

end;

procedure TDMNFe.UpdateLoteNFe(const Ano, Numero: Integer);
begin
  if ( qryEmitente.IsEmpty ) then
    Exit;

  with qryEmitente do
  begin
    Exit;
    qryEmitenteLOTE_ANO_NFE.AsInteger := Ano;
    qryEmitenteLOTE_NUM_NFE.AsInteger := Numero + 1;
    Post;
    ApplyUpdates;
    CommitTransaction;
  end;
end;

procedure TDMNFe.UpdateVendaNFe(const SerieNFE : Integer; const NumeroNFE : Int64; const DataHoraEmissao : TDateTime; const FileNameNFE : String);
begin
  if ( qryCalculoImporto.IsEmpty ) then
    Exit;

  with qryCalculoImporto do
  begin
    Edit;

    qryCalculoImportoSTATUS.Value   := STATUS_VND_NFE;
    qryCalculoImportoSERIE.AsString := FormatFloat('##00', SerieNFE);
    qryCalculoImportoNFE.Value      := NumeroNFE;
    qryCalculoImportoDATAEMISSAO.Value := StrToDate( FormatDateTime('dd/mm/yyyy', DataHoraEmissao) );
    qryCalculoImportoHORAEMISSAO.Value := StrToDate( FormatDateTime('hh:mm:ss',   DataHoraEmissao) );
    qryCalculoImportoNFE_ENVIADA.Value := 0;
    qryCalculoImportoXML_NFE_FILENAME.Value := ExtractFileName( FileNameNFE );
    qryCalculoImportoXML_NFE.LoadFromFile( FileNameNFE );

    Post;
    ApplyUpdates;
    CommitTransaction;
  end;
end;

procedure TDMNFe.UpdateVendaNFe(const SerieNFE : Integer; const NumeroNFE : Int64; const DataHoraEmissao : TDateTime;
  const FileNameNFE, ChaveNFE : String; const AnoLoteNFE, NumeroLoteNFE : Integer);
begin
  if ( qryCalculoImporto.IsEmpty ) then
    Exit;

  with qryCalculoImporto do
  begin
    Edit;

    qryCalculoImportoSTATUS.Value   := STATUS_VND_NFE;
    qryCalculoImportoSERIE.AsString := FormatFloat('##00', SerieNFE);
    qryCalculoImportoNFE.Value      := NumeroNFE;
    qryCalculoImportoDATAEMISSAO.Value := StrToDate( FormatDateTime('dd/mm/yyyy', DataHoraEmissao) );
    qryCalculoImportoHORAEMISSAO.Value := StrToDate( FormatDateTime('hh:mm:ss',   DataHoraEmissao) );
    qryCalculoImportoNFE_ENVIADA.Value := 1;
    qryCalculoImportoLOTE_NFE_ANO.Value    := AnoLoteNFE;
    qryCalculoImportoLOTE_NFE_NUMERO.Value := NumeroLoteNFE;
    qryCalculoImportoVERIFICADOR_NFE.Value := ChaveNFE;
    qryCalculoImportoXML_NFE_FILENAME.Value := ExtractFileName( FileNameNFE );
    qryCalculoImportoXML_NFE.LoadFromFile( FileNameNFE );

    Post;
    ApplyUpdates;
    CommitTransaction;
  end;
end;

procedure TDMNFe.UpdateNumeroNFe(const Serie, Numero: Integer);
begin
  if ( qryEmitente.IsEmpty ) then
    Exit;

  with qryEmitente do
  begin
    Exit;

    qryEmitenteSERIE_NFE.AsInteger  := Serie;
    qryEmitenteNUMERO_NFE.AsInteger := Numero + 1;

    Post;
    ApplyUpdates;
    CommitTransaction;
  end;
end;

procedure TDMNFe.GerarNFEACBr(const sCNPJEmitente, sCNPJDestinatario : String; const iAnoVenda, iNumVenda : Integer;
  var DtHoraEmiss : TDateTime; var iSerieNFe, iNumeroNFe : Integer; var FileNameXML : String);
begin

  try

    LerConfiguracao;

    AbrirEmitente( sCNPJEmitente );
    AbrirDestinatario( sCNPJDestinatario );
    AbrirVenda( iAnoVenda, iNumVenda );

    iSerieNFe   := qryEmitenteSERIE_NFE.AsInteger;
    iNumeroNFe  := GetNextID('TBEMPRESA', 'NUMERO_NFE',   'where CNPJ = ' + QuotedStr(sCNPJEmitente) + ' and SERIE_NFE = '    + qryEmitenteSERIE_NFE.AsString);
    DtHoraEmiss := GetDateTimeDB;

    with ACBrNFe.NotasFiscais.Add.NFe do
    begin
      Ide.cNF       := iNumeroNFe; // Caso não seja preenchido será gerado um número aleatório pelo componente
      Ide.natOp     := qryCalculoImportoCFOP_DESCRICAO.AsString;

      if ( qryCalculoImportoVENDA_PRAZO.AsInteger = 0 ) then
        Ide.indPag  := ipVista
      else
        Ide.indPag  := ipPrazo;

      Ide.modelo    := 55;
      Ide.serie     := iSerieNFe;
      Ide.nNF       := iNumeroNFe;
      Ide.dEmi      := StrToDate( FormatDateTime('dd/mm/yyyy', DtHoraEmiss) );
      Ide.dSaiEnt   := StrToDate( FormatDateTime('dd/mm/yyyy', DtHoraEmiss) );
      Ide.hSaiEnt   := DtHoraEmiss;
      Ide.tpNF      := tnSaida;
      Ide.tpEmis    := ACBrNFe.Configuracoes.Geral.FormaEmissao;
      Ide.tpAmb     := ACBrNFe.Configuracoes.WebServices.Ambiente;
      Ide.verProc   := GetExeVersion( ParamStr(0) ); // Versão do seu sistema
      Ide.cUF       := NotaUtil.UFtoCUF( qryEmitenteEST_SIGLA.AsString );
      Ide.cMunFG    := qryEmitenteCID_IBGE.AsInteger ;
      Ide.finNFe    := fnNormal;

  //     Ide.dhCont := date;
  //     Ide.xJust  := 'Justificativa Contingencia';

  //Para NFe referenciada use os campos abaixo
  {     with Ide.NFref.Add do
        begin
          refNFe       := ''; //NFe Eletronica

          RefNF.cUF    := 0;  // |
          RefNF.AAMM   := ''; // |
          RefNF.CNPJ   := ''; // |
          RefNF.modelo := 1;  // |- NFe Modelo 1/1A
          RefNF.serie  := 1;  // |
          RefNF.nNF    := 0;  // |

          RefNFP.cUF     := 0;  // |
          RefNFP.AAMM    := ''; // |
          RefNFP.CNPJCPF := ''; // |
          RefNFP.IE      := ''; // |- NF produtor Rural
          RefNFP.modelo  := ''; // |
          RefNFP.serie   := 1;  // |
          RefNFP.nNF     := 0;  // |

          RefECF.modelo  := ECFModRef2B; // |
          RefECF.nECF    := '';          // |- Cupom Fiscal
          RefECF.nCOO    := '';          // |
        end;
  }
      Emit.CNPJCPF           := qryEmitenteCNPJ.AsString;
      Emit.IE                := qryEmitenteIE.AsString;
      Emit.xNome             := qryEmitenteRZSOC.AsString;
      Emit.xFant             := qryEmitenteNMFANT.AsString;

      case qryEmitenteTIPO_REGIME_NFE.AsInteger of
        0 : Emit.CRT := crtSimplesNacional;
        1 : Emit.CRT := crtSimplesExcessoReceita;
        2 : Emit.CRT := crtRegimeNormal;
      end;

      Emit.EnderEmit.fone    := qryEmitenteFONE.AsString;
      Emit.EnderEmit.CEP     := StrToInt( qryEmitenteCEP.AsString );
      Emit.EnderEmit.xLgr    := Trim( qryEmitenteTLG_SIGLA.AsString + ' ' + qryEmitenteLOG_NOME.AsString );
      Emit.EnderEmit.nro     := qryEmitenteNUMERO_END.AsString;
      Emit.EnderEmit.xCpl    := qryEmitenteCOMPLEMENTO.AsString;
      Emit.EnderEmit.xBairro := qryEmitenteBAI_NOME.AsString;
      Emit.EnderEmit.cMun    := qryEmitenteCID_IBGE.AsInteger;
      Emit.EnderEmit.xMun    := qryEmitenteCID_NOME.AsString;
      Emit.EnderEmit.UF      := qryEmitenteEST_SIGLA.AsString;
      Emit.enderEmit.cPais   := qryEmitentePAIS_ID.AsInteger;
      Emit.enderEmit.xPais   := qryEmitentePAIS_NOME.AsString;

      Emit.IEST              := '';
      Emit.IM                := ''; // Preencher no caso de existir serviços na nota
      Emit.CNAE              := ''; // Verifique na cidade do emissor da NFe se é permitido
                                    // a inclusão de serviços na NFe

  //Para NFe Avulsa preencha os campos abaixo
  {      Avulsa.CNPJ    := '';
        Avulsa.xOrgao  := '';
        Avulsa.matr    := '';
        Avulsa.xAgente := '';
        Avulsa.fone    := '';
        Avulsa.UF      := '';
        Avulsa.nDAR    := '';
        Avulsa.dEmi    := now;
        Avulsa.vDAR    := 0;
        Avulsa.repEmi  := '';
        Avulsa.dPag    := now;             }

      Dest.CNPJCPF           := qryDestinatarioCNPJ.AsString; // FormatFloat('00000000000000', qryDestinatarioCNPJ.AsInteger);
      Dest.xNome             := qryDestinatarioNOME.AsString;

      if ( qryDestinatarioPESSOA_FISICA.AsInteger = 0 ) then
      begin
        Dest.IE              := qryDestinatarioINSCEST.AsString;
        Dest.ISUF            := EmptyStr;
      end
      else
      begin
        Dest.IE              := EmptyStr;
        Dest.ISUF            := EmptyStr;
      end;

      Dest.EnderDest.Fone    := qryDestinatarioFONE.AsString;
      Dest.EnderDest.CEP     := qryDestinatarioCEP.AsInteger;
      Dest.EnderDest.xLgr    := Trim( qryDestinatarioTLG_SIGLA.AsString + ' ' + qryDestinatarioLOG_NOME.AsString );
      Dest.EnderDest.nro     := qryDestinatarioNUMERO_END.AsString;
      Dest.EnderDest.xCpl    := qryDestinatarioCOMPLEMENTO.AsString;
      Dest.EnderDest.xBairro := qryDestinatarioBAI_NOME.AsString;
      Dest.EnderDest.cMun    := qryDestinatarioCID_IBGE.AsInteger;
      Dest.EnderDest.xMun    := qryDestinatarioCID_NOME.AsString;
      Dest.EnderDest.UF      := qryDestinatarioEST_SIGLA.AsString;
      Dest.EnderDest.cPais   := qryDestinatarioPAIS_ID.AsInteger;  // 1058;
      Dest.EnderDest.xPais   := qryDestinatarioPAIS_NOME.AsString; // 'BRASIL';

  //Use os campos abaixo para informar o endereço de retirada quando for diferente do Emitente
  {      Retirada.CNPJCPF := '';
        Retirada.xLgr    := '';
        Retirada.nro     := '';
        Retirada.xCpl    := '';
        Retirada.xBairro := '';
        Retirada.cMun    := 0;
        Retirada.xMun    := '';
        Retirada.UF      := '';}

  //Use os campos abaixo para informar o endereço de entrega quando for diferente do Remetente/Destinatário
  {      Entrega.CNPJCPF := '';
        Entrega.xLgr    := '';
        Entrega.nro     := '';
        Entrega.xCpl    := '';
        Entrega.xBairro := '';
        Entrega.cMun    := 0;
        Entrega.xMun    := '';
        Entrega.UF      := '';}

  //Adicionando Produtos
      qryDadosProduto.First;
      while not qryDadosProduto.Eof do
      begin

        with Det.Add do
        begin
          Prod.nItem    := qryDadosProdutoSEQ.AsInteger;   // Número sequencial, para cada item deve ser incrementado
          Prod.cProd    := qryDadosProdutoCODPROD.AsString;
          Prod.cEAN     := qryDadosProdutoCODBARRA_EAN.AsString;
          Prod.xProd    := qryDadosProdutoDESCRI.AsString;
          Prod.NCM      := qryDadosProdutoNCM_SH.AsString; // Tabela NCM disponível em  http://www.receita.fazenda.gov.br/Aliquotas/DownloadArqTIPI.htm
          Prod.EXTIPI   := '';
          Prod.CFOP     := qryDadosProdutoCFOP_COD.AsString;
          Prod.uCom     := qryDadosProdutoUNP_SIGLA.AsString;
          Prod.qCom     := qryDadosProdutoQTDE.AsCurrency;
          Prod.vUnCom   := qryDadosProdutoPUNIT.AsCurrency;
          Prod.vProd    := qryDadosProdutoPUNIT.AsCurrency;

          Prod.cEANTrib  := qryDadosProdutoCODBARRA_EAN.AsString;
          Prod.uTrib     := qryDadosProdutoUNP_SIGLA.AsString;
          Prod.qTrib     := qryDadosProdutoQTDE.AsCurrency;
          Prod.vUnTrib   := qryDadosProdutoPUNIT.AsCurrency;

          Prod.vFrete    := 0;
          Prod.vSeg      := 0;
          Prod.vDesc     := qryDadosProdutoVALOR_DESCONTO.AsCurrency;
          //Prod.vDesc     := qryDadosProdutoPUNIT.AsCurrency * qryDadosProdutoDESCONTO.AsFloat / 100;

          // Informação Adicional do Produto
          infAdProd      := 'Ref.: ' + qryDadosProdutoREFERENCIA.AsString;

  //Declaração de Importação. Pode ser adicionada várias através do comando Prod.DI.Add
  {         with Prod.DI.Add do
            begin
              nDi         := '';
              dDi         := now;
              xLocDesemb  := '';
              UFDesemb    := '';
              dDesemb     := now;
              cExportador := '';

              with adi.Add do
               begin
                 nAdicao     := 1;
                 nSeqAdi     := 1;
                 cFabricante := '';
                 vDescDI     := 0;
               end;
            end;
  }
  //Campos para venda de veículos novos
  {         with Prod.veicProd do
            begin
              tpOP    := toVendaConcessionaria;
              chassi  := '';
              cCor    := '';
              xCor    := '';
              pot     := '';
              Cilin   := '';
              pesoL   := '';
              pesoB   := '';
              nSerie  := '';
              tpComb  := '';
              nMotor  := '';
              CMT     := '';
              dist    := '';
              RENAVAM := '';
              anoMod  := 0;
              anoFab  := 0;
              tpPint  := '';
              tpVeic  := 0;
              espVeic := 0;
              VIN     := '';
              condVeic := cvAcabado;
              cMod    := '';
            end;
  }
  //Campos específicos para venda de medicamentos
  {         with Prod.med.Add do
            begin
              nLote := '';
              qLote := 0 ;
              dFab  := now ;
              dVal  := now ;
              vPMC  := 0 ;
            end;  }

  //Campos específicos para venda de armamento
  {         with Prod.arma.Add do
            begin
              nSerie := 0;
              tpArma := taUsoPermitido ;
              nCano  := 0 ;
              descr  := '' ;
            end;      }

  //Campos específicos para venda de combustível(distribuidoras)
  {         with Prod.comb do
            begin
              cProdANP := 0;
              CODIF    := '';
              qTemp    := 0;
              UFcons   := '';

              CIDE.qBCprod   := 0 ;
              CIDE.vAliqProd := 0 ;
              CIDE.vCIDE     := 0 ;

              ICMS.vBCICMS   := 0 ;
              ICMS.vICMS     := 0 ;
              ICMS.vBCICMSST := 0 ;
              ICMS.vICMSST   := 0 ;

              ICMSInter.vBCICMSSTDest := 0 ;
              ICMSInter.vICMSSTDest   := 0 ;

              ICMSCons.vBCICMSSTCons := 0 ;
              ICMSCons.vICMSSTCons   := 0 ;
              ICMSCons.UFcons        := '' ;
            end;}

          with Imposto do
          begin
            with ICMS do
            begin
              if ( Emit.CRT = crtSimplesNacional ) then
              begin

                // csosnVazio,csosn101, csosn102, csosn103, csosn201, csosn202, csosn203, csosn300, csosn400, csosn500, csosn900
                Case qryDadosProdutoCSOSN.AsInteger of
                  101 : CSOSN := csosn101;
                  102 : CSOSN := csosn102;
                  103 : CSOSN := csosn103;
                  201 : CSOSN := csosn201;
                  202 : CSOSN := csosn202;
                  203 : CSOSN := csosn203;
                  300 : CSOSN := csosn300;
                  400 : CSOSN := csosn400;
                  500 : CSOSN := csosn500;
                  else
                    CSOSN := csosn900;
                end;

                pCredSN     := qryDadosProdutoALIQUOTA_CSOSN.AsCurrency;
                vCredICMSSN := qryDadosProdutoPFINAL.AsCurrency * pCredSN / 100;

              end
              else
              begin

                Case qryDadosProdutoCODTRIBUTACAO.AsInteger of
                   0 : CST := cst00;
                  10 : CST := cst10;
                  20 : CST := cst20;
                  30 : CST := cst30;
                  40 : CST := cst40;
                  41 : CST := cst41;
                  50 : CST := cst50;
                  51 : CST := cst51;
                  60 : CST := cst60;
                  70 : CST := cst70;
                  else
                    CST := cst90;
                end;

                ICMS.modBC   := dbiValorOperacao;
                ICMS.vBC     := qryDadosProdutoPFINAL.AsCurrency;
                ICMS.pRedBC  := 0;
                ICMS.pICMS   := qryDadosProdutoALIQUOTA.AsCurrency;
                ICMS.vICMS   := qryDadosProdutoPFINAL.AsCurrency * ICMS.pICMS / 100;

              end;

              ICMS.orig    := TpcnOrigemMercadoria( qryDadosProdutoCODORIGEM.AsInteger );
              ICMS.modBCST := dbisMargemValorAgregado;
              ICMS.pMVAST  := 0;
              ICMS.pRedBCST:= 0;
              ICMS.vBCST   := 0;
              ICMS.pICMSST := 0;
              ICMS.vICMSST := 0;

            end;

            with PIS do
            begin
              if ( Emit.CRT = crtSimplesNacional ) then
              begin
                CST      := pis99;
                PIS.vBC  := 0;
                PIS.pPIS := 0;
                PIS.vPIS := 0;

                PIS.qBCProd   := 0;
                PIS.vAliqProd := 0;
                PIS.vPIS      := 0;
              end;
            end;

            with COFINS do
            begin
              if ( Emit.CRT = crtSimplesNacional ) then
              begin
                CST            := cof99;
                COFINS.vBC     := 0;
                COFINS.pCOFINS := 0;
                COFINS.vCOFINS := 0;

                COFINS.qBCProd   := 0;
                COFINS.vAliqProd := 0;
              end;
            end;

  {
            with IPI do
            begin
              CST      := ipi99 ;
              clEnq    := '999';
              CNPJProd := '';
              cSelo    := '';
              qSelo    := 0;
              cEnq     := '';

              vBC    := qryDadosProdutoPUNIT.AsCurrency;
              qUnid  := 0;
              vUnid  := 0;
              pIPI   := 0; // Percentual IPI
              vIPI   := 0; // Valor IPI
            end;

              with II do
               begin
                 vBc      := 0;
                 vDespAdu := 0;
                 vII      := 0;
                 vIOF     := 0;
               end;

              with PISST do
               begin
                 vBc       := 0;
                 pPis      := 0;
                 qBCProd   := 0;
                 vAliqProd := 0;
                 vPIS      := 0;
               end;

              with COFINSST do
               begin
                 vBC       := 0;
                 pCOFINS   := 0;
                 qBCProd   := 0;
                 vAliqProd := 0;
                 vCOFINS   := 0;
               end;
  }
  //Grupo para serviços
  {            with ISSQN do
               begin
                 vBC       := 0;
                 vAliq     := 0;
                 vISSQN    := 0;
                 cMunFG    := 0;
                 cListServ := 0; // Preencha este campo usando a tabela disponível
                                 // em http://www.planalto.gov.br/Ccivil_03/LEIS/LCP/Lcp116.htm
               end;}
          end;
        end ;

        qryDadosProduto.Next;
      end;

      Total.ICMSTot.vBC     := qryCalculoImportoNFE_VALOR_BASE_ICMS.AsCurrency;
      Total.ICMSTot.vICMS   := qryCalculoImportoNFE_VALOR_ICMS.AsCurrency;
      Total.ICMSTot.vBCST   := qryCalculoImportoNFE_VALOR_BASE_ICMS_SUBST.AsCurrency;
      Total.ICMSTot.vST     := qryCalculoImportoNFE_VALOR_ICMS_SUBST.AsCurrency;
      Total.ICMSTot.vProd   := qryCalculoImportoNFE_VALOR_TOTAL_PRODUTO.AsCurrency;
      Total.ICMSTot.vFrete  := qryCalculoImportoNFE_VALOR_FRETE.AsCurrency;
      Total.ICMSTot.vSeg    := qryCalculoImportoNFE_VALOR_SEGURO.AsCurrency;
      Total.ICMSTot.vDesc   := qryCalculoImportoNFE_VALOR_DESCONTO.AsCurrency;
      Total.ICMSTot.vII     := qryCalculoImportoNFE_VALOR_TOTAL_II.AsCurrency;
      Total.ICMSTot.vIPI    := qryCalculoImportoNFE_VALOR_TOTAL_IPI.AsCurrency;
      Total.ICMSTot.vPIS    := qryCalculoImportoNFE_VALOR_PIS.AsCurrency;
      Total.ICMSTot.vCOFINS := qryCalculoImportoNFE_VALOR_COFINS.AsCurrency;
      Total.ICMSTot.vOutro  := qryCalculoImportoNFE_VALOR_OUTROS.AsCurrency;
      Total.ICMSTot.vNF     := qryCalculoImportoNFE_VALOR_TOTAL_NOTA.AsCurrency;

  {      Total.ISSQNtot.vServ   := 0;
        Total.ISSQNTot.vBC     := 0;
        Total.ISSQNTot.vISS    := 0;
        Total.ISSQNTot.vPIS    := 0;
        Total.ISSQNTot.vCOFINS := 0;}

  {      Total.retTrib.vRetPIS    := 0;
        Total.retTrib.vRetCOFINS := 0;
        Total.retTrib.vRetCSLL   := 0;
        Total.retTrib.vBCIRRF    := 0;
        Total.retTrib.vIRRF      := 0;
        Total.retTrib.vBCRetPrev := 0;
        Total.retTrib.vRetPrev   := 0;}

      Transp.modFrete := mfContaEmitente;
      Transp.Transporta.CNPJCPF  := '';
      Transp.Transporta.xNome    := '';
      Transp.Transporta.IE       := '';
      Transp.Transporta.xEnder   := '';
      Transp.Transporta.xMun     := '';
      Transp.Transporta.UF       := '';

  {      Transp.retTransp.vServ    := 0;
        Transp.retTransp.vBCRet   := 0;
        Transp.retTransp.pICMSRet := 0;
        Transp.retTransp.vICMSRet := 0;
        Transp.retTransp.CFOP     := '';
        Transp.retTransp.cMunFG   := 0;         }

        Transp.veicTransp.placa := '';
        Transp.veicTransp.UF    := '';
        Transp.veicTransp.RNTC  := '';
  //Dados do Reboque
  {      with Transp.Reboque.Add do
         begin
           placa := '';
           UF    := '';
           RNTC  := '';
         end;}
                            
      if ( Transp.modFrete in [mfContaDestinatario, mfContaTerceiros] ) then
        with Transp.Vol.Add do
        begin
          qVol  := qryDadosProduto.RecordCount;
          esp   := 'Especie';
          marca := 'Marca';
          nVol  := 'Numero';
          pesoL := qryDadosProduto.RecordCount * 1;
          pesoB := qryDadosProduto.RecordCount * 0.1;

          //Lacres do volume. Pode ser adicionado vários
          //Lacres.Add.nLacre := '';
        end;

      Cobr.Fat.nFat  := FormatFloat('0000', qryCalculoImportoANO.AsInteger) + '/' + FormatFloat('0000000', qryCalculoImportoCODCONTROL.AsInteger);
      Cobr.Fat.vOrig := qryCalculoImportoTOTALVENDABRUTA.AsCurrency;
      Cobr.Fat.vDesc := qryCalculoImportoDESCONTO.AsCurrency ;
      Cobr.Fat.vLiq  := qryCalculoImportoTOTALVENDA.AsCurrency ;

      qryDuplicatas.First;
      while not qryDuplicatas.Eof do
      begin
        with Cobr.Dup.Add do
        begin
          nDup  := FormatFloat('0000', qryDuplicatasANOLANC.AsInteger) + '/' + FormatFloat('0000000', qryDuplicatasNUMLANC.AsInteger);
          dVenc := qryDuplicatasDTVENC.AsDateTime;
          vDup  := qryDuplicatasVALORREC.AsCurrency;
        end;

        qryDuplicatas.Next;
      end;

      InfAdic.infCpl     := #13 +
                            'Venda: ' + qryCalculoImportoANO.AsString + '/' + FormatFloat('###0000000', qryCalculoImportoCODCONTROL.AsInteger)  +
                            ' - Forma/Cond. Pgto.: ' + qryCalculoImportoFORMAPAG.AsString + '/' + qryCalculoImportoCOND_DESCRICAO_FULL.AsString + #13 +
                            'Vendedor: ' + qryCalculoImportoVENDEDOR_NOME.AsString + #13 +
                            'Obserações : ' + qryCalculoImportoOBS.AsString;

      InfAdic.infAdFisco := 'Info. Fisco: ' + GetInformacaoFisco;

  {
      with InfAdic.obsCont.Add do
      begin
        xCampo := 'ObsCont';
        xTexto := 'Info. Fisco: ' + GetInformacaoFisco;
      end;

      with InfAdic.obsCont.Add do
      begin
        xCampo := 'ObsCont';
        xTexto := 'Obserações da venda: ' + qryCalculoImportoOBS.AsString;
      end;

      with InfAdic.obsCont.Add do
      begin
        xCampo := 'ObsCont';
        xTexto := 'Venda: ' + qryCalculoImportoANO.AsString + '/' + FormatFloat('###0000000', qryCalculoImportoCODCONTROL.AsInteger) +
                  ' - Forma/Cond. Pgto.: ' + qryCalculoImportoFORMAPAG.AsString + '/' + qryCalculoImportoCOND_DESCRICAO_FULL.AsString;
      end;

      with InfAdic.obsCont.Add do
      begin
        xCampo := 'ObsCont';
        xTexto := 'Vendedor: ' + qryCalculoImportoVENDEDOR_NOME.AsString;
      end;

      with InfAdic.obsFisco.Add do
      begin
        xCampo := 'ObsFisco';
        xTexto := GetInformacaoFisco;
      end;

  //Processo referenciado
       with InfAdic.procRef.Add do
         begin
           nProc := '';
           indProc := ipSEFAZ;
         end;                 }

      exporta.UFembarq   := '';
      exporta.xLocEmbarq := '';

      compra.xNEmp := '';
      compra.xPed  := '';
      compra.xCont := '';

      ACBrNFe.NotasFiscais.Assinar;
      ACBrNFe.NotasFiscais.Valida;
      ACBrNFe.NotasFiscais.GerarNFe;
      
      ACBrNFe.NotasFiscais.Items[0].SaveToFile;

      FileNameXML := ACBrNFe.NotasFiscais.Items[0].NomeArq;
    end;

  except
    On E : Exception do
      ShowError('Erro ao tentar gerar NF-e.' + #13#13 + 'GerarNFEACBr() --> ' + e.Message);
  end;

end;

end.
