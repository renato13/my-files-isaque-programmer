/*------ SYSDBA 29/01/2013 16:47:19 --------*/

COMMENT ON DOMAIN DMN_MONEY_DESCONTO IS 'Valor Desconto c/ 3 cadas decimais.';

CREATE DOMAIN DMN_MONEY_DESCONTO_4 AS
NUMERIC(15,4)
DEFAULT 0;COMMENT ON DOMAIN DMN_MONEY_DESCONTO_4 IS 'Valor Desconto c/ 4 cadas decimais.';




/*------ SYSDBA 29/01/2013 16:53:42 --------*/

CREATE DOMAIN DMN_PERCENTUAL_3 AS
NUMERIC(15,3)
DEFAULT 0;COMMENT ON DOMAIN DMN_PERCENTUAL_3 IS 'Percentual c/ 3 casas decimais.';

CREATE DOMAIN DMN_PERCENTUAL_2 AS
NUMERIC(15,2)
DEFAULT 0;COMMENT ON DOMAIN DMN_PERCENTUAL_2 IS 'Percentual c/ 2 casas decimais.';

CREATE DOMAIN DMN_PERCENTUAL_4 AS
NUMERIC(15,4)
DEFAULT 0;COMMENT ON DOMAIN DMN_PERCENTUAL_4 IS 'Percentual c/ 4 casas decimais.';




/*------ SYSDBA 29/01/2013 16:55:19 --------*/

COMMENT ON COLUMN TBVENDAS.DESCONTO IS
'Valor Total Desconto.';




/*------ SYSDBA 29/01/2013 16:55:46 --------*/

COMMENT ON COLUMN TBVENDAS.NFE_VALOR_DESCONTO IS
'NFe - Valor Total Desconto.';




/*------ SYSDBA 29/01/2013 16:56:39 --------*/

update RDB$RELATION_FIELDS set
RDB$FIELD_SOURCE = 'DMN_PERCENTUAL_2'
where (RDB$FIELD_NAME = 'DESCONTO') and
(RDB$RELATION_NAME = 'TBVENDAS')
;

COMMENT ON COLUMN TBVENDAS.DESCONTO IS
'Valor Total Desconto.';




/*------ SYSDBA 29/01/2013 16:57:12 --------*/

update RDB$RELATION_FIELDS set
RDB$FIELD_SOURCE = 'DMN_MONEY_DESCONTO_4'
where (RDB$FIELD_NAME = 'DESCONTO') and
(RDB$RELATION_NAME = 'TBVENDAS')
;

COMMENT ON COLUMN TBVENDAS.DESCONTO IS
'Valor Total Desconto.';




/*------ SYSDBA 29/01/2013 16:59:39 --------*/

update RDB$RELATION_FIELDS set
RDB$FIELD_SOURCE = 'DMN_MONEY'
where (RDB$FIELD_NAME = 'DESCONTO') and
(RDB$RELATION_NAME = 'TBVENDAS')
;

COMMENT ON COLUMN TBVENDAS.DESCONTO IS
'Valor Total Desconto.';




/*------ SYSDBA 29/01/2013 17:00:14 --------*/

update RDB$RELATION_FIELDS set
RDB$FIELD_SOURCE = 'DMN_PERCENTUAL_3'
where (RDB$FIELD_NAME = 'DESCONTO') and
(RDB$RELATION_NAME = 'TVENDASITENS')
;

COMMENT ON COLUMN TVENDASITENS.DESCONTO IS
'Percentual desconto.';




/*------ SYSDBA 29/01/2013 17:00:25 --------*/

update RDB$RELATION_FIELDS set
RDB$FIELD_SOURCE = 'DMN_MONEY_DESCONTO_4'
where (RDB$FIELD_NAME = 'DESCONTO_VALOR') and
(RDB$RELATION_NAME = 'TVENDASITENS')
;

COMMENT ON COLUMN TVENDASITENS.DESCONTO_VALOR IS
'Valor desconto (Unitario).';




/*------ SYSDBA 30/01/2013 16:07:12 --------*/

update RDB$RELATION_FIELDS set
RDB$FIELD_SOURCE = 'DMN_MONEY_DESCONTO_4'
where (RDB$FIELD_NAME = 'DESCONTO') and
(RDB$RELATION_NAME = 'TBVENDAS')
;

COMMENT ON COLUMN TBVENDAS.DESCONTO IS
'Valor Total Desconto.';




/*------ SYSDBA 30/01/2013 16:09:02 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_vendasitens_total_venda for tvendasitens
active after insert or update or delete position 10
AS
  declare variable anovenda Smallint;
  declare variable numvenda Integer;
  declare variable total_bruto Dmn_money;
  declare variable total_desconto dmn_money_desconto_4;
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
  from TVENDASITENS i
  where i.Ano = :Anovenda
    and i.Codcontrol = :Numvenda
  into
      Total_bruto
    , Total_desconto;

  Total_bruto    = coalesce(:Total_bruto, 0);
  Total_desconto = coalesce(:Total_desconto, 0);

  Update TBVENDAS v Set
      v.Desconto = :Total_desconto
    , v.Totalvenda = :Total_bruto - :Total_desconto
  where v.Ano = :Anovenda
    and v.Codcontrol = :Numvenda;
end
^

SET TERM ; ^


/*------ SYSDBA 06/02/2013 01:23:14 --------*/

COMMENT ON COLUMN TBVENDAS.STATUS IS
'Status:
1 - Em Atendimento
2 - Aberta
3 - Finalizada
4 - NF-e emitida
5 - Cancelada';




/*------ SYSDBA 07/02/2013 16:37:51 --------*/

CREATE DOMAIN DMN_MONEY_4 AS
NUMERIC(15,4);


/*------ SYSDBA 07/02/2013 16:46:12 --------*/

update RDB$RELATION_FIELDS set
RDB$FIELD_SOURCE = 'DMN_MONEY'
where (RDB$FIELD_NAME = 'PFINAL') and
(RDB$RELATION_NAME = 'TVENDASITENS')
;

COMMENT ON COLUMN TVENDASITENS.PFINAL IS
'';



/*------ 08/02/2013 14:15:51 --------*/

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

/*------ 08/02/2013 14:15:51 --------*/

SET TERM ; ^


/*------ SYSDBA 08/02/2013 14:49:19 --------*/

COMMENT ON COLUMN TBNFE_ENVIADA.DATAEMISSAO IS
'Data Emissao.';




/*------ SYSDBA 08/02/2013 14:49:30 --------*/

COMMENT ON COLUMN TBNFE_ENVIADA.HORAEMISSAO IS
'Hora Emissao.';




/*------ SYSDBA 08/02/2013 14:50:42 --------*/

COMMENT ON COLUMN TBNFE_ENVIADA.SERIE IS
'Serie da NF-e.';

COMMENT ON COLUMN TBNFE_ENVIADA.NUMERO IS
'Numero da NF-e.';

COMMENT ON COLUMN TBNFE_ENVIADA.CHAVE IS
'Chave.';

COMMENT ON COLUMN TBNFE_ENVIADA.PROTOCOLO IS
'Protocolo.';

COMMENT ON COLUMN TBNFE_ENVIADA.RECIBO IS
'Numero Recibo.';

COMMENT ON COLUMN TBNFE_ENVIADA.XML_FILENAME IS
'Nome arquivo XML.';

COMMENT ON COLUMN TBNFE_ENVIADA.XML_FILE IS
'Arquivo XML.';

COMMENT ON COLUMN TBNFE_ENVIADA.LOTE_ANO IS
'Ano Lote.';

COMMENT ON COLUMN TBNFE_ENVIADA.LOTE_NUM IS
'Numero Lote.';




/*------ SYSDBA 08/02/2013 14:51:22 --------*/

COMMENT ON COLUMN TBVENDAS.VENDA_PRAZO IS
'Venda A Prazo:
0 - Nao
1 - Sim';




/*------ SYSDBA 08/02/2013 14:52:12 --------*/

update RDB$RELATION_FIELDS set
RDB$FIELD_SOURCE = 'DMN_VCHAR_50'
where (RDB$FIELD_NAME = 'CANCEL_USUARIO') and
(RDB$RELATION_NAME = 'TBVENDAS')
;

COMMENT ON COLUMN TBVENDAS.CANCEL_USUARIO IS
'';



/*------ 14/02/2013 08:52:40 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure SET_CONTA_CORRENTE_SALDO (
    CONTA_CORRENTE integer,
    DATA_MOVIMENTO date)
as
declare variable DATA_SALDO_ANT date;
declare variable VALOR_SALDO_ANT numeric(15,2);
declare variable TOTAL_CREDITO_DIA numeric(15,2);
declare variable TOTAL_DEBITO_DIA numeric(15,2);
declare variable TOTAL_SALDO_DIA numeric(15,2);
begin
  -- Buscar Saldo anterior
  Select
      s1.Data_saldo
    , s1.Valor_saldo
  from TBCONTA_CORRENTE_SALDO s1
  where s1.Codigo = :Conta_corrente
    and s1.Data_saldo in (
      Select
        max(s2.Data_saldo)
      from TBCONTA_CORRENTE_SALDO s2
      where s2.Codigo = :Conta_corrente
        and s2.Data_saldo < :Data_movimento
    )
  into
      Data_saldo_ant
    , Valor_saldo_ant;

  -- Gravar Saldo anterior caso nao exista
  if ( :Data_saldo_ant is null ) then
  begin
    Data_saldo_ant  = :Data_movimento - 1;
    Valor_saldo_ant = 0;

    Insert Into TBCONTA_CORRENTE_SALDO (
        Codigo
      , Data_saldo
      , Valor_saldo
    ) values (
        :Conta_corrente
      , :Data_saldo_ant
      , :Valor_saldo_ant
    );
  end 

  -- Consolidar Creditos e Debitos do dia
  Select
      sum( Case when upper(m.Tipo) = 'C' then m.Valor else 0 end )
    , sum( Case when upper(m.Tipo) = 'D' then m.Valor else 0 end )
  from TBCAIXA_MOVIMENTO m
  where m.Situacao = 1 -- Confirmado
    and m.Conta_corrente = :Conta_corrente
    and cast(m.Datahora as Date ) = :Data_movimento
  into
      Total_credito_dia
    , Total_debito_dia;

  Total_saldo_dia = :Valor_saldo_ant + coalesce(:Total_credito_dia, 0) - coalesce(:Total_debito_dia, 0);

  /* Gerar Saldo Conta Corrente do Dia */
  if ( not Exists(
    Select
      s3.Codigo
    from TBCONTA_CORRENTE_SALDO s3
    where s3.Codigo = :Conta_corrente
      and s3.Data_saldo = :Data_movimento
  ) ) then
  begin

    -- Inserir Saldo do Dia
    Insert Into TBCONTA_CORRENTE_SALDO (
        Codigo
      , Data_saldo
      , Valor_saldo
    ) values (
        :Conta_corrente
      , :Data_movimento
      , :Total_saldo_dia
    );

   end
   else
   begin

     -- Atualizar Saldo do Dia
     Update TBCONTA_CORRENTE_SALDO s Set
       s.Valor_saldo = :Total_saldo_dia
     where s.Codigo = :Conta_corrente
       and s.Data_saldo = :Data_movimento;

   end 
end^

/*------ 14/02/2013 08:52:40 --------*/

SET TERM ; ^

/*------ 14/02/2013 08:53:25 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure GET_DIA_UTIL (
    DATA date,
    DIAS integer)
returns (
    DIA_UTIL date)
as
begin
  Dia_util = :Data + :Dias;
  if ( Extract(Weekday from :Dia_util) = 0 ) then /* Caso seja domingo */
    Dia_util = :Dia_util + 1;
  else
  if ( Extract(Weekday from :Dia_util) = 6 ) then /* Caso seja sabado */
    Dia_util = :Dia_util + 2;

  suspend;
end^

/*------ 14/02/2013 08:53:25 --------*/

SET TERM ; ^


/*------ SYSDBA 14/02/2013 09:02:40 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_vendas_cancelar for tbvendas
active after update position 2
AS
  declare variable produto varchar(10);
  declare variable empresa varchar(18);
  declare variable estoque integer;
  declare variable quantidade integer;
  declare variable valor_produto numeric(15,2);
begin
  if ( (coalesce(old.Status, 0) <> coalesce(new.Status, 0)) and (new.Status = 5)) then
  begin

    -- Retornar produto do Estoque
    for
      Select
          i.Codprod
        , i.Codemp
        , i.Qtde
        , coalesce(p.Qtde, 0)
        , coalesce(p.Preco, 0)
      from TVENDASITENS i
        inner join TBPRODUTO p on (p.Cod = i.Codprod)
      where i.Ano = new.Ano
        and i.Codcontrol = new.Codcontrol
      into
          produto
        , empresa
        , quantidade
        , estoque
        , valor_produto
    do
    begin
      estoque = :Estoque + :Quantidade;

      -- Retornar estoque
      Update TBPRODUTO p Set
        p.Qtde = :Estoque
      where p.Cod    = :Produto
        and p.Codemp = :Empresa;

      -- Gerar historico
      Insert Into TBPRODHIST (
          Codempresa
        , Codprod
        , Doc
        , Historico
        , Dthist
        , Qtdeatual
        , Qtdenova
        , Qtdefinal
        , Resp
        , Motivo
      ) values (
          :Empresa
        , :Produto
        , new.Ano || '/' || new.Codcontrol
        , 'ENTRADA - VENDA CANCELADA'
        , Current_time
        , :Estoque - :Quantidade
        , :Quantidade
        , :Estoque
        , new.Cancel_usuario
        , 'Venda no valor de R$ ' || :Valor_produto
      );

    end

    -- Cancelar Contas A Receber (Apenas parcelas nao pagas)
    Update TBCONTREC r Set
        r.status   = 'CANCELADA'
      , r.Situacao = 0 -- Cancelado
    where r.anovenda = new.ano
      and r.numvenda = new.codcontrol
      and coalesce(r.Valorrectot, 0) = 0;

    -- Cancelar Movimento Caixa
    Update TBCAIXA_MOVIMENTO m Set
      m.Situacao = 0 -- Cancelado
    where m.Empresa = new.Codemp
      and m.Cliente = new.Codcli
      and m.Venda_ano = new.Ano
      and m.Venda_num = new.Codcontrol;
     
  end 
end
^

SET TERM ; ^




/*------ SYSDBA 14/02/2013 09:02:51 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_vendas_atualizar_estoque for tbvendas
active after update position 1
AS
  declare variable produto varchar(10);
  declare variable empresa varchar(18);
  declare variable estoque integer;
  declare variable quantidade integer;
  declare variable reserva integer;
  declare variable valor_produto numeric(15,2);
begin
  if ( (coalesce(old.Status, 0) <> coalesce(new.Status, 0)) and (new.Status = 3)) then
  begin

    -- Baixar produto do Estoque
    for
      Select
          i.Codprod
        , i.Codemp
        , i.Qtde
        , coalesce(p.Qtde, 0)
        , coalesce(p.Reserva, 0)
        , coalesce(p.Preco, 0)
      from TVENDASITENS i
        inner join TBPRODUTO p on (p.Cod = i.Codprod)
      where i.Ano = new.Ano
        and i.Codcontrol = new.Codcontrol
      into
          produto
        , empresa
        , quantidade
        , estoque
        , reserva
        , valor_produto
    do
    begin
      reserva = :reserva - :Quantidade;
      estoque = :Estoque - :Quantidade;

      -- Baixar estoque
      Update TBPRODUTO p Set
          p.Reserva = :Reserva
        , p.Qtde    = :Estoque
      where p.Cod    = :Produto
        and p.Codemp = :Empresa;

      -- Gravar posicao de estoque
      Update TVENDASITENS i Set
        i.Qtdefinal = :Estoque
      where i.Ano        = new.Ano
        and i.Codcontrol = new.Codcontrol
        and i.Codemp     = new.Codemp
        and i.Codprod    = :Produto;

      -- Gerar historico
      Insert Into TBPRODHIST (
          Codempresa
        , Codprod
        , Doc
        , Historico
        , Dthist
        , Qtdeatual
        , Qtdenova
        , Qtdefinal
        , Resp
        , Motivo
      ) values (
          :Empresa
        , :Produto
        , new.Ano || '/' || new.Codcontrol
        , 'SAIDA - VENDA'
        , Current_time
        , :Estoque + :Quantidade
        , :Quantidade
        , :Estoque
        , new.Usuario
        , 'Venda no valor de R$ ' || :Valor_produto
      );
    end
     
  end 
end
^

SET TERM ; ^




/*------ SYSDBA 14/02/2013 09:03:11 --------*/

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
      v.Desconto   = :Total_desconto
    , v.Totalvenda = :Total_liquido
  where v.Ano = :Anovenda
    and v.Codcontrol = :Numvenda;
