unit UGeVendaItemPesquisa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadraoPesquisa, DB, IBCustomDataSet, IBQuery, Grids, DBGrids,
  StdCtrls, Buttons, ExtCtrls, Mask, rxToolEdit;

type
  TFrmGeVendaItemPesquisa = class(TfrmGrPadraoPesquisa)
    lblData: TLabel;
    e1Data: TDateEdit;
    e2Data: TDateEdit;
    QryPesquisaCODPROD: TIBStringField;
    QryPesquisaPRODUTO: TIBStringField;
    QryPesquisaGRUPO: TIBStringField;
    QryPesquisaUNIDADE: TIBStringField;
    QryPesquisaQUANTIDADE: TLargeintField;
    QryPesquisaTOTAL_BRUTO: TIBBCDField;
    QryPesquisaTOTAL_DESCONTO: TIBBCDField;
    QryPesquisaTOTAL_FINAL: TIBBCDField;
    QryPesquisaVENDEDOR: TIBStringField;
    QryPesquisaCLIENTE_CPF: TIBStringField;
    QryPesquisaCLIENTE_NOME: TIBStringField;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure ConfigurarColunas;
  public
    { Public declarations }
    function ExecutarPesquisa : Boolean; override;
  end;

var
  FrmGeVendaItemPesquisa: TFrmGeVendaItemPesquisa;

implementation

uses
  UDMBusiness, UConstantesDGE;

{$R *.dfm}

{ TFrmGeVendaItemPesquisa }

procedure TFrmGeVendaItemPesquisa.ConfigurarColunas;
begin
  dbgDados.Columns[0].Visible := edTipoPesquisa.ItemIndex in [0, 2, 3]; // Código
  dbgDados.Columns[1].Visible := edTipoPesquisa.ItemIndex in [0, 2, 3]; // Produto
  dbgDados.Columns[2].Visible := edTipoPesquisa.ItemIndex in [0, 1];    // Grupo
  dbgDados.Columns[3].Visible := edTipoPesquisa.ItemIndex in [2];       // Vendedor
  dbgDados.Columns[4].Visible := edTipoPesquisa.ItemIndex in [3];       // Cliente
end;

function TFrmGeVendaItemPesquisa.ExecutarPesquisa: Boolean;
var
  sDataInicial,
  sDataFinal  : String;
begin
  Screen.Cursor := crSQLWait;
  try
    sDataInicial := FormatDateTime('yyyy-mm-dd', StrToDateDef(e1Data.Text, Date));
    sDataFinal   := FormatDateTime('yyyy-mm-dd', StrToDateDef(e2Data.Text, Date));

    QryPesquisa.Close;

    with QryPesquisa do
    begin
      SQL.Clear;
      SQL.AddStrings( SQLSelect );
      SQL.Add('where v.dtvenda between ' + QuotedStr(sDataInicial) + ' and ' + QuotedStr(sDataFinal));

      Case edTipoPesquisa.ItemIndex of
        0:
          begin
            SQL[9]  := '  , cast(null as varchar(60)) as Vendedor';
            SQL[10] := '  , cast(null as varchar(18)) as Cliente_Cpf';
            SQL[11] := '  , cast(null as varchar(60)) as Cliente_Nome';

            if ( StrToIntDef(Trim(edPesquisar.Text), 0) > 0 ) then
              SQL.Add('  and i.codprod = ' + FormatFloat('0000000', StrToInt(Trim(edPesquisar.Text))))
            else
              SQL.Add('  and p.descri like ' + QuotedStr(Trim(edPesquisar.Text) + '%'));
          end;

        1:
          begin
            SQL[1]  := '    cast(null as varchar(10)) as codprod';
            SQL[2]  := '  , cast(null as varchar(50)) as Produto';
            SQL[9]  := '  , cast(null as varchar(60)) as Vendedor';
            SQL[10] := '  , cast(null as varchar(18)) as Cliente_Cpf';
            SQL[11] := '  , cast(null as varchar(60)) as Cliente_Nome';

            if ( StrToIntDef(Trim(edPesquisar.Text), 0) > 0 ) then
              SQL.Add('  and p.codgrupo = ' + Trim(edPesquisar.Text))
            else
              SQL.Add('  and g.descri like ' + QuotedStr(Trim(edPesquisar.Text) + '%'));
          end;

        2:
          begin
            SQL[3]  := '  , cast(null as varchar(30)) as Grupo';
            SQL[10] := '  , cast(null as varchar(18)) as Cliente_Cpf';
            SQL[11] := '  , cast(null as varchar(60)) as Cliente_Nome';

            if ( StrToIntDef(Trim(edPesquisar.Text), 0) > 0 ) then
              SQL.Add('  and v.vendedor_cod = ' + Trim(edPesquisar.Text))
            else
              SQL.Add('  and vd.nome like ' + QuotedStr(Trim(edPesquisar.Text) + '%'));
          end;

        3:
          begin
            SQL[3]  := '  , cast(null as varchar(30)) as Grupo';
            SQL[9]  := '  , cast(null as varchar(60)) as Vendedor';

            //if ( StrToIntDef(Trim(edPesquisar.Text), 0) > 0 ) then
            //  SQL.Add('  and v.codcli = ' + QuotedStr(Trim(edPesquisar.Text)))
            //else
              SQL.Add('  and cl.nome like ' + QuotedStr(Trim(edPesquisar.Text) + '%'));
          end;
      end;

      SQL.Add('group by');

      if ( edTipoPesquisa.ItemIndex in [0, 2, 3] ) then
      begin
        SQL.Add('    i.codprod');
        SQL.Add('  , p.descri');
      end;

      if ( edTipoPesquisa.ItemIndex in [1] ) then
        SQL.Add('    p.codgrupo');

      if ( edTipoPesquisa.ItemIndex in [0, 1] ) then
        SQL.Add('  , g.descri');

      SQL.Add('  , u.unp_sigla');

      if ( edTipoPesquisa.ItemIndex in [2] ) then
        SQL.Add('  , vd.nome');

      if ( edTipoPesquisa.ItemIndex in [3] ) then
      begin
        SQL.Add('  , v.codcli');
        SQL.Add('  , cl.nome');
      end;
    end;

    QryPesquisa.Open;

    Result := not QryPesquisa.IsEmpty;
  finally
    ConfigurarColunas;
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmGeVendaItemPesquisa.FormCreate(Sender: TObject);
begin
  inherited;
  e1Data.Date := Date - 7;
  e2Data.Date := Date;

  ConfigurarColunas;
end;

initialization
  FormFunction.RegisterForm('FrmGeVendaItemPesquisa', TFrmGeVendaItemPesquisa);

end.
