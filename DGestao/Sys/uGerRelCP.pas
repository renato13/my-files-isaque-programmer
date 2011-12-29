unit uGerRelCP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, StdCtrls, ComCtrls, Buttons,
  ExtCtrls;

type
  TfrmGerRelCP = class(TForm)
    Label3: TLabel;
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
    procedure btbtnGrupoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGerRelCP: TfrmGerRelCP;

implementation

uses uRelCP;

{$R *.dfm}

procedure TfrmGerRelCP.btbtnGrupoClick(Sender: TObject);
begin
Application.CreateForm(TfrmRelCP, frmRelCP);
// 1/6) Por Data de Emissao - Todas as Duplicatas
if (rdgrpData.ItemIndex=0) and (rdgrpStatus.ItemIndex=0)
 then
  Begin
   with frmRelCP do
    begin
     IBQuery1.Close;
     IBQuery1.SQL.Clear;
     IBQuery1.SQL.Add('select F.NOMEFORN, P.DTEMISS, P.DTPAG, P.DTVENC, P.HISTORIC, P.NUMLANC, P.VALORPAG, P.TIPPAG');
     IBQuery1.SQL.Add('from TBCONTPAG P, TBFORNECEDOR F');
     IBQuery1.SQL.Add('where (P.CODFORN = F.CODFORN)');
     IBQuery1.SQL.Add('and (P.DTEMISS between :dataini and :datafim)');
     IBQuery1.SQL.Add('order by F.NOMEFORN, P.DTEMISS');
     IBQuery1.ParamByName('dataini').value := DateToStr(dttmpcIni.Date);
     IBQuery1.ParamByName('datafim').value := DateToStr(dttmpcFim.Date);
     IBQuery1.Open;
     qrlblPeriodo.Caption:= 'Data de Emissão: '+ DateToStr(dttmpcIni.Date) +' a '+ DateToStr(dttmpcFim.date);
     qrlblStatus.Caption := 'TODAS';
     qckrpCP.Preview;
    end;
  end

// 2/6)Por Data de Vencimento - Todas as Duplicatas
else if (rdgrpData.ItemIndex=1) and (rdgrpStatus.ItemIndex=0)
 then
  Begin
   with frmRelCP do
    begin
     IBQuery1.Close;
     IBQuery1.SQL.Clear;
     IBQuery1.SQL.Add('select F.NOMEFORN, P.DTEMISS, P.DTPAG, P.DTVENC, P.HISTORIC, P.NUMLANC, P.VALORPAG, P.TIPPAG');
     IBQuery1.SQL.Add('from TBCONTPAG P, TBFORNECEDOR F');
     IBQuery1.SQL.Add('where (P.CODFORN = F.CODFORN)');
     IBQuery1.SQL.Add('and (P.DTVENC between :dataini and :datafim)');
     IBQuery1.SQL.Add('order by F.NOMEFORN, P.DTVENC');
     IBQuery1.ParamByName('dataini').value := DateToStr(dttmpcIni.Date);
     IBQuery1.ParamByName('datafim').value := DateToStr(dttmpcFim.Date);
     IBQuery1.Open;
     qrlblPeriodo.Caption:= 'Data de Vencimento: '+ DateToStr(dttmpcIni.Date) +' a '+ DateToStr(dttmpcFim.date);
     qrlblStatus.Caption := 'TODAS';
     qckrpCP.Preview;
    end;
  end

// 3/6)Por Data de Emissao - Duplicatas Quitadas
else if (rdgrpData.ItemIndex=0) and (rdgrpStatus.ItemIndex=1)
 then
  Begin
   with frmRelCP do
    begin
     IBQuery1.Close;
     IBQuery1.SQL.Clear;
     IBQuery1.SQL.Add('select F.NOMEFORN, P.DTEMISS, P.DTPAG, P.DTVENC, P.HISTORIC, P.NUMLANC, P.VALORPAG, P.TIPPAG');
     IBQuery1.SQL.Add('from TBCONTPAG P, TBFORNECEDOR F');
     IBQuery1.SQL.Add('where (P.CODFORN = F.CODFORN)');
     IBQuery1.SQL.Add('and (P.DTPAG is not null)');
     IBQuery1.SQL.Add('and (P.DTEMISS between :dataini and :datafim)');
     IBQuery1.SQL.Add('order by F.NOMEFORN, P.DTEMISS, P.DTPAG');
     IBQuery1.ParamByName('dataini').value := DateToStr(dttmpcIni.Date);
     IBQuery1.ParamByName('datafim').value := DateToStr(dttmpcFim.Date);
     IBQuery1.Open;
     qrlblPeriodo.Caption:= 'Data de Emissão: '+ DateToStr(dttmpcIni.Date) +' a '+ DateToStr(dttmpcFim.date);
     //qrlblStatus.Caption := rdgrpStatus.Items.Strings[1];
     qrlblStatus.Caption := 'QUITADAS';
     qckrpCP.Preview;
    end;
  end