end
^

SET TERM ; ^




/*------ SYSDBA 14/02/2013 09:04:47 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_compras_cancelar for tbcompras
active after update position 2
AS
  declare variable produto varchar(10);
  declare variable empresa varchar(18);
  declare variable estoque integer;
  declare variable quantidade integer;
  declare variable custo_compra numeric(15,2);
begin
  if ( (coalesce(old.Status, 0) <> coalesce(new.Status, 0)) and (new.Status = 3)) then
  begin

    -- Decrementar Estoque do produto
    for
      Select
          i.Codprod
        , i.Codemp
        , i.Qtde
        , coalesce(p.Qtde, 0)
        , coalesce(i.Customedio, 0)
      from TBCOMPRASITENS i
        inner join TBPRODUTO p on (p.Cod = i.Codprod)
      where i.Ano = new.Ano
        and i.Codcontrol = new.Codcontrol
      into
          Produto
        , Empresa
        , Quantidade
        , Estoque
        , Custo_compra
    do
    begin
      -- Decrementar estoque
      Update TBPRODUTO p Set
        p.Qtde       = :Estoque - :Quantidade
      where p.Cod    = :Produto
        and p.Codemp = :Empresa;

      -- Gerar historico
      Insert Into TBPRODHIST (
          Codempresa
        , Codprod
        , Doc
        , Historico
        , Dthist
        , Qtdeatual
        , Qtdenova
        , Qtdefinal
        , Resp
        , Motivo
      ) values (
          :Empresa
        , :Produto
        , new.Ano || '/' || new.Codcontrol
        , 'SAIDA - COMPRA CANCELADA'
        , Current_time
        , :Estoque
        , :Quantidade
        , :Estoque - :Quantidade
        , new.Cancel_usuario
        , 'Custo Final no valor de R$ ' || :Custo_compra
      );
    end
     
    -- Cancelar Movimento Caixa
    Update TBCAIXA_MOVIMENTO m Set
      m.Situacao = 0 -- Cancelado
    where m.Empresa = new.Codemp
      and m.Fornecedor = new.Codforn
      and m.Compra_ano = new.Ano
      and m.Compra_num = new.Codcontrol;

  end 
end
^

SET TERM ; ^




/*------ SYSDBA 14/02/2013 09:05:03 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_compras_atualizar_estoque for tbcompras
active after update position 1
AS
  declare variable produto varchar(10);
  declare variable empresa varchar(18);
  declare variable estoque integer;
  declare variable quantidade integer;
  declare variable custo_produto numeric(15,2);
  declare variable custo_compra numeric(15,2);
  declare variable custo_medio numeric(15,2);
begin
  if ( (coalesce(old.Status, 0) <> coalesce(new.Status, 0)) and (new.Status = 2)) then
  begin

    -- Incrimentar Estoque do produto
    for
      Select
          i.Codprod
        , i.Codemp
        , i.Qtde
        , coalesce(p.Qtde, 0)
        , coalesce(i.Customedio, 0)
        , coalesce(p.Customedio, 0)
      from TBCOMPRASITENS i
        inner join TBPRODUTO p on (p.Cod = i.Codprod)
      where i.Ano = new.Ano
        and i.Codcontrol = new.Codcontrol
      into
          Produto
        , Empresa
        , Quantidade
        , Estoque
        , Custo_compra
        , Custo_produto
    do
    begin
      if ( (:Custo_compra > 0) and (:Custo_produto > 0) and (:Estoque > 0) ) then
        Custo_medio = (:Custo_compra + :Custo_produto) / 2;
      else
        Custo_medio = :Custo_compra;

      -- Incrementar estoque
      Update TBPRODUTO p Set
          --p.Customedio = :Custo_medio
          p.Customedio = :Custo_compra
        , p.Qtde       = :Estoque + :Quantidade
      where p.Cod    = :Produto
        and p.Codemp = :Empresa;

      -- Gravar posicao de estoque
      Update TBCOMPRASITENS i Set
          i.Qtdeantes = :Estoque
        , i.Qtdefinal = :Estoque + :Quantidade
      where i.Ano = new.Ano
        and i.Codcontrol = new.Codcontrol
        and i.Codemp     = new.Codemp
        and i.Codprod    = :Produto;

      -- Gerar historico
      Insert Into TBPRODHIST (
          Codempresa
        , Codprod
        , Doc
        , Historico
        , Dthist
        , Qtdeatual
        , Qtdenova
        , Qtdefinal
        , Resp
        , Motivo
      ) values (
          :Empresa
        , :Produto
        , new.Ano || '/' || new.Codcontrol
        , 'ENTRADA - COMPRA'
        , Current_time
        , :Estoque
        , :Quantidade
        , :Estoque + :Quantidade
        , new.Usuario
        , 'Custo Medio no valor de R$ ' || :Custo_medio
      );
    end
     
  end 
end
^

SET TERM ; ^




/*------ SYSDBA 14/02/2013 09:48:51 --------*/

ALTER TABLE TVENDASITENS
    ADD TOTAL_BRUTO DMN_MONEY,
    ADD TOTAL_DESCONTO DMN_MONEY,
    ADD TOTAL_LIQUIDO DMN_MONEY;

COMMENT ON COLUMN TVENDASITENS.TOTAL_BRUTO IS
'Total Bruto.';

COMMENT ON COLUMN TVENDASITENS.TOTAL_DESCONTO IS
'Total Desconto.';

COMMENT ON COLUMN TVENDASITENS.TOTAL_LIQUIDO IS
'Total Liquido.';




/*------ SYSDBA 14/02/2013 09:50:37 --------*/

SET TERM ^ ;

CREATE trigger tg_vendasitens_totais_produto for tvendasitens
active before insert or update position 0
AS
begin
  new.total_bruto    = coalesce(new.qtde, 0) * coalesce(new.punit, 0);
  new.total_desconto = coalesce(new.qtde, 0) * coalesce(new.desconto_valor, 0);
  new.total_liquido  = coalesce(new.qtde, 0) * coalesce(new.pfinal, 0);
end^

SET TERM ; ^


