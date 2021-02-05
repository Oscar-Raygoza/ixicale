USE clv_benefits;

ALTER TABLE clv_benefits.bnf_configuracion_clausula ADD n_posicion INT(11) DEFAULT '0' NOT NULL COMMENT 'Orden o posicion de la clausula' AFTER idbnf_sub_concepto;

SELECT
	cc.n_posicion `order`,
	c.idbnf_concepto,
	sc.idbnf_sub_concepto,
	cc.idbnf_configuracion_clausula,
	-- cv.idbnf_condicion_variable,
	c.idioma AS descripcion_concepto,
	sc.idioma AS descripcion_sub_concepto,
	cc.texto,
	cc.nombre,
	-- cv.base var_base,
-- 	cv.tipo_dato var_tipo_dato,
-- 	cv.override_rules var_override_rules,
-- 	cv.rangos var_rangos,
-- 	cv.tipo_rango var_tipo_rango,
-- 	cv.idbnf_variable_beneficio var_idbnf_variable_beneficio,
-- 	cv.es_global var_es_global,
-- 	cv.tag tag,
	cc.es_rango es_rango,
	cc.rangos,
	cc.opcional,
	cc.booking_window_fecha_inicio,
	cc.booking_window_fecha_fin,
	cc.travel_window_fecha_inicio,
	cc.travel_window_fecha_fin,
	cc.variables,
	cc.propiedades,
	cc.idfrm_auth_concepto
FROM
	bnf_sub_concepto sc
inner join bnf_configuracion_clausula cc on
	cc.idbnf_sub_concepto = sc.idbnf_sub_concepto
-- INNER JOIN bnf_condicion_variable cv ON
--  cv.idbnf_configuracion_clausula = cc.idbnf_configuracion_clausula
INNER JOIN bnf_concepto c ON
	c.idbnf_concepto = sc.idbnf_concepto
WHERE
	sc.idcontr_categoria_contrato = :id_template
	AND sc.estado = 1
	AND cc.estado = 1
order by
	sc.idbnf_concepto ASC,
	sc.idbnf_sub_concepto ASC,
	cc.n_posicion ASC,
	cc.idbnf_configuracion_clausula ASC
;




--  Auto-generated SQL script #202008281125
UPDATE clv_benefits.bnf_configuracion_clausula SET n_posicion=1 WHERE idbnf_configuracion_clausula=339;
UPDATE clv_benefits.bnf_configuracion_clausula SET n_posicion=2 WHERE idbnf_configuracion_clausula=340;
UPDATE clv_benefits.bnf_configuracion_clausula SET n_posicion=2 WHERE idbnf_configuracion_clausula=341;
UPDATE clv_benefits.bnf_configuracion_clausula SET n_posicion=3 WHERE idbnf_configuracion_clausula=342;
UPDATE clv_benefits.bnf_configuracion_clausula SET n_posicion=4 WHERE idbnf_configuracion_clausula=343;
UPDATE clv_benefits.bnf_configuracion_clausula SET n_posicion=5 WHERE idbnf_configuracion_clausula=344;
UPDATE clv_benefits.bnf_configuracion_clausula SET n_posicion=6 WHERE idbnf_configuracion_clausula=345;
UPDATE clv_benefits.bnf_configuracion_clausula SET n_posicion=7 WHERE idbnf_configuracion_clausula=346;
UPDATE clv_benefits.bnf_configuracion_clausula SET n_posicion=8 WHERE idbnf_configuracion_clausula=347;
UPDATE clv_benefits.bnf_configuracion_clausula SET n_posicion=9 WHERE idbnf_configuracion_clausula=348;
UPDATE clv_benefits.bnf_configuracion_clausula SET n_posicion=2 WHERE idbnf_configuracion_clausula=349;
UPDATE clv_benefits.bnf_configuracion_clausula SET n_posicion=10 WHERE idbnf_configuracion_clausula=350;


# 2020.08.31 template 125

UPDATE clv_benefits.bnf_configuracion_clausula SET n_posicion=15 WHERE idbnf_configuracion_clausula=520;
UPDATE clv_benefits.bnf_configuracion_clausula SET n_posicion=17 WHERE idbnf_configuracion_clausula=519;
UPDATE clv_benefits.bnf_configuracion_clausula SET n_posicion=16 WHERE idbnf_configuracion_clausula=470;
UPDATE clv_benefits.bnf_configuracion_clausula SET n_posicion=17 WHERE idbnf_configuracion_clausula=471;
UPDATE clv_benefits.bnf_configuracion_clausula SET n_posicion=16 WHERE idbnf_configuracion_clausula=469;
UPDATE clv_benefits.bnf_configuracion_clausula SET n_posicion=4 WHERE idbnf_configuracion_clausula=485;
UPDATE clv_benefits.bnf_configuracion_clausula SET n_posicion=3 WHERE idbnf_configuracion_clausula=462;
UPDATE clv_benefits.bnf_configuracion_clausula SET n_posicion=2 WHERE idbnf_configuracion_clausula=461;
UPDATE clv_benefits.bnf_configuracion_clausula SET n_posicion=1 WHERE idbnf_configuracion_clausula=453;
UPDATE clv_benefits.bnf_configuracion_clausula SET n_posicion=8 WHERE idbnf_configuracion_clausula=458;
UPDATE clv_benefits.bnf_configuracion_clausula SET n_posicion=7 WHERE idbnf_configuracion_clausula=457;
UPDATE clv_benefits.bnf_configuracion_clausula SET n_posicion=6 WHERE idbnf_configuracion_clausula=455;
UPDATE clv_benefits.bnf_configuracion_clausula SET n_posicion=5 WHERE idbnf_configuracion_clausula=454;
UPDATE clv_benefits.bnf_configuracion_clausula SET n_posicion=12 WHERE idbnf_configuracion_clausula=466;
UPDATE clv_benefits.bnf_configuracion_clausula SET n_posicion=11 WHERE idbnf_configuracion_clausula=463;
UPDATE clv_benefits.bnf_configuracion_clausula SET n_posicion=10 WHERE idbnf_configuracion_clausula=460;
UPDATE clv_benefits.bnf_configuracion_clausula SET n_posicion=9 WHERE idbnf_configuracion_clausula=459;
UPDATE clv_benefits.bnf_configuracion_clausula SET n_posicion=14 WHERE idbnf_configuracion_clausula=467;
UPDATE clv_benefits.bnf_configuracion_clausula SET n_posicion=13 WHERE idbnf_configuracion_clausula=465;



SELECT
	cc.n_posicion `order`,
	c.idbnf_concepto,
	sc.idbnf_sub_concepto,
	cc.idbnf_configuracion_clausula,
	c.idioma AS descripcion_concepto,
	sc.idioma AS descripcion_sub_concepto,
	cc.texto,
	cc.nombre,
    cc.id_referencia_clausula,
	cc.propiedades,
	cc.idfrm_auth_concepto
FROM
	bnf_sub_concepto sc
inner join bnf_configuracion_clausula cc on
	cc.idbnf_sub_concepto = sc.idbnf_sub_concepto
INNER JOIN bnf_concepto c ON
	c.idbnf_concepto = sc.idbnf_concepto
WHERE
	sc.idcontr_categoria_contrato = :id_template
	AND sc.estado = 1
	AND cc.estado = 1
order by
	sc.idbnf_concepto ASC,
	sc.idbnf_sub_concepto ASC,
	cc.n_posicion ASC,
	cc.idbnf_configuracion_clausula ASC
;