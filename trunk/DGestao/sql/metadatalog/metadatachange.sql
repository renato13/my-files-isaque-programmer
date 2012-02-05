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
