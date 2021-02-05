use clv_benefits;
show tables;

SELECT * FROM bnf_concepto;
EXPLAIN SELECT * FROM bnf_concepto c WHERE c.idbnf_concepto = 1;
DESC bnf_concepto;

SELECT * FROM bnf_condicion_variable;
EXPLAIN SELECT * FROM bnf_condicion_variable cv WHERE cv.idbnf_condicion_variable = 1;
DESC bnf_condicion_variable;

SELECT * FROM bnf_configuracion_clausula;

DESC bnf_configuracion_clausula;
SELECT
	bsc.idcontr_categoria_contrato,
	cc.nombre,
	cc.idbnf_configuracion_clausula,
	cc.texto,
	cc.*
FROM clv_benefits.bnf_configuracion_clausula cc
INNER JOIN clv_benefits.bnf_sub_concepto bsc ON bsc.idbnf_sub_concepto = cc.idbnf_sub_concepto
WHERE cc.nombre = 'Pagos.' AND bsc.idcontr_categoria_contrato IN (105,106,104);

SELECT * FROM bnf_sub_concepto;
EXPLAIN SELECT * FROM bnf_sub_concepto sc WHERE sc.idbnf_sub_concepto = 1;
DESC bnf_sub_concepto;

SELECT * FROM bnf_variable_beneficio;
EXPLAIN SELECT * FROM bnf_variable_beneficio vb WHERE vb.idbnf_variable_beneficio = 1;
DESC bnf_variable_beneficio;


-- {"can":"388","red":"387"}