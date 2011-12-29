unit UGrPadrao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, HPL_Strings, StdCtrls, DBCtrls, IBCustomDataSet, DB, DBClient,
  ExtCtrls, Mask, Grids, DBGrids;

type
  TfrmGrPadrao = class(TForm)
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    FuncoesString : THopeString;
  end;

var
  frmGrPadrao: TfrmGrPadrao;

  function CustomKeyDown(Frm : TForm; var Key : Word; Shift : TShiftState) : Boolean;

implementation

{$R *.dfm}

function CustomKeyDown(Frm : TForm; var Key: Word; Shift : TShiftState) : Boolean;
begin

  if (not Assigned(Frm)) or (Key = 0) then
    Exit;

  if (Key = VK_RETURN) and (Shift = []) then
  begin

    if (
         (Frm.ActiveControl is TEdit) 
      or (Frm.ActiveControl is TCheckBox)
      or (Frm.ActiveControl is TRadioButton)
      or (Frm.ActiveControl is TComboBox)
      or (Frm.ActiveControl is TMaskEdit)
      or (Frm.ActiveControl is TLabeledEdit)
      // DB Controls
      or (Frm.ActiveControl is TDBEdit)
      or (Frm.ActiveControl is TDBCheckBox)
      or (Frm.ActiveControl is TDBRadioGroup)
      or (Frm.ActiveControl is TDBComboBox)
      or (Frm.ActiveControl is TDBLookupComboBox)
      or (Frm.ActiveControl is TDBLookupListBox)
    ) then

      if ( Assigned(TEdit(Frm.ActiveControl).OnKeyPress) or Assigned(TEdit(Frm.ActiveControl).OnKeyDown) ) then
        Result := False
      else
        Result := True

    else
    if (Frm.ActiveControl is TDBMemo) then
    begin
      with TDBMemo(Frm.ActiveControl) do
        Result := ( Assigned(DataSource) and Assigned(DataSource.DataSet) and (not (DataSource.DataSet.State in [dsInsert, dsEdit])) );
    end
    else
    if ( (Frm.ActiveControl is TMemo) and TMemo(Frm.ActiveControl).Enabled and (not TMemo(Frm.ActiveControl).ReadOnly) ) then
      Result := False;

    if Result then
    begin
      Key := 0;
      Frm.Perform(WM_NEXTDLGCTL, 0, 0);
    end;

  end;

end;

procedure TfrmGrPadrao.FormCreate(Sender: TObject);
begin
  FuncoesString := THopeString.Create;
end;

procedure TfrmGrPadrao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  CustomKeyDown(Self, Key, Shift);
end;

end.
