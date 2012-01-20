unit UDMNFe;

interface

uses
  SysUtils, Classes, ACBrNFeDANFEClass, ACBrNFeDANFERave, ACBrNFe, DB,
  IBCustomDataSet, IBQuery, frxClass, frxDBSet, frxExportRTF, frxExportXLS,
  frxExportPDF, frxExportMail;

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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMNFe: TDMNFe;

implementation

uses UDMBusiness;

{$R *.dfm}

end.
