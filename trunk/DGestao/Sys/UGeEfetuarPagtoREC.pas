unit UGeEfetuarPagtoREC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadrao, StdCtrls, Mask, DBCtrls, ExtCtrls, DB,
  IBCustomDataSet, IBUpdateSQL, IBTable, Buttons;

type
  TfrmGeEfetuarPagtoREC = class(TfrmGrPadrao)
    GrpBxDadosNominais: TGroupBox;
    Bevel1: TBevel;
    GroupBox1: TGroupBox;
    lblAnoLanc: TLabel;
    Label3: TLabel;
    lblCliente: TLabel;
    edAnoLanc: TEdit;
    edNumLanc: TEdit;
    edCliente: TEdit;
    Bevel2: TBevel;
    cdsPagamentos: TIBDataSet;
    cdsPagamentosANOLANC: TSmallintField;
    cdsPagamentosNUMLANC: TIntegerField;
    cdsPagamentosSEQ: TSmallintField;
    cdsPagamentosHISTORICO: TMemoField;
    cdsPagamentosDATA_PAGTO: TDateField;
    cdsPagamentosFORMA_PAGTO: TSmallintField;
    cdsPagamentosFORMA_PAGTO_DESC: TIBStringField;
    cdsPagamentosVALOR_BAIXA: TIBBCDField;
    cdsPagamentosNUMERO_CHEQUE: TIBStringField;
    cdsPagamentosBANCO: TSmallintField;
    cdsPagamentosBCO_NOME: TIBStringField;
    cdsPagamentosDOCUMENTO_BAIXA: TIBStringField;
    updPagamentos: TIBUpdateSQL;
    dtsPagamentos: TDataSource;
    tblBanco: TIBTable;
    dtsBanco: TDataSource;
    tblFormaPagto: TIBTable;
    dtsFormaPagto: TDataSource;
    lblDataPagto: TLabel;
    dbDataPagto: TDBEdit;
    dbValorPago: TDBEdit;
    lblValorPago: TLabel;
    lblFormaPagto: TLabel;
    dbFormaPagto: TDBLookupComboBox;
    lblDocBaixa: TLabel;
    dbDocBaixa: TDBEdit;
    lblNoCheque: TLabel;
    dbNoCheque: TDBEdit;
    lblBanco: TLabel;
    dbBanco: TDBLookupComboBox;
    lblHistorico: TLabel;
    dbHistorico: TDBMemo;
    btnConfirmar: TBitBtn;
    btnCancelar: TBitBtn;
    procedure dtsPagamentosStateChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure cdsPagamentosNewRecord(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGeEfetuarPagtoREC: TfrmGeEfetuarPagtoREC;

  function PagamentoConfirmado(const AOwner : TComponent; const Ano, Lancamento : Integer; const Cliente : String) : Boolean;

implementation

uses UDMBusiness;

{$R *.dfm}

function PagamentoConfirmado(const AOwner : TComponent; const Ano, Lancamento : Integer; const Cliente : String) : Boolean;
var
  frm : TfrmGeEfetuarPagtoREC;
begin
  frm := TfrmGeEfetuarPagtoREC.Create(AOwner);
  try

    with frm do
    begin
      edAnoLanc.Text := FormatFloat('0000', Ano);
      edNumLanc.Text := FormatFloat('###0000000', Lancamento);
      edCliente.Text := Cliente;

      cdsPagamentos.Close;

      with cdsPagamentos, SelectSQL do
      begin
        Add('where p.Anolanc = ' + IntToStr(Ano));
        Add('  and p.Numlanc = ' + IntToStr(Lancamento));
      end;

      cdsPagamentos.Open;
      cdsPagamentos.Append;

      Result := (ShowModal = mrOk);
    end;

  finally
    frm.Free;
  end;
end;

procedure TfrmGeEfetuarPagtoREC.dtsPagamentosStateChange(Sender: TObject);
begin
  inherited;
  dtsPagamentos.AutoEdit := ( cdsPagamentos.State in [dsEdit, dsInsert] );
end;

procedure TfrmGeEfetuarPagtoREC.FormCreate(Sender: TObject);
begin
  inherited;
  tblBanco.Open;
  tblFormaPagto.Open;
end;

procedure TfrmGeEfetuarPagtoREC.btnConfirmarClick(Sender: TObject);
begin
  inherited;
  if ( cdsPagamentos.State in [dsEdit, dsInsert] ) then
  begin
    if ( cdsPagamentosVALOR_BAIXA.AsCurrency <= 0 ) then
    begin
      ShowWarning('Favor informar o valor pago!');
      dbValorPago.SetFocus;
    end
    else
    if ( (UpperCase(dbFormaPagto.Text) = 'CHEQUE') and (Trim(cdsPagamentosNUMERO_CHEQUE.AsString) = EmptyStr) ) then
    begin
      ShowWarning('Favor informar o Número do Cheque!');
      dbNoCheque.SetFocus;
    end
    else
    if ( (Trim(cdsPagamentosNUMERO_CHEQUE.AsString) <> EmptyStr) and (cdsPagamentosBANCO.AsInteger = 0) ) then
    begin
      ShowWarning('Favor informar o Banco!');
      dbBanco.SetFocus;
    end
    else
    if ( ShowConfirm('Confirma a efetuação do pagamento?') ) then
    begin
      cdsPagamentosHISTORICO.AsString := UpperCase(cdsPagamentosHISTORICO.AsString);
      
      cdsPagamentos.Post;
      cdsPagamentos.ApplyUpdates;
      CommitTransaction;

      ModalResult := mrOk;
    end;
  end;
end;

procedure TfrmGeEfetuarPagtoREC.btnCancelarClick(Sender: TObject);
begin
  inherited;
  Self.Close;
end;

procedure TfrmGeEfetuarPagtoREC.cdsPagamentosNewRecord(DataSet: TDataSet);
begin
  inherited;
  cdsPagamentosANOLANC.Value    := StrToInt(edAnoLanc.Text);
  cdsPagamentosNUMLANC.Value    := StrToInt(edNumLanc.Text);
  cdsPagamentosSEQ.Value        := GetNextID('TBCONTREC_BAIXA', 'SEQ', 'where anolanc = ' + edAnoLanc.Text + ' and numlanc = ' + edNumLanc.Text);
  cdsPagamentosDATA_PAGTO.Value := Date;
  cdsPagamentosFORMA_PAGTO.Value      := GetFormaPagtoIDDefault;
  cdsPagamentosFORMA_PAGTO_DESC.Value := GetFormaPagtoNomeDefault;
end;

procedure TfrmGeEfetuarPagtoREC.FormShow(Sender: TObject);
begin
  inherited;
  if ( dtsPagamentos.AutoEdit ) then
    dbDataPagto.SetFocus;
end;

end.