/*!!! Error occured !!!
Invalid token.
Dynamic SQL Error.
SQL error code = -104.
Token unknown - line 35, column 7.
amd.

*/



/*------ SYSDBA 14/02/2013 10:34:24 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_vendasitens_totais_produto for tvendasitens
active before insert or update position 0
AS
begin
  new.total_bruto    = ( coalesce(new.qtde, 0) * coalesce(new.punit, 0) );
  new.total_desconto = ( coalesce(new.qtde, 0) * coalesce(new.desconto_valor, 0) );
  new.total_liquido  = ( coalesce(new.total_bruto, 0) - coalesce(new.total_desconto, 0) );
end^

SET TERM ; ^




/*------ SYSDBA 14/02/2013 10:46:47 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_vendasitens_total_venda for tvendasitens
active after insert or update or delete position 10
AS
  declare variable anovenda Smallint;
  declare variable numvenda Integer;
  declare variable total_bruto Dmn_money;
  declare variable total_desconto dmn_money;
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
      sum( coalesce(i.total_bruto,    0) )
    , sum( coalesce(i.total_desconto, 0) )
  from TVENDASITENS i
  where i.Ano = :Anovenda
    and i.Codcontrol = :Numvenda
  into
      Total_bruto
    , Total_desconto;

  Total_bruto    = coalesce(:Total_bruto, 0);
  Total_desconto = coalesce(:Total_desconto, 0);
  total_liquido  = :Total_bruto - :Total_desconto;

  Update TBVENDAS v Set
      v.Desconto   = :Total_desconto
    , v.Totalvenda = :Total_liquido
  where v.Ano = :Anovenda
    and v.Codcontrol = :Numvenda;
end^

SET TERM ; ^




/*------ SYSDBA 14/02/2013 11:13:26 --------*/

ALTER TABLE TBVENDAS
    ADD TOTALVENDA_BRUTA DMN_MONEY;

COMMENT ON COLUMN TBVENDAS.TOTALVENDA_BRUTA IS
'Total Venda Bruta.';

alter table TBVENDAS
alter ANO position 1;

alter table TBVENDAS
alter CODCONTROL position 2;

alter table TBVENDAS
alter CODEMP position 3;

alter table TBVENDAS
alter CODCLI position 4;

alter table TBVENDAS
alter DTVENDA position 5;

alter table TBVENDAS
alter STATUS position 6;

alter table TBVENDAS
alter TOTALVENDA_BRUTA position 7;

alter table TBVENDAS
alter DESCONTO position 8;

alter table TBVENDAS
alter TOTALVENDA position 9;

alter table TBVENDAS
alter DTFINALIZACAO_VENDA position 10;

alter table TBVENDAS
alter OBS position 11;

alter table TBVENDAS
alter FORMAPAG position 12;

alter table TBVENDAS
alter FATDIAS position 13;

alter table TBVENDAS
alter SERIE position 14;

alter table TBVENDAS
alter NFE position 15;

alter table TBVENDAS
alter DATAEMISSAO position 16;

alter table TBVENDAS
alter HORAEMISSAO position 17;

alter table TBVENDAS
alter CFOP position 18;

alter table TBVENDAS
alter VERIFICADOR_NFE position 19;

alter table TBVENDAS
alter XML_NFE position 20;

alter table TBVENDAS
alter VENDEDOR_COD position 21;

alter table TBVENDAS
alter USUARIO position 22;

alter table TBVENDAS
alter FORMAPAGTO_COD position 23;

alter table TBVENDAS
alter CONDICAOPAGTO_COD position 24;

alter table TBVENDAS
alter VENDA_PRAZO position 25;

alter table TBVENDAS
alter PRAZO_01 position 26;

alter table TBVENDAS
alter PRAZO_02 position 27;

alter table TBVENDAS
alter PRAZO_03 position 28;

alter table TBVENDAS
alter PRAZO_04 position 29;

alter table TBVENDAS
alter PRAZO_05 position 30;

alter table TBVENDAS
alter PRAZO_06 position 31;

alter table TBVENDAS
alter PRAZO_07 position 32;

alter table TBVENDAS
alter PRAZO_08 position 33;

alter table TBVENDAS
alter PRAZO_09 position 34;

alter table TBVENDAS
alter PRAZO_10 position 35;

alter table TBVENDAS
alter PRAZO_11 position 36;

alter table TBVENDAS
alter PRAZO_12 position 37;

alter table TBVENDAS
alter LOTE_NFE_ANO position 38;

alter table TBVENDAS
alter LOTE_NFE_NUMERO position 39;

alter table TBVENDAS
alter NFE_ENVIADA position 40;

alter table TBVENDAS
alter CANCEL_USUARIO position 41;

alter table TBVENDAS
alter CANCEL_DATAHORA position 42;

alter table TBVENDAS
alter CANCEL_MOTIVO position 43;

alter table TBVENDAS
alter XML_NFE_FILENAME position 44;

alter table TBVENDAS
alter NFE_VALOR_BASE_ICMS position 45;

alter table TBVENDAS
alter NFE_VALOR_ICMS position 46;

alter table TBVENDAS
alter NFE_VALOR_BASE_ICMS_SUBST position 47;

alter table TBVENDAS
alter NFE_VALOR_ICMS_SUBST position 48;

alter table TBVENDAS
alter NFE_VALOR_TOTAL_PRODUTO position 49;

alter table TBVENDAS
alter NFE_VALOR_FRETE position 50;

alter table TBVENDAS
alter NFE_VALOR_SEGURO position 51;

alter table TBVENDAS
alter NFE_VALOR_DESCONTO position 52;

alter table TBVENDAS
alter NFE_VALOR_TOTAL_II position 53;

alter table TBVENDAS
alter NFE_VALOR_TOTAL_IPI position 54;

alter table TBVENDAS
alter NFE_VALOR_PIS position 55;

alter table TBVENDAS
alter NFE_VALOR_COFINS position 56;

alter table TBVENDAS
alter NFE_VALOR_OUTROS position 57;

alter table TBVENDAS
alter NFE_VALOR_TOTAL_NOTA position 58;




/*------ SYSDBA 14/02/2013 11:14:17 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_vendasitens_total_venda for tvendasitens
active after insert or update or delete position 10
AS
  declare variable anovenda Smallint;
  declare variable numvenda Integer;
  declare variable total_bruto Dmn_money;
  declare variable total_desconto dmn_money;
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
      sum( coalesce(i.total_bruto,    0) )
    , sum( coalesce(i.total_desconto, 0) )
  from TVENDASITENS i
  where i.Ano = :Anovenda
    and i.Codcontrol = :Numvenda
  into
      Total_bruto
    , Total_desconto;

  Total_bruto    = coalesce(:Total_bruto, 0);
  Total_desconto = coalesce(:Total_desconto, 0);
  total_liquido  = :Total_bruto - :Total_desconto;

  Update TBVENDAS v Set
      v.Totalvenda_bruta = :Total_bruto
    , v.Desconto   = :Total_desconto
    , v.Totalvenda = :Total_liquido
  where v.Ano = :Anovenda
    and v.Codcontrol = :Numvenda;
end^

SET TERM ; ^




/*------ SYSDBA 14/02/2013 11:32:21 --------*/

COMMENT ON COLUMN TBVENDAS.TOTALVENDA_BRUTA IS
'Total Venda Bruta (Total Produto).';




/*------ SYSDBA 14/02/2013 11:32:37 --------*/

COMMENT ON COLUMN TBVENDAS.TOTALVENDA_BRUTA IS
'Valor Total Venda Bruta (Total Produto).';




/*------ SYSDBA 14/02/2013 11:33:23 --------*/

