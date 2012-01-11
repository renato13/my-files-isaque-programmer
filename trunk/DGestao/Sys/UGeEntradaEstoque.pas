unit UGeEntradaEstoque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadraoCadastro, ImgList, IBCustomDataSet, IBUpdateSQL, DB,
  Mask, DBCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls,
  ToolWin;

type
  TfrmGeEntradaEstoque = class(TfrmGrPadraoCadastro)
    lblData: TLabel;
    edData: TDateTimePicker;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGeEntradaEstoque: TfrmGeEntradaEstoque;

implementation

uses DateUtils, UDMBusiness, UGeCondicaoPagto, UGeProduto, UGeTabelaCFOP;

{$R *.dfm}

end.
