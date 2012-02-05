/* Alter View (Drop, Create)... */
/* Drop altered view: VW_TIPO_REGIME_NFE */
DROP VIEW VW_TIPO_REGIME_NFE;

/* Create altered view: VW_TIPO_REGIME_NFE */
/* Create view: VW_TIPO_REGIME_NFE (ViwData.CreateDependDef) */
CREATE VIEW VW_TIPO_REGIME_NFE(
CODIGO,
DESCRICAO)
 AS 
Select First 1
    0 as Codigo
  , 'Simples Nacional (1)' as Descricao
from TBORIGEMPROD

union

Select First 1
    1 as Codigo
  , 'Simples Excesso Receita (2)' as Descricao
from TBORIGEMPROD

union

Select First 1
    2 as Codigo
  , 'Regime Normal (3)' as Descricao
from TBORIGEMPROD
;

/* Create(Add) Crant */
GRANT ALL ON VW_TIPO_REGIME_NFE TO PUBLIC;

GRANT ALL ON VW_TIPO_REGIME_NFE TO SYSDBA WITH GRANT OPTION;


ALTER TABLE TBPRODUTO
    ADD CSOSN DMN_VCHAR_03,
    ADD ALIQUOTA_CSOSN DECIMAL(15,2) DEFAULT 0;
alter table TBPRODUTO
alter CODIGO position 1;
alter table TBPRODUTO
alter COD position 2;
alter table TBPRODUTO
alter DESCRI position 3;
alter table TBPRODUTO
alter MODELO position 4;
alter table TBPRODUTO
alter PRECO position 5;
alter table TBPRODUTO
alter REFERENCIA position 6;
alter table TBPRODUTO
alter SECAO position 7;
alter table TBPRODUTO
alter QTDE position 8;
alter table TBPRODUTO
alter UNIDADE position 9;
alter table TBPRODUTO
alter ESTOQMIN position 10;
alter table TBPRODUTO
alter CODGRUPO position 11;
alter table TBPRODUTO
alter CUSTOMEDIO position 12;
alter table TBPRODUTO
alter CODEMP position 13;
alter table TBPRODUTO
alter CODSECAO position 14;
alter table TBPRODUTO
alter CODORIGEM position 15;
alter table TBPRODUTO
alter CODTRIBUTACAO position 16;
alter table TBPRODUTO
alter CST position 17;
alter table TBPRODUTO
alter CSOSN position 18;
alter table TBPRODUTO
alter NCM_SH position 19;
alter table TBPRODUTO
alter CODCFOP position 20;
alter table TBPRODUTO
alter CODBARRA_EAN position 21;
alter table TBPRODUTO
alter CODUNIDADE position 22;
alter table TBPRODUTO
alter ALIQUOTA_TIPO position 23;
alter table TBPRODUTO
alter ALIQUOTA position 24;
alter table TBPRODUTO
alter ALIQUOTA_CSOSN position 25;
alter table TBPRODUTO
alter VALOR_IPI position 26;
alter table TBPRODUTO
alter RESERVA position 27;


ALTER TABLE TBTRIBUTACAO_TIPO
    ADD CRT SMALLINT;
COMMENT ON COLUMN TBTRIBUTACAO_TIPO.CRT IS
'Codigo do Regime Tributario.';


ALTER TABLE TBTRIBUTACAO_TIPO DROP CONSTRAINT PK_TBTRIBUTACAO_TIPO;


update RDB$RELATION_FIELDS set
RDB$FIELD_SOURCE = 'DMN_VCHAR_03'
where (RDB$FIELD_NAME = 'TPT_COD') and
(RDB$RELATION_NAME = 'TBTRIBUTACAO_TIPO')
;


alter table TBTRIBUTACAO_TIPO
add constraint PK_TBTRIBUTACAO_TIPO
primary key (TPT_COD);


DROP VIEW VW_TIPO_TRIBUTACAO;
CREATE VIEW VW_TIPO_TRIBUTACAO(
    TPT_COD,
    TPT_DESCRICAO,
    TPT_DESCRICAO_FULL,
    TPT_SIGLA,
    CRT)
AS
Select
    t.Tpt_cod
  , t.Tpt_descricao
  , t.Tpt_cod || ' - ' || t.Tpt_descricao as Tpt_descricao_full
  , t.Tpt_sigla
  , t.Crt
from TBTRIBUTACAO_TIPO t
;
GRANT SELECT, UPDATE, DELETE, INSERT, REFERENCES ON VW_TIPO_TRIBUTACAO TO "PUBLIC";


ALTER TABLE TVENDASITENS
    ADD ALIQUOTA_CSOSN DECIMAL(10,2) DEFAULT 0;
alter table TVENDASITENS
alter ANO position 1;
alter table TVENDASITENS
alter CODCONTROL position 2;
alter table TVENDASITENS
alter SEQ position 3;
alter table TVENDASITENS
alter CODPROD position 4;
alter table TVENDASITENS
alter CODEMP position 5;
alter table TVENDASITENS
alter CODCLI position 6;
alter table TVENDASITENS
alter DTVENDA position 7;
alter table TVENDASITENS
alter QTDE position 8;
alter table TVENDASITENS
alter PUNIT position 9;
alter table TVENDASITENS
alter DESCONTO position 10;
alter table TVENDASITENS
alter PFINAL position 11;
alter table TVENDASITENS
alter QTDEFINAL position 12;
alter table TVENDASITENS
alter UNID_COD position 13;
alter table TVENDASITENS
alter CFOP_COD position 14;
alter table TVENDASITENS
alter ALIQUOTA position 15;
alter table TVENDASITENS
alter ALIQUOTA_CSOSN position 16;
alter table TVENDASITENS
alter VALOR_IPI position 17;


ALTER TABLE TVENDASITENS ADD IBE$$TEMP_COLUMN
DECIMAL(10,2) DEFAULT 0;
UPDATE RDB$RELATION_FIELDS F1
SET
F1.RDB$DEFAULT_VALUE  = (SELECT F2.RDB$DEFAULT_VALUE
                         FROM RDB$RELATION_FIELDS F2
                         WHERE (F2.RDB$RELATION_NAME = 'TVENDASITENS') AND
                               (F2.RDB$FIELD_NAME = 'IBE$$TEMP_COLUMN')),
F1.RDB$DEFAULT_SOURCE = (SELECT F3.RDB$DEFAULT_SOURCE FROM RDB$RELATION_FIELDS F3
                         WHERE (F3.RDB$RELATION_NAME = 'TVENDASITENS') AND
                               (F3.RDB$FIELD_NAME = 'IBE$$TEMP_COLUMN'))
WHERE (F1.RDB$RELATION_NAME = 'TVENDASITENS') AND
      (F1.RDB$FIELD_NAME = 'ALIQUOTA');
ALTER TABLE TVENDASITENS DROP IBE$$TEMP_COLUMN;

/*------ SYSDBA 04/02/2012 23:13:14 --------*/

Update tbproduto p set p.Csosn = '102' where p.Codtributacao = '41';
COMMIT WORK;

/*------ SYSDBA 04/02/2012 23:13:52 --------*/

Update tbproduto p set p.Aliquota_csosn = 0;
COMMIT WORK;

/*------ SYSDBA 04/02/2012 23:17:52 --------*/

UPDATE OR INSERT INTO TBTRIBUTACAO_TIPO (TPT_COD, TPT_DESCRICAO, TPT_SIGLA, CRT)
                                 VALUES ('00', 'Tributada integralmente', NULL, 0)
                               MATCHING (TPT_COD);
UPDATE OR INSERT INTO TBTRIBUTACAO_TIPO (TPT_COD, TPT_DESCRICAO, TPT_SIGLA, CRT)
                                 VALUES ('10', 'Tributada e com cobrança de ICMS por substituição tributária', NULL, 0)
                               MATCHING (TPT_COD);
UPDATE OR INSERT INTO TBTRIBUTACAO_TIPO (TPT_COD, TPT_DESCRICAO, TPT_SIGLA, CRT)
                                 VALUES ('20', 'Com redução de base de cálculo', NULL, 0)
                               MATCHING (TPT_COD);
UPDATE OR INSERT INTO TBTRIBUTACAO_TIPO (TPT_COD, TPT_DESCRICAO, TPT_SIGLA, CRT)
                                 VALUES ('30', 'Isenta ou não tributada e com cobrança de ICMS por substituição tributária', NULL, 0)
                               MATCHING (TPT_COD);
UPDATE OR INSERT INTO TBTRIBUTACAO_TIPO (TPT_COD, TPT_DESCRICAO, TPT_SIGLA, CRT)
                                 VALUES ('40', 'Isenta', NULL, 0)
                               MATCHING (TPT_COD);
UPDATE OR INSERT INTO TBTRIBUTACAO_TIPO (TPT_COD, TPT_DESCRICAO, TPT_SIGLA, CRT)
                                 VALUES ('41', 'Não tributada', NULL, 0)
                               MATCHING (TPT_COD);
