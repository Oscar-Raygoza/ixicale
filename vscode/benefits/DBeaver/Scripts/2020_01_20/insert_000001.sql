-- subconcept 1. Commission
-- subconcepto
INSERT INTO clv_benefits.bnf_sub_concepto 
(idcontr_categoria_contrato, idbnf_concepto, descripcion, idioma, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES(97, 10, 'Commission', '{"1":"Commission"}', 1, '2019-10-24 22:35:08', 'jugomez', ' ', '2019-10-24 22:35:08');
-- clausula(s)
INSERT INTO clv_benefits.bnf_configuracion_clausula 
(idbnf_sub_concepto, opcional, nombre, texto, variables, limite_inferior, limite_superior, es_rango, rangos, booking_window_fecha_inicio, booking_window_fecha_fin, travel_window_fecha_inicio, travel_window_fecha_fin, propiedades, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion) 
VALUES((
    SELECT x.idbnf_sub_concepto FROM clv_benefits.bnf_sub_concepto x WHERE 
    usuario_creacion = "jugomez" AND
    fecha_creacion = "2019-10-24 22:35:08" AND
    x.idcontr_categoria_contrato = 97
), 0, 'Commission', '{"legal":{"1":"<p style=\\"text-align: justify;\\"><span style=\\"font-family: Arial, Helvetica, sans-serif; font-size: 10px;\\">Rates are commisionable to the group at&nbsp; @%COMMISSION@%. Please note the commission is calculated on the balance after deducting 3% hostipitality tax and $5.00 USD per person, per day, for gratuities from the above rates.&nbsp; Commissions will be paid via wire transfer. Please include this information in the invoice.</span></p><p style=\\"text-align: justify;\\"><span style=\\"font-family: Arial, Helvetica, sans-serif; font-size: 10px;\\">Invoices should be issued to:<br>Heron Development Corp.<br>RUC&nbsp;155618202-2-2015 <br>DV-50Torre Generali Piso 19 Av. Samuel Lewis. <br>Panamá, Panamá</span></p>"},"comercial":{"1":"<p style=\\"text-align: justify;\\"><span style=\\"font-family: Arial, Helvetica, sans-serif; font-size: 10px;\\">Rates are commisionable to the group&nbsp;at &nbsp;@%COMMISSION@ %. Please note the commission is calculated on the balance after deducting 3% hostipitality tax and $5.00 USD per person, per day, for gratuities from the above rates. </span></p>"}}', '["@%COMMISSION@","@%COMMISSION@"]', '0', '0', 0, '[{"selecto":true,"inicio":0,"fin":0}]', '2020-01-14', '2020-01-14', '2020-01-14', '2020-01-14', '["ZHBP","CDS","ZRCZ","ZHIM","ZHLB","ZPLB","ZMNI","ZMSU","ZRPL","ZHSP","ZMGR"]', 1, '2019-10-24 22:53:47', 'jugomez', 'ixicale', '2020-01-14 14:43:10');
-- variable(s)
INSERT INTO clv_benefits.bnf_condicion_variable
( idbnf_configuracion_clausula, idbnf_variable_beneficio, base, tipo_dato, override_rules, es_global, tag, tipo_rango, rangos, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES((
	SELECT bcc.idbnf_configuracion_clausula FROM clv_benefits.bnf_configuracion_clausula bcc WHERE
	usuario_creacion = "jugomez" AND
	fecha_creacion = "2019-10-24 22:53:47" AND
	idbnf_sub_concepto = (
        SELECT x.idbnf_sub_concepto FROM clv_benefits.bnf_sub_concepto x WHERE 
        usuario_creacion = "jugomez" AND
        fecha_creacion = "2019-10-24 22:35:08" AND
        x.idcontr_categoria_contrato = 97
	)
), 2, '{"0-0":"10"}', 1, '{"0-0":[{"auth_id":0,"min":"10","max":"12","level":0},{"auth_id":0,"min":"13","max":"15","level":1},{"auth_id":0,"min":"16","max":"20","level":2}]}', 1, '@%COMMISSION@', 0, '[{"selecto":true,"inicio":0,"fin":0}]', 1, '2019-10-24 22:53:47', 'jugomez', 'ixicale', '2020-01-14 14:43:11');
INSERT INTO clv_benefits.bnf_condicion_variable
( idbnf_configuracion_clausula, idbnf_variable_beneficio, base, tipo_dato, override_rules, es_global, tag, tipo_rango, rangos, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES((
	SELECT bcc.idbnf_configuracion_clausula FROM clv_benefits.bnf_configuracion_clausula bcc WHERE
	usuario_creacion = "jugomez" AND
	fecha_creacion = "2019-10-24 22:53:47" AND
	idbnf_sub_concepto = (
        SELECT x.idbnf_sub_concepto FROM clv_benefits.bnf_sub_concepto x WHERE 
        usuario_creacion = "jugomez" AND
        fecha_creacion = "2019-10-24 22:35:08" AND
        x.idcontr_categoria_contrato = 97
	)
), 2, '{"0-0":"10"}', 1, '{"0-0":[{"auth_id":0,"min":"10","max":"12","level":0},{"auth_id":0,"min":"13","max":"15","level":1},{"auth_id":0,"min":"16","max":"20","level":2}]}', 1, '@%COMMISSION@', 0, '[{"selecto":true,"inicio":0,"fin":0}]', 1, '2019-11-12 00:10:43', 'marrosas', 'ixicale', '2020-01-14 14:43:11');


-- subconcept 2. Commission Jamaica
-- subconcepto
INSERT INTO clv_benefits.bnf_sub_concepto
(idcontr_categoria_contrato, idbnf_concepto, descripcion, idioma, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES(97, 10, 'Commission Jamaica', '{"1":"Commission Jamaica"}', 1, '2019-10-24 22:54:56', 'jugomez', 'jugomez', '2019-10-24 22:56:30');

-- clausula(s)
INSERT INTO clv_benefits.bnf_configuracion_clausula
(idbnf_sub_concepto, opcional, nombre, texto, variables, limite_inferior, limite_superior, es_rango, rangos, booking_window_fecha_inicio, booking_window_fecha_fin, travel_window_fecha_inicio, travel_window_fecha_fin, propiedades, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES((
	SELECT x.idbnf_sub_concepto FROM clv_benefits.bnf_sub_concepto x WHERE 
	usuario_creacion = "jugomez" AND
	fecha_creacion = "2019-10-24 22:54:56" AND
	x.idcontr_categoria_contrato = 97
), 0, 'Commission Jamaica', '{"legal":{"1":"<p>Rates are commisionable to (Company Name) at&nbsp;@%COMMISSION@% %. Please note the commission is calculated on the balance after deducting $4.00 USD per person, per night for Hospitality Tax, 10% of GCT and 10% per person, per day, for gratuities from the above rates. </p>"},"comercial":{"1":"<p>Rates are commisionable to (Company Name) at @%COMMISSION@%. Please note the commission is calculated on the balance after deducting $4.00 USD per person, per night for Hospitality Tax, 10% of GCT and 10% per person, per day, for gratuities from the above rates. </p>"}}', '["@%COMMISSION@"]', '0', '0', 0, '[{"selecto":true,"inicio":0,"fin":0}]', '2019-11-20', '2019-11-20', '2019-11-20', '2019-11-20', '["ZCJG"]', 1, '2019-10-24 22:59:23', 'jugomez', 'ixicale', '2019-11-20 13:31:01');
-- variable
INSERT INTO clv_benefits.bnf_condicion_variable
(idbnf_configuracion_clausula, idbnf_variable_beneficio, base, tipo_dato, override_rules, es_global, tag, tipo_rango, rangos, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES((
	SELECT bcc.idbnf_configuracion_clausula FROM clv_benefits.bnf_configuracion_clausula bcc WHERE
	usuario_creacion = "jugomez" AND
	fecha_creacion = "2019-10-24 22:59:23" AND
	idbnf_sub_concepto = (
        SELECT x.idbnf_sub_concepto FROM clv_benefits.bnf_sub_concepto x WHERE 
        usuario_creacion = "jugomez" AND
        fecha_creacion = "2019-10-24 22:54:56" AND
        x.idcontr_categoria_contrato = 97
	)
), 2, '{"0-0":"10"}', 1, '{"0-0":[{"auth_id":0,"min":"10","max":"12","level":0},{"auth_id":0,"min":"13","max":"15","level":1},{"auth_id":0,"min":"16","max":"20","level":2}]}', 1, '@%COMMISSION@', 0, '[{"selecto":true,"inicio":0,"fin":0}]', 1, '2019-10-24 22:59:23', 'jugomez', 'ixicale', '2019-11-20 13:31:01');


-- subconcept 3. 