COMMENT ON COLUMN TBVENDAS.TOTALVENDA IS
'Valor Total Venda Liquida (Total Nota, na maioria dos casos).';




/*------ SYSDBA 29/04/2013 18:25:50 --------*/

ALTER TABLE TBFORNECEDOR
    ADD TRANSPORTADORA DMN_LOGICO DEFAULT 0;

COMMENT ON COLUMN TBFORNECEDOR.TRANSPORTADORA IS
'Transportadora:
0 - Nao
1 - Sim';




/*------ SYSDBA 01/05/2013 19:18:22 --------*/

ALTER TABLE TBVENDAS
    ADD NFE_MODALIDADE_FRETE DMN_SMALLINT_NN,
    ADD NFE_TRANSPORTADORA DMN_INTEGER_N;

COMMENT ON COLUMN TBVENDAS.NFE_MODALIDADE_FRETE IS
'Modalidade Frete:
0 -  (0) Por conta do Emitente
1 -  (1) Por conta do Destinatario
2 -  (2) Por conta de Terceiros
3 -  (9) Sem Frete';

COMMENT ON COLUMN TBVENDAS.NFE_TRANSPORTADORA IS
'Transportadora:

Codigo do Fornecedor do Servico de Transporte.';




/*------ SYSDBA 01/05/2013 19:18:44 --------*/

ALTER TABLE TBVENDAS ADD IBE$$TEMP_COLUMN
 SMALLINT DEFAULT 3
;

UPDATE RDB$RELATION_FIELDS F1
SET
F1.RDB$DEFAULT_VALUE  = (SELECT F2.RDB$DEFAULT_VALUE
                         FROM RDB$RELATION_FIELDS F2
                         WHERE (F2.RDB$RELATION_NAME = 'TBVENDAS') AND
                               (F2.RDB$FIELD_NAME = 'IBE$$TEMP_COLUMN')),
F1.RDB$DEFAULT_SOURCE = (SELECT F3.RDB$DEFAULT_SOURCE FROM RDB$RELATION_FIELDS F3
                         WHERE (F3.RDB$RELATION_NAME = 'TBVENDAS') AND
                               (F3.RDB$FIELD_NAME = 'IBE$$TEMP_COLUMN'))
WHERE (F1.RDB$RELATION_NAME = 'TBVENDAS') AND
      (F1.RDB$FIELD_NAME = 'NFE_MODALIDADE_FRETE');

ALTER TABLE TBVENDAS DROP IBE$$TEMP_COLUMN;




/*------ SYSDBA 01/05/2013 19:19:04 --------*/

alter table TBVENDAS
alter column ANO position 1;


/*------ SYSDBA 01/05/2013 19:19:04 --------*/

alter table TBVENDAS
alter column CODCONTROL position 2;


/*------ SYSDBA 01/05/2013 19:19:04 --------*/

alter table TBVENDAS
alter column CODEMP position 3;


/*------ SYSDBA 01/05/2013 19:19:04 --------*/

alter table TBVENDAS
alter column CODCLI position 4;


/*------ SYSDBA 01/05/2013 19:19:04 --------*/

alter table TBVENDAS
alter column DTVENDA position 5;


/*------ SYSDBA 01/05/2013 19:19:04 --------*/

alter table TBVENDAS
alter column STATUS position 6;


/*------ SYSDBA 01/05/2013 19:19:04 --------*/

alter table TBVENDAS
alter column TOTALVENDA_BRUTA position 7;


/*------ SYSDBA 01/05/2013 19:19:04 --------*/

alter table TBVENDAS
alter column DESCONTO position 8;


/*------ SYSDBA 01/05/2013 19:19:04 --------*/

alter table TBVENDAS
alter column TOTALVENDA position 9;


/*------ SYSDBA 01/05/2013 19:19:04 --------*/

alter table TBVENDAS
alter column DTFINALIZACAO_VENDA position 10;


/*------ SYSDBA 01/05/2013 19:19:04 --------*/

alter table TBVENDAS
alter column OBS position 11;


/*------ SYSDBA 01/05/2013 19:19:04 --------*/

alter table TBVENDAS
alter column FORMAPAG position 12;


/*------ SYSDBA 01/05/2013 19:19:04 --------*/

alter table TBVENDAS
alter column FATDIAS position 13;


/*------ SYSDBA 01/05/2013 19:19:04 --------*/

alter table TBVENDAS
alter column SERIE position 14;


/*------ SYSDBA 01/05/2013 19:19:04 --------*/

alter table TBVENDAS
alter column NFE position 15;


/*------ SYSDBA 01/05/2013 19:19:04 --------*/

alter table TBVENDAS
alter column DATAEMISSAO position 16;


/*------ SYSDBA 01/05/2013 19:19:04 --------*/

alter table TBVENDAS
alter column HORAEMISSAO position 17;


/*------ SYSDBA 01/05/2013 19:19:04 --------*/

alter table TBVENDAS
alter column CFOP position 18;


/*------ SYSDBA 01/05/2013 19:19:04 --------*/

alter table TBVENDAS
alter column VERIFICADOR_NFE position 19;


/*------ SYSDBA 01/05/2013 19:19:04 --------*/

alter table TBVENDAS
alter column XML_NFE position 20;


/*------ SYSDBA 01/05/2013 19:19:04 --------*/

alter table TBVENDAS
alter column VENDEDOR_COD position 21;


/*------ SYSDBA 01/05/2013 19:19:04 --------*/

alter table TBVENDAS
alter column USUARIO position 22;


/*------ SYSDBA 01/05/2013 19:19:04 --------*/

alter table TBVENDAS
alter column FORMAPAGTO_COD position 23;


/*------ SYSDBA 01/05/2013 19:19:04 --------*/

alter table TBVENDAS
alter column CONDICAOPAGTO_COD position 24;


/*------ SYSDBA 01/05/2013 19:19:04 --------*/

alter table TBVENDAS
alter column VENDA_PRAZO position 25;


/*------ SYSDBA 01/05/2013 19:19:04 --------*/

alter table TBVENDAS
alter column PRAZO_01 position 26;


/*------ SYSDBA 01/05/2013 19:19:04 --------*/

alter table TBVENDAS
alter column PRAZO_02 position 27;


/*------ SYSDBA 01/05/2013 19:19:04 --------*/

alter table TBVENDAS
alter column PRAZO_03 position 28;


/*------ SYSDBA 01/05/2013 19:19:04 --------*/

alter table TBVENDAS
alter column PRAZO_04 position 29;


/*------ SYSDBA 01/05/2013 19:19:04 --------*/

alter table TBVENDAS
alter column PRAZO_05 position 30;


/*------ SYSDBA 01/05/2013 19:19:04 --------*/

alter table TBVENDAS
alter column PRAZO_06 position 31;


/*------ SYSDBA 01/05/2013 19:19:04 --------*/

alter table TBVENDAS
alter column PRAZO_07 position 32;


/*------ SYSDBA 01/05/2013 19:19:04 --------*/

alter table TBVENDAS
alter column PRAZO_08 position 33;


/*------ SYSDBA 01/05/2013 19:19:04 --------*/

alter table TBVENDAS
alter column PRAZO_09 position 34;


/*------ SYSDBA 01/05/2013 19:19:04 --------*/

alter table TBVENDAS
alter column PRAZO_10 position 35;


/*------ SYSDBA 01/05/2013 19:19:04 --------*/

alter table TBVENDAS
alter column PRAZO_11 position 36;


/*------ SYSDBA 01/05/2013 19:19:04 --------*/

alter table TBVENDAS
alter column PRAZO_12 position 37;


/*------ SYSDBA 01/05/2013 19:19:04 --------*/

alter table TBVENDAS
alter column LOTE_NFE_ANO position 38;


