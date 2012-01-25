unit UDMNFe;

interface

uses
  Windows, SysUtils, Classes, ACBrNFeDANFEClass, ACBrNFeDANFERave, ACBrNFe, DB,
  IBCustomDataSet, IBQuery, frxClass, frxDBSet, frxExportRTF, frxExportXLS,
  frxExportPDF, frxExportMail, UGeConfigurarNFeACBr,

  ACBrUtil, pcnConversao, pcnNFeW, pcnNFeRTXT, pcnAuxiliar, SHDocVw;

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
    qryCalculoImportoDATAEMISSAO: TDateField;
    qryCalculoImportoHORAEMISSAO: TTimeField;
    qryCalculoImportoCFOP: TIntegerField;
    qryCalculoImportoCFOP_DESCRICAO: TIBStringField;
    qryCalculoImportoVERIFICADOR_NFE: TIBStringField;
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
    procedure SelecionarCertificado(Sender : TObject);
    procedure TestarServico(Sender : TObject);
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
    frmACBr : TfrmGeConfigurarNFeACBr;
  public
    { Public declarations }
    property ConfigACBr : TfrmGeConfigurarNFeACBr read frmACBr write frmACBr;
    procedure LoadXML(MyMemo: TStringList; MyWebBrowser: TWebBrowser);

    procedure LerConfiguracao;
    procedure GravarConfiguracao;

    procedure AbrirEmitente(sCNPJ : String);
  end;

var
  DMNFe: TDMNFe;
  
const
  SELDIRHELP = 1000;

  procedure ConfigurarNFeACBr;

implementation

