unit UGeProduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadraoCadastro, ImgList, IBCustomDataSet, IBUpdateSQL, DB,
  Mask, DBCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls,
  ToolWin;

type
  TfrmGeProduto = class(TfrmGrPadraoCadastro)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGeProduto: TfrmGeProduto;

implementation

uses UDMBusiness;

{$R *.dfm}

end.
