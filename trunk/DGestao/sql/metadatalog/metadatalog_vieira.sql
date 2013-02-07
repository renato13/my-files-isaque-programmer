


/*------ SYSDBA 07/02/2013 18:49:09 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_vendasitens_total_venda for tvendasitens
active after insert or update or delete position 10
AS
  declare variable anovenda Smallint;
  declare variable numvenda Integer;
  declare variable total_bruto Dmn_money;
  declare variable total_desconto dmn_money_desconto_4;
  declare variable total_liquido Dmn_money;
begin
  if ( (Inserting) or (Updating) ) then
  begin
    anovenda = new.Ano;
    numvenda = new.Codcontrol;
  end
  else
  begin
    anovenda = old.Ano;
    numvenda = old.Codcontrol;
  end

  Select
      sum( coalesce(i.Qtde, 0) * coalesce(i.Punit, 0) )
    --, sum( coalesce(i.Qtde, 0) * (coalesce(i.Punit, 0) - coalesce(i.Pfinal, 0)) )
    , sum( coalesce(i.Qtde, 0) * coalesce(i.desconto_valor, 0) )
    , sum( coalesce(i.Qtde, 0) * coalesce(i.pfinal, 0) )
  from TVENDASITENS i
  where i.Ano = :Anovenda
    and i.Codcontrol = :Numvenda
  into
      Total_bruto
    , Total_desconto
    , total_liquido;

  Total_bruto    = coalesce(:Total_bruto, 0);
  Total_desconto = coalesce(:Total_desconto, 0);

  Update TBVENDAS v Set
      v.Desconto = :Total_desconto
--    , v.Totalvenda = :Total_bruto - :Total_desconto
    , v.Totalvenda = :Total_liquido
  where v.Ano = :Anovenda
    and v.Codcontrol = :Numvenda;
end^

SET TERM ; ^