/*------ SYSDBA 01/05/2013 19:19:04 --------*/

alter table TBVENDAS
alter column LOTE_NFE_NUMERO position 39;


/*------ SYSDBA 01/05/2013 19:19:04 --------*/

alter table TBVENDAS
alter column NFE_ENVIADA position 40;


/*------ SYSDBA 01/05/2013 19:19:04 --------*/

alter table TBVENDAS
alter column CANCEL_USUARIO position 41;


/*------ SYSDBA 01/05/2013 19:19:04 --------*/

alter table TBVENDAS
alter column CANCEL_DATAHORA position 42;


/*------ SYSDBA 01/05/2013 19:19:04 --------*/

alter table TBVENDAS
alter column CANCEL_MOTIVO position 43;


/*------ SYSDBA 01/05/2013 19:19:04 --------*/

alter table TBVENDAS
alter column XML_NFE_FILENAME position 44;


/*------ SYSDBA 01/05/2013 19:19:04 --------*/

alter table TBVENDAS
alter column NFE_MODALIDADE_FRETE position 45;


/*------ SYSDBA 01/05/2013 19:19:04 --------*/

alter table TBVENDAS
alter column NFE_TRANSPORTADORA position 46;


/*------ SYSDBA 01/05/2013 19:19:04 --------*/

alter table TBVENDAS
alter column NFE_VALOR_BASE_ICMS position 47;


/*------ SYSDBA 01/05/2013 19:19:04 --------*/

alter table TBVENDAS
alter column NFE_VALOR_ICMS position 48;


/*------ SYSDBA 01/05/2013 19:19:04 --------*/

alter table TBVENDAS
alter column NFE_VALOR_BASE_ICMS_SUBST position 49;


/*------ SYSDBA 01/05/2013 19:19:04 --------*/

alter table TBVENDAS
alter column NFE_VALOR_ICMS_SUBST position 50;


/*------ SYSDBA 01/05/2013 19:19:04 --------*/

alter table TBVENDAS
alter column NFE_VALOR_TOTAL_PRODUTO position 51;


/*------ SYSDBA 01/05/2013 19:19:04 --------*/

alter table TBVENDAS
alter column NFE_VALOR_FRETE position 52;


/*------ SYSDBA 01/05/2013 19:19:04 --------*/

alter table TBVENDAS
alter column NFE_VALOR_SEGURO position 53;


/*------ SYSDBA 01/05/2013 19:19:04 --------*/

alter table TBVENDAS
alter column NFE_VALOR_DESCONTO position 54;


/*------ SYSDBA 01/05/2013 19:19:04 --------*/

alter table TBVENDAS
alter column NFE_VALOR_TOTAL_II position 55;


/*------ SYSDBA 01/05/2013 19:19:04 --------*/

alter table TBVENDAS
alter column NFE_VALOR_TOTAL_IPI position 56;


/*------ SYSDBA 01/05/2013 19:19:04 --------*/

alter table TBVENDAS
alter column NFE_VALOR_PIS position 57;


/*------ SYSDBA 01/05/2013 19:19:04 --------*/

alter table TBVENDAS
alter column NFE_VALOR_COFINS position 58;


/*------ SYSDBA 01/05/2013 19:19:04 --------*/

alter table TBVENDAS
alter column NFE_VALOR_OUTROS position 59;


/*------ SYSDBA 01/05/2013 19:19:04 --------*/

alter table TBVENDAS
alter column NFE_VALOR_TOTAL_NOTA position 60;


/*------ SYSDBA 01/05/2013 19:40:14 --------*/

COMMENT ON COLUMN TBVENDAS.NFE_MODALIDADE_FRETE IS
'Modalidade Frete:
0 -  (0) Por conta do Emitente               [CIF - (Cost, Insurance and Freight - “Custo, Seguros e Frete”)]
1 -  (1) Por conta do Destinatario/Remetente [FOB - (Free on Board - “Livre a bordo”)]
2 -  (2) Por conta de Terceiros
3 -  (9) Sem Frete';




/*------ SYSDBA 01/05/2013 19:48:22 --------*/

ALTER TABLE TBVENDAS
    ADD NFE_PLACA_VEICULO DMN_VCHAR_10,
    ADD NFE_PLACA_UF DMN_VCHAR_02,
    ADD NFE_PLACA_RNTC DMN_VCHAR_10;

COMMENT ON COLUMN TBVENDAS.NFE_PLACA_VEICULO IS
'Placa do Veiculo de Transporte.';

COMMENT ON COLUMN TBVENDAS.NFE_PLACA_UF IS
'UF da Placa do Veiculo.';

COMMENT ON COLUMN TBVENDAS.NFE_PLACA_RNTC IS
'RNCT do Veiculo.

RNTC - Registros Nacional de Transportes de Carga (Identificacao do vagao quando o transporte for Trem)';

alter table TBVENDAS
alter ANO position 1;

alter table TBVENDAS
alter CODCONTROL position 2;

alter table TBVENDAS
alter CODEMP position 3;

alter table TBVENDAS
alter CODCLI position 4;

alter table TBVENDAS
alter DTVENDA position 5;

alter table TBVENDAS
alter STATUS position 6;

alter table TBVENDAS
alter TOTALVENDA_BRUTA position 7;

alter table TBVENDAS
alter DESCONTO position 8;

alter table TBVENDAS
alter TOTALVENDA position 9;

alter table TBVENDAS
alter DTFINALIZACAO_VENDA position 10;

alter table TBVENDAS
alter OBS position 11;

alter table TBVENDAS
alter FORMAPAG position 12;

alter table TBVENDAS
alter FATDIAS position 13;

alter table TBVENDAS
alter SERIE position 14;

alter table TBVENDAS
alter NFE position 15;

alter table TBVENDAS
alter DATAEMISSAO position 16;

alter table TBVENDAS
alter HORAEMISSAO position 17;

alter table TBVENDAS
alter CFOP position 18;

alter table TBVENDAS
alter VERIFICADOR_NFE position 19;

alter table TBVENDAS
alter XML_NFE position 20;

alter table TBVENDAS
alter VENDEDOR_COD position 21;

alter table TBVENDAS
alter USUARIO position 22;

alter table TBVENDAS
alter FORMAPAGTO_COD position 23;

alter table TBVENDAS
alter CONDICAOPAGTO_COD position 24;

alter table TBVENDAS
alter VENDA_PRAZO position 25;

alter table TBVENDAS
alter PRAZO_01 position 26;

alter table TBVENDAS
alter PRAZO_02 position 27;

alter table TBVENDAS
alter PRAZO_03 position 28;

alter table TBVENDAS
alter PRAZO_04 position 29;

alter table TBVENDAS
alter PRAZO_05 position 30;

alter table TBVENDAS
alter PRAZO_06 position 31;

alter table TBVENDAS
alter PRAZO_07 position 32;

alter table TBVENDAS
alter PRAZO_08 position 33;

alter table TBVENDAS
alter PRAZO_09 position 34;

alter table TBVENDAS
alter PRAZO_10 position 35;

alter table TBVENDAS
alter PRAZO_11 position 36;

alter table TBVENDAS
alter PRAZO_12 position 37;

alter table TBVENDAS
alter LOTE_NFE_ANO position 38;

alter table TBVENDAS
alter LOTE_NFE_NUMERO position 39;

alter table TBVENDAS
alter NFE_ENVIADA position 40;

alter table TBVENDAS
alter CANCEL_USUARIO position 41;

alter table TBVENDAS
alter CANCEL_DATAHORA position 42;

alter table TBVENDAS
alter CANCEL_MOTIVO position 43;

alter table TBVENDAS
alter XML_NFE_FILENAME position 44;

