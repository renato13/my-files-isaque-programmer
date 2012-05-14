unit uGerRelCR;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, StdCtrls, ComCtrls, Buttons,
  ExtCtrls;

type
  TfrmGerRelCR = class(TForm)
    Label3: TLabel;
    rdgrpSerie: TRadioGroup;
    rdgrpStatus: TRadioGroup;
    Panel1: TPanel;
    BitBtn2: TBitBtn;
    btbtnGrupo: TBitBtn;
    rdgrpData: TRadioGroup;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    dttmpcIni: TDateTimePicker;
    dttmpcFim: TDateTimePicker;
    cmbbx: TComboBox;
    ibqryCli: TIBQuery;
    ibqryCliNOME: TIBStringField;
    procedure FormShow(Sender: TObject);
    procedure btbtnGrupoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGerRelCR: TfrmGerRelCR;

implementation

uses UDMBusiness, uRelCR;

{$R *.dfm}

procedure TfrmGerRelCR.FormShow(Sender: TObject);
begin
ibqryCli.Open;
while not ibqryCli.Eof do
  begin
   cmbbx.Items.Add(ibqryCliNOME.Value);
   ibqryCli.Next;
  end;
ibqryCli.Close;
end;

procedure TfrmGerRelCR.btbtnGrupoClick(Sender: TObject);
begin
Application.CreateForm(TfrmRelCR, frmRelCR);
// 1/6) Cliente - Por Data de Emissao - Todas as Duplicatas
if (rdgrpData.ItemIndex=0) and (rdgrpStatus.ItemIndex=0)
 then
  Begin
   with frmRelCR do
    begin
     IBQuery1.Close;
     IBQuery1.SQL.Clear;
     IBQuery1.SQL.Add('select R.DOCNF, R.DTEMISS, R.DTVENC, R.DTREC, C.NOME, R.PARC, R.TIPPAG, R.NUMLANC, R.DTREC, R.VALORREC');
     IBQuery1.SQL.Add('from TBCONTREC R, TBCLIENTE C');
     IBQuery1.SQL.Add('where (R.CNPJ = C.CNPJ)');
     IBQuery1.SQL.Add('and (C.NOME = :cli)');
     IBQuery1.SQL.Add('and (R.DTEMISS between :dataini and :datafim)');
     IBQuery1.SQL.Add('order by C.NOME, R.PARC');
     IBQuery1.ParamByName('cli').Value := cmbbx.Text;
     IBQuery1.ParamByName('dataini').value := DateToStr(dttmpcIni.Date);
     IBQuery1.ParamByName('datafim').value := DateToStr(dttmpcFim.Date);
     IBQuery1.Open;
     qrlblCliente.Caption := cmbbx.Text;
     qrlblPeriodo.Caption:= 'Data de Emissão: '+ DateToStr(dttmpcIni.Date) +' a '+ DateToStr(dttmpcFim.date);
     qrlblStatus.Caption := 'TODAS';
     qckrpCR.Preview;
    end;
  end

// 2/6)Cliente - Por Data de Vencimento - Todas as Duplicatas
else if (rdgrpData.ItemIndex=1) and (rdgrpStatus.ItemIndex=0)
 then
  Begin
   with frmRelCR do
    begin
     IBQuery1.Close;
     IBQuery1.SQL.Clear;
     IBQuery1.SQL.Add('select R.DOCNF, R.DTEMISS, R.DTVENC, R.DTREC, C.NOME, R.PARC, R.TIPPAG, R.NUMLANC, R.DTREC, R.VALORREC');
     IBQuery1.SQL.Add('from TBCONTREC R, TBCLIENTE C');
     IBQuery1.SQL.Add('where (R.CNPJ = C.CNPJ)');
     IBQuery1.SQL.Add('and (C.NOME = :cli)');
     IBQuery1.SQL.Add('and (R.DTVENC between :dataini and :datafim)');
     IBQuery1.SQL.Add('order by C.NOME, R.PARC');
     IBQuery1.ParamByName('cli').Value := cmbbx.Text;
     IBQuery1.ParamByName('dataini').value := DateToStr(dttmpcIni.Date);
     IBQuery1.ParamByName('datafim').value := DateToStr(dttmpcFim.Date);
     IBQuery1.Open;
     qrlblCliente.Caption := cmbbx.Text;
     qrlblPeriodo.Caption:= 'Data de Vencimento: '+ DateToStr(dttmpcIni.Date) +' a '+ DateToStr(dttmpcFim.date);
     qrlblStatus.Caption := 'TODAS';
     qckrpCR.Preview;
    end;
  end