uses UDMBusiness, Forms, FileCtrl;

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
      WriteString( 'Certificado', 'Caminho' ,edtCaminho.Text) ;
      WriteString( 'Certificado', 'Senha'   ,edtSenha.Text) ;
      WriteString( 'Certificado', 'NumSerie',edtNumSerie.Text) ;

      WriteInteger( 'Geral', 'DANFE'       ,rgTipoDanfe.ItemIndex) ;
      WriteInteger( 'Geral', 'FormaEmissao',rgFormaEmissao.ItemIndex) ;
      WriteString( 'Geral', 'LogoMarca'   ,edtLogoMarca.Text) ;
      WriteBool(   'Geral', 'Salvar'      ,ckSalvar.Checked) ;
      WriteString( 'Geral', 'PathSalvar'  ,edtPathLogs.Text) ;

      WriteString ( 'WebService', 'UF'        ,cbUF.Text) ;
      WriteInteger( 'WebService', 'Ambiente'  ,rgTipoAmb.ItemIndex) ;
      WriteBool   ( 'WebService', 'Visualizar',ckVisualizar.Checked) ;

      WriteString( 'Proxy', 'Host'   ,edtProxyHost.Text) ;
      WriteString( 'Proxy', 'Porta'  ,edtProxyPorta.Text) ;
      WriteString( 'Proxy', 'User'   ,edtProxyUser.Text) ;
      WriteString( 'Proxy', 'Pass'   ,edtProxySenha.Text) ;

      WriteString( 'Emitente', 'CNPJ'       ,edtEmitCNPJ.Text) ;
      WriteString( 'Emitente', 'IE'         ,edtEmitIE.Text) ;
      WriteString( 'Emitente', 'RazaoSocial',edtEmitRazao.Text) ;
      WriteString( 'Emitente', 'Fantasia'   ,edtEmitFantasia.Text) ;
      WriteString( 'Emitente', 'Fone'       ,edtEmitFone.Text) ;
      WriteString( 'Emitente', 'CEP'        ,edtEmitCEP.Text) ;
      WriteString( 'Emitente', 'Logradouro' ,edtEmitLogradouro.Text) ;
      WriteString( 'Emitente', 'Numero'     ,edtEmitNumero.Text) ;
      WriteString( 'Emitente', 'Complemento',edtEmitComp.Text) ;
      WriteString( 'Emitente', 'Bairro'     ,edtEmitBairro.Text) ;
      WriteString( 'Emitente', 'CodCidade'  ,edtEmitCodCidade.Text) ;
      WriteString( 'Emitente', 'Cidade'     ,edtEmitCidade.Text) ;
      WriteString( 'Emitente', 'UF'         ,edtEmitUF.Text) ;

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
begin
  try

    with ConfigACBr, FileINI do
    begin

      {$IFDEF ACBrNFeOpenSSL}
         edtCaminho.Text  := ReadString( 'Certificado','Caminho' ,'') ;
         edtSenha.Text    := ReadString( 'Certificado','Senha'   ,'') ;
         ACBrNFe.Configuracoes.Certificados.Certificado  := edtCaminho.Text;
         ACBrNFe.Configuracoes.Certificados.Senha        := edtSenha.Text;
         edtNumSerie.Visible := False;
         Label25.Visible     := False;
         sbtnGetCert.Visible := False;
      {$ELSE}
         edtNumSerie.Text := ReadString( 'Certificado','NumSerie','') ;
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

      rgFormaEmissao.ItemIndex := ReadInteger( 'Geral','FormaEmissao',0) ;
      ckSalvar.Checked    := ReadBool  ( 'Geral', 'Salvar'      ,True) ;
      edtPathLogs.Text    := ReadString( 'Geral', 'PathSalvar'  ,'') ;

      ACBrNFe.Configuracoes.Geral.FormaEmissao := StrToTpEmis(OK, IntToStr(rgFormaEmissao.ItemIndex + 1));
      ACBrNFe.Configuracoes.Geral.Salvar       := ckSalvar.Checked;
      ACBrNFe.Configuracoes.Geral.PathSalvar   := edtPathLogs.Text;

      cbUF.ItemIndex       := cbUF.Items.IndexOf(ReadString( 'WebService','UF','SP')) ;
      rgTipoAmb.ItemIndex  := ReadInteger( 'WebService', 'Ambiente'  ,0) ;
      ckVisualizar.Checked := ReadBool    ( 'WebService', 'Visualizar',False) ;

      ACBrNFe.Configuracoes.WebServices.UF         := cbUF.Text;
      ACBrNFe.Configuracoes.WebServices.Ambiente   := StrToTpAmb(Ok,IntToStr(rgTipoAmb.ItemIndex + 1));
      ACBrNFe.Configuracoes.WebServices.Visualizar := ckVisualizar.Checked;

      edtProxyHost.Text  := ReadString( 'Proxy', 'Host'   ,'') ;
      edtProxyPorta.Text := ReadString( 'Proxy', 'Porta'  ,'') ;
      edtProxyUser.Text  := ReadString( 'Proxy', 'User'   ,'') ;
      edtProxySenha.Text := ReadString( 'Proxy', 'Pass'   ,'') ;

      ACBrNFe.Configuracoes.WebServices.ProxyHost := edtProxyHost.Text;
      ACBrNFe.Configuracoes.WebServices.ProxyPort := edtProxyPorta.Text;
      ACBrNFe.Configuracoes.WebServices.ProxyUser := edtProxyUser.Text;
      ACBrNFe.Configuracoes.WebServices.ProxyPass := edtProxySenha.Text;

      rgTipoDanfe.ItemIndex := ReadInteger( 'Geral', 'DANFE'       ,0) ;
      edtLogoMarca.Text     := ReadString ( 'Geral', 'LogoMarca'   ,'') ;

      if ACBrNFe.DANFE <> nil then
      begin
        ACBrNFe.DANFE.TipoDANFE := StrToTpImp(OK,IntToStr(rgTipoDanfe.ItemIndex+1));
        ACBrNFe.DANFE.Logo      := edtLogoMarca.Text;
      end;

      edtEmitCNPJ.Text       := ReadString( 'Emitente', 'CNPJ'       ,'') ;
      edtEmitIE.Text         := ReadString( 'Emitente', 'IE'         ,'') ;
      edtEmitRazao.Text      := ReadString( 'Emitente', 'RazaoSocial','') ;
      edtEmitFantasia.Text   := ReadString( 'Emitente', 'Fantasia'   ,'') ;
      edtEmitFone.Text       := ReadString( 'Emitente', 'Fone'       ,'') ;
      edtEmitCEP.Text        := ReadString( 'Emitente', 'CEP'        ,'') ;
      edtEmitLogradouro.Text := ReadString( 'Emitente', 'Logradouro' ,'') ;
      edtEmitNumero.Text     := ReadString( 'Emitente', 'Numero'     ,'') ;
      edtEmitComp.Text       := ReadString( 'Emitente', 'Complemento','') ;
      edtEmitBairro.Text     := ReadString( 'Emitente', 'Bairro'     ,'') ;
      edtEmitCodCidade.Text  := ReadString( 'Emitente', 'CodCidade'  ,'') ;
      edtEmitCidade.Text     := ReadString( 'Emitente', 'Cidade'     ,'') ;
      edtEmitUF.Text         := ReadString( 'Emitente', 'UF'         ,'') ;

      edtSmtpHost.Text      := ReadString( 'Email', 'Host'   ,'') ;
      edtSmtpPort.Text      := ReadString( 'Email', 'Port'   ,'') ;
      edtSmtpUser.Text      := ReadString( 'Email', 'User'   ,'') ;
      edtSmtpPass.Text      := ReadString( 'Email', 'Pass'   ,'') ;
      edtEmailAssunto.Text  := ReadString( 'Email', 'Assunto','') ;
      cbEmailSSL.Checked    := ReadBool(   'Email', 'SSL'    ,False) ;

      StreamMemo := TMemoryStream.Create;

      ReadBinaryStream( 'Email', 'Mensagem',StreamMemo) ;

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

    end;

    ShowInformation( '' );
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

end.