alter table TBVENDAS
alter NFE_MODALIDADE_FRETE position 45;

alter table TBVENDAS
alter NFE_TRANSPORTADORA position 46;

alter table TBVENDAS
alter NFE_PLACA_VEICULO position 47;

alter table TBVENDAS
alter NFE_PLACA_UF position 48;

alter table TBVENDAS
alter NFE_PLACA_RNTC position 49;

alter table TBVENDAS
alter NFE_VALOR_BASE_ICMS position 50;

alter table TBVENDAS
alter NFE_VALOR_ICMS position 51;

alter table TBVENDAS
alter NFE_VALOR_BASE_ICMS_SUBST position 52;

alter table TBVENDAS
alter NFE_VALOR_ICMS_SUBST position 53;

alter table TBVENDAS
alter NFE_VALOR_TOTAL_PRODUTO position 54;

alter table TBVENDAS
alter NFE_VALOR_FRETE position 55;

alter table TBVENDAS
alter NFE_VALOR_SEGURO position 56;

alter table TBVENDAS
alter NFE_VALOR_DESCONTO position 57;

alter table TBVENDAS
alter NFE_VALOR_TOTAL_II position 58;

alter table TBVENDAS
alter NFE_VALOR_TOTAL_IPI position 59;

alter table TBVENDAS
alter NFE_VALOR_PIS position 60;

alter table TBVENDAS
alter NFE_VALOR_COFINS position 61;

alter table TBVENDAS
alter NFE_VALOR_OUTROS position 62;

alter table TBVENDAS
alter NFE_VALOR_TOTAL_NOTA position 63;




/*------ SYSDBA 01/05/2013 20:10:03 --------*/

create view vw_modalidade_frete ( codigo, descricao )
as

Select First 1
    0
  , '(0) Por conta do Emitente [CIF]'
from TBEMPRESA

union

Select First 1
    1
  , '(1) Por conta do Destinatario/Remetente [FOB]'
from TBEMPRESA

union

Select First 1
    3
  , '(9) Sem Frete'
from TBEMPRESA
;

GRANT ALL ON VW_MODALIDADE_FRETE TO "PUBLIC";

/*------ SYSDBA 01/05/2013 20:25:35 --------*/

update TBVENDAS v set v.nfe_modalidade_frete = 3 where v.nfe_modalidade_frete is null;
/*------ SYSDBA 01/05/2013 20:25:47 --------*/

COMMIT WORK;

/*!!! Error occured !!!
Invalid token.
Dynamic SQL Error.
SQL error code = -104.
Token unknown - line 53, column 34.
,.

*/



/*------ SYSDBA 06/05/2013 21:32:58 --------*/

CREATE TABLE TBVENDAS_VOLUME (
    ANO_VENDA DMN_SMALLINT_NN NOT NULL,
    CONTROLE_VENDA DMN_INTEGER_NN NOT NULL,
    SEQUENCIAL DMN_SMALLINT_NN NOT NULL,
    NUMERO DMN_VCHAR_50,
    QUANTIDADE DMN_SMALLINT_NN DEFAULT 1,
    ESPECIE DMN_VCHAR_50,
    MARCA DMN_VCHAR_50,
    PESO_BRUTO DMN_PERCENTUAL_3,
    PESO_LIQUIDO DMN_PERCENTUAL_3);

ALTER TABLE TBVENDAS_VOLUME
ADD CONSTRAINT PK_TBVENDAS_VOLUME
PRIMARY KEY (ANO_VENDA,CONTROLE_VENDA,SEQUENCIAL);

COMMENT ON COLUMN TBVENDAS_VOLUME.ANO_VENDA IS
'Ano Venda.';

COMMENT ON COLUMN TBVENDAS_VOLUME.CONTROLE_VENDA IS
'Controle Venda.';

COMMENT ON COLUMN TBVENDAS_VOLUME.SEQUENCIAL IS
'Sequencial.';

COMMENT ON COLUMN TBVENDAS_VOLUME.NUMERO IS
'Numero Volume.';

COMMENT ON COLUMN TBVENDAS_VOLUME.QUANTIDADE IS
'Quantidade Total de Volumes.';

COMMENT ON COLUMN TBVENDAS_VOLUME.ESPECIE IS
'Especie.';

COMMENT ON COLUMN TBVENDAS_VOLUME.MARCA IS
'Marca.';

COMMENT ON COLUMN TBVENDAS_VOLUME.PESO_BRUTO IS
'Peso Bruto.';

COMMENT ON COLUMN TBVENDAS_VOLUME.PESO_LIQUIDO IS
'Peso Liquido.';




/*------ SYSDBA 06/05/2013 21:33:19 --------*/

ALTER TABLE TBVENDAS_VOLUME
ADD CONSTRAINT FK_TBVENDAS_VOLUME
FOREIGN KEY (ANO_VENDA,CONTROLE_VENDA)
REFERENCES TBVENDAS(ANO,CODCONTROL)
ON DELETE CASCADE
ON UPDATE CASCADE;

GRANT ALL ON TBVENDAS_VOLUME TO "PUBLIC";

/*!!! Error occured !!!
Column does not belong to referenced table.
Dynamic SQL Error.
SQL error code = -206.
Column unknown.
PIS.INDICE_ABCR.
At line 2, column 109.

*/

/*!!! Error occured !!!
Column does not belong to referenced table.
Dynamic SQL Error.
SQL error code = -206.
Column unknown.
P.INDICE_ABCR.
At line 2, column 103.

*/

/*!!! Error occured !!!
Column does not belong to referenced table.
Dynamic SQL Error.
SQL error code = -206.
Column unknown.
P.INDICE_ABCR.
At line 2, column 103.

*/



/*------ SYSDBA 23/05/2013 16:37:50 --------*/

ALTER TABLE TBPRODUTO
    ADD PERCENTUAL_MARCKUP DMN_PERCENTUAL_3;

COMMENT ON COLUMN TBPRODUTO.PERCENTUAL_MARCKUP IS
'Percentual Marckup c/ 3 casas decimais.

Sugestao de composicao:
Percentual Marckup = (Lucro Desejado + Despesas Administrativas e de Venda) / Custo de Entrada';

alter table TBPRODUTO
alter CODIGO position 1;

alter table TBPRODUTO
alter COD position 2;

alter table TBPRODUTO
alter DESCRI position 3;

alter table TBPRODUTO
alter APRESENTACAO position 4;

alter table TBPRODUTO
alter DESCRI_APRESENTACAO position 5;

alter table TBPRODUTO
alter MODELO position 6;

alter table TBPRODUTO
alter PRECO position 7;

alter table TBPRODUTO
alter PRECO_PROMOCAO position 8;

alter table TBPRODUTO
alter REFERENCIA position 9;

alter table TBPRODUTO
alter SECAO position 10;

alter table TBPRODUTO
alter QTDE position 11;

alter table TBPRODUTO
alter UNIDADE position 12;

alter table TBPRODUTO
alter ESTOQMIN position 13;

alter table TBPRODUTO
alter CODGRUPO position 14;

alter table TBPRODUTO
alter CODFABRICANTE position 15;

alter table TBPRODUTO
alter CUSTOMEDIO position 16;

alter table TBPRODUTO
alter PERCENTUAL_MARCKUP position 17;

alter table TBPRODUTO
alter CODEMP position 18;

alter table TBPRODUTO
alter CODSECAO position 19;

alter table TBPRODUTO
alter CODORIGEM position 20;

alter table TBPRODUTO
alter CODTRIBUTACAO position 21;

alter table TBPRODUTO
alter CST position 22;

alter table TBPRODUTO
alter CSOSN position 23;

alter table TBPRODUTO
alter CST_PIS position 24;

alter table TBPRODUTO
alter CST_COFINS position 25;