// 3/6) Cliente - Por Data de Emissao - Duplicatas Quitadas
else if (rdgrpData.ItemIndex=0) and (rdgrpStatus.ItemIndex=1)
 then
  Begin
   with frmRelCR do
    begin
     IBQuery1.Close;
     IBQuery1.SQL.Clear;
     IBQuery1.SQL.Add('select R.DOCNF, R.DTEMISS, R.DTVENC, R.DTREC, C.NOME, R.PARC, R.TIPPAG, R.NUMLANC, R.DTREC, R.VALORREC');
     IBQuery1.SQL.Add('from TBCONTREC R, TBCLIENTE C');
     IBQuery1.SQL.Add('where (R.CNPJ = C.CNPJ)');
     IBQuery1.SQL.Add('and (C.NOME = :cli)');
     IBQuery1.SQL.Add('and (R.DTREC is not null)');
     IBQuery1.SQL.Add('and (R.DTEMISS between :dataini and :datafim)');
     IBQuery1.SQL.Add('order by C.NOME, R.PARC');
     IBQuery1.ParamByName('cli').Value := cmbbx.Text;
     IBQuery1.ParamByName('dataini').value := DateToStr(dttmpcIni.Date);
     IBQuery1.ParamByName('datafim').value := DateToStr(dttmpcFim.Date);
     IBQuery1.Open;
     qrlblCliente.Caption := cmbbx.Text;
     qrlblPeriodo.Caption:= 'Data de Emissão: '+ DateToStr(dttmpcIni.Date) +' a '+ DateToStr(dttmpcFim.date);
     //qrlblStatus.Caption := rdgrpStatus.Items.Strings[1];
     qrlblStatus.Caption := 'QUITADAS';
     qckrpCR.Preview;
    end;
  end

// 4/6) Cliente - Por Data de Emissao - Duplicatas Pendentes
else if (rdgrpData.ItemIndex=0) and (rdgrpStatus.ItemIndex=2)
 then
  Begin
   with frmRelCR do
    begin
     IBQuery1.Close;
     IBQuery1.SQL.Clear;
     IBQuery1.SQL.Add('select R.DOCNF, R.DTEMISS, R.DTVENC, R.DTREC, C.NOME, R.PARC, R.TIPPAG, R.NUMLANC, R.DTREC, R.VALORREC');
     IBQuery1.SQL.Add('from TBCONTREC R, TBCLIENTE C');
     IBQuery1.SQL.Add('where (R.CNPJ = C.CNPJ)');
     IBQuery1.SQL.Add('and (C.NOME = :cli)');
     IBQuery1.SQL.Add('and (R.DTREC is null)');
     IBQuery1.SQL.Add('and (R.DTEMISS between :dataini and :datafim)');
     IBQuery1.SQL.Add('order by C.NOME, R.PARC');
     IBQuery1.ParamByName('cli').Value := cmbbx.Text;
     IBQuery1.ParamByName('dataini').value := DateToStr(dttmpcIni.Date);
     IBQuery1.ParamByName('datafim').value := DateToStr(dttmpcFim.Date);
     IBQuery1.Open;
     qrlblCliente.Caption := cmbbx.Text;
     qrlblPeriodo.Caption:= 'Data de Emissão: '+ DateToStr(dttmpcIni.Date) +' a '+ DateToStr(dttmpcFim.date);
     qrlblStatus.Caption := 'PENDENTES';
     qckrpCR.Preview;
    end;
  end

