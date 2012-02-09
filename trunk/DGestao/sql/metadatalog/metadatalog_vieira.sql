


/*------ SYSDBA 01/02/2012 23:13:46 --------*/

CREATE TABLE TBFUNCAO (
    COD SMALLINT NOT NULL,
    FUNCAO VARCHAR(25));
alter table TBFUNCAO
add constraint PK_TBFUNCAO
primary key (COD);
CREATE SEQUENCE GEN_TBFUNCAO_ID;



/*------ SYSDBA 01/02/2012 23:14:00 --------*/

alter table TBFUNCAO
add constraint UNQ1_TBFUNCAO
unique (FUNCAO);



/*------ SYSDBA 01/02/2012 23:14:57 --------*/

ALTER TABLE TBUSERS DROP FUNCAO;



/*------ SYSDBA 01/02/2012 23:15:35 --------*/

update RDB$FIELDS set
RDB$FIELD_LENGTH = 16,
RDB$CHARACTER_LENGTH = 16
where RDB$FIELD_NAME = 'RDB$602'
;



/*------ SYSDBA 01/02/2012 23:16:18 --------*/

ALTER TABLE TBUSERS
    ADD CODFUNCAO SMALLINT NOT NULL;



/*------ SYSDBA 01/02/2012 23:16:31 --------*/

UPDATE TBUSERS
SET CODFUNCAO = 1;



/*------ SYSDBA 01/02/2012 23:24:30 --------*/

alter table TBUSERS
add constraint FK_TBUSERS_1
foreign key (CODFUNCAO)
references TBFUNCAO(COD);



/*------ SYSDBA 04/02/2012 09:19:23 --------*/

ALTER TABLE TBUSERS
    ADD LIMIDESC DECIMAL(2,2);



/*------ SYSDBA 04/02/2012 09:21:04 --------*/

ALTER TABLE TBUSERS ADD IBE$$TEMP_COLUMN
 NUMERIC(1,1) DEFAULT 0.00
;
UPDATE RDB$RELATION_FIELDS F1
SET
F1.RDB$DEFAULT_VALUE  = (SELECT F2.RDB$DEFAULT_VALUE
                         FROM RDB$RELATION_FIELDS F2
                         WHERE (F2.RDB$RELATION_NAME = 'TBUSERS') AND
                               (F2.RDB$FIELD_NAME = 'IBE$$TEMP_COLUMN')),
F1.RDB$DEFAULT_SOURCE = (SELECT F3.RDB$DEFAULT_SOURCE FROM RDB$RELATION_FIELDS F3
                         WHERE (F3.RDB$RELATION_NAME = 'TBUSERS') AND
                               (F3.RDB$FIELD_NAME = 'IBE$$TEMP_COLUMN'))
WHERE (F1.RDB$RELATION_NAME = 'TBUSERS') AND
      (F1.RDB$FIELD_NAME = 'LIMIDESC');
ALTER TABLE TBUSERS DROP IBE$$TEMP_COLUMN;



/*------ SYSDBA 08/02/2012 20:23:55 --------*/

CREATE TABLE TBNFE_ENVIADA (
    ANOVENDA SMALLINT NOT NULL,
    NUMVENDA INTEGER,
    DATAEMISSAO DATE,
    HORAEMISSAO TIME,
    SERIE DMN_VCHAR_04 NOT NULL,
    NUMERO DMN_BIGINT_NN NOT NULL,
    CHAVE VARCHAR(250),
    PROTOCOLO VARCHAR(250),
    RECIBO VARCHAR(250),
    XML_FILENAME VARCHAR(250),
    XML_FILE DMN_TEXTO);
alter table TBNFE_ENVIADA
add constraint PK_TBNFE_ENVIADA
primary key (SERIE,NUMERO);



/*------ SYSDBA 08/02/2012 20:30:44 --------*/

ALTER TABLE TBNFE_ENVIADA
    ADD LOTE_ANO SMALLINT,
    ADD LOTE_NUM DMN_BIGINT_NN;



/*------ SYSDBA 08/02/2012 20:38:29 --------*/

SET TERM ^ ;

CREATE trigger tg_nfe_atualizar_venda for tbnfe_enviada
active after insert position 0
AS
begin
  if ( (new.anovenda > 0) and (new.numvenda > 0) ) then
  begin
    Update TBVENDAS v Set
        v.serie = new.serie
      , v.nfe   = new.numero
      , v.verificador_nfe  = new.chave
      , v.xml_nfe_filename = new.xml_filename
      , v.xml_nfe          = new.xml_file
      , v.status      = 4 -- Nota Fiscal Gerada
      , v.dataemissao = new.dataemissao
      , v.horaemissao = new.horaemissao
    where v.ano = new.anovenda
      and v.codcontrol = new.numvenda;
  end 
end
^

SET TERM ; ^




/*------ SYSDBA 08/02/2012 21:27:57 --------*/

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

      -- Gerar histórico
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
        , user
        , 'Venda no valor de R$ ' || :Valor_produto
      );

      -- Cancelar Contas A Receber
      Update TBCONTREC r Set
        r.status = 'CANCELADA'
      where r.anovenda = new.ano
        and r.numvenda = new.codcontrol;
    end
     
  end 
end
^

SET TERM ; ^