alter table TBPRODUTO
alter NCM_SH position 26;

alter table TBPRODUTO
alter CODCFOP position 27;

alter table TBPRODUTO
alter CODBARRA_EAN position 28;

alter table TBPRODUTO
alter CODUNIDADE position 29;

alter table TBPRODUTO
alter ALIQUOTA_TIPO position 30;

alter table TBPRODUTO
alter ALIQUOTA position 31;

alter table TBPRODUTO
alter ALIQUOTA_CSOSN position 32;

alter table TBPRODUTO
alter ALIQUOTA_PIS position 33;

alter table TBPRODUTO
alter ALIQUOTA_COFINS position 34;

alter table TBPRODUTO
alter VALOR_IPI position 35;

alter table TBPRODUTO
alter RESERVA position 36;

alter table TBPRODUTO
alter PRODUTO_NOVO position 37;

alter table TBPRODUTO
alter COR_VEICULO position 38;

alter table TBPRODUTO
alter COMBUSTIVEL_VEICULO position 39;

alter table TBPRODUTO
alter TIPO_VEICULO position 40;

alter table TBPRODUTO
alter ANO_MODELO_VEICULO position 41;

alter table TBPRODUTO
alter ANO_FABRICACAO_VEICULO position 42;

alter table TBPRODUTO
alter RENAVAM_VEICULO position 43;

alter table TBPRODUTO
alter CHASSI_VEICULO position 44;

alter table TBPRODUTO
alter KILOMETRAGEM_VEICULO position 45;

alter table TBPRODUTO
alter SITUACAO_ATUAL_VEICULO position 46;

alter table TBPRODUTO
alter SITUACAO_HISTORICO_VEICULO position 47;

alter table TBPRODUTO
alter PERCENTUAL_REDUCAO_BC position 48;




/*------ SYSDBA 23/05/2013 16:41:26 --------*/

ALTER TABLE TBPRODUTO
    ADD PRECO_SUGERIDO DMN_MONEY;

COMMENT ON COLUMN TBPRODUTO.PRECO IS
'Preco Venda.';

COMMENT ON COLUMN TBPRODUTO.PRECO_SUGERIDO IS
'Preco Venda (Sugerido).';

alter table TBPRODUTO
alter CODIGO position 1;

alter table TBPRODUTO
alter COD position 2;

alter table TBPRODUTO
alter DESCRI position 3;

alter table TBPRODUTO
alter APRESENTACAO position 4;

alter table TBPRODUTO
alter DESCRI_APRESENTACAO position 5;

alter table TBPRODUTO
alter MODELO position 6;

alter table TBPRODUTO
alter PRECO position 7;

alter table TBPRODUTO
alter PRECO_PROMOCAO position 8;

alter table TBPRODUTO
alter REFERENCIA position 9;

alter table TBPRODUTO
alter SECAO position 10;

alter table TBPRODUTO
alter QTDE position 11;

alter table TBPRODUTO
alter UNIDADE position 12;

alter table TBPRODUTO
alter ESTOQMIN position 13;

alter table TBPRODUTO
alter CODGRUPO position 14;

alter table TBPRODUTO
alter CODFABRICANTE position 15;

alter table TBPRODUTO
alter CUSTOMEDIO position 16;

alter table TBPRODUTO
alter PERCENTUAL_MARCKUP position 17;

alter table TBPRODUTO
alter PRECO_SUGERIDO position 18;

alter table TBPRODUTO
alter CODEMP position 19;

alter table TBPRODUTO
alter CODSECAO position 20;

alter table TBPRODUTO
alter CODORIGEM position 21;

alter table TBPRODUTO
alter CODTRIBUTACAO position 22;

alter table TBPRODUTO
alter CST position 23;

alter table TBPRODUTO
alter CSOSN position 24;

alter table TBPRODUTO
alter CST_PIS position 25;

alter table TBPRODUTO
alter CST_COFINS position 26;

alter table TBPRODUTO
alter NCM_SH position 27;

alter table TBPRODUTO
alter CODCFOP position 28;

alter table TBPRODUTO
alter CODBARRA_EAN position 29;

alter table TBPRODUTO
alter CODUNIDADE position 30;

alter table TBPRODUTO
alter ALIQUOTA_TIPO position 31;

alter table TBPRODUTO
alter ALIQUOTA position 32;

alter table TBPRODUTO
alter ALIQUOTA_CSOSN position 33;

alter table TBPRODUTO
alter ALIQUOTA_PIS position 34;

alter table TBPRODUTO
alter ALIQUOTA_COFINS position 35;

alter table TBPRODUTO
alter VALOR_IPI position 36;

alter table TBPRODUTO
alter RESERVA position 37;

alter table TBPRODUTO
alter PRODUTO_NOVO position 38;

alter table TBPRODUTO
alter COR_VEICULO position 39;

alter table TBPRODUTO
alter COMBUSTIVEL_VEICULO position 40;

alter table TBPRODUTO
alter TIPO_VEICULO position 41;

alter table TBPRODUTO
alter ANO_MODELO_VEICULO position 42;

alter table TBPRODUTO
alter ANO_FABRICACAO_VEICULO position 43;

alter table TBPRODUTO
alter RENAVAM_VEICULO position 44;

alter table TBPRODUTO
alter CHASSI_VEICULO position 45;

alter table TBPRODUTO
alter KILOMETRAGEM_VEICULO position 46;

alter table TBPRODUTO
alter SITUACAO_ATUAL_VEICULO position 47;

alter table TBPRODUTO
alter SITUACAO_HISTORICO_VEICULO position 48;

alter table TBPRODUTO
alter PERCENTUAL_REDUCAO_BC position 49;


/*------ SYSDBA 23/05/2013 16:54:07 --------*/

Update TBPRODUTO p Set
    p.percentual_marckup = cast( (((p.preco - p.customedio) / p.customedio) * 100) as numeric(18,3) )
  , p.preco_sugerido     = cast( (p.customedio + (p.customedio * ((p.preco - p.customedio) / p.customedio))) as numeric(15,2) )
where (p.percentual_marckup is null)
  and (p.preco_sugerido is null)
  and (coalesce(p.customedio, 0) > 0)
;
/*------ SYSDBA 23/05/2013 16:54:11 --------*/

COMMIT WORK;

/*------ SYSDBA 23/05/2013 16:54:41 --------*/

--update TBVENDAS v set v.nfe_modalidade_frete = 3 where v.nfe_modalidade_frete is null
/*
Select
    p.codigo
  , p.descri
  , p.customedio
  , p.preco
  , p.percentual_marckup
  , p.preco_sugerido
  , cast( (((p.preco - p.customedio) / p.customedio) * 100) as numeric(18,3) ) as tmp_percentual_marckup
  , cast( (p.customedio + (p.customedio * ((p.preco - p.customedio) / p.customedio))) as numeric(15,2) ) as tmp_preco_sugerido
from TBPRODUTO p
--where (p.percentual_marckup is null)
--  and (p.preco_sugerido is null)
*/

Update TBPRODUTO p Set
    p.percentual_marckup = cast( (((p.preco - p.customedio) / p.customedio) * 100) as numeric(18,3) )
  , p.preco_sugerido     = cast( (p.customedio + (p.customedio * ((p.preco - p.customedio) / p.customedio))) as numeric(15,2) )
where (p.percentual_marckup is null)
  and (p.preco_sugerido is null)
  and (coalesce(p.customedio, 0) > 0);
/*------ SYSDBA 23/05/2013 16:54:43 --------*/

COMMIT WORK;

/*!!! Error occured !!!
Invalid token.
Dynamic SQL Error.
SQL error code = -104.
Token unknown - line 65, column 23.
>.

*/