// 5/6) Cliente - Por Data de Vencimento - Duplicatas Quitadas
else if (rdgrpData.ItemIndex=1) and (rdgrpStatus.ItemIndex=1)
 then
  Begin
   with frmRelCR do
    begin
     IBQuery1.Close;
     IBQuery1.SQL.Clear;
     IBQuery1.SQL.Add('select R.DOCNF, R.DTEMISS, R.DTVENC, R.DTREC,C.NOME, R.PARC, R.TIPPAG, R.NUMLANC, R.DTREC, R.VALORREC');
     IBQuery1.SQL.Add('from TBCONTREC R, TBCLIENTE C');
     IBQuery1.SQL.Add('where (R.CNPJ = C.CNPJ)');
     IBQuery1.SQL.Add('and (C.NOME = :cli)');
     IBQuery1.SQL.Add('and (R.DTREC is not null)');
     IBQuery1.SQL.Add('and (R.DTVENC between :dataini and :datafim)');
     IBQuery1.SQL.Add('order by C.NOME, R.PARC');
     IBQuery1.ParamByName('cli').Value := cmbbx.Text;
     IBQuery1.ParamByName('dataini').value := DateToStr(dttmpcIni.Date);
     IBQuery1.ParamByName('datafim').value := DateToStr(dttmpcFim.Date);
     IBQuery1.Open;
     qrlblCliente.Caption := cmbbx.Text;
     qrlblPeriodo.Caption:= 'Data de Vencimento: '+ DateToStr(dttmpcIni.Date) +' a '+ DateToStr(dttmpcFim.date);
     //qrlblStatus.Caption := rdgrpStatus.Items.Strings[1];
     qrlblStatus.Caption := 'QUITADAS';
     qckrpCR.Preview;
    end;
  end

// 6/6) Cliente - Por Data de Vencimento - Duplicatas Pendentes
else if (rdgrpData.ItemIndex=1) and (rdgrpStatus.ItemIndex=2)
 then
  Begin
   with frmRelCR do
    begin
     IBQuery1.Close;
     IBQuery1.SQL.Clear;
     IBQuery1.SQL.Add('select R.DOCNF, R.DTEMISS, R.DTVENC, R.DTREC, C.NOME, R.PARC, R.TIPPAG, R.NUMLANC, R.DTREC, R.VALORREC');
     IBQuery1.SQL.Add('from TBCONTREC R, TBCLIENTE C');
     IBQuery1.SQL.Add('where (R.CNPJ = C.CNPJ)');
     IBQuery1.SQL.Add('and (C.NOME = :cli)');
     IBQuery1.SQL.Add('and (R.DTREC is null)');
     IBQuery1.SQL.Add('and (R.DTVENC between :dataini and :datafim)');
     IBQuery1.SQL.Add('order by C.NOME, R.PARC');
     IBQuery1.ParamByName('cli').Value := cmbbx.Text;
     IBQuery1.ParamByName('dataini').value := DateToStr(dttmpcIni.Date);
     IBQuery1.ParamByName('datafim').value := DateToStr(dttmpcFim.Date);
     IBQuery1.Open;
     qrlblCliente.Caption := cmbbx.Text;
     qrlblPeriodo.Caption:= 'Data de Vencimento: '+ DateToStr(dttmpcIni.Date) +' a '+ DateToStr(dttmpcFim.date);
     //qrlblStatus.Caption := rdgrpStatus.Items.Strings[1];
     qrlblStatus.Caption := 'PENDENTES';
     qckrpCR.Preview;
    end;
  end;
frmRelCR.Destroy;

end;

procedure TfrmGerRelCR.FormCreate(Sender: TObject);
begin
 dttmpcIni.Date := IncMonth(Date, -1);
 dttmpcFim.Date := Date;
end;

end.