UPDATE OR INSERT INTO TBTRIBUTACAO_TIPO (TPT_COD, TPT_DESCRICAO, TPT_SIGLA, CRT)
                                 VALUES ('50', 'Suspensão', NULL, 0)
                               MATCHING (TPT_COD);
UPDATE OR INSERT INTO TBTRIBUTACAO_TIPO (TPT_COD, TPT_DESCRICAO, TPT_SIGLA, CRT)
                                 VALUES ('51', 'Diferimento', NULL, 0)
                               MATCHING (TPT_COD);
UPDATE OR INSERT INTO TBTRIBUTACAO_TIPO (TPT_COD, TPT_DESCRICAO, TPT_SIGLA, CRT)
                                 VALUES ('60', 'ICMS cobrado anteriormente por substituição tributária', NULL, 0)
                               MATCHING (TPT_COD);
UPDATE OR INSERT INTO TBTRIBUTACAO_TIPO (TPT_COD, TPT_DESCRICAO, TPT_SIGLA, CRT)
                                 VALUES ('70', 'Com redução de base de cálculo e cobrança de ICMS por substituição tributária', NULL, 0)
                               MATCHING (TPT_COD);
UPDATE OR INSERT INTO TBTRIBUTACAO_TIPO (TPT_COD, TPT_DESCRICAO, TPT_SIGLA, CRT)
                                 VALUES ('90', 'Outras', NULL, 0)
                               MATCHING (TPT_COD);
UPDATE OR INSERT INTO TBTRIBUTACAO_TIPO (TPT_COD, TPT_DESCRICAO, TPT_SIGLA, CRT)
                                 VALUES ('101', 'Tributada pelo Simples Nacional com permissão de crédito.', NULL, 1)
                               MATCHING (TPT_COD);
UPDATE OR INSERT INTO TBTRIBUTACAO_TIPO (TPT_COD, TPT_DESCRICAO, TPT_SIGLA, CRT)
                                 VALUES ('102', 'Tributada pelo Simples Nacional sem permissão de crédito.', NULL, 1)
                               MATCHING (TPT_COD);
UPDATE OR INSERT INTO TBTRIBUTACAO_TIPO (TPT_COD, TPT_DESCRICAO, TPT_SIGLA, CRT)
                                 VALUES ('103', 'Isenção do ICMS no Simples Nacional para faixa de receita bruta.', NULL, 1)
                               MATCHING (TPT_COD);
UPDATE OR INSERT INTO TBTRIBUTACAO_TIPO (TPT_COD, TPT_DESCRICAO, TPT_SIGLA, CRT)
                                 VALUES ('201', 'Tributada pelo SN com permissão de crédito e com cobrança do ICMS por Subst. Trib.', NULL, 1)
                               MATCHING (TPT_COD);
UPDATE OR INSERT INTO TBTRIBUTACAO_TIPO (TPT_COD, TPT_DESCRICAO, TPT_SIGLA, CRT)
                                 VALUES ('202', 'Tributada pelo SN sem permissão de crédito e com cobrança do ICMS por Subst. Trib.', NULL, 1)
                               MATCHING (TPT_COD);
UPDATE OR INSERT INTO TBTRIBUTACAO_TIPO (TPT_COD, TPT_DESCRICAO, TPT_SIGLA, CRT)
                                 VALUES ('203', 'Isenção do ICMS nos SN para faixa de receita bruta e com cobrança do ICMS por Subst. Trib.', NULL, 1)
                               MATCHING (TPT_COD);
UPDATE OR INSERT INTO TBTRIBUTACAO_TIPO (TPT_COD, TPT_DESCRICAO, TPT_SIGLA, CRT)
                                 VALUES ('300', 'Imune', NULL, 1)
                               MATCHING (TPT_COD);
UPDATE OR INSERT INTO TBTRIBUTACAO_TIPO (TPT_COD, TPT_DESCRICAO, TPT_SIGLA, CRT)
                                 VALUES ('400', 'Não tributada pelo Simples Nacional.', NULL, 1)
                               MATCHING (TPT_COD);
UPDATE OR INSERT INTO TBTRIBUTACAO_TIPO (TPT_COD, TPT_DESCRICAO, TPT_SIGLA, CRT)
                                 VALUES ('500', 'ICMS cobrado anteriormente por substituição tributária (substituído) ou por antecipação.', NULL, 1)
                               MATCHING (TPT_COD);
UPDATE OR INSERT INTO TBTRIBUTACAO_TIPO (TPT_COD, TPT_DESCRICAO, TPT_SIGLA, CRT)
                                 VALUES ('900', 'Outros', NULL, 1)
                               MATCHING (TPT_COD);

COMMIT WORK;
