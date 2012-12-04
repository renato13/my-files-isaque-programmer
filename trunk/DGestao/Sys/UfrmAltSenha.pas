unit UfrmAltSenha;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Mask, DBCtrls, DB, IBCustomDataSet, Buttons;

type
  TfrmAltSenha = class(TForm)
    Panel1: TPanel;
    DBENome: TDBEdit;
    lblNome: TLabel;
    lblsenha: TLabel;
    DBEsenha: TDBEdit;
    lblconfSen: TLabel;
    EdConfirmSenha: TEdit;
    Label1: TLabel;
    DBEsenhanova: TDBEdit;
    ibdtstUsers: TIBDataSet;
    dtsrcUsers: TDataSource;
    Panel2: TPanel;
    btbtnFechar: TBitBtn;
    btbtnSalvar: TBitBtn;
    ibdtstUsersNOME: TIBStringField;
    ibdtstUsersSENHA: TIBStringField;
    ibdtstUsersNOMECOMPLETO: TIBStringField;
    ibdtstUsersCODFUNCAO: TSmallintField;
    ibdtstUsersLIMIDESC: TIBBCDField;
    procedure btbtnFecharClick(Sender: TObject);
    procedure btbtnSalvarClick(Sender: TObject);
    procedure DBEsenhaExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAltSenha: TfrmAltSenha;

implementation

uses UDMBusiness;

var
 flagadmin:integer;

{$R *.dfm}

procedure TfrmAltSenha.btbtnFecharClick(Sender: TObject);
begin
frmAltSenha.Close;
end;

procedure TfrmAltSenha.btbtnSalvarClick(Sender: TObject);
begin
  if dbenome.text='' then
  begin
    Messagedlg('USUÁRIO INVÁLIDO!',mtwarning,[mbOK],0);
    dbenome.setfocus;
  end;

  if dbesenha.text='' then
  begin
    Messagedlg('SENHA INVÁLIDA!', mtwarning,[mbok], 0);
    dbenome.setfocus;
  end;

  if (DBEsenhanova.text)<>(edconfirmsenha.text) then
    begin
      Messagedlg('Senha não confirmada, tente novamente...',mtwarning,[mbok], 0);
      edconfirmsenha.setfocus;
      exit
    end;
  ibdtstUsers.Post;
  DMBusiness.ibtrnsctnBusiness.CommitRetaining;
  ShowMessage('Senha alterada com sucesso!');

end;

procedure TfrmAltSenha.DBEsenhaExit(Sender: TObject);
begin
 if (DBEsenhanova.text)<> ibdtstUsersSENHA.Value then
 begin
   ShowMessage('SENHA INVÁLIDA!');
   DBEsenha.SetFocus;
 end
end;

procedure TfrmAltSenha.FormShow(Sender: TObject);
begin
 ibdtstUsers.Edit;
end;

end.