// 4/6) Por Data de Emissao - Duplicatas Pendentes
else if (rdgrpData.ItemIndex=0) and (rdgrpStatus.ItemIndex=2)
 then
  Begin
   with frmRelCP do
    begin
     IBQuery1.Close;
     IBQuery1.SQL.Clear;
     IBQuery1.SQL.Add('select F.NOMEFORN, P.DTEMISS, P.DTPAG, P.DTVENC, P.HISTORIC, P.NUMLANC, P.VALORPAG, P.TIPPAG');
     IBQuery1.SQL.Add('from TBCONTPAG P, TBFORNECEDOR F');
     IBQuery1.SQL.Add('where (P.CODFORN = F.CODFORN)');
     IBQuery1.SQL.Add('and (P.DTPAG is null)');
     IBQuery1.SQL.Add('and (P.DTEMISS between :dataini and :datafim)');
     IBQuery1.SQL.Add('order by F.NOMEFORN, P.DTEMISS');
     IBQuery1.ParamByName('dataini').value := DateToStr(dttmpcIni.Date);
     IBQuery1.ParamByName('datafim').value := DateToStr(dttmpcFim.Date);
     IBQuery1.Open;
     qrlblPeriodo.Caption:= 'Data de Emissão: '+ DateToStr(dttmpcIni.Date) +' a '+ DateToStr(dttmpcFim.date);
     qrlblStatus.Caption := 'PENDENTES';
     qckrpCP.Preview;
    end;
  end

// 5/6) Por Data de Vencimento - Duplicatas Quitadas
else if (rdgrpData.ItemIndex=1) and (rdgrpStatus.ItemIndex=1)
 then
  Begin
   with frmRelCP do
    begin
     IBQuery1.Close;
     IBQuery1.SQL.Clear;
     IBQuery1.SQL.Add('select F.NOMEFORN, P.DTEMISS, P.DTPAG, P.DTVENC, P.HISTORIC, P.NUMLANC, P.VALORPAG, P.TIPPAG');
     IBQuery1.SQL.Add('from TBCONTPAG P, TBFORNECEDOR F');
     IBQuery1.SQL.Add('where (P.CODFORN = F.CODFORN)');
     IBQuery1.SQL.Add('and (P.DTPAG is not null)');
     IBQuery1.SQL.Add('and (P.DTVENC between :dataini and :datafim)');
     IBQuery1.SQL.Add('order by F.NOMEFORN, P.DTVENC, P.DTPAG');
     IBQuery1.ParamByName('dataini').value := DateToStr(dttmpcIni.Date);
     IBQuery1.ParamByName('datafim').value := DateToStr(dttmpcFim.Date);
     IBQuery1.Open;
     qrlblPeriodo.Caption:= 'Data de Vencimento: '+ DateToStr(dttmpcIni.Date) +' a '+ DateToStr(dttmpcFim.date);
     //qrlblStatus.Caption := rdgrpStatus.Items.Strings[1];
     qrlblStatus.Caption := 'QUITADAS';
     qckrpCP.Preview;
    end;
  end

// 6/6) Por Data de Vencimento - Duplicatas Pendentes
else if (rdgrpData.ItemIndex=1) and (rdgrpStatus.ItemIndex=2)
 then
  Begin
   with frmRelCP do
    begin
     IBQuery1.Close;
     IBQuery1.SQL.Clear;
     IBQuery1.SQL.Add('select F.NOMEFORN, P.DTEMISS, P.DTPAG, P.DTVENC, P.HISTORIC, P.NUMLANC, P.VALORPAG, P.TIPPAG');
     IBQuery1.SQL.Add('from TBCONTPAG P, TBFORNECEDOR F');
     IBQuery1.SQL.Add('where (P.CODFORN = F.CODFORN)');
     IBQuery1.SQL.Add('and (P.DTPAG is null)');
     IBQuery1.SQL.Add('and (P.DTVENC between :dataini and :datafim)');
     IBQuery1.SQL.Add('order by F.NOMEFORN, P.DTVENC');
     IBQuery1.ParamByName('dataini').value := DateToStr(dttmpcIni.Date);
     IBQuery1.ParamByName('datafim').value := DateToStr(dttmpcFim.Date);
     IBQuery1.Open;
     qrlblPeriodo.Caption:= 'Data de Vencimento: '+ DateToStr(dttmpcIni.Date) +' a '+ DateToStr(dttmpcFim.date);
     //qrlblStatus.Caption := rdgrpStatus.Items.Strings[1];
     qrlblStatus.Caption := 'PENDENTES';
     qckrpCP.Preview;
    end;
  end;
frmRelCP.Destroy;

end;

end.
