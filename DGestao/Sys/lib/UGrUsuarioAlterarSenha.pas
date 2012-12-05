unit UGrUsuarioAlterarSenha;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  UGrPadrao, Dialogs, ExtCtrls, StdCtrls, Mask, DBCtrls, DB, IBCustomDataSet, Buttons;

type
  TfrmGrUsuarioAlterarSenha = class(TfrmGrPadrao)
    Panel1: TPanel;
    dbNome: TDBEdit;
    lblNome: TLabel;
    lblSenhaNova: TLabel;
    dbSenhaAtual: TDBEdit;
    lblSenhaConfirmar: TLabel;
    edSenhaConfirmar: TEdit;
    lblSenhaAtual: TLabel;
    dbSenhaNova: TDBEdit;
    tblUsers: TIBDataSet;
    dtsUsers: TDataSource;
    pnlBotoes: TPanel;
    btbtnSalvar: TBitBtn;
    tblUsersNOME: TIBStringField;
    tblUsersSENHA: TIBStringField;
    tblUsersNOMECOMPLETO: TIBStringField;
    tblUsersCODFUNCAO: TSmallintField;
    tblUsersLIMIDESC: TIBBCDField;
    btbtnFechar: TBitBtn;
    BvlBotoes: TBevel;
    procedure btbtnFecharClick(Sender: TObject);
    procedure btbtnSalvarClick(Sender: TObject);
    procedure dbSenhaAtualExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGrUsuarioAlterarSenha: TfrmGrUsuarioAlterarSenha;

implementation

uses UDMBusiness;

var
 flagadmin:integer;

{$R *.dfm}

procedure TfrmGrUsuarioAlterarSenha.btbtnFecharClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmGrUsuarioAlterarSenha.btbtnSalvarClick(Sender: TObject);
begin
//  if dbenome.text='' then
//  begin
//    Messagedlg('USUÁRIO INVÁLIDO!',mtwarning,[mbOK],0);
//    dbenome.setfocus;
//  end;
//
//  if dbesenha.text='' then
//  begin
//    Messagedlg('SENHA INVÁLIDA!', mtwarning,[mbok], 0);
//    dbenome.setfocus;
//  end;
//
//  if (DBEsenhanova.text)<>(edconfirmsenha.text) then
//    begin
//      Messagedlg('Senha não confirmada, tente novamente...',mtwarning,[mbok], 0);
//      edconfirmsenha.setfocus;
//      exit
//    end;
//  ibdtstUsers.Post;
//  DMBusiness.ibtrnsctnBusiness.CommitRetaining;
//  ShowMessage('Senha alterada com sucesso!');
//
end;

procedure TfrmGrUsuarioAlterarSenha.dbSenhaAtualExit(Sender: TObject);
begin
// if (DBEsenhanova.text)<> ibdtstUsersSENHA.Value then
// begin
//   ShowMessage('SENHA INVÁLIDA!');
//   DBEsenha.SetFocus;
// end
end;

procedure TfrmGrUsuarioAlterarSenha.FormShow(Sender: TObject);
begin
// ibdtstUsers.Edit;
end;

procedure TfrmGrUsuarioAlterarSenha.FormCreate(Sender: TObject);
begin
  inherited;
  ;
end;

procedure TfrmGrUsuarioAlterarSenha.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  ;
end;

initialization
  FormFunction.RegisterForm('frmGrUsuarioAlterarSenha', TfrmGrUsuarioAlterarSenha);

end.
