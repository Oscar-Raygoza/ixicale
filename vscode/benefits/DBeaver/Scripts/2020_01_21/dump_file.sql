-- try to copy bnf_sub_concepto 1. 'Food and Beverage'.
INSERT INTO clv_benefits.bnf_sub_concepto 
(idcontr_categoria_contrato, idbnf_concepto, descripcion, idioma, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES(97, 9, 'Food and Beverage', '{"1":"Food and Beverage"}', 1, '2019-10-24 22:17:53', 'ersanchez', 'ixicale', NOW());
-- try to copy bnf_sub_concepto 2. 'Commission'.
INSERT INTO clv_benefits.bnf_sub_concepto 
(idcontr_categoria_contrato, idbnf_concepto, descripcion, idioma, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES(97, 10, 'Commission', '{"1":"Commission"}', 1, '2019-10-24 22:35:08', 'jugomez', 'ixicale', NOW());

-- try to copy bnf_configuracion_clausula 1. 'Commission'.
INSERT INTO clv_benefits.bnf_configuracion_clausula 
(idbnf_sub_concepto, opcional, nombre, texto, variables, limite_inferior, limite_superior, es_rango, rangos, booking_window_fecha_inicio, booking_window_fecha_fin, travel_window_fecha_inicio, travel_window_fecha_fin, propiedades, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES((
    SELECT x.idbnf_sub_concepto FROM clv_benefits.bnf_sub_concepto x WHERE
        x.usuario_creacion = "jugomez" AND
        x.fecha_creacion = "2019-10-24 22:35:08" AND
        x.idcontr_categoria_contrato = 97
    ORDER BY x.idbnf_sub_concepto DESC
    LIMIT 1
),
0, 'Commission', '{"legal":{"1":"<p style=\"text-align: justify;\"><span style=\"font-family: Arial, Helvetica, sans-serif; font-size: 10px;\">Rates are commisionable to the group at&nbsp; @%COMMISSION@%. Please note the commission is calculated on the balance after deducting 3% hostipitality tax and $5.00 USD per person, per day, for gratuities from the above rates.&nbsp; Commissions will be paid via wire transfer. Please include this information in the invoice.</span></p><p style=\"text-align: justify;\"><span style=\"font-family: Arial, Helvetica, sans-serif; font-size: 10px;\">Invoices should be issued to:<br>Heron Development Corp.<br>RUC&nbsp;155618202-2-2015 <br>DV-50Torre Generali Piso 19 Av. Samuel Lewis. <br>Panamá, Panamá</span></p>"},"comercial":{"1":"<p style=\"text-align: justify;\"><span style=\"font-family: Arial, Helvetica, sans-serif; font-size: 10px;\">Rates are commisionable to the group&nbsp;at &nbsp;@%COMMISSION@ %. Please note the commission is calculated on the balance after deducting 3% hostipitality tax and $5.00 USD per person, per day, for gratuities from the above rates. </span></p>"}}', '["@%COMMISSION@","@%COMMISSION@"]', '0', '0', 0, '[{"selecto":true,"inicio":0,"fin":0}]', '2020-01-14', '2020-01-14', '2020-01-14', '2020-01-14', '["ZHBP","CDS","ZRCZ","ZHIM","ZHLB","ZPLB","ZMNI","ZMSU","ZRPL","ZHSP","ZMGR"]', 1, '2019-10-24 22:53:47', 'jugomez', 'ixicale', NOW());

-- try to copy bnf_condicion_variable 1. '@%COMMISSION@'.
INSERT INTO clv_benefits.bnf_condicion_variable
( idbnf_configuracion_clausula, idbnf_variable_beneficio, base, tipo_dato, override_rules, es_global, tag, tipo_rango, rangos, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES((
	SELECT bcc.idbnf_configuracion_clausula FROM clv_benefits.bnf_configuracion_clausula bcc WHERE
	bcc.usuario_creacion = "jugomez" AND
    bcc.fecha_creacion = "2019-10-24 22:53:47" AND
	bcc.idbnf_sub_concepto = (
        SELECT x.idbnf_sub_concepto FROM clv_benefits.bnf_sub_concepto x WHERE
            x.usuario_creacion = "jugomez" AND
            x.fecha_creacion = "2019-10-24 22:35:08" AND
            x.idcontr_categoria_contrato = 97
        ORDER BY x.idbnf_sub_concepto DESC 
        LIMIT 1
	)
    ORDER BY bcc.idbnf_configuracion_clausula DESC 
    LIMIT 1
), 2, '{"0-0":"10"}', 1, '{"0-0":[{"auth_id":0,"min":"10","max":"12","level":0},{"auth_id":0,"min":"13","max":"15","level":1},{"auth_id":0,"min":"16","max":"20","level":2}]}', 1, '@%COMMISSION@', 0, '[{"selecto":true,"inicio":0,"fin":0}]', 1, '2019-10-24 22:53:47', 'jugomez', 'ixicale', NOW());

-- try to copy bnf_condicion_variable 33. '@%COMMISSION@'.
INSERT INTO clv_benefits.bnf_condicion_variable
( idbnf_configuracion_clausula, idbnf_variable_beneficio, base, tipo_dato, override_rules, es_global, tag, tipo_rango, rangos, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES((
	SELECT bcc.idbnf_configuracion_clausula FROM clv_benefits.bnf_configuracion_clausula bcc WHERE
	bcc.usuario_creacion = "jugomez" AND
    bcc.fecha_creacion = "2019-10-24 22:53:47" AND
	bcc.idbnf_sub_concepto = (
        SELECT x.idbnf_sub_concepto FROM clv_benefits.bnf_sub_concepto x WHERE
            x.usuario_creacion = "jugomez" AND
            x.fecha_creacion = "2019-10-24 22:35:08" AND
            x.idcontr_categoria_contrato = 97
        ORDER BY x.idbnf_sub_concepto DESC 
        LIMIT 1
	)
    ORDER BY bcc.idbnf_configuracion_clausula DESC 
    LIMIT 1
), 2, '{"0-0":"10"}', 1, '{"0-0":[{"auth_id":0,"min":"10","max":"12","level":0},{"auth_id":0,"min":"13","max":"15","level":1},{"auth_id":0,"min":"16","max":"20","level":2}]}', 1, '@%COMMISSION@', 0, '[{"selecto":true,"inicio":0,"fin":0}]', 1, '2019-11-12 00:10:43', 'marrosas', 'ixicale', NOW());

-- try to copy bnf_sub_concepto 3. 'Commission Jamaica'.
INSERT INTO clv_benefits.bnf_sub_concepto 
(idcontr_categoria_contrato, idbnf_concepto, descripcion, idioma, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES(97, 10, 'Commission Jamaica', '{"1":"Commission Jamaica"}', 1, '2019-10-24 22:54:56', 'jugomez', 'ixicale', NOW());

-- try to copy bnf_configuracion_clausula 2. 'Commission Jamaica'.
INSERT INTO clv_benefits.bnf_configuracion_clausula 
(idbnf_sub_concepto, opcional, nombre, texto, variables, limite_inferior, limite_superior, es_rango, rangos, booking_window_fecha_inicio, booking_window_fecha_fin, travel_window_fecha_inicio, travel_window_fecha_fin, propiedades, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES((
    SELECT x.idbnf_sub_concepto FROM clv_benefits.bnf_sub_concepto x WHERE
        x.usuario_creacion = "jugomez" AND
        x.fecha_creacion = "2019-10-24 22:54:56" AND
        x.idcontr_categoria_contrato = 97
    ORDER BY x.idbnf_sub_concepto DESC
    LIMIT 1
),
0, 'Commission Jamaica', '{"legal":{"1":"<p>Rates are commisionable to (Company Name) at&nbsp;@%COMMISSION@% %. Please note the commission is calculated on the balance after deducting $4.00 USD per person, per night for Hospitality Tax, 10% of GCT and 10% per person, per day, for gratuities from the above rates. </p>"},"comercial":{"1":"<p>Rates are commisionable to (Company Name) at @%COMMISSION@%. Please note the commission is calculated on the balance after deducting $4.00 USD per person, per night for Hospitality Tax, 10% of GCT and 10% per person, per day, for gratuities from the above rates. </p>"}}', '["@%COMMISSION@"]', '0', '0', 0, '[{"selecto":true,"inicio":0,"fin":0}]', '2019-11-20', '2019-11-20', '2019-11-20', '2019-11-20', '["ZCJG"]', 1, '2019-10-24 22:59:23', 'jugomez', 'ixicale', NOW());

-- try to copy bnf_condicion_variable 2. '@%COMMISSION@'.
INSERT INTO clv_benefits.bnf_condicion_variable
( idbnf_configuracion_clausula, idbnf_variable_beneficio, base, tipo_dato, override_rules, es_global, tag, tipo_rango, rangos, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES((
	SELECT bcc.idbnf_configuracion_clausula FROM clv_benefits.bnf_configuracion_clausula bcc WHERE
	bcc.usuario_creacion = "jugomez" AND
    bcc.fecha_creacion = "2019-10-24 22:59:23" AND
	bcc.idbnf_sub_concepto = (
        SELECT x.idbnf_sub_concepto FROM clv_benefits.bnf_sub_concepto x WHERE
            x.usuario_creacion = "jugomez" AND
            x.fecha_creacion = "2019-10-24 22:54:56" AND
            x.idcontr_categoria_contrato = 97
        ORDER BY x.idbnf_sub_concepto DESC 
        LIMIT 1
	)
    ORDER BY bcc.idbnf_configuracion_clausula DESC 
    LIMIT 1
), 2, '{"0-0":"10"}', 1, '{"0-0":[{"auth_id":0,"min":"10","max":"12","level":0},{"auth_id":0,"min":"13","max":"15","level":1},{"auth_id":0,"min":"16","max":"20","level":2}]}', 1, '@%COMMISSION@', 0, '[{"selecto":true,"inicio":0,"fin":0}]', 1, '2019-10-24 22:59:23', 'jugomez', 'ixicale', NOW());

-- try to copy bnf_condicion_variable 53. '@%COMMISSION@'.
INSERT INTO clv_benefits.bnf_condicion_variable
( idbnf_configuracion_clausula, idbnf_variable_beneficio, base, tipo_dato, override_rules, es_global, tag, tipo_rango, rangos, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES((
	SELECT bcc.idbnf_configuracion_clausula FROM clv_benefits.bnf_configuracion_clausula bcc WHERE
	bcc.usuario_creacion = "jugomez" AND
    bcc.fecha_creacion = "2019-10-24 22:59:23" AND
	bcc.idbnf_sub_concepto = (
        SELECT x.idbnf_sub_concepto FROM clv_benefits.bnf_sub_concepto x WHERE
            x.usuario_creacion = "jugomez" AND
            x.fecha_creacion = "2019-10-24 22:54:56" AND
            x.idcontr_categoria_contrato = 97
        ORDER BY x.idbnf_sub_concepto DESC 
        LIMIT 1
	)
    ORDER BY bcc.idbnf_configuracion_clausula DESC 
    LIMIT 1
), 2, '{"0-0":"10"}', 1, '{"0-0":[{"auth_id":0,"min":"10","max":"12","level":0},{"auth_id":0,"min":"13","max":"15","level":1},{"auth_id":0,"min":"16","max":"20","level":2}]}', 0, '@%COMMISSION@', 0, '[{"selecto":true,"inicio":0,"fin":0}]', 1, '2019-11-19 22:17:51', 'marrosas', 'ixicale', NOW());

-- try to copy bnf_sub_concepto 4. 'Commissions-staff, upgrade, comp.'.
INSERT INTO clv_benefits.bnf_sub_concepto 
(idcontr_categoria_contrato, idbnf_concepto, descripcion, idioma, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES(97, 10, 'Commissions-staff, upgrade, comp.', '{"1":"Commissions-staff, upgrade, comp."}', 1, '2019-10-24 23:00:02', 'jugomez', 'ixicale', NOW());

-- try to copy bnf_configuracion_clausula 3. 'Commission-staff, upgrade, comp'.
INSERT INTO clv_benefits.bnf_configuracion_clausula 
(idbnf_sub_concepto, opcional, nombre, texto, variables, limite_inferior, limite_superior, es_rango, rangos, booking_window_fecha_inicio, booking_window_fecha_fin, travel_window_fecha_inicio, travel_window_fecha_fin, propiedades, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES((
    SELECT x.idbnf_sub_concepto FROM clv_benefits.bnf_sub_concepto x WHERE
        x.usuario_creacion = "jugomez" AND
        x.fecha_creacion = "2019-10-24 23:00:02" AND
        x.idcontr_categoria_contrato = 97
    ORDER BY x.idbnf_sub_concepto DESC
    LIMIT 1
),
0, 'Commission-staff, upgrade, comp', '{"legal":{"1":"<p>  Discounted\n  rooms as staff or complimentary and room upgrades are no commissionable.</p>"},"comercial":{"1":"<p>  Discounted\n  rooms as staff or complimentary and room upgrades are no commissionable.</p>"}}', '[]', '0', '0', 0, '[{"selecto":true,"inicio":0,"fin":0}]', '2019-11-08', '2019-11-08', '2019-11-08', '2019-11-08', '["ZHBP","CDS","ZRCZ","ZHIM","ZHLB","ZPLB","ZMNI","ZMSU","ZCJG","ZRPL","ZHSP","ZMGR"]', 1, '2019-10-24 23:06:15', 'jugomez', 'ixicale', NOW());

-- try to copy bnf_condicion_variable 3. '@%COMMISSION@'.
INSERT INTO clv_benefits.bnf_condicion_variable
( idbnf_configuracion_clausula, idbnf_variable_beneficio, base, tipo_dato, override_rules, es_global, tag, tipo_rango, rangos, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES((
	SELECT bcc.idbnf_configuracion_clausula FROM clv_benefits.bnf_configuracion_clausula bcc WHERE
	bcc.usuario_creacion = "jugomez" AND
    bcc.fecha_creacion = "2019-10-24 23:06:15" AND
	bcc.idbnf_sub_concepto = (
        SELECT x.idbnf_sub_concepto FROM clv_benefits.bnf_sub_concepto x WHERE
            x.usuario_creacion = "jugomez" AND
            x.fecha_creacion = "2019-10-24 23:00:02" AND
            x.idcontr_categoria_contrato = 97
        ORDER BY x.idbnf_sub_concepto DESC 
        LIMIT 1
	)
    ORDER BY bcc.idbnf_configuracion_clausula DESC 
    LIMIT 1
), 1, '{"0-0":"__"}', 2, '{"0-0":[{"auth_id":"0","max":"","min":"","level":"1"}]}', 0, '@%COMMISSION@', 0, '[{"selecto":true,"inicio":0,"fin":0}]', 0, '2019-10-24 23:06:15', 'jugomez', 'ixicale', NOW());

-- try to copy bnf_condicion_variable 27. '@%COMMISSION@'.
INSERT INTO clv_benefits.bnf_condicion_variable
( idbnf_configuracion_clausula, idbnf_variable_beneficio, base, tipo_dato, override_rules, es_global, tag, tipo_rango, rangos, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES((
	SELECT bcc.idbnf_configuracion_clausula FROM clv_benefits.bnf_configuracion_clausula bcc WHERE
	bcc.usuario_creacion = "jugomez" AND
    bcc.fecha_creacion = "2019-10-24 23:06:15" AND
	bcc.idbnf_sub_concepto = (
        SELECT x.idbnf_sub_concepto FROM clv_benefits.bnf_sub_concepto x WHERE
            x.usuario_creacion = "jugomez" AND
            x.fecha_creacion = "2019-10-24 23:00:02" AND
            x.idcontr_categoria_contrato = 97
        ORDER BY x.idbnf_sub_concepto DESC 
        LIMIT 1
	)
    ORDER BY bcc.idbnf_configuracion_clausula DESC 
    LIMIT 1
), 1, '{"0-0":"__"}', 2, '{"0-0":[{"auth_id":"0","max":"","min":"","level":"1"}]}', 1, '@%COMMISSION@', 0, '[{"selecto":true,"inicio":0,"fin":0}]', 0, '2019-11-08 22:54:42', 'ixicale', 'ixicale', NOW());

-- try to copy bnf_condicion_variable 28. '@%COMMISSION@'.
INSERT INTO clv_benefits.bnf_condicion_variable
( idbnf_configuracion_clausula, idbnf_variable_beneficio, base, tipo_dato, override_rules, es_global, tag, tipo_rango, rangos, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES((
	SELECT bcc.idbnf_configuracion_clausula FROM clv_benefits.bnf_configuracion_clausula bcc WHERE
	bcc.usuario_creacion = "jugomez" AND
    bcc.fecha_creacion = "2019-10-24 23:06:15" AND
	bcc.idbnf_sub_concepto = (
        SELECT x.idbnf_sub_concepto FROM clv_benefits.bnf_sub_concepto x WHERE
            x.usuario_creacion = "jugomez" AND
            x.fecha_creacion = "2019-10-24 23:00:02" AND
            x.idcontr_categoria_contrato = 97
        ORDER BY x.idbnf_sub_concepto DESC 
        LIMIT 1
	)
    ORDER BY bcc.idbnf_configuracion_clausula DESC 
    LIMIT 1
), 1, '{"0-0":"__"}', 2, '{"0-0":[{"auth_id":"0","max":"","min":"","level":"1"}]}', 1, '@%COMMISSION@', 0, '[{"selecto":true,"inicio":0,"fin":0}]', 0, '2019-11-08 22:54:54', 'ersanchez', 'ixicale', NOW());

-- try to copy bnf_condicion_variable 29. '@%COMMISSION@'.
INSERT INTO clv_benefits.bnf_condicion_variable
( idbnf_configuracion_clausula, idbnf_variable_beneficio, base, tipo_dato, override_rules, es_global, tag, tipo_rango, rangos, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES((
	SELECT bcc.idbnf_configuracion_clausula FROM clv_benefits.bnf_configuracion_clausula bcc WHERE
	bcc.usuario_creacion = "jugomez" AND
    bcc.fecha_creacion = "2019-10-24 23:06:15" AND
	bcc.idbnf_sub_concepto = (
        SELECT x.idbnf_sub_concepto FROM clv_benefits.bnf_sub_concepto x WHERE
            x.usuario_creacion = "jugomez" AND
            x.fecha_creacion = "2019-10-24 23:00:02" AND
            x.idcontr_categoria_contrato = 97
        ORDER BY x.idbnf_sub_concepto DESC 
        LIMIT 1
	)
    ORDER BY bcc.idbnf_configuracion_clausula DESC 
    LIMIT 1
), 1, '{"0-0":"__"}', 2, '{"0-0":[{"auth_id":"0","max":"","min":"","level":"1"}]}', 1, '@%COMMISSION@', 0, '[{"selecto":true,"inicio":0,"fin":0}]', 0, '2019-11-08 22:54:54', 'ersanchez', 'ixicale', NOW());

-- try to copy bnf_sub_concepto 5. 'Comps'.
INSERT INTO clv_benefits.bnf_sub_concepto 
(idcontr_categoria_contrato, idbnf_concepto, descripcion, idioma, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES(97, 7, 'Comps', '{"1":"Comps"}', 1, '2019-10-24 23:10:26', 'jugomez', 'ixicale', NOW());

-- try to copy bnf_configuracion_clausula 4. 'Comps '.
INSERT INTO clv_benefits.bnf_configuracion_clausula 
(idbnf_sub_concepto, opcional, nombre, texto, variables, limite_inferior, limite_superior, es_rango, rangos, booking_window_fecha_inicio, booking_window_fecha_fin, travel_window_fecha_inicio, travel_window_fecha_fin, propiedades, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES((
    SELECT x.idbnf_sub_concepto FROM clv_benefits.bnf_sub_concepto x WHERE
        x.usuario_creacion = "jugomez" AND
        x.fecha_creacion = "2019-10-24 23:10:26" AND
        x.idcontr_categoria_contrato = 97
    ORDER BY x.idbnf_sub_concepto DESC
    LIMIT 1
),
0, 'Comps ', '{"legal":{"1":"<p><span style=\"font-family: Arial, Helvetica, sans-serif; font-size: 10px;\">The Company will cause the Hotel to provide one complimentary room, single or double occupancy for every&nbsp;@COMPS@ rooms paid nightly.&nbsp; These rooms are all-inclusive.&nbsp; (A mandatory charge of $10.00 USD per person, per night will be charged for complimentary rooms for tax and gratuities.)&nbsp; Maximum of&nbsp;@MAXCOMPS@ rooms.</span></p>"},"comercial":{"1":"<p><span style=\"font-size: 10px; font-family: Arial, Helvetica, sans-serif;\">Complimentary Rooms: One Complimentary room, single or double occupancy for every @COMPS@&nbsp;rooms paid&nbsp;nightly.  These rooms are all-inclusive. A mandatory charge of $10.00 USD per person, per night will be charged for complimentary rooms for tax and gratuities, to a maximum of&nbsp;@MAXCOMPS@ rooms.</span></p>"}}', '["@MAXCOMPS@","@COMPS@"]', '0', '0', 1, '[{"selecto":true,"inicio":10,"fin":149},{"inicio":150,"fin":499},{"inicio":500,"fin":10000}]', '2019-12-11', '2019-12-11', '2019-12-11', '2019-12-11', '["ZHBP","CDS","ZRCZ","ZHIM","ZHLB","ZPLB","ZMNI","ZMSU","ZCJG","ZRPL","ZHSP","ZMGR"]', 1, '2019-10-25 00:04:33', 'jugomez', 'ixicale', NOW());

-- try to copy bnf_condicion_variable 4. '@MAXCOMPS@'.
INSERT INTO clv_benefits.bnf_condicion_variable
( idbnf_configuracion_clausula, idbnf_variable_beneficio, base, tipo_dato, override_rules, es_global, tag, tipo_rango, rangos, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES((
	SELECT bcc.idbnf_configuracion_clausula FROM clv_benefits.bnf_configuracion_clausula bcc WHERE
	bcc.usuario_creacion = "jugomez" AND
    bcc.fecha_creacion = "2019-10-25 00:04:33" AND
	bcc.idbnf_sub_concepto = (
        SELECT x.idbnf_sub_concepto FROM clv_benefits.bnf_sub_concepto x WHERE
            x.usuario_creacion = "jugomez" AND
            x.fecha_creacion = "2019-10-24 23:10:26" AND
            x.idcontr_categoria_contrato = 97
        ORDER BY x.idbnf_sub_concepto DESC 
        LIMIT 1
	)
    ORDER BY bcc.idbnf_configuracion_clausula DESC 
    LIMIT 1
), 3, '{"10-149":"1","150-499":"1","500-10000":"10"}', 1, '{"10-149":[{"auth_id":0,"min":"1","max":"6","level":0},{"auth_id":0,"min":"7","max":"10","level":1},{"auth_id":0,"min":"11","max":"20","level":2}],"150-499":[{"auth_id":0,"min":"1","max":"10","level":0},{"auth_id":0,"min":"11","max":"15","level":1},{"auth_id":0,"min":"16","max":"20","level":2}],"500-10000":[{"auth_id":0,"min":"1","max":"10","level":0},{"auth_id":0,"min":"11","max":"15","level":1},{"auth_id":0,"min":"16","max":"20","level":2}]}', 1, '@MAXCOMPS@', 1, '[{"selecto":false,"inicio":10,"fin":149},{"selecto":false,"inicio":150,"fin":499},{"selecto":true,"inicio":500,"fin":10000}]', 1, '2019-10-25 00:04:33', 'jugomez', 'ixicale', NOW());

-- try to copy bnf_condicion_variable 5. '@COMPS@'.
INSERT INTO clv_benefits.bnf_condicion_variable
( idbnf_configuracion_clausula, idbnf_variable_beneficio, base, tipo_dato, override_rules, es_global, tag, tipo_rango, rangos, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES((
	SELECT bcc.idbnf_configuracion_clausula FROM clv_benefits.bnf_configuracion_clausula bcc WHERE
	bcc.usuario_creacion = "jugomez" AND
    bcc.fecha_creacion = "2019-10-25 00:04:33" AND
	bcc.idbnf_sub_concepto = (
        SELECT x.idbnf_sub_concepto FROM clv_benefits.bnf_sub_concepto x WHERE
            x.usuario_creacion = "jugomez" AND
            x.fecha_creacion = "2019-10-24 23:10:26" AND
            x.idcontr_categoria_contrato = 97
        ORDER BY x.idbnf_sub_concepto DESC 
        LIMIT 1
	)
    ORDER BY bcc.idbnf_configuracion_clausula DESC 
    LIMIT 1
), 1, '{"10-149":"50","150-499":"50","500-10000":"50"}', 1, '{"10-149":[{"auth_id":0,"min":"50","max":"25","level":0},{"auth_id":0,"min":"20","max":"24","level":1},{"auth_id":0,"min":"19","max":"1","level":2}],"150-499":[{"auth_id":0,"min":"50","max":"25","level":0},{"auth_id":0,"min":"24","max":"20","level":1},{"auth_id":0,"min":"19","max":"1","level":2}],"500-10000":[{"auth_id":0,"min":"100","max":"50","level":0},{"auth_id":0,"min":"49","max":"45","level":1},{"auth_id":0,"min":"44","max":"1","level":2}]}', 1, '@COMPS@', 1, '[{"selecto":true,"inicio":10,"fin":149},{"selecto":false,"inicio":150,"fin":499},{"selecto":false,"inicio":500,"fin":10000}]', 1, '2019-10-25 00:04:33', 'jugomez', 'ixicale', NOW());


-- try to copy bnf_configuracion_clausula 10. 'Comps Los Cabos'.
INSERT INTO clv_benefits.bnf_configuracion_clausula 
(idbnf_sub_concepto, opcional, nombre, texto, variables, limite_inferior, limite_superior, es_rango, rangos, booking_window_fecha_inicio, booking_window_fecha_fin, travel_window_fecha_inicio, travel_window_fecha_fin, propiedades, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES((
    SELECT x.idbnf_sub_concepto FROM clv_benefits.bnf_sub_concepto x WHERE
        x.usuario_creacion = "jugomez" AND
        x.fecha_creacion = "2019-10-24 23:10:26" AND
        x.idcontr_categoria_contrato = 97
    ORDER BY x.idbnf_sub_concepto DESC
    LIMIT 1
),
0, 'Comps Los Cabos', '{"legal":{"1":"<p>pendiente</p>"},"comercial":{"1":"<p>pendiente</p>"}}', '[]', '0', '0', 1, '[{"selecto":true,"inicio":0,"fin":0}]', '2019-11-08', '2019-11-08', '2019-11-08', '2019-11-08', '["ZPLB"]', 1, '2019-10-26 15:52:46', 'jugomez', 'ixicale', NOW());

-- try to copy bnf_condicion_variable 16. '@COMPS@'.
INSERT INTO clv_benefits.bnf_condicion_variable
( idbnf_configuracion_clausula, idbnf_variable_beneficio, base, tipo_dato, override_rules, es_global, tag, tipo_rango, rangos, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES((
	SELECT bcc.idbnf_configuracion_clausula FROM clv_benefits.bnf_configuracion_clausula bcc WHERE
	bcc.usuario_creacion = "jugomez" AND
    bcc.fecha_creacion = "2019-10-26 15:52:46" AND
	bcc.idbnf_sub_concepto = (
        SELECT x.idbnf_sub_concepto FROM clv_benefits.bnf_sub_concepto x WHERE
            x.usuario_creacion = "jugomez" AND
            x.fecha_creacion = "2019-10-24 23:10:26" AND
            x.idcontr_categoria_contrato = 97
        ORDER BY x.idbnf_sub_concepto DESC 
        LIMIT 1
	)
    ORDER BY bcc.idbnf_configuracion_clausula DESC 
    LIMIT 1
), 1, '{"0-0":"__"}', 2, '{"0-0":[{"auth_id":"0","max":"","min":"","level":"1"}]}', 0, '@COMPS@', 0, '[{"selecto":true,"inicio":0,"fin":0}]', 0, '2019-10-26 15:52:46', 'jugomez', 'ixicale', NOW());


-- try to copy bnf_configuracion_clausula 37. 'pruebas'.
INSERT INTO clv_benefits.bnf_configuracion_clausula 
(idbnf_sub_concepto, opcional, nombre, texto, variables, limite_inferior, limite_superior, es_rango, rangos, booking_window_fecha_inicio, booking_window_fecha_fin, travel_window_fecha_inicio, travel_window_fecha_fin, propiedades, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES((
    SELECT x.idbnf_sub_concepto FROM clv_benefits.bnf_sub_concepto x WHERE
        x.usuario_creacion = "jugomez" AND
        x.fecha_creacion = "2019-10-24 23:10:26" AND
        x.idcontr_categoria_contrato = 97
    ORDER BY x.idbnf_sub_concepto DESC
    LIMIT 1
),
0, 'pruebas', '{"legal":{"1":"DAni y javi van a subir promociones&nbsp;&nbsp;@PROMOTION@"},"comercial":{"1":"Dani y javi los quieren&nbsp;@PROMOTION@"}}', '["@PROMOTION@"]', '0', '0', 2, '[{"selecto":true,"inicio":10,"fin":20},{"inicio":21,"fin":25},{"inicio":26,"fin":30}]', '2019-11-19', '2019-11-19', '2019-11-19', '2019-11-19', '["ZHBP","CDS","ZRCZ","ZHIM","ZHLB","ZPLB","ZMNI","ZMSU","ZCJG","ZCMPPC","ZRPL","ZHSP","ZMGR"]', 0, '2019-11-19 15:34:46', 'marrosas', 'ixicale', NOW());

-- try to copy bnf_condicion_variable 52. '@PROMOTION@'.
INSERT INTO clv_benefits.bnf_condicion_variable
( idbnf_configuracion_clausula, idbnf_variable_beneficio, base, tipo_dato, override_rules, es_global, tag, tipo_rango, rangos, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES((
	SELECT bcc.idbnf_configuracion_clausula FROM clv_benefits.bnf_configuracion_clausula bcc WHERE
	bcc.usuario_creacion = "marrosas" AND
    bcc.fecha_creacion = "2019-11-19 15:34:46" AND
	bcc.idbnf_sub_concepto = (
        SELECT x.idbnf_sub_concepto FROM clv_benefits.bnf_sub_concepto x WHERE
            x.usuario_creacion = "jugomez" AND
            x.fecha_creacion = "2019-10-24 23:10:26" AND
            x.idcontr_categoria_contrato = 97
        ORDER BY x.idbnf_sub_concepto DESC 
        LIMIT 1
	)
    ORDER BY bcc.idbnf_configuracion_clausula DESC 
    LIMIT 1
), 11, '{"10-20":"1","21-25":"1","26-30":"1"}', 1, '{"10-20":[{"auth_id":0,"min":"10","max":"20","level":0},{"auth_id":0,"min":"21","max":"25","level":1},{"auth_id":0,"min":"26","max":"30","level":2}],"21-25":[{"auth_id":0,"min":"10","max":"20","level":0},{"auth_id":0,"min":"21","max":"25","level":1},{"auth_id":0,"min":"26","max":"30","level":2}],"26-30":[{"auth_id":0,"min":"10","max":"20","level":2},{"auth_id":0,"min":"10","max":"20","level":0},{"auth_id":0,"min":"21","max":"25","level":1}]}', 1, '@PROMOTION@', 2, '[{"selecto":false,"inicio":10,"fin":20},{"selecto":false,"inicio":21,"fin":25},{"selecto":true,"inicio":26,"fin":30}]', 1, '2019-11-19 15:34:46', 'marrosas', 'ixicale', NOW());

-- try to copy bnf_sub_concepto 6. 'Comps cumulative basis'.
INSERT INTO clv_benefits.bnf_sub_concepto 
(idcontr_categoria_contrato, idbnf_concepto, descripcion, idioma, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES(97, 7, 'Comps cumulative basis', '{"1":"Comps cumulative basis"}', 1, '2019-10-25 00:06:02', 'jugomez', 'ixicale', NOW());

-- try to copy bnf_configuracion_clausula 5. 'Comps cumulative basis'.
INSERT INTO clv_benefits.bnf_configuracion_clausula 
(idbnf_sub_concepto, opcional, nombre, texto, variables, limite_inferior, limite_superior, es_rango, rangos, booking_window_fecha_inicio, booking_window_fecha_fin, travel_window_fecha_inicio, travel_window_fecha_fin, propiedades, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES((
    SELECT x.idbnf_sub_concepto FROM clv_benefits.bnf_sub_concepto x WHERE
        x.usuario_creacion = "jugomez" AND
        x.fecha_creacion = "2019-10-25 00:06:02" AND
        x.idcontr_categoria_contrato = 97
    ORDER BY x.idbnf_sub_concepto DESC
    LIMIT 1
),
0, 'Comps cumulative basis', '{"legal":{"1":"<p>The Company will cause the Hotel to provide one complimentary room, single or double occupancy for every&nbsp;@COMPS@ rooms&nbsp;paid in comulative basis nightly.&nbsp; These rooms are all-inclusive.&nbsp; A mandatory charge of $10.00 USD per person, per night will be charged for complimentary rooms for tax and gratuities.&nbsp; Maximum of&nbsp;@MAXCOMPS@ rooms.</p>"},"comercial":{"1":"<p>Complimentary Rooms: One Complimentary room, single or double occupancy for every @COMPS@&nbsp;rooms paid&nbsp;in comulative basis nightly.  These rooms are all-inclusive. A mandatory charge of $10.00 USD per person, per night will be charged for complimentary rooms for tax and gratuities, to a maximum of&nbsp;@MAXCOMPS@ rooms.</p>"}}', '["@MAXCOMPS@","@COMPS@"]', '0', '0', 1, '[{"selecto":true,"inicio":10,"fin":149},{"inicio":150,"fin":499},{"inicio":500,"fin":10000}]', '2019-11-19', '2019-11-19', '2019-11-19', '2019-11-19', '["ZHBP","CDS","ZRCZ","ZHIM","ZHLB","ZPLB","ZMNI","ZMSU","ZCJG","ZRPL","ZHSP","ZMGR"]', 1, '2019-10-25 00:14:09', 'jugomez', 'ixicale', NOW());

-- try to copy bnf_condicion_variable 6. '@MAXCOMPS@'.
INSERT INTO clv_benefits.bnf_condicion_variable
( idbnf_configuracion_clausula, idbnf_variable_beneficio, base, tipo_dato, override_rules, es_global, tag, tipo_rango, rangos, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES((
	SELECT bcc.idbnf_configuracion_clausula FROM clv_benefits.bnf_configuracion_clausula bcc WHERE
	bcc.usuario_creacion = "jugomez" AND
    bcc.fecha_creacion = "2019-10-25 00:14:09" AND
	bcc.idbnf_sub_concepto = (
        SELECT x.idbnf_sub_concepto FROM clv_benefits.bnf_sub_concepto x WHERE
            x.usuario_creacion = "jugomez" AND
            x.fecha_creacion = "2019-10-25 00:06:02" AND
            x.idcontr_categoria_contrato = 97
        ORDER BY x.idbnf_sub_concepto DESC 
        LIMIT 1
	)
    ORDER BY bcc.idbnf_configuracion_clausula DESC 
    LIMIT 1
), 3, '{"10-149":"1","150-499":"1","500-10000":"10"}', 1, '{"10-149":[{"auth_id":0,"min":"1","max":"6","level":0},{"auth_id":0,"min":"7","max":"10","level":1},{"auth_id":0,"min":"11","max":"20","level":2}],"150-499":[{"auth_id":0,"min":"1","max":"10","level":0},{"auth_id":0,"min":"11","max":"15","level":1},{"auth_id":0,"min":"16","max":"20","level":2}],"500-10000":[{"auth_id":0,"min":"1","max":"10","level":0},{"auth_id":0,"min":"11","max":"15","level":1},{"auth_id":0,"min":"16","max":"20","level":2}]}', 1, '@MAXCOMPS@', 1, '[{"selecto":false,"inicio":10,"fin":149},{"selecto":false,"inicio":150,"fin":499},{"selecto":true,"inicio":500,"fin":10000}]', 1, '2019-10-25 00:14:10', 'jugomez', 'ixicale', NOW());

-- try to copy bnf_condicion_variable 7. '@COMPS@'.
INSERT INTO clv_benefits.bnf_condicion_variable
( idbnf_configuracion_clausula, idbnf_variable_beneficio, base, tipo_dato, override_rules, es_global, tag, tipo_rango, rangos, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES((
	SELECT bcc.idbnf_configuracion_clausula FROM clv_benefits.bnf_configuracion_clausula bcc WHERE
	bcc.usuario_creacion = "jugomez" AND
    bcc.fecha_creacion = "2019-10-25 00:14:09" AND
	bcc.idbnf_sub_concepto = (
        SELECT x.idbnf_sub_concepto FROM clv_benefits.bnf_sub_concepto x WHERE
            x.usuario_creacion = "jugomez" AND
            x.fecha_creacion = "2019-10-25 00:06:02" AND
            x.idcontr_categoria_contrato = 97
        ORDER BY x.idbnf_sub_concepto DESC 
        LIMIT 1
	)
    ORDER BY bcc.idbnf_configuracion_clausula DESC 
    LIMIT 1
), 1, '{"10-149":"50","150-499":"50","500-10000":"50"}', 1, '{"10-149":[{"auth_id":0,"min":"50","max":"25","level":0},{"auth_id":0,"min":"20","max":"24","level":1},{"auth_id":0,"min":"19","max":"1","level":2}],"150-499":[{"auth_id":0,"min":"50","max":"25","level":0},{"auth_id":0,"min":"24","max":"20","level":1},{"auth_id":0,"min":"19","max":"1","level":2}],"500-10000":[{"auth_id":0,"min":"100","max":"50","level":0},{"auth_id":0,"min":"49","max":"45","level":1},{"auth_id":0,"min":"44","max":"1","level":2}]}', 1, '@COMPS@', 1, '[{"selecto":true,"inicio":10,"fin":149},{"selecto":false,"inicio":150,"fin":499},{"selecto":false,"inicio":500,"fin":10000}]', 1, '2019-10-25 00:14:10', 'jugomez', 'ixicale', NOW());

-- try to copy bnf_sub_concepto 7. 'Staff Rooms'.
INSERT INTO clv_benefits.bnf_sub_concepto 
(idcontr_categoria_contrato, idbnf_concepto, descripcion, idioma, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES(97, 7, 'Staff Rooms', '{"1":"Staff Rooms"}', 1, '2019-10-25 00:15:05', 'jugomez', 'ixicale', NOW());

-- try to copy bnf_configuracion_clausula 6. 'Staff rooms'.
INSERT INTO clv_benefits.bnf_configuracion_clausula 
(idbnf_sub_concepto, opcional, nombre, texto, variables, limite_inferior, limite_superior, es_rango, rangos, booking_window_fecha_inicio, booking_window_fecha_fin, travel_window_fecha_inicio, travel_window_fecha_fin, propiedades, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES((
    SELECT x.idbnf_sub_concepto FROM clv_benefits.bnf_sub_concepto x WHERE
        x.usuario_creacion = "jugomez" AND
        x.fecha_creacion = "2019-10-25 00:15:05" AND
        x.idcontr_categoria_contrato = 97
    ORDER BY x.idbnf_sub_concepto DESC
    LIMIT 1
),
0, 'Staff rooms', '{"legal":{"1":"<p>\n \n \n  The Company will cause the Hotel to provide one Staff room at\n  50% of the Group rate single or double occupancy&nbsp;for every&nbsp;@COMPS@ rooms paid\n  nightly.&nbsp;Staff rates are applicable 2 nights\n  prior, 1 night post. Maximum&nbsp;@MAXCOMPS@ rooms.</p>"},"comercial":{"1":"<p>\n \n \n  Staff Rooms: One Staff room at 50% of the Group rate single or\n  double occupancy&nbsp;for every&nbsp;@COMPS@ rooms paid.&nbsp; Staff rates are applicable 2 nights prior,\n  1 night post. Maximum&nbsp;@MAXCOMPS@ rooms.</p>"}}', '["@COMPS@","@MAXCOMPS@"]', '0', '0', 1, '[{"selecto":true,"inicio":10,"fin":149},{"inicio":150,"fin":499},{"inicio":500,"fin":10000}]', '2019-11-19', '2019-11-19', '2019-11-19', '2019-11-19', '["ZHBP","CDS","ZRCZ","ZHIM","ZHLB","ZPLB","ZMNI","ZMSU","ZCJG","ZRPL","ZHSP","ZMGR"]', 1, '2019-10-25 00:20:46', 'jugomez', 'ixicale', NOW());

-- try to copy bnf_condicion_variable 8. '@COMPS@'.
INSERT INTO clv_benefits.bnf_condicion_variable
( idbnf_configuracion_clausula, idbnf_variable_beneficio, base, tipo_dato, override_rules, es_global, tag, tipo_rango, rangos, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES((
	SELECT bcc.idbnf_configuracion_clausula FROM clv_benefits.bnf_configuracion_clausula bcc WHERE
	bcc.usuario_creacion = "jugomez" AND
    bcc.fecha_creacion = "2019-10-25 00:20:46" AND
	bcc.idbnf_sub_concepto = (
        SELECT x.idbnf_sub_concepto FROM clv_benefits.bnf_sub_concepto x WHERE
            x.usuario_creacion = "jugomez" AND
            x.fecha_creacion = "2019-10-25 00:15:05" AND
            x.idcontr_categoria_contrato = 97
        ORDER BY x.idbnf_sub_concepto DESC 
        LIMIT 1
	)
    ORDER BY bcc.idbnf_configuracion_clausula DESC 
    LIMIT 1
), 1, '{"10-149":"50","150-499":"50","500-10000":"50"}', 1, '{"10-149":[{"auth_id":0,"min":"50","max":"25","level":0},{"auth_id":0,"min":"20","max":"24","level":1},{"auth_id":0,"min":"19","max":"1","level":2}],"150-499":[{"auth_id":0,"min":"50","max":"25","level":0},{"auth_id":0,"min":"24","max":"20","level":1},{"auth_id":0,"min":"19","max":"1","level":2}],"500-10000":[{"auth_id":0,"min":"100","max":"50","level":0},{"auth_id":0,"min":"49","max":"45","level":1},{"auth_id":0,"min":"44","max":"1","level":2}]}', 1, '@COMPS@', 1, '[{"selecto":true,"inicio":10,"fin":149},{"selecto":false,"inicio":150,"fin":499},{"selecto":false,"inicio":500,"fin":10000}]', 1, '2019-10-25 00:20:47', 'jugomez', 'ixicale', NOW());

-- try to copy bnf_condicion_variable 9. '@MAXCOMPS@'.
INSERT INTO clv_benefits.bnf_condicion_variable
( idbnf_configuracion_clausula, idbnf_variable_beneficio, base, tipo_dato, override_rules, es_global, tag, tipo_rango, rangos, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES((
	SELECT bcc.idbnf_configuracion_clausula FROM clv_benefits.bnf_configuracion_clausula bcc WHERE
	bcc.usuario_creacion = "jugomez" AND
    bcc.fecha_creacion = "2019-10-25 00:20:46" AND
	bcc.idbnf_sub_concepto = (
        SELECT x.idbnf_sub_concepto FROM clv_benefits.bnf_sub_concepto x WHERE
            x.usuario_creacion = "jugomez" AND
            x.fecha_creacion = "2019-10-25 00:15:05" AND
            x.idcontr_categoria_contrato = 97
        ORDER BY x.idbnf_sub_concepto DESC 
        LIMIT 1
	)
    ORDER BY bcc.idbnf_configuracion_clausula DESC 
    LIMIT 1
), 3, '{"10-149":"1","150-499":"1","500-10000":"10"}', 1, '{"10-149":[{"auth_id":0,"min":"1","max":"6","level":0},{"auth_id":0,"min":"7","max":"10","level":1},{"auth_id":0,"min":"11","max":"20","level":2}],"150-499":[{"auth_id":0,"min":"1","max":"10","level":0},{"auth_id":0,"min":"11","max":"15","level":1},{"auth_id":0,"min":"16","max":"20","level":2}],"500-10000":[{"auth_id":0,"min":"1","max":"10","level":0},{"auth_id":0,"min":"11","max":"15","level":1},{"auth_id":0,"min":"16","max":"20","level":2}]}', 1, '@MAXCOMPS@', 1, '[{"selecto":false,"inicio":10,"fin":149},{"selecto":false,"inicio":150,"fin":499},{"selecto":true,"inicio":500,"fin":10000}]', 1, '2019-10-25 00:20:47', 'jugomez', 'ixicale', NOW());

-- try to copy bnf_sub_concepto 8. 'Staff rooms'.
INSERT INTO clv_benefits.bnf_sub_concepto 
(idcontr_categoria_contrato, idbnf_concepto, descripcion, idioma, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES(97, 7, 'Staff rooms', '{"1":"Staff rooms cumulative basis"}', 1, '2019-10-25 00:21:19', 'jugomez', 'ixicale', NOW());

-- try to copy bnf_configuracion_clausula 7. 'Staff rooms cumulitive basis'.
INSERT INTO clv_benefits.bnf_configuracion_clausula 
(idbnf_sub_concepto, opcional, nombre, texto, variables, limite_inferior, limite_superior, es_rango, rangos, booking_window_fecha_inicio, booking_window_fecha_fin, travel_window_fecha_inicio, travel_window_fecha_fin, propiedades, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES((
    SELECT x.idbnf_sub_concepto FROM clv_benefits.bnf_sub_concepto x WHERE
        x.usuario_creacion = "jugomez" AND
        x.fecha_creacion = "2019-10-25 00:21:19" AND
        x.idcontr_categoria_contrato = 97
    ORDER BY x.idbnf_sub_concepto DESC
    LIMIT 1
),
0, 'Staff rooms cumulitive basis', '{"legal":{"1":"<p>The Company will cause the Hotel to provide one Staff room at\n  50% of the Group rate single or double occupancy&nbsp;for every&nbsp;@COMPS@ rooms cumulative basis.&nbsp;Staff rates are applicable 2 nights\n  prior, 1 night post. Maximum&nbsp;@MAXCOMPS@ rooms. </p>"},"comercial":{"1":"<p>Staff Rooms: One Staff room at 50% of the Group rate single or\n  double occupancy&nbsp;for every&nbsp;@COMPS@ rooms paid  cumulative basis. Staff rates are applicable 2 nights prior,\n  1 night post. Maximum&nbsp;@MAXCOMPS@ rooms.&nbsp;</p>"}}', '["@MAXCOMPS@","@COMPS@"]', '0', '0', 1, '[{"selecto":true,"inicio":10,"fin":149},{"inicio":150,"fin":499},{"inicio":500,"fin":10000}]', '2019-11-19', '2019-11-19', '2019-11-19', '2019-11-19', '["ZHBP","CDS","ZRCZ","ZHIM","ZHLB","ZPLB","ZMNI","ZMSU","ZCJG","ZRPL","ZHSP","ZMGR"]', 1, '2019-10-25 00:24:31', 'jugomez', 'ixicale', NOW());

-- try to copy bnf_condicion_variable 10. '@MAXCOMPS@'.
INSERT INTO clv_benefits.bnf_condicion_variable
( idbnf_configuracion_clausula, idbnf_variable_beneficio, base, tipo_dato, override_rules, es_global, tag, tipo_rango, rangos, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES((
	SELECT bcc.idbnf_configuracion_clausula FROM clv_benefits.bnf_configuracion_clausula bcc WHERE
	bcc.usuario_creacion = "jugomez" AND
    bcc.fecha_creacion = "2019-10-25 00:24:31" AND
	bcc.idbnf_sub_concepto = (
        SELECT x.idbnf_sub_concepto FROM clv_benefits.bnf_sub_concepto x WHERE
            x.usuario_creacion = "jugomez" AND
            x.fecha_creacion = "2019-10-25 00:21:19" AND
            x.idcontr_categoria_contrato = 97
        ORDER BY x.idbnf_sub_concepto DESC 
        LIMIT 1
	)
    ORDER BY bcc.idbnf_configuracion_clausula DESC 
    LIMIT 1
), 3, '{"10-149":"1","150-499":"1","500-10000":"10"}', 1, '{"10-149":[{"auth_id":0,"min":"1","max":"6","level":0},{"auth_id":0,"min":"7","max":"10","level":1},{"auth_id":0,"min":"11","max":"20","level":2}],"150-499":[{"auth_id":0,"min":"1","max":"10","level":0},{"auth_id":0,"min":"11","max":"15","level":1},{"auth_id":0,"min":"16","max":"20","level":2}],"500-10000":[{"auth_id":0,"min":"1","max":"10","level":0},{"auth_id":0,"min":"11","max":"15","level":1},{"auth_id":0,"min":"16","max":"20","level":2}]}', 1, '@MAXCOMPS@', 1, '[{"selecto":false,"inicio":10,"fin":149},{"selecto":false,"inicio":150,"fin":499},{"selecto":true,"inicio":500,"fin":10000}]', 1, '2019-10-25 00:24:32', 'jugomez', 'ixicale', NOW());

-- try to copy bnf_condicion_variable 11. '@COMPS@'.
INSERT INTO clv_benefits.bnf_condicion_variable
( idbnf_configuracion_clausula, idbnf_variable_beneficio, base, tipo_dato, override_rules, es_global, tag, tipo_rango, rangos, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES((
	SELECT bcc.idbnf_configuracion_clausula FROM clv_benefits.bnf_configuracion_clausula bcc WHERE
	bcc.usuario_creacion = "jugomez" AND
    bcc.fecha_creacion = "2019-10-25 00:24:31" AND
	bcc.idbnf_sub_concepto = (
        SELECT x.idbnf_sub_concepto FROM clv_benefits.bnf_sub_concepto x WHERE
            x.usuario_creacion = "jugomez" AND
            x.fecha_creacion = "2019-10-25 00:21:19" AND
            x.idcontr_categoria_contrato = 97
        ORDER BY x.idbnf_sub_concepto DESC 
        LIMIT 1
	)
    ORDER BY bcc.idbnf_configuracion_clausula DESC 
    LIMIT 1
), 1, '{"10-149":"50","150-499":"50","500-10000":"50"}', 1, '{"10-149":[{"auth_id":0,"min":"50","max":"25","level":0},{"auth_id":0,"min":"20","max":"24","level":1},{"auth_id":0,"min":"19","max":"1","level":2}],"150-499":[{"auth_id":0,"min":"50","max":"25","level":0},{"auth_id":0,"min":"24","max":"20","level":1},{"auth_id":0,"min":"19","max":"1","level":2}],"500-10000":[{"auth_id":0,"min":"100","max":"50","level":0},{"auth_id":0,"min":"49","max":"45","level":1},{"auth_id":0,"min":"44","max":"1","level":2}]}', 1, '@COMPS@', 1, '[{"selecto":true,"inicio":10,"fin":149},{"selecto":false,"inicio":150,"fin":499},{"selecto":false,"inicio":500,"fin":10000}]', 1, '2019-10-25 00:24:32', 'jugomez', 'ixicale', NOW());

-- try to copy bnf_sub_concepto 9. 'Upgrade'.
INSERT INTO clv_benefits.bnf_sub_concepto 
(idcontr_categoria_contrato, idbnf_concepto, descripcion, idioma, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES(97, 7, 'Upgrade', '{"1":"Upgrade"}', 1, '2019-10-25 00:29:47', 'jugomez', 'ixicale', NOW());

-- try to copy bnf_configuracion_clausula 8. 'Upgrade'.
INSERT INTO clv_benefits.bnf_configuracion_clausula 
(idbnf_sub_concepto, opcional, nombre, texto, variables, limite_inferior, limite_superior, es_rango, rangos, booking_window_fecha_inicio, booking_window_fecha_fin, travel_window_fecha_inicio, travel_window_fecha_fin, propiedades, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES((
    SELECT x.idbnf_sub_concepto FROM clv_benefits.bnf_sub_concepto x WHERE
        x.usuario_creacion = "jugomez" AND
        x.fecha_creacion = "2019-10-25 00:29:47" AND
        x.idcontr_categoria_contrato = 97
    ORDER BY x.idbnf_sub_concepto DESC
    LIMIT 1
),
0, 'Upgrade', '{"legal":{"1":"<p>\n \n \n  The Company will cause the Hotel to provide one Up-Grade to the\n  next category level available&nbsp;for\n  every&nbsp;@COMPS@ rooms paid nightly. 2 guests maximum. Maximum @MAXCOMPS@ upgrades.&nbsp;Additional\n  nights will be at the prevailing rates.  </p>"},"comercial":{"1":"<p>\n \n \n  Room Upgrades: One Upgrade to the\n  next room category available&nbsp;for every&nbsp;@COMPS@&nbsp;rooms paid nightly.&nbsp;2 guests maximum. Maximum&nbsp;@MAXCOMPS@ upgrades.&nbsp;\n  Additional nights will be at the group rates.</p>"}}', '["@COMPS@","@MAXCOMPS@"]', '0', '0', 1, '[{"selecto":true,"inicio":10,"fin":149},{"inicio":150,"fin":499},{"inicio":500,"fin":10000}]', '2019-11-19', '2019-11-19', '2019-11-19', '2019-11-19', '["ZHBP","CDS","ZRCZ","ZHIM","ZHLB","ZPLB","ZMNI","ZMSU","ZCJG","ZRPL","ZHSP","ZMGR"]', 1, '2019-10-25 00:38:37', 'jugomez', 'ixicale', NOW());

-- try to copy bnf_condicion_variable 12. '@COMPS@'.
INSERT INTO clv_benefits.bnf_condicion_variable
( idbnf_configuracion_clausula, idbnf_variable_beneficio, base, tipo_dato, override_rules, es_global, tag, tipo_rango, rangos, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES((
	SELECT bcc.idbnf_configuracion_clausula FROM clv_benefits.bnf_configuracion_clausula bcc WHERE
	bcc.usuario_creacion = "jugomez" AND
    bcc.fecha_creacion = "2019-10-25 00:38:37" AND
	bcc.idbnf_sub_concepto = (
        SELECT x.idbnf_sub_concepto FROM clv_benefits.bnf_sub_concepto x WHERE
            x.usuario_creacion = "jugomez" AND
            x.fecha_creacion = "2019-10-25 00:29:47" AND
            x.idcontr_categoria_contrato = 97
        ORDER BY x.idbnf_sub_concepto DESC 
        LIMIT 1
	)
    ORDER BY bcc.idbnf_configuracion_clausula DESC 
    LIMIT 1
), 1, '{"10-149":"50","150-499":"50","500-10000":"50"}', 1, '{"10-149":[{"auth_id":0,"min":"50","max":"25","level":0},{"auth_id":0,"min":"20","max":"24","level":1},{"auth_id":0,"min":"19","max":"1","level":2}],"150-499":[{"auth_id":0,"min":"50","max":"25","level":0},{"auth_id":0,"min":"24","max":"20","level":1},{"auth_id":0,"min":"19","max":"1","level":2}],"500-10000":[{"auth_id":0,"min":"100","max":"50","level":0},{"auth_id":0,"min":"49","max":"45","level":1},{"auth_id":0,"min":"44","max":"1","level":2}]}', 1, '@COMPS@', 1, '[{"selecto":true,"inicio":10,"fin":149},{"selecto":false,"inicio":150,"fin":499},{"selecto":false,"inicio":500,"fin":10000}]', 1, '2019-10-25 00:38:38', 'jugomez', 'ixicale', NOW());

-- try to copy bnf_condicion_variable 13. '@MAXCOMPS@'.
INSERT INTO clv_benefits.bnf_condicion_variable
( idbnf_configuracion_clausula, idbnf_variable_beneficio, base, tipo_dato, override_rules, es_global, tag, tipo_rango, rangos, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES((
	SELECT bcc.idbnf_configuracion_clausula FROM clv_benefits.bnf_configuracion_clausula bcc WHERE
	bcc.usuario_creacion = "jugomez" AND
    bcc.fecha_creacion = "2019-10-25 00:38:37" AND
	bcc.idbnf_sub_concepto = (
        SELECT x.idbnf_sub_concepto FROM clv_benefits.bnf_sub_concepto x WHERE
            x.usuario_creacion = "jugomez" AND
            x.fecha_creacion = "2019-10-25 00:29:47" AND
            x.idcontr_categoria_contrato = 97
        ORDER BY x.idbnf_sub_concepto DESC 
        LIMIT 1
	)
    ORDER BY bcc.idbnf_configuracion_clausula DESC 
    LIMIT 1
), 3, '{"10-149":"1","150-499":"1","500-10000":"10"}', 1, '{"10-149":[{"auth_id":0,"min":"1","max":"6","level":0},{"auth_id":0,"min":"7","max":"10","level":1},{"auth_id":0,"min":"11","max":"20","level":2}],"150-499":[{"auth_id":0,"min":"1","max":"10","level":0},{"auth_id":0,"min":"11","max":"15","level":1},{"auth_id":0,"min":"16","max":"20","level":2}],"500-10000":[{"auth_id":0,"min":"1","max":"10","level":0},{"auth_id":0,"min":"11","max":"15","level":1},{"auth_id":0,"min":"16","max":"20","level":2}]}', 1, '@MAXCOMPS@', 1, '[{"selecto":false,"inicio":10,"fin":149},{"selecto":false,"inicio":150,"fin":499},{"selecto":true,"inicio":500,"fin":10000}]', 1, '2019-10-25 00:38:38', 'jugomez', 'ixicale', NOW());

-- try to copy bnf_sub_concepto 10. 'Upgrades cumulative basis.'.
INSERT INTO clv_benefits.bnf_sub_concepto 
(idcontr_categoria_contrato, idbnf_concepto, descripcion, idioma, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES(97, 7, 'Upgrades cumulative basis.', '{"1":"Upgrades cumulative basis."}', 1, '2019-10-25 00:39:25', 'jugomez', 'ixicale', NOW());

-- try to copy bnf_configuracion_clausula 9. 'Upgrades cumulative basis'.
INSERT INTO clv_benefits.bnf_configuracion_clausula 
(idbnf_sub_concepto, opcional, nombre, texto, variables, limite_inferior, limite_superior, es_rango, rangos, booking_window_fecha_inicio, booking_window_fecha_fin, travel_window_fecha_inicio, travel_window_fecha_fin, propiedades, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES((
    SELECT x.idbnf_sub_concepto FROM clv_benefits.bnf_sub_concepto x WHERE
        x.usuario_creacion = "jugomez" AND
        x.fecha_creacion = "2019-10-25 00:39:25" AND
        x.idcontr_categoria_contrato = 97
    ORDER BY x.idbnf_sub_concepto DESC
    LIMIT 1
),
0, 'Upgrades cumulative basis', '{"legal":{"1":"<p>The Company will cause the Hotel to provide one Up-Grade to the\n  next category level available&nbsp;for\n  every&nbsp;@COMPS@ rooms paid cumulative basis nightly. 2 guests maximum. Maximum @MAXCOMPS@ upgrades.&nbsp;Additional\n  nights will be at the prevailing rates.</p>"},"comercial":{"1":"<p>Room Upgrades: One Upgrade to the\n  next room category available&nbsp;for every&nbsp;@COMPS@&nbsp;rooms paid&nbsp;cumulative basis  nightly.&nbsp;2 guests maximum. Maximum&nbsp;@MAXCOMPS@ upgrades.&nbsp;\n  Additional nights will be at the group rates.</p>"}}', '["@COMPS@","@MAXCOMPS@"]', '0', '0', 1, '[{"selecto":true,"inicio":10,"fin":149},{"inicio":150,"fin":499},{"inicio":500,"fin":10000}]', '2019-11-19', '2019-11-19', '2019-11-19', '2019-11-19', '["ZHBP","CDS","ZRCZ","ZHIM","ZHLB","ZPLB","ZMNI","ZMSU","ZCJG","ZRPL","ZHSP","ZMGR"]', 1, '2019-10-25 00:41:54', 'jugomez', 'ixicale', NOW());

-- try to copy bnf_condicion_variable 14. '@COMPS@'.
INSERT INTO clv_benefits.bnf_condicion_variable
( idbnf_configuracion_clausula, idbnf_variable_beneficio, base, tipo_dato, override_rules, es_global, tag, tipo_rango, rangos, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES((
	SELECT bcc.idbnf_configuracion_clausula FROM clv_benefits.bnf_configuracion_clausula bcc WHERE
	bcc.usuario_creacion = "jugomez" AND
    bcc.fecha_creacion = "2019-10-25 00:41:54" AND
	bcc.idbnf_sub_concepto = (
        SELECT x.idbnf_sub_concepto FROM clv_benefits.bnf_sub_concepto x WHERE
            x.usuario_creacion = "jugomez" AND
            x.fecha_creacion = "2019-10-25 00:39:25" AND
            x.idcontr_categoria_contrato = 97
        ORDER BY x.idbnf_sub_concepto DESC 
        LIMIT 1
	)
    ORDER BY bcc.idbnf_configuracion_clausula DESC 
    LIMIT 1
), 1, '{"10-149":"50","150-499":"50","500-10000":"50"}', 1, '{"10-149":[{"auth_id":0,"min":"50","max":"25","level":0},{"auth_id":0,"min":"20","max":"24","level":1},{"auth_id":0,"min":"19","max":"1","level":2}],"150-499":[{"auth_id":0,"min":"50","max":"25","level":0},{"auth_id":0,"min":"24","max":"20","level":1},{"auth_id":0,"min":"19","max":"1","level":2}],"500-10000":[{"auth_id":0,"min":"100","max":"50","level":0},{"auth_id":0,"min":"49","max":"45","level":1},{"auth_id":0,"min":"44","max":"1","level":2}]}', 1, '@COMPS@', 1, '[{"selecto":true,"inicio":10,"fin":149},{"selecto":false,"inicio":150,"fin":499},{"selecto":false,"inicio":500,"fin":10000}]', 1, '2019-10-25 00:41:54', 'jugomez', 'ixicale', NOW());

-- try to copy bnf_condicion_variable 15. '@MAXCOMPS@'.
INSERT INTO clv_benefits.bnf_condicion_variable
( idbnf_configuracion_clausula, idbnf_variable_beneficio, base, tipo_dato, override_rules, es_global, tag, tipo_rango, rangos, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES((
	SELECT bcc.idbnf_configuracion_clausula FROM clv_benefits.bnf_configuracion_clausula bcc WHERE
	bcc.usuario_creacion = "jugomez" AND
    bcc.fecha_creacion = "2019-10-25 00:41:54" AND
	bcc.idbnf_sub_concepto = (
        SELECT x.idbnf_sub_concepto FROM clv_benefits.bnf_sub_concepto x WHERE
            x.usuario_creacion = "jugomez" AND
            x.fecha_creacion = "2019-10-25 00:39:25" AND
            x.idcontr_categoria_contrato = 97
        ORDER BY x.idbnf_sub_concepto DESC 
        LIMIT 1
	)
    ORDER BY bcc.idbnf_configuracion_clausula DESC 
    LIMIT 1
), 3, '{"10-149":"1","150-499":"1","500-10000":"10"}', 1, '{"10-149":[{"auth_id":0,"min":"1","max":"6","level":0},{"auth_id":0,"min":"7","max":"10","level":1},{"auth_id":0,"min":"11","max":"20","level":2}],"150-499":[{"auth_id":0,"min":"1","max":"10","level":0},{"auth_id":0,"min":"11","max":"15","level":1},{"auth_id":0,"min":"16","max":"20","level":2}],"500-10000":[{"auth_id":0,"min":"1","max":"10","level":0},{"auth_id":0,"min":"11","max":"15","level":1},{"auth_id":0,"min":"16","max":"20","level":2}]}', 1, '@MAXCOMPS@', 1, '[{"selecto":false,"inicio":10,"fin":149},{"selecto":false,"inicio":150,"fin":499},{"selecto":true,"inicio":500,"fin":10000}]', 1, '2019-10-25 00:41:55', 'jugomez', 'ixicale', NOW());

-- try to copy bnf_sub_concepto 11. 'Golf'.
INSERT INTO clv_benefits.bnf_sub_concepto 
(idcontr_categoria_contrato, idbnf_concepto, descripcion, idioma, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES(97, 7, 'Golf', '{"1":"Golf"}', 1, '2019-10-26 16:01:30', 'jugomez', 'ixicale', NOW());

-- try to copy bnf_configuracion_clausula 11. 'Golf'.
INSERT INTO clv_benefits.bnf_configuracion_clausula 
(idbnf_sub_concepto, opcional, nombre, texto, variables, limite_inferior, limite_superior, es_rango, rangos, booking_window_fecha_inicio, booking_window_fecha_fin, travel_window_fecha_inicio, travel_window_fecha_fin, propiedades, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES((
    SELECT x.idbnf_sub_concepto FROM clv_benefits.bnf_sub_concepto x WHERE
        x.usuario_creacion = "jugomez" AND
        x.fecha_creacion = "2019-10-26 16:01:30" AND
        x.idcontr_categoria_contrato = 97
    ORDER BY x.idbnf_sub_concepto DESC
    LIMIT 1
),
0, 'Golf', '{"legal":{"1":"<p>  The Company will cause the Hotel to provide a @GOLF%@% discount on\n  Green Fees at Moon Palace Golf course. Discount does not apply to twilight\n  rate, equipment rental or pro shop. Delete if offering Resort Credit.</p>"},"comercial":{"1":"<p>  Golf Discount: Group will get @GOLF%@%\n  discount on green fees at Moon Palace Golf course.&nbsp;Does not apply to\n  twilight rate, equipment rental, pro shop or other promotions.</p>"}}', '["@GOLF%@"]', '0', '0', 1, '[{"selecto":true,"inicio":10,"fin":149},{"inicio":150,"fin":499},{"inicio":500,"fin":10000}]', '2019-11-19', '2019-11-19', '2019-11-19', '2019-11-19', '["ZHBP","CDS","ZRCZ","ZHIM","ZHLB","ZPLB","ZMNI","ZMSU","ZCJG","ZRPL","ZHSP","ZMGR"]', 1, '2019-10-26 16:23:49', 'jugomez', 'ixicale', NOW());

-- try to copy bnf_condicion_variable 17. '@GOLF%@'.
INSERT INTO clv_benefits.bnf_condicion_variable
( idbnf_configuracion_clausula, idbnf_variable_beneficio, base, tipo_dato, override_rules, es_global, tag, tipo_rango, rangos, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES((
	SELECT bcc.idbnf_configuracion_clausula FROM clv_benefits.bnf_configuracion_clausula bcc WHERE
	bcc.usuario_creacion = "jugomez" AND
    bcc.fecha_creacion = "2019-10-26 16:23:49" AND
	bcc.idbnf_sub_concepto = (
        SELECT x.idbnf_sub_concepto FROM clv_benefits.bnf_sub_concepto x WHERE
            x.usuario_creacion = "jugomez" AND
            x.fecha_creacion = "2019-10-26 16:01:30" AND
            x.idcontr_categoria_contrato = 97
        ORDER BY x.idbnf_sub_concepto DESC 
        LIMIT 1
	)
    ORDER BY bcc.idbnf_configuracion_clausula DESC 
    LIMIT 1
), 4, '{"10-149":"40","150-499":"40","500-10000":"40"}', 1, '{"10-149":[{"auth_id":0,"min":"40","max":"50","level":0},{"auth_id":0,"min":"51","max":"55","level":1},{"auth_id":0,"min":"56","max":"100","level":2}],"150-499":[{"auth_id":0,"min":"40","max":"50","level":0},{"auth_id":0,"min":"51","max":"55","level":1},{"auth_id":0,"min":"56","max":"100","level":2}],"500-10000":[{"auth_id":0,"min":"40","max":"50","level":0},{"auth_id":0,"min":"51","max":"55","level":1},{"auth_id":0,"min":"56","max":"100","level":2}]}', 1, '@GOLF%@', 1, '[{"selecto":false,"inicio":10,"fin":149},{"selecto":false,"inicio":150,"fin":499},{"selecto":true,"inicio":500,"fin":10000}]', 1, '2019-10-26 16:23:49', 'jugomez', 'ixicale', NOW());

-- try to copy bnf_sub_concepto 12. 'spa'.
INSERT INTO clv_benefits.bnf_sub_concepto 
(idcontr_categoria_contrato, idbnf_concepto, descripcion, idioma, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES(97, 7, 'spa', '{"1":"Spa"}', 1, '2019-10-26 16:26:55', 'jugomez', 'ixicale', NOW());

-- try to copy bnf_configuracion_clausula 12. 'Spa'.
INSERT INTO clv_benefits.bnf_configuracion_clausula 
(idbnf_sub_concepto, opcional, nombre, texto, variables, limite_inferior, limite_superior, es_rango, rangos, booking_window_fecha_inicio, booking_window_fecha_fin, travel_window_fecha_inicio, travel_window_fecha_fin, propiedades, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES((
    SELECT x.idbnf_sub_concepto FROM clv_benefits.bnf_sub_concepto x WHERE
        x.usuario_creacion = "jugomez" AND
        x.fecha_creacion = "2019-10-26 16:26:55" AND
        x.idcontr_categoria_contrato = 97
    ORDER BY x.idbnf_sub_concepto DESC
    LIMIT 1
),
0, 'Spa', '{"legal":{"1":"<p>  The Company will cause the Hotel to provide a @SPA%@% discount on\n  Spa treatments. Does not apply to discounted packages. Not applicable if receiving Resort Credit.</p>"},"comercial":{"1":"<p>  Spa Discount: Group will get @SPA%@%\n  discount on Spa treatments. Does not apply to discounted packages or other\n  promotions.</p><p><br></p>"}}', '["@SPA%@"]', '0', '0', 1, '[{"selecto":true,"inicio":10,"fin":149},{"inicio":150,"fin":499},{"inicio":500,"fin":10000}]', '2019-11-19', '2019-11-19', '2019-11-19', '2019-11-19', '["ZHBP","CDS","ZRCZ","ZHIM","ZHLB","ZPLB","ZMNI","ZMSU","ZCJG","ZRPL","ZHSP","ZMGR"]', 1, '2019-10-26 16:40:32', 'jugomez', 'ixicale', NOW());

-- try to copy bnf_condicion_variable 18. '@SPA%@'.
INSERT INTO clv_benefits.bnf_condicion_variable
( idbnf_configuracion_clausula, idbnf_variable_beneficio, base, tipo_dato, override_rules, es_global, tag, tipo_rango, rangos, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES((
	SELECT bcc.idbnf_configuracion_clausula FROM clv_benefits.bnf_configuracion_clausula bcc WHERE
	bcc.usuario_creacion = "jugomez" AND
    bcc.fecha_creacion = "2019-10-26 16:40:32" AND
	bcc.idbnf_sub_concepto = (
        SELECT x.idbnf_sub_concepto FROM clv_benefits.bnf_sub_concepto x WHERE
            x.usuario_creacion = "jugomez" AND
            x.fecha_creacion = "2019-10-26 16:26:55" AND
            x.idcontr_categoria_contrato = 97
        ORDER BY x.idbnf_sub_concepto DESC 
        LIMIT 1
	)
    ORDER BY bcc.idbnf_configuracion_clausula DESC 
    LIMIT 1
), 5, '{"10-149":"10","150-499":"10","500-10000":"10"}', 1, '{"10-149":[{"auth_id":0,"min":"10","max":"15","level":0}],"150-499":[{"auth_id":0,"min":"15","max":"20","level":1},{"auth_id":0,"min":"21","max":"100","level":2},{"auth_id":0,"min":"10","max":"15","level":0}],"500-10000":[{"auth_id":0,"min":"10","max":"15","level":0},{"auth_id":0,"min":"16","max":"20","level":1},{"auth_id":0,"min":"21","max":"100","level":2}]}', 1, '@SPA%@', 1, '[{"selecto":false,"inicio":10,"fin":149},{"selecto":false,"inicio":150,"fin":499},{"selecto":true,"inicio":500,"fin":10000}]', 1, '2019-10-26 16:40:33', 'jugomez', 'ixicale', NOW());

-- try to copy bnf_sub_concepto 13. 'Master Account'.
INSERT INTO clv_benefits.bnf_sub_concepto 
(idcontr_categoria_contrato, idbnf_concepto, descripcion, idioma, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES(97, 7, 'Master Account', '{"1":"Master Account"}', 1, '2019-10-26 16:41:22', 'jugomez', 'ixicale', NOW());

-- try to copy bnf_configuracion_clausula 13. 'Master Account.'.
INSERT INTO clv_benefits.bnf_configuracion_clausula 
(idbnf_sub_concepto, opcional, nombre, texto, variables, limite_inferior, limite_superior, es_rango, rangos, booking_window_fecha_inicio, booking_window_fecha_fin, travel_window_fecha_inicio, travel_window_fecha_fin, propiedades, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES((
    SELECT x.idbnf_sub_concepto FROM clv_benefits.bnf_sub_concepto x WHERE
        x.usuario_creacion = "jugomez" AND
        x.fecha_creacion = "2019-10-26 16:41:22" AND
        x.idcontr_categoria_contrato = 97
    ORDER BY x.idbnf_sub_concepto DESC
    LIMIT 1
),
0, 'Master Account.', '{"legal":{"1":"<p>  The Company will cause the Hotel to apply @MASTERACCOUNT%@% of the total\n  Net Room Pickup towards incidental charges billed to the master account. Net\n  Room Pick up is defined as the total room revenue picked up less\n  complimentary and staff rooms and after the deduction of taxes and\n  gratuities. The credit may not be used towards reducing room revenue owed or\n  towards any applicable liquidated damages. Credit may be used towards\n  surcharges for private receptions in suites, tee times at Moon Palace Spa\n  &amp; Golf Club, Spa treatments at any Palace Resort, Palace Productions AV\n  &amp; décor services. Not applicable for any cost established in the Palace\n  Production Technical Production Manual, nor for any cost derivative from any\n  external supplier. No cash reimbursement if credit is not used. Unused Credit\n  cannot be applied to future programs.&nbsp;</p>"},"comercial":{"1":"<p>Credit Back to the Group Master Account: Group will get @MASTERACCOUNT%@% of the total net group amount, credited back to the Group Master account. The credit is applicable towards surcharges for private receptions in suites, Golf at Moon Palace Spa &amp; Golf Club, Spa services at any Palace Resort or Palace Productions AV &amp; Décor services, Transportation services when contracting all Group transfers through GDS DMC, Upgraded hotel amenities and much more!</p>"}}', '["@SPA%@","@MASTERACCOUNT%@"]', '0', '0', 1, '[{"selecto":true,"inicio":10,"fin":149},{"inicio":150,"fin":499},{"inicio":500,"fin":10000}]', '2019-11-19', '2019-11-19', '2019-11-19', '2019-11-19', '["ZHBP","CDS","ZRCZ","ZHIM","ZHLB","ZPLB","ZMNI","ZMSU","ZCJG","ZRPL","ZHSP","ZMGR"]', 1, '2019-10-26 16:59:05', 'jugomez', 'ixicale', NOW());

-- try to copy bnf_condicion_variable 19. '@SPA%@'.
INSERT INTO clv_benefits.bnf_condicion_variable
( idbnf_configuracion_clausula, idbnf_variable_beneficio, base, tipo_dato, override_rules, es_global, tag, tipo_rango, rangos, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES((
	SELECT bcc.idbnf_configuracion_clausula FROM clv_benefits.bnf_configuracion_clausula bcc WHERE
	bcc.usuario_creacion = "jugomez" AND
    bcc.fecha_creacion = "2019-10-26 16:59:05" AND
	bcc.idbnf_sub_concepto = (
        SELECT x.idbnf_sub_concepto FROM clv_benefits.bnf_sub_concepto x WHERE
            x.usuario_creacion = "jugomez" AND
            x.fecha_creacion = "2019-10-26 16:41:22" AND
            x.idcontr_categoria_contrato = 97
        ORDER BY x.idbnf_sub_concepto DESC 
        LIMIT 1
	)
    ORDER BY bcc.idbnf_configuracion_clausula DESC 
    LIMIT 1
), 5, '{"10-149":"10","150-499":"10","500-10000":"10"}', 1, '{"10-149":[{"auth_id":0,"min":"10","max":"15","level":0}],"150-499":[{"auth_id":0,"min":"15","max":"20","level":1},{"auth_id":0,"min":"21","max":"100","level":2},{"auth_id":0,"min":"10","max":"15","level":0}],"500-10000":[{"auth_id":0,"min":"10","max":"15","level":0},{"auth_id":0,"min":"16","max":"20","level":1},{"auth_id":0,"min":"21","max":"100","level":2}]}', 1, '@SPA%@', 1, '[{"selecto":false,"inicio":10,"fin":149},{"selecto":false,"inicio":150,"fin":499},{"selecto":true,"inicio":500,"fin":10000}]', 1, '2019-10-26 16:59:05', 'jugomez', 'ixicale', NOW());

-- try to copy bnf_condicion_variable 20. '@MASTERACCOUNT%@'.
INSERT INTO clv_benefits.bnf_condicion_variable
( idbnf_configuracion_clausula, idbnf_variable_beneficio, base, tipo_dato, override_rules, es_global, tag, tipo_rango, rangos, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES((
	SELECT bcc.idbnf_configuracion_clausula FROM clv_benefits.bnf_configuracion_clausula bcc WHERE
	bcc.usuario_creacion = "jugomez" AND
    bcc.fecha_creacion = "2019-10-26 16:59:05" AND
	bcc.idbnf_sub_concepto = (
        SELECT x.idbnf_sub_concepto FROM clv_benefits.bnf_sub_concepto x WHERE
            x.usuario_creacion = "jugomez" AND
            x.fecha_creacion = "2019-10-26 16:41:22" AND
            x.idcontr_categoria_contrato = 97
        ORDER BY x.idbnf_sub_concepto DESC 
        LIMIT 1
	)
    ORDER BY bcc.idbnf_configuracion_clausula DESC 
    LIMIT 1
), 6, '{"10-149":"3","150-499":"3","500-10000":"3"}', 1, '{"10-149":[{"auth_id":0,"min":"3","max":"5","level":0},{"auth_id":0,"min":"6","max":"8","level":1},{"auth_id":0,"min":"9","max":"15","level":2}],"150-499":[{"auth_id":0,"min":"3","max":"5","level":0},{"auth_id":0,"min":"6","max":"8","level":1},{"auth_id":0,"min":"9","max":"15","level":2}],"500-10000":[{"auth_id":0,"min":"3","max":"5","level":0},{"auth_id":0,"min":"6","max":"8","level":1},{"auth_id":0,"min":"9","max":"15","level":2}]}', 1, '@MASTERACCOUNT%@', 1, '[{"selecto":true,"inicio":10,"fin":149},{"selecto":false,"inicio":150,"fin":499},{"selecto":false,"inicio":500,"fin":10000}]', 1, '2019-10-26 16:59:05', 'jugomez', 'ixicale', NOW());

-- try to copy bnf_sub_concepto 14. 'Free Kids'.
INSERT INTO clv_benefits.bnf_sub_concepto 
(idcontr_categoria_contrato, idbnf_concepto, descripcion, idioma, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES(97, 7, 'Free Kids', '{"1":"Resort Credit"}', 1, '2019-10-26 16:59:44', 'jugomez', 'ixicale', NOW());

-- try to copy bnf_configuracion_clausula 14. 'Resort Credit PR'.
INSERT INTO clv_benefits.bnf_configuracion_clausula 
(idbnf_sub_concepto, opcional, nombre, texto, variables, limite_inferior, limite_superior, es_rango, rangos, booking_window_fecha_inicio, booking_window_fecha_fin, travel_window_fecha_inicio, travel_window_fecha_fin, propiedades, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES((
    SELECT x.idbnf_sub_concepto FROM clv_benefits.bnf_sub_concepto x WHERE
        x.usuario_creacion = "jugomez" AND
        x.fecha_creacion = "2019-10-26 16:59:44" AND
        x.idcontr_categoria_contrato = 97
    ORDER BY x.idbnf_sub_concepto DESC
    LIMIT 1
),
0, 'Resort Credit PR', '{"legal":{"1":"<p>The Company will cause the Hotel to offer a special amenity of\n  $500 Resort Credit (for 3 nights) or $750 Resort Credit (for 4 nights) or\n  $1,500 Resort Credit (for 5 to 8 nights). Credit is based on per room per\n  stay and it is only applicable to individual guest room folio. Resort credit\n  is non-transferable and non-cumulative. Resort Credit has no commercial value\n  and is not subject to refund or credit. 16% Taxes and fees apply for services\n  redeemed and will be covered by each guest.Terms and condition at_______________</p>"},"comercial":{"1":"<p>  Resort Credit: Up to $1,500 USD in Resort Credit per room that\n  may be used towards Golf reservations, Spa Services, Selected Tours, Family\n  photo sessions, Gastronomic Experiences and selected items at the Hotel’s\n  Gift Shop and Jewellery Store. 16% Taxes and fees are applicable for services\n  redeemed. Terms and condition at_______________</p>"}}', '[]', '0', '0', 0, '[{"selecto":true,"inicio":0,"fin":0}]', '2019-11-08', '2019-11-08', '2019-11-08', '2019-11-08', '["ZHBP","CDS","ZRCZ","ZHIM","ZMNI","ZMSU","ZCJG","ZRPL","ZHSP","ZMGR"]', 1, '2019-10-26 17:26:31', 'jugomez', 'ixicale', NOW());

-- try to copy bnf_condicion_variable 21. '@%COMMISSION@'.
INSERT INTO clv_benefits.bnf_condicion_variable
( idbnf_configuracion_clausula, idbnf_variable_beneficio, base, tipo_dato, override_rules, es_global, tag, tipo_rango, rangos, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES((
	SELECT bcc.idbnf_configuracion_clausula FROM clv_benefits.bnf_configuracion_clausula bcc WHERE
	bcc.usuario_creacion = "jugomez" AND
    bcc.fecha_creacion = "2019-10-26 17:26:31" AND
	bcc.idbnf_sub_concepto = (
        SELECT x.idbnf_sub_concepto FROM clv_benefits.bnf_sub_concepto x WHERE
            x.usuario_creacion = "jugomez" AND
            x.fecha_creacion = "2019-10-26 16:59:44" AND
            x.idcontr_categoria_contrato = 97
        ORDER BY x.idbnf_sub_concepto DESC 
        LIMIT 1
	)
    ORDER BY bcc.idbnf_configuracion_clausula DESC 
    LIMIT 1
), 2, '{"0-0":"__"}', 2, '{"0-0":[{"auth_id":"0","max":"","min":"","level":"1"}]}', 1, '@%COMMISSION@', 0, '[{"selecto":true,"inicio":0,"fin":0}]', 0, '2019-10-26 17:26:31', 'jugomez', 'ixicale', NOW());


-- try to copy bnf_configuracion_clausula 15. 'Resort Credit LB'.
INSERT INTO clv_benefits.bnf_configuracion_clausula 
(idbnf_sub_concepto, opcional, nombre, texto, variables, limite_inferior, limite_superior, es_rango, rangos, booking_window_fecha_inicio, booking_window_fecha_fin, travel_window_fecha_inicio, travel_window_fecha_fin, propiedades, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES((
    SELECT x.idbnf_sub_concepto FROM clv_benefits.bnf_sub_concepto x WHERE
        x.usuario_creacion = "jugomez" AND
        x.fecha_creacion = "2019-10-26 16:59:44" AND
        x.idcontr_categoria_contrato = 97
    ORDER BY x.idbnf_sub_concepto DESC
    LIMIT 1
),
0, 'Resort Credit LB', '{"legal":{"1":"<p>The Company will cause the Hotel to offer a special amenity of\n  $500 Resort Credit (for 3 nights) or $750 Resort Credit (for 4 nights) or\n  $1,500 Resort Credit (for 5 to 8 nights). Credit is based on per room per\n  stay and it is only applicable to individual guest room folio. Resort credit\n  is non-transferable and non-cumulative. Resort Credit has no commercial value\n  and is not subject to refund or credit. 16% Taxes and fees apply for services\n  redeemed and will be covered by each guest.Terms and condition at_______________</p>"},"comercial":{"1":"<p>Resort Credit: Up to $1,500 USD in Resort Credit per room that\n  may be used towards Golf reservations, Spa Services, Selected Tours, Family\n  photo sessions, Gastronomic Experiences and selected items at the Hotel’s\n  Gift Shop and Jewellery Store. 16% Taxes and fees are applicable for services\n  redeemed. Terms and condition at_______________</p>"}}', '[]', '0', '0', 0, '[{"selecto":true,"inicio":0,"fin":0}]', '2019-11-08', '2019-11-08', '2019-11-08', '2019-11-08', '["ZHLB","ZPLB"]', 1, '2019-10-26 17:29:21', 'jugomez', 'ixicale', NOW());

-- try to copy bnf_condicion_variable 22. '@%COMMISSION@'.
INSERT INTO clv_benefits.bnf_condicion_variable
( idbnf_configuracion_clausula, idbnf_variable_beneficio, base, tipo_dato, override_rules, es_global, tag, tipo_rango, rangos, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES((
	SELECT bcc.idbnf_configuracion_clausula FROM clv_benefits.bnf_configuracion_clausula bcc WHERE
	bcc.usuario_creacion = "jugomez" AND
    bcc.fecha_creacion = "2019-10-26 17:29:21" AND
	bcc.idbnf_sub_concepto = (
        SELECT x.idbnf_sub_concepto FROM clv_benefits.bnf_sub_concepto x WHERE
            x.usuario_creacion = "jugomez" AND
            x.fecha_creacion = "2019-10-26 16:59:44" AND
            x.idcontr_categoria_contrato = 97
        ORDER BY x.idbnf_sub_concepto DESC 
        LIMIT 1
	)
    ORDER BY bcc.idbnf_configuracion_clausula DESC 
    LIMIT 1
), 2, '{"0-0":"__"}', 2, '{"0-0":[{"auth_id":"0","max":"","min":"","level":"1"}]}', 1, '@%COMMISSION@', 0, '[{"selecto":true,"inicio":0,"fin":0}]', 0, '2019-10-26 17:29:22', 'jugomez', 'ixicale', NOW());

-- try to copy bnf_sub_concepto 15. 'Resort Credit LB'.
INSERT INTO clv_benefits.bnf_sub_concepto 
(idcontr_categoria_contrato, idbnf_concepto, descripcion, idioma, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES(97, 7, 'Resort Credit LB', '{"1":"Mice Credit"}', 1, '2019-10-26 17:26:51', 'jugomez', 'ixicale', NOW());
-- try to copy bnf_sub_concepto 16. 'VIP Status'.
INSERT INTO clv_benefits.bnf_sub_concepto 
(idcontr_categoria_contrato, idbnf_concepto, descripcion, idioma, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES(97, 7, 'VIP Status', '{"1":"VIP Status"}', 1, '2019-10-26 17:36:33', 'jugomez', 'ixicale', NOW());

-- try to copy bnf_configuracion_clausula 16. 'VIPstatus'.
INSERT INTO clv_benefits.bnf_configuracion_clausula 
(idbnf_sub_concepto, opcional, nombre, texto, variables, limite_inferior, limite_superior, es_rango, rangos, booking_window_fecha_inicio, booking_window_fecha_fin, travel_window_fecha_inicio, travel_window_fecha_fin, propiedades, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES((
    SELECT x.idbnf_sub_concepto FROM clv_benefits.bnf_sub_concepto x WHERE
        x.usuario_creacion = "jugomez" AND
        x.fecha_creacion = "2019-10-26 17:36:33" AND
        x.idcontr_categoria_contrato = 97
    ORDER BY x.idbnf_sub_concepto DESC
    LIMIT 1
),
0, 'VIPstatus', '{"legal":{"1":"<p>  The Company will cause the Hotel to provide a maximum of @VIPSTATUS@ VIP status with 50 minutes spa treatments included.</p>"},"comercial":{"1":"<p>A maximum of&nbsp; @VIPSTATUS@ VIP status with 50 minutes spa treatments included.</p>"}}', '["@VIPSTATUS@"]', '0', '0', 1, '[{"selecto":true,"inicio":"149","fin":"499"},{"inicio":"500","fin":"10000"}]', '2019-11-19', '2019-11-19', '2019-11-19', '2019-11-19', '["ZHBP","CDS","ZRCZ","ZHIM","ZMNI","ZMSU","ZCJG","ZRPL","ZHSP","ZMGR"]', 1, '2019-10-26 17:47:34', 'jugomez', 'ixicale', NOW());

-- try to copy bnf_condicion_variable 23. '@VIPSTATUS@'.
INSERT INTO clv_benefits.bnf_condicion_variable
( idbnf_configuracion_clausula, idbnf_variable_beneficio, base, tipo_dato, override_rules, es_global, tag, tipo_rango, rangos, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES((
	SELECT bcc.idbnf_configuracion_clausula FROM clv_benefits.bnf_configuracion_clausula bcc WHERE
	bcc.usuario_creacion = "jugomez" AND
    bcc.fecha_creacion = "2019-10-26 17:47:34" AND
	bcc.idbnf_sub_concepto = (
        SELECT x.idbnf_sub_concepto FROM clv_benefits.bnf_sub_concepto x WHERE
            x.usuario_creacion = "jugomez" AND
            x.fecha_creacion = "2019-10-26 17:36:33" AND
            x.idcontr_categoria_contrato = 97
        ORDER BY x.idbnf_sub_concepto DESC 
        LIMIT 1
	)
    ORDER BY bcc.idbnf_configuracion_clausula DESC 
    LIMIT 1
), 7, '{"150-499":"8","500-10000":"10"}', 1, '{"150-499":[{"auth_id":0,"min":"1","max":"8","level":0},{"auth_id":0,"min":"9","max":"10","level":1},{"auth_id":0,"min":"11","max":"20","level":2}],"500-10000":[{"auth_id":0,"min":"1","max":"10","level":0},{"auth_id":0,"min":"11","max":"12","level":1},{"auth_id":0,"min":"13","max":"20","level":2}]}', 1, '@VIPSTATUS@', 1, '[{"selecto":true,"inicio":150,"fin":499},{"selecto":false,"inicio":500,"fin":10000}]', 1, '2019-10-26 17:47:34', 'jugomez', 'ixicale', NOW());

-- try to copy bnf_sub_concepto 17. 'Optional'.
INSERT INTO clv_benefits.bnf_sub_concepto 
(idcontr_categoria_contrato, idbnf_concepto, descripcion, idioma, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES(97, 7, 'Optional', '{"1":"Optional"}', 1, '2019-10-26 17:54:29', 'jugomez', 'ixicale', NOW());

-- try to copy bnf_configuracion_clausula 17. 'Optonial'.
INSERT INTO clv_benefits.bnf_configuracion_clausula 
(idbnf_sub_concepto, opcional, nombre, texto, variables, limite_inferior, limite_superior, es_rango, rangos, booking_window_fecha_inicio, booking_window_fecha_fin, travel_window_fecha_inicio, travel_window_fecha_fin, propiedades, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES((
    SELECT x.idbnf_sub_concepto FROM clv_benefits.bnf_sub_concepto x WHERE
        x.usuario_creacion = "jugomez" AND
        x.fecha_creacion = "2019-10-26 17:54:29" AND
        x.idcontr_categoria_contrato = 97
    ORDER BY x.idbnf_sub_concepto DESC
    LIMIT 1
),
0, 'Optonial', '{"legal":{"1":"@OPTIONAL@"},"comercial":{"1":"<p>@OPTIONAL@</p>"}}', '["@OPTIONAL@"]', '0', '0', 0, '[{"selecto":true,"inicio":0,"fin":0}]', '2019-11-19', '2019-11-19', '2019-11-19', '2019-11-19', '["ZHBP","CDS","ZRCZ","ZHIM","ZHLB","ZPLB","ZMNI","ZMSU","ZCJG","ZRPL","ZHSP","ZMGR"]', 1, '2019-10-26 17:56:02', 'jugomez', 'ixicale', NOW());

-- try to copy bnf_condicion_variable 24. '@OPTIONAL@'.
INSERT INTO clv_benefits.bnf_condicion_variable
( idbnf_configuracion_clausula, idbnf_variable_beneficio, base, tipo_dato, override_rules, es_global, tag, tipo_rango, rangos, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES((
	SELECT bcc.idbnf_configuracion_clausula FROM clv_benefits.bnf_configuracion_clausula bcc WHERE
	bcc.usuario_creacion = "jugomez" AND
    bcc.fecha_creacion = "2019-10-26 17:56:02" AND
	bcc.idbnf_sub_concepto = (
        SELECT x.idbnf_sub_concepto FROM clv_benefits.bnf_sub_concepto x WHERE
            x.usuario_creacion = "jugomez" AND
            x.fecha_creacion = "2019-10-26 17:54:29" AND
            x.idcontr_categoria_contrato = 97
        ORDER BY x.idbnf_sub_concepto DESC 
        LIMIT 1
	)
    ORDER BY bcc.idbnf_configuracion_clausula DESC 
    LIMIT 1
), 8, '{"0-0":"__"}', 2, '{"0-0":[{"auth_id":"0","max":"","min":"","level":"1"}]}', 1, '@OPTIONAL@', 0, '[{"selecto":true,"inicio":0,"fin":0}]', 1, '2019-10-26 17:56:02', 'jugomez', 'ixicale', NOW());

-- try to copy bnf_sub_concepto 18. 'Free Kids'.
INSERT INTO clv_benefits.bnf_sub_concepto 
(idcontr_categoria_contrato, idbnf_concepto, descripcion, idioma, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES(97, 2, 'Free Kids', '{"1":"Free Kids"}', 1, '2019-10-26 19:08:09', 'jugomez', 'ixicale', NOW());

-- try to copy bnf_configuracion_clausula 18. 'Free Kids'.
INSERT INTO clv_benefits.bnf_configuracion_clausula 
(idbnf_sub_concepto, opcional, nombre, texto, variables, limite_inferior, limite_superior, es_rango, rangos, booking_window_fecha_inicio, booking_window_fecha_fin, travel_window_fecha_inicio, travel_window_fecha_fin, propiedades, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES((
    SELECT x.idbnf_sub_concepto FROM clv_benefits.bnf_sub_concepto x WHERE
        x.usuario_creacion = "jugomez" AND
        x.fecha_creacion = "2019-10-26 19:08:09" AND
        x.idcontr_categoria_contrato = 97
    ORDER BY x.idbnf_sub_concepto DESC
    LIMIT 1
),
0, 'Free Kids', '{"legal":{"1":"<p>  Free Kids Promotion: Children up to 17 years old are free of\n  charge when sharing a room with their parents.</p>"},"comercial":{"1":"<p>  Free Kids Promotion: Children up to 17 years old are free of\n  charge when sharing a room with their parents.</p>"}}', '[]', '0', '0', 0, '[{"selecto":true,"inicio":0,"fin":0}]', '2019-11-08', '2019-11-08', '2019-11-08', '2019-11-08', '["ZHBP","CDS","ZRCZ","ZMNI","ZMSU","ZCJG","ZRPL","ZMGR"]', 1, '2019-10-26 19:09:43', 'jugomez', 'ixicale', NOW());

-- try to copy bnf_condicion_variable 25. '@%COMMISSION@'.
INSERT INTO clv_benefits.bnf_condicion_variable
( idbnf_configuracion_clausula, idbnf_variable_beneficio, base, tipo_dato, override_rules, es_global, tag, tipo_rango, rangos, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES((
	SELECT bcc.idbnf_configuracion_clausula FROM clv_benefits.bnf_configuracion_clausula bcc WHERE
	bcc.usuario_creacion = "jugomez" AND
    bcc.fecha_creacion = "2019-10-26 19:09:43" AND
	bcc.idbnf_sub_concepto = (
        SELECT x.idbnf_sub_concepto FROM clv_benefits.bnf_sub_concepto x WHERE
            x.usuario_creacion = "jugomez" AND
            x.fecha_creacion = "2019-10-26 19:08:09" AND
            x.idcontr_categoria_contrato = 97
        ORDER BY x.idbnf_sub_concepto DESC 
        LIMIT 1
	)
    ORDER BY bcc.idbnf_configuracion_clausula DESC 
    LIMIT 1
), 2, '{"0-0":"__"}', 2, '{"0-0":[{"auth_id":"0","max":"","min":"","level":"1"}]}', 1, '@%COMMISSION@', 0, '[{"selecto":true,"inicio":0,"fin":0}]', 0, '2019-10-26 19:09:43', 'jugomez', 'ixicale', NOW());

-- try to copy bnf_sub_concepto 19. 'Ready, Sell, Stay'.
INSERT INTO clv_benefits.bnf_sub_concepto 
(idcontr_categoria_contrato, idbnf_concepto, descripcion, idioma, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES(97, 2, 'Ready, Sell, Stay', '{"1":"Ready, Sell, Stay"}', 1, '2019-10-26 19:10:55', 'jugomez', 'ixicale', NOW());

-- try to copy bnf_configuracion_clausula 19. 'Ready, Sell, Stay'.
INSERT INTO clv_benefits.bnf_configuracion_clausula 
(idbnf_sub_concepto, opcional, nombre, texto, variables, limite_inferior, limite_superior, es_rango, rangos, booking_window_fecha_inicio, booking_window_fecha_fin, travel_window_fecha_inicio, travel_window_fecha_fin, propiedades, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES((
    SELECT x.idbnf_sub_concepto FROM clv_benefits.bnf_sub_concepto x WHERE
        x.usuario_creacion = "jugomez" AND
        x.fecha_creacion = "2019-10-26 19:10:55" AND
        x.idcontr_categoria_contrato = 97
    ORDER BY x.idbnf_sub_concepto DESC
    LIMIT 1
),
0, 'Ready, Sell, Stay', '{"legal":{"1":"<p>  Ready, Sell, Stay!: Our Rewards Program to thank you for your\n  preference by earning Complimentary nights at any Palace Resorts property\n  when booking a group with us. For detailed information please visit the\n  attached web link.______</p>"},"comercial":{"1":"<p>  Ready, Sell, Stay!: Our Rewards Program to thank you for your\n  preference by earning Complimentary nights at any Palace Resorts property\n  when booking a group with us. For detailed information please visit the\n  attached web link._____</p>"}}', '[]', '0', '0', 0, '[{"selecto":true,"inicio":0,"fin":0}]', '2019-11-08', '2019-11-08', '2019-11-08', '2019-11-08', '["ZHBP","CDS","ZRCZ","ZHIM","ZHLB","ZPLB","ZMNI","ZMSU","ZCJG","ZRPL","ZHSP","ZMGR"]', 1, '2019-10-26 19:11:34', 'jugomez', 'ixicale', NOW());

-- try to copy bnf_condicion_variable 26. '@%COMMISSION@'.
INSERT INTO clv_benefits.bnf_condicion_variable
( idbnf_configuracion_clausula, idbnf_variable_beneficio, base, tipo_dato, override_rules, es_global, tag, tipo_rango, rangos, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES((
	SELECT bcc.idbnf_configuracion_clausula FROM clv_benefits.bnf_configuracion_clausula bcc WHERE
	bcc.usuario_creacion = "jugomez" AND
    bcc.fecha_creacion = "2019-10-26 19:11:34" AND
	bcc.idbnf_sub_concepto = (
        SELECT x.idbnf_sub_concepto FROM clv_benefits.bnf_sub_concepto x WHERE
            x.usuario_creacion = "jugomez" AND
            x.fecha_creacion = "2019-10-26 19:10:55" AND
            x.idcontr_categoria_contrato = 97
        ORDER BY x.idbnf_sub_concepto DESC 
        LIMIT 1
	)
    ORDER BY bcc.idbnf_configuracion_clausula DESC 
    LIMIT 1
), 2, '{"0-0":"__"}', 2, '{"0-0":[{"auth_id":"0","max":"","min":"","level":"1"}]}', 1, '@%COMMISSION@', 0, '[{"selecto":true,"inicio":0,"fin":0}]', 0, '2019-10-26 19:11:34', 'jugomez', 'ixicale', NOW());

-- try to copy bnf_sub_concepto 20. 'Comisión México'.
INSERT INTO clv_benefits.bnf_sub_concepto 
(idcontr_categoria_contrato, idbnf_concepto, descripcion, idioma, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES(97, 10, 'Comisión México', '{"2":"Comisión Jamaica"}', 1, '2019-11-09 16:04:10', 'marrosas', 'ixicale', NOW());

-- try to copy bnf_configuracion_clausula 20. 'Comisión Jamaica'.
INSERT INTO clv_benefits.bnf_configuracion_clausula 
(idbnf_sub_concepto, opcional, nombre, texto, variables, limite_inferior, limite_superior, es_rango, rangos, booking_window_fecha_inicio, booking_window_fecha_fin, travel_window_fecha_inicio, travel_window_fecha_fin, propiedades, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES((
    SELECT x.idbnf_sub_concepto FROM clv_benefits.bnf_sub_concepto x WHERE
        x.usuario_creacion = "marrosas" AND
        x.fecha_creacion = "2019-11-09 16:04:10" AND
        x.idcontr_categoria_contrato = 97
    ORDER BY x.idbnf_sub_concepto DESC
    LIMIT 1
),
0, 'Comisión Jamaica', '{"legal":{"2":"<p style=\"text-align: justify;\"><span style=\"font-size: 12px;\">La tarifa es comisionable al Grupo&nbsp;al @%COMISIONMX@. Por favor considere que la comisión es calculada sobre el\nbalance después de deducir $4 USD por persona, por noche de Impuesto de\nHospitalidad, 10% de GCT (Impuesto General de Consumo) y 10% por persona, por\ndía de gratuidades de las tarifas arriba especificadas. </span></p>"},"comercial":{"2":"<p style=\"text-align: justify;\"><span style=\"font-size: 12px;\">La tarifa es comisionable al Grupo&nbsp;&nbsp;al @%COMISIONMX@. La comisión es calculada sobre el\nbalance después de deducir $4 USD por persona, por noche de Impuesto de\nHospitalidad, 10% de GCT (Impuesto General de Consumo) y 10% por persona, por\ndía de gratuidades de las tarifas arriba especificadas.</span></p>"}}', '["@%COMMISSION@","@%COMISIONMX@"]', '0', '0', 0, '[{"selecto":true,"inicio":0,"fin":0}]', '2019-11-19', '2019-11-19', '2019-11-19', '2019-11-19', '["ZHBP","ZCJG","ZHSP","ZMGR"]', 1, '2019-11-09 16:09:44', 'marrosas', 'ixicale', NOW());

-- try to copy bnf_condicion_variable 30. '@%COMMISSION@'.
INSERT INTO clv_benefits.bnf_condicion_variable
( idbnf_configuracion_clausula, idbnf_variable_beneficio, base, tipo_dato, override_rules, es_global, tag, tipo_rango, rangos, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES((
	SELECT bcc.idbnf_configuracion_clausula FROM clv_benefits.bnf_configuracion_clausula bcc WHERE
	bcc.usuario_creacion = "marrosas" AND
    bcc.fecha_creacion = "2019-11-09 16:09:44" AND
	bcc.idbnf_sub_concepto = (
        SELECT x.idbnf_sub_concepto FROM clv_benefits.bnf_sub_concepto x WHERE
            x.usuario_creacion = "marrosas" AND
            x.fecha_creacion = "2019-11-09 16:04:10" AND
            x.idcontr_categoria_contrato = 97
        ORDER BY x.idbnf_sub_concepto DESC 
        LIMIT 1
	)
    ORDER BY bcc.idbnf_configuracion_clausula DESC 
    LIMIT 1
), 2, '{"0-0":"10"}', 1, '{"0-0":[{"auth_id":0,"min":"10","max":"12","level":0},{"auth_id":0,"min":"13","max":"15","level":1},{"auth_id":0,"min":"16","max":"20","level":2}]}', 1, '@%COMMISSION@', 0, '[{"selecto":true,"inicio":0,"fin":0}]', 1, '2019-11-09 16:09:45', 'marrosas', 'ixicale', NOW());

-- try to copy bnf_condicion_variable 54. '@%COMISIONMX@'.
INSERT INTO clv_benefits.bnf_condicion_variable
( idbnf_configuracion_clausula, idbnf_variable_beneficio, base, tipo_dato, override_rules, es_global, tag, tipo_rango, rangos, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES((
	SELECT bcc.idbnf_configuracion_clausula FROM clv_benefits.bnf_configuracion_clausula bcc WHERE
	bcc.usuario_creacion = "marrosas" AND
    bcc.fecha_creacion = "2019-11-09 16:09:44" AND
	bcc.idbnf_sub_concepto = (
        SELECT x.idbnf_sub_concepto FROM clv_benefits.bnf_sub_concepto x WHERE
            x.usuario_creacion = "marrosas" AND
            x.fecha_creacion = "2019-11-09 16:04:10" AND
            x.idcontr_categoria_contrato = 97
        ORDER BY x.idbnf_sub_concepto DESC 
        LIMIT 1
	)
    ORDER BY bcc.idbnf_configuracion_clausula DESC 
    LIMIT 1
), 9, '{"0-0":"1"}', 1, '{"0-0":[{"auth_id":0,"min":"1","max":"15","level":0}]}', 0, '@%COMISIONMX@', 0, '[{"selecto":true,"inicio":0,"fin":0}]', 1, '2019-11-19 22:24:27', 'marrosas', 'ixicale', NOW());

-- try to copy bnf_sub_concepto 21. 'Comisión México'.
INSERT INTO clv_benefits.bnf_sub_concepto 
(idcontr_categoria_contrato, idbnf_concepto, descripcion, idioma, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES(97, 10, 'Comisión México', '{"2":"Comisión México"}', 1, '2019-11-09 16:12:21', 'marrosas', 'ixicale', NOW());

-- try to copy bnf_configuracion_clausula 21. 'Comisión México'.
INSERT INTO clv_benefits.bnf_configuracion_clausula 
(idbnf_sub_concepto, opcional, nombre, texto, variables, limite_inferior, limite_superior, es_rango, rangos, booking_window_fecha_inicio, booking_window_fecha_fin, travel_window_fecha_inicio, travel_window_fecha_fin, propiedades, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES((
    SELECT x.idbnf_sub_concepto FROM clv_benefits.bnf_sub_concepto x WHERE
        x.usuario_creacion = "marrosas" AND
        x.fecha_creacion = "2019-11-09 16:12:21" AND
        x.idcontr_categoria_contrato = 97
    ORDER BY x.idbnf_sub_concepto DESC
    LIMIT 1
),
0, 'Comisión México', '{"legal":{"2":"<span style=\"font-size: 12px;\"><p style=\"text-align: justify;\">La tarifa es comisionable a (variable agencia) al (variable porcentaje)%. Por favor considere que la comisión es calculada sobre el balance después de deducir el 3% de impuesto de hospitalidad y $5.00 USD por persona, por día de gratuidades de las tarifas arriba especificadas.</p></span>"},"comercial":{"2":"<span style=\"font-size: 12px;\"><p style=\"text-align: justify;\">La tarifa es comisionable a (variable agencia) al (variable porcentaje)%. La comisión es calculada sobre el balance después de deducir el 3% de impuesto de hospitalidad y $5.00 USD por persona, por día de gratuidades de las tarifas arriba especificadas.</p></span>"}}', '[]', '0', '0', 0, '[{"selecto":true,"inicio":0,"fin":0}]', '2019-11-09', '2019-11-09', '2019-11-09', '2019-11-09', '["ZHBP","CDS","ZRCZ","ZHIM","ZHLB","ZPLB","ZMNI","ZMSU","ZCMPPC","ZRPL","ZHSP","ZMGR"]', 1, '2019-11-09 16:14:21', 'marrosas', 'ixicale', NOW());

-- try to copy bnf_condicion_variable 31. '@%COMMISSION@'.
INSERT INTO clv_benefits.bnf_condicion_variable
( idbnf_configuracion_clausula, idbnf_variable_beneficio, base, tipo_dato, override_rules, es_global, tag, tipo_rango, rangos, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES((
	SELECT bcc.idbnf_configuracion_clausula FROM clv_benefits.bnf_configuracion_clausula bcc WHERE
	bcc.usuario_creacion = "marrosas" AND
    bcc.fecha_creacion = "2019-11-09 16:14:21" AND
	bcc.idbnf_sub_concepto = (
        SELECT x.idbnf_sub_concepto FROM clv_benefits.bnf_sub_concepto x WHERE
            x.usuario_creacion = "marrosas" AND
            x.fecha_creacion = "2019-11-09 16:12:21" AND
            x.idcontr_categoria_contrato = 97
        ORDER BY x.idbnf_sub_concepto DESC 
        LIMIT 1
	)
    ORDER BY bcc.idbnf_configuracion_clausula DESC 
    LIMIT 1
), 2, '{"0-0":"__"}', 2, '{"0-0":[{"auth_id":"0","max":"","min":"","level":"1"}]}', 1, '@%COMMISSION@', 0, '[{"selecto":true,"inicio":0,"fin":0}]', 0, '2019-11-09 16:14:22', 'marrosas', 'ixicale', NOW());

-- try to copy bnf_sub_concepto 22. 'Comisión Staff, Comps, Up grades'.
INSERT INTO clv_benefits.bnf_sub_concepto 
(idcontr_categoria_contrato, idbnf_concepto, descripcion, idioma, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES(97, 10, 'Comisión Staff, Comps, Up grades', '{"2":"Comisión Staff, Comps, Up grades"}', 1, '2019-11-09 16:15:21', 'marrosas', 'ixicale', NOW());

-- try to copy bnf_configuracion_clausula 22. 'Comisión Staff, Comps, Upgrades'.
INSERT INTO clv_benefits.bnf_configuracion_clausula 
(idbnf_sub_concepto, opcional, nombre, texto, variables, limite_inferior, limite_superior, es_rango, rangos, booking_window_fecha_inicio, booking_window_fecha_fin, travel_window_fecha_inicio, travel_window_fecha_fin, propiedades, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES((
    SELECT x.idbnf_sub_concepto FROM clv_benefits.bnf_sub_concepto x WHERE
        x.usuario_creacion = "marrosas" AND
        x.fecha_creacion = "2019-11-09 16:15:21" AND
        x.idcontr_categoria_contrato = 97
    ORDER BY x.idbnf_sub_concepto DESC
    LIMIT 1
),
0, 'Comisión Staff, Comps, Upgrades', '{"legal":{"2":"<p style=\"text-align: justify;\">  <span style=\"font-size: 12px;\">Habitaciones\n  con tarifas descontadas como habitaciones Staff, habitaciones Complementarias\n  y habitaciones en Ascenso no son comisionables.</span></p>"},"comercial":{"2":"<p style=\"text-align: justify;\"><span style=\"font-size: 12px;\">Habitaciones\n  con tarifas descontadas como habitaciones Staff, habitaciones Complementarias\n  y habitaciones en Ascenso no son comisionables.</span></p>"}}', '[]', '0', '0', 0, '[{"selecto":true,"inicio":0,"fin":0}]', '2019-11-09', '2019-11-09', '2019-11-09', '2019-11-09', '["ZHBP","CDS","ZRCZ","ZHIM","ZHLB","ZPLB","ZMNI","ZMSU","ZCJG","ZCMPPC","ZRPL","ZHSP","ZMGR"]', 1, '2019-11-09 16:16:31', 'marrosas', 'ixicale', NOW());

-- try to copy bnf_condicion_variable 32. '@%COMMISSION@'.
INSERT INTO clv_benefits.bnf_condicion_variable
( idbnf_configuracion_clausula, idbnf_variable_beneficio, base, tipo_dato, override_rules, es_global, tag, tipo_rango, rangos, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES((
	SELECT bcc.idbnf_configuracion_clausula FROM clv_benefits.bnf_configuracion_clausula bcc WHERE
	bcc.usuario_creacion = "marrosas" AND
    bcc.fecha_creacion = "2019-11-09 16:16:31" AND
	bcc.idbnf_sub_concepto = (
        SELECT x.idbnf_sub_concepto FROM clv_benefits.bnf_sub_concepto x WHERE
            x.usuario_creacion = "marrosas" AND
            x.fecha_creacion = "2019-11-09 16:15:21" AND
            x.idcontr_categoria_contrato = 97
        ORDER BY x.idbnf_sub_concepto DESC 
        LIMIT 1
	)
    ORDER BY bcc.idbnf_configuracion_clausula DESC 
    LIMIT 1
), 2, '{"0-0":"__"}', 2, '{"0-0":[{"auth_id":"0","max":"","min":"","level":"1"}]}', 0, '@%COMMISSION@', 0, '[{"selecto":true,"inicio":0,"fin":0}]', 0, '2019-11-09 16:16:32', 'marrosas', 'ixicale', NOW());

-- try to copy bnf_sub_concepto 23. 'Eventos y locaciones'.
INSERT INTO clv_benefits.bnf_sub_concepto 
(idcontr_categoria_contrato, idbnf_concepto, descripcion, idioma, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES(97, 7, 'Eventos y locaciones', '{"2":"Eventos y locaciones"}', 1, '2019-11-12 01:17:21', 'marrosas', 'ixicale', NOW());

-- try to copy bnf_configuracion_clausula 23. 'Eventos y locaciones'.
INSERT INTO clv_benefits.bnf_configuracion_clausula 
(idbnf_sub_concepto, opcional, nombre, texto, variables, limite_inferior, limite_superior, es_rango, rangos, booking_window_fecha_inicio, booking_window_fecha_fin, travel_window_fecha_inicio, travel_window_fecha_fin, propiedades, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES((
    SELECT x.idbnf_sub_concepto FROM clv_benefits.bnf_sub_concepto x WHERE
        x.usuario_creacion = "marrosas" AND
        x.fecha_creacion = "2019-11-12 01:17:21" AND
        x.idcontr_categoria_contrato = 97
    ORDER BY x.idbnf_sub_concepto DESC
    LIMIT 1
),
0, 'Eventos y locaciones', '{"legal":{"2":"<p style=\"text-align: justify;\">Dependiendo de la producción de Cuartos Noche, el Grupo tendrá de sin costo eventos y locaciones.</p>"},"comercial":{"2":"Eventos y locaciones sin costo, dependiendo de la producción de Cuarto Noche.&nbsp;"}}', '[]', '0', '0', 0, '[{"selecto":true,"inicio":0,"fin":0}]', '2019-11-11', '2019-11-11', '2019-11-11', '2019-11-11', '["ZHBP","CDS","ZRCZ","ZHIM","ZHLB","ZPLB","ZMNI","ZMSU","ZCJG","ZCMPPC","ZRPL","ZHSP","ZMGR"]', 1, '2019-11-12 01:21:02', 'marrosas', 'ixicale', NOW());

-- try to copy bnf_condicion_variable 34. '@%COMMISSION@'.
INSERT INTO clv_benefits.bnf_condicion_variable
( idbnf_configuracion_clausula, idbnf_variable_beneficio, base, tipo_dato, override_rules, es_global, tag, tipo_rango, rangos, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES((
	SELECT bcc.idbnf_configuracion_clausula FROM clv_benefits.bnf_configuracion_clausula bcc WHERE
	bcc.usuario_creacion = "marrosas" AND
    bcc.fecha_creacion = "2019-11-12 01:21:02" AND
	bcc.idbnf_sub_concepto = (
        SELECT x.idbnf_sub_concepto FROM clv_benefits.bnf_sub_concepto x WHERE
            x.usuario_creacion = "marrosas" AND
            x.fecha_creacion = "2019-11-12 01:17:21" AND
            x.idcontr_categoria_contrato = 97
        ORDER BY x.idbnf_sub_concepto DESC 
        LIMIT 1
	)
    ORDER BY bcc.idbnf_configuracion_clausula DESC 
    LIMIT 1
), 2, '{"0-0":"10"}', 1, '{"0-0":[{"auth_id":0,"min":"10","max":"12","level":0},{"auth_id":0,"min":"13","max":"15","level":1},{"auth_id":0,"min":"16","max":"20","level":2}]}', 1, '@%COMMISSION@', 0, '[{"selecto":true,"inicio":0,"fin":0}]', 0, '2019-11-12 01:21:03', 'marrosas', 'ixicale', NOW());

-- try to copy bnf_sub_concepto 24. 'Meseros'.
INSERT INTO clv_benefits.bnf_sub_concepto 
(idcontr_categoria_contrato, idbnf_concepto, descripcion, idioma, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES(97, 7, 'Meseros', '{"2":"Meseros"}', 1, '2019-11-12 01:21:29', 'marrosas', 'ixicale', NOW());

-- try to copy bnf_configuracion_clausula 24. 'Hrs Meseros'.
INSERT INTO clv_benefits.bnf_configuracion_clausula 
(idbnf_sub_concepto, opcional, nombre, texto, variables, limite_inferior, limite_superior, es_rango, rangos, booking_window_fecha_inicio, booking_window_fecha_fin, travel_window_fecha_inicio, travel_window_fecha_fin, propiedades, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES((
    SELECT x.idbnf_sub_concepto FROM clv_benefits.bnf_sub_concepto x WHERE
        x.usuario_creacion = "marrosas" AND
        x.fecha_creacion = "2019-11-12 01:21:29" AND
        x.idcontr_categoria_contrato = 97
    ORDER BY x.idbnf_sub_concepto DESC
    LIMIT 1
),
0, 'Hrs Meseros', '{"legal":{"2":"<p style=\"text-align: justify;\">Incluye&nbsp;&nbsp;@MESEROS@ horas de servicio de meseros en eventos privados.</p>"},"comercial":{"2":"<p style=\"text-align: justify;\">Incluye&nbsp;@MESEROS@ horas de servicio de meseros en eventos privados.</p>"}}', '["@MESEROS@"]', '0', '0', 0, '[{"selecto":true,"inicio":0,"fin":0}]', '2019-11-19', '2019-11-19', '2019-11-19', '2019-11-19', '["ZHBP","CDS","ZRCZ","ZHIM","ZHLB","ZPLB","ZMNI","ZMSU","ZCJG","ZCMPPC","ZRPL","ZHSP","ZMGR"]', 1, '2019-11-12 01:27:04', 'marrosas', 'ixicale', NOW());

-- try to copy bnf_condicion_variable 35. '@MESEROS@'.
INSERT INTO clv_benefits.bnf_condicion_variable
( idbnf_configuracion_clausula, idbnf_variable_beneficio, base, tipo_dato, override_rules, es_global, tag, tipo_rango, rangos, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES((
	SELECT bcc.idbnf_configuracion_clausula FROM clv_benefits.bnf_configuracion_clausula bcc WHERE
	bcc.usuario_creacion = "marrosas" AND
    bcc.fecha_creacion = "2019-11-12 01:27:04" AND
	bcc.idbnf_sub_concepto = (
        SELECT x.idbnf_sub_concepto FROM clv_benefits.bnf_sub_concepto x WHERE
            x.usuario_creacion = "marrosas" AND
            x.fecha_creacion = "2019-11-12 01:21:29" AND
            x.idcontr_categoria_contrato = 97
        ORDER BY x.idbnf_sub_concepto DESC 
        LIMIT 1
	)
    ORDER BY bcc.idbnf_configuracion_clausula DESC 
    LIMIT 1
), 10, '{"0-0":"1"}', 1, '{"0-0":[{"auth_id":0,"min":"01","max":"5","level":0},{"auth_id":0,"min":"6","max":"9","level":1},{"auth_id":0,"min":"11","max":"20","level":2}]}', 1, '@MESEROS@', 0, '[{"selecto":true,"inicio":0,"fin":0}]', 1, '2019-11-12 01:27:04', 'marrosas', 'ixicale', NOW());

-- try to copy bnf_sub_concepto 25. 'Área de Registro'.
INSERT INTO clv_benefits.bnf_sub_concepto 
(idcontr_categoria_contrato, idbnf_concepto, descripcion, idioma, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES(97, 7, 'Área de Registro', '{"2":"Área de Registro"}', 1, '2019-11-12 01:28:33', 'marrosas', 'ixicale', NOW());

-- try to copy bnf_configuracion_clausula 25. 'Área de Registro'.
INSERT INTO clv_benefits.bnf_configuracion_clausula 
(idbnf_sub_concepto, opcional, nombre, texto, variables, limite_inferior, limite_superior, es_rango, rangos, booking_window_fecha_inicio, booking_window_fecha_fin, travel_window_fecha_inicio, travel_window_fecha_fin, propiedades, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES((
    SELECT x.idbnf_sub_concepto FROM clv_benefits.bnf_sub_concepto x WHERE
        x.usuario_creacion = "marrosas" AND
        x.fecha_creacion = "2019-11-12 01:28:33" AND
        x.idcontr_categoria_contrato = 97
    ORDER BY x.idbnf_sub_concepto DESC
    LIMIT 1
),
0, 'Área de Registro', '{"legal":{"2":"<p style=\"text-align: justify;\">Área de registro especial, sujeta a disponibilidad al momento de firma del Contrato y de acuerdo al número y hora de llegada de sus participantes.&nbsp; Incluye barra de bebidas y canapés durante el registro.<br></p>"},"comercial":{"2":"Área de registro especial, sujeta a disponibilidad al momento de firma del Contrato y de acuerdo al número y hora de llegada de sus participantes.&nbsp; Incluye barra de bebidas y canapés durante el registro."}}', '[]', '0', '0', 0, '[{"selecto":true,"inicio":0,"fin":0}]', '2019-11-11', '2019-11-11', '2019-11-11', '2019-11-11', '["ZHBP","CDS","ZRCZ","ZHIM","ZHLB","ZPLB","ZMNI","ZMSU","ZCJG","ZCMPPC","ZRPL","ZHSP","ZMGR"]', 1, '2019-11-12 01:30:16', 'marrosas', 'ixicale', NOW());

-- try to copy bnf_condicion_variable 36. '@%COMMISSION@'.
INSERT INTO clv_benefits.bnf_condicion_variable
( idbnf_configuracion_clausula, idbnf_variable_beneficio, base, tipo_dato, override_rules, es_global, tag, tipo_rango, rangos, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES((
	SELECT bcc.idbnf_configuracion_clausula FROM clv_benefits.bnf_configuracion_clausula bcc WHERE
	bcc.usuario_creacion = "marrosas" AND
    bcc.fecha_creacion = "2019-11-12 01:30:16" AND
	bcc.idbnf_sub_concepto = (
        SELECT x.idbnf_sub_concepto FROM clv_benefits.bnf_sub_concepto x WHERE
            x.usuario_creacion = "marrosas" AND
            x.fecha_creacion = "2019-11-12 01:28:33" AND
            x.idcontr_categoria_contrato = 97
        ORDER BY x.idbnf_sub_concepto DESC 
        LIMIT 1
	)
    ORDER BY bcc.idbnf_configuracion_clausula DESC 
    LIMIT 1
), 2, '{"0-0":"__"}', 2, '{"0-0":[{"auth_id":"0","max":"","min":"","level":"1"}]}', 1, '@%COMMISSION@', 0, '[{"selecto":true,"inicio":0,"fin":0}]', 0, '2019-11-12 01:30:16', 'marrosas', 'ixicale', NOW());

-- try to copy bnf_sub_concepto 26. 'Salones'.
INSERT INTO clv_benefits.bnf_sub_concepto 
(idcontr_categoria_contrato, idbnf_concepto, descripcion, idioma, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES(97, 7, 'Salones', '{"2":"Salones"}', 1, '2019-11-12 01:37:35', 'marrosas', 'ixicale', NOW());
-- try to copy bnf_sub_concepto 27. 'Coffee Break'.
INSERT INTO clv_benefits.bnf_sub_concepto 
(idcontr_categoria_contrato, idbnf_concepto, descripcion, idioma, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES(97, 7, 'Coffee Break', '{"2":"Coffee Break"}', 1, '2019-11-12 01:38:59', 'marrosas', 'ixicale', NOW());

-- try to copy bnf_configuracion_clausula 26. 'Coffee Break'.
INSERT INTO clv_benefits.bnf_configuracion_clausula 
(idbnf_sub_concepto, opcional, nombre, texto, variables, limite_inferior, limite_superior, es_rango, rangos, booking_window_fecha_inicio, booking_window_fecha_fin, travel_window_fecha_inicio, travel_window_fecha_fin, propiedades, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES((
    SELECT x.idbnf_sub_concepto FROM clv_benefits.bnf_sub_concepto x WHERE
        x.usuario_creacion = "marrosas" AND
        x.fecha_creacion = "2019-11-12 01:38:59" AND
        x.idcontr_categoria_contrato = 97
    ORDER BY x.idbnf_sub_concepto DESC
    LIMIT 1
),
0, 'Coffee Break', '{"legal":{"2":"<p style=\"text-align: justify;\">Coffee Break continuo durante las sesiones del Grupo (café, agua, refrescos, pan dulce, pastas, crudittes y/o snacks).&nbsp;&nbsp;</p>"},"comercial":{"2":"<p style=\"text-align: justify;\">Coffee Break continuo durante las sesiones del Grupo (café, agua, refrescos, pan dulce, pastas, crudittes y/o snacks).&nbsp;&nbsp;</p>"}}', '[]', '0', '0', 0, '[{"selecto":true,"inicio":0,"fin":0}]', '2019-11-11', '2019-11-11', '2019-11-11', '2019-11-11', '["ZHBP","CDS","ZRCZ","ZHIM","ZHLB","ZPLB","ZMNI","ZMSU","ZCJG","ZCMPPC","ZRPL","ZHSP","ZMGR"]', 1, '2019-11-12 01:40:46', 'marrosas', 'ixicale', NOW());

-- try to copy bnf_condicion_variable 37. '@%COMMISSION@'.
INSERT INTO clv_benefits.bnf_condicion_variable
( idbnf_configuracion_clausula, idbnf_variable_beneficio, base, tipo_dato, override_rules, es_global, tag, tipo_rango, rangos, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES((
	SELECT bcc.idbnf_configuracion_clausula FROM clv_benefits.bnf_configuracion_clausula bcc WHERE
	bcc.usuario_creacion = "marrosas" AND
    bcc.fecha_creacion = "2019-11-12 01:40:46" AND
	bcc.idbnf_sub_concepto = (
        SELECT x.idbnf_sub_concepto FROM clv_benefits.bnf_sub_concepto x WHERE
            x.usuario_creacion = "marrosas" AND
            x.fecha_creacion = "2019-11-12 01:38:59" AND
            x.idcontr_categoria_contrato = 97
        ORDER BY x.idbnf_sub_concepto DESC 
        LIMIT 1
	)
    ORDER BY bcc.idbnf_configuracion_clausula DESC 
    LIMIT 1
), 2, '{"0-0":"__"}', 2, '{"0-0":[{"auth_id":"0","max":"","min":"","level":"1"}]}', 1, '@%COMMISSION@', 0, '[{"selecto":true,"inicio":0,"fin":0}]', 0, '2019-11-12 01:40:46', 'marrosas', 'ixicale', NOW());

-- try to copy bnf_sub_concepto 28. 'CSM'.
INSERT INTO clv_benefits.bnf_sub_concepto 
(idcontr_categoria_contrato, idbnf_concepto, descripcion, idioma, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES(97, 7, 'CSM', '{"2":"CSM"}', 1, '2019-11-12 01:41:15', 'marrosas', 'ixicale', NOW());

-- try to copy bnf_configuracion_clausula 27. 'CSM'.
INSERT INTO clv_benefits.bnf_configuracion_clausula 
(idbnf_sub_concepto, opcional, nombre, texto, variables, limite_inferior, limite_superior, es_rango, rangos, booking_window_fecha_inicio, booking_window_fecha_fin, travel_window_fecha_inicio, travel_window_fecha_fin, propiedades, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES((
    SELECT x.idbnf_sub_concepto FROM clv_benefits.bnf_sub_concepto x WHERE
        x.usuario_creacion = "marrosas" AND
        x.fecha_creacion = "2019-11-12 01:41:15" AND
        x.idcontr_categoria_contrato = 97
    ORDER BY x.idbnf_sub_concepto DESC
    LIMIT 1
),
0, 'CSM', '{"legal":{"2":"El Hotel asignará un Gerente de Grupos."},"comercial":{"2":"El Hotel asignará un Gerente de Grupos."}}', '[]', '0', '0', 0, '[{"selecto":true,"inicio":0,"fin":0}]', '2019-11-11', '2019-11-11', '2019-11-11', '2019-11-11', '["ZHBP","CDS","ZRCZ","ZHIM","ZHLB","ZPLB","ZMNI","ZMSU","ZCJG","ZCMPPC","ZRPL","ZHSP","ZMGR"]', 1, '2019-11-12 01:42:28', 'marrosas', 'ixicale', NOW());

-- try to copy bnf_condicion_variable 38. '@%COMMISSION@'.
INSERT INTO clv_benefits.bnf_condicion_variable
( idbnf_configuracion_clausula, idbnf_variable_beneficio, base, tipo_dato, override_rules, es_global, tag, tipo_rango, rangos, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES((
	SELECT bcc.idbnf_configuracion_clausula FROM clv_benefits.bnf_configuracion_clausula bcc WHERE
	bcc.usuario_creacion = "marrosas" AND
    bcc.fecha_creacion = "2019-11-12 01:42:28" AND
	bcc.idbnf_sub_concepto = (
        SELECT x.idbnf_sub_concepto FROM clv_benefits.bnf_sub_concepto x WHERE
            x.usuario_creacion = "marrosas" AND
            x.fecha_creacion = "2019-11-12 01:41:15" AND
            x.idcontr_categoria_contrato = 97
        ORDER BY x.idbnf_sub_concepto DESC 
        LIMIT 1
	)
    ORDER BY bcc.idbnf_configuracion_clausula DESC 
    LIMIT 1
), 2, '{"0-0":"__"}', 2, '{"0-0":[{"auth_id":"0","max":"","min":"","level":"1"}]}', 0, '@%COMMISSION@', 0, '[{"selecto":true,"inicio":0,"fin":0}]', 0, '2019-11-12 01:42:28', 'marrosas', 'ixicale', NOW());

-- try to copy bnf_sub_concepto 29. 'Vino'.
INSERT INTO clv_benefits.bnf_sub_concepto 
(idcontr_categoria_contrato, idbnf_concepto, descripcion, idioma, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES(97, 7, 'Vino', '{"2":"Vino"}', 1, '2019-11-12 01:46:03', 'marrosas', 'ixicale', NOW());

-- try to copy bnf_configuracion_clausula 28. 'Vino'.
INSERT INTO clv_benefits.bnf_configuracion_clausula 
(idbnf_sub_concepto, opcional, nombre, texto, variables, limite_inferior, limite_superior, es_rango, rangos, booking_window_fecha_inicio, booking_window_fecha_fin, travel_window_fecha_inicio, travel_window_fecha_fin, propiedades, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES((
    SELECT x.idbnf_sub_concepto FROM clv_benefits.bnf_sub_concepto x WHERE
        x.usuario_creacion = "marrosas" AND
        x.fecha_creacion = "2019-11-12 01:46:03" AND
        x.idcontr_categoria_contrato = 97
    ORDER BY x.idbnf_sub_concepto DESC
    LIMIT 1
),
0, 'Vino', '{"legal":{"2":"Botella de vino de bienvenida para las habitaciones del Grupo durante la primera noches de estancia."},"comercial":{"2":"Botella de vino de bienvenida para las habitaciones del Grupo durante la primera noches de estancia."}}', '[]', '0', '0', 0, '[{"selecto":true,"inicio":0,"fin":0}]', '2019-11-11', '2019-11-11', '2019-11-11', '2019-11-11', '["ZHBP","CDS","ZRCZ","ZHIM","ZHLB","ZPLB","ZMNI","ZMSU","ZCJG","ZCMPPC","ZRPL","ZHSP","ZMGR"]', 1, '2019-11-12 01:47:18', 'marrosas', 'ixicale', NOW());

-- try to copy bnf_condicion_variable 39. '@%COMMISSION@'.
INSERT INTO clv_benefits.bnf_condicion_variable
( idbnf_configuracion_clausula, idbnf_variable_beneficio, base, tipo_dato, override_rules, es_global, tag, tipo_rango, rangos, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES((
	SELECT bcc.idbnf_configuracion_clausula FROM clv_benefits.bnf_configuracion_clausula bcc WHERE
	bcc.usuario_creacion = "marrosas" AND
    bcc.fecha_creacion = "2019-11-12 01:47:18" AND
	bcc.idbnf_sub_concepto = (
        SELECT x.idbnf_sub_concepto FROM clv_benefits.bnf_sub_concepto x WHERE
            x.usuario_creacion = "marrosas" AND
            x.fecha_creacion = "2019-11-12 01:46:03" AND
            x.idcontr_categoria_contrato = 97
        ORDER BY x.idbnf_sub_concepto DESC 
        LIMIT 1
	)
    ORDER BY bcc.idbnf_configuracion_clausula DESC 
    LIMIT 1
), 2, '{"0-0":"__"}', 2, '{"0-0":[{"auth_id":"0","max":"","min":"","level":"1"}]}', 0, '@%COMMISSION@', 0, '[{"selecto":true,"inicio":0,"fin":0}]', 0, '2019-11-12 01:47:18', 'marrosas', 'ixicale', NOW());

-- try to copy bnf_sub_concepto 30. 'Spa'.
INSERT INTO clv_benefits.bnf_sub_concepto 
(idcontr_categoria_contrato, idbnf_concepto, descripcion, idioma, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES(97, 7, 'Spa', '{"2":"Spa"}', 1, '2019-11-12 01:49:21', 'marrosas', 'ixicale', NOW());

-- try to copy bnf_configuracion_clausula 29. '% Spa'.
INSERT INTO clv_benefits.bnf_configuracion_clausula 
(idbnf_sub_concepto, opcional, nombre, texto, variables, limite_inferior, limite_superior, es_rango, rangos, booking_window_fecha_inicio, booking_window_fecha_fin, travel_window_fecha_inicio, travel_window_fecha_fin, propiedades, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES((
    SELECT x.idbnf_sub_concepto FROM clv_benefits.bnf_sub_concepto x WHERE
        x.usuario_creacion = "marrosas" AND
        x.fecha_creacion = "2019-11-12 01:49:21" AND
        x.idcontr_categoria_contrato = 97
    ORDER BY x.idbnf_sub_concepto DESC
    LIMIT 1
),
0, '% Spa', '{"legal":{"2":"El Hotel otorgará un descuento del 15% en tratamientos de Spa. Este beneficio no es combinable con promociones o paquetes."},"comercial":{"2":"El Hotel otorgará un descuento del 15% en tratamientos de Spa. Este beneficio no es combinable con promociones o paquetes."}}', '[]', '0', '0', 0, '[{"selecto":true,"inicio":0,"fin":0}]', '2019-11-11', '2019-11-11', '2019-11-11', '2019-11-11', '["ZHBP","CDS","ZRCZ","ZHIM","ZHLB","ZPLB","ZMNI","ZMSU","ZCJG","ZCMPPC","ZRPL","ZHSP","ZMGR"]', 1, '2019-11-12 01:54:56', 'marrosas', 'ixicale', NOW());

-- try to copy bnf_condicion_variable 40. '@%COMMISSION@'.
INSERT INTO clv_benefits.bnf_condicion_variable
( idbnf_configuracion_clausula, idbnf_variable_beneficio, base, tipo_dato, override_rules, es_global, tag, tipo_rango, rangos, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES((
	SELECT bcc.idbnf_configuracion_clausula FROM clv_benefits.bnf_configuracion_clausula bcc WHERE
	bcc.usuario_creacion = "marrosas" AND
    bcc.fecha_creacion = "2019-11-12 01:54:56" AND
	bcc.idbnf_sub_concepto = (
        SELECT x.idbnf_sub_concepto FROM clv_benefits.bnf_sub_concepto x WHERE
            x.usuario_creacion = "marrosas" AND
            x.fecha_creacion = "2019-11-12 01:49:21" AND
            x.idcontr_categoria_contrato = 97
        ORDER BY x.idbnf_sub_concepto DESC 
        LIMIT 1
	)
    ORDER BY bcc.idbnf_configuracion_clausula DESC 
    LIMIT 1
), 2, '{"0-0":"__"}', 2, '{"0-0":[{"auth_id":"0","max":"","min":"","level":"1"}]}', 0, '@%COMMISSION@', 0, '[{"selecto":true,"inicio":0,"fin":0}]', 0, '2019-11-12 01:54:57', 'marrosas', 'ixicale', NOW());

-- try to copy bnf_sub_concepto 31. 'Moon Vacation Getaway'.
INSERT INTO clv_benefits.bnf_sub_concepto 
(idcontr_categoria_contrato, idbnf_concepto, descripcion, idioma, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES(97, 7, 'Moon Vacation Getaway', '{"1":"Moon Vacation Getaway"}', 1, '2019-11-12 01:55:02', 'jugomez', 'ixicale', NOW());

-- try to copy bnf_configuracion_clausula 30. 'Moon Vacations'.
INSERT INTO clv_benefits.bnf_configuracion_clausula 
(idbnf_sub_concepto, opcional, nombre, texto, variables, limite_inferior, limite_superior, es_rango, rangos, booking_window_fecha_inicio, booking_window_fecha_fin, travel_window_fecha_inicio, travel_window_fecha_fin, propiedades, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES((
    SELECT x.idbnf_sub_concepto FROM clv_benefits.bnf_sub_concepto x WHERE
        x.usuario_creacion = "jugomez" AND
        x.fecha_creacion = "2019-11-12 01:55:02" AND
        x.idcontr_categoria_contrato = 97
    ORDER BY x.idbnf_sub_concepto DESC
    LIMIT 1
),
0, 'Moon Vacations', '{"legal":{"1":"Each person in the group will have the opportunity to participate in the Moon Vacation Getaway program, which offers a preferential rate for a future stay."},"comercial":{"1":"Each person in the group will have the opportunity to participate in the Moon Vacation Getaway program, which offers a preferential rate for a future stay."}}', '[]', '0', '0', 0, '[{"selecto":true,"inicio":0,"fin":0}]', '2019-11-11', '2019-11-11', '2019-11-11', '2019-11-11', '["ZHBP","CDS","ZRCZ","ZHIM","ZHLB","ZMNI","ZMSU","ZCJG","ZCMPPC","ZRPL","ZHSP","ZMGR"]', 1, '2019-11-12 01:56:07', 'jugomez', 'ixicale', NOW());

-- try to copy bnf_condicion_variable 41. '@%COMMISSION@'.
INSERT INTO clv_benefits.bnf_condicion_variable
( idbnf_configuracion_clausula, idbnf_variable_beneficio, base, tipo_dato, override_rules, es_global, tag, tipo_rango, rangos, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES((
	SELECT bcc.idbnf_configuracion_clausula FROM clv_benefits.bnf_configuracion_clausula bcc WHERE
	bcc.usuario_creacion = "jugomez" AND
    bcc.fecha_creacion = "2019-11-12 01:56:07" AND
	bcc.idbnf_sub_concepto = (
        SELECT x.idbnf_sub_concepto FROM clv_benefits.bnf_sub_concepto x WHERE
            x.usuario_creacion = "jugomez" AND
            x.fecha_creacion = "2019-11-12 01:55:02" AND
            x.idcontr_categoria_contrato = 97
        ORDER BY x.idbnf_sub_concepto DESC 
        LIMIT 1
	)
    ORDER BY bcc.idbnf_configuracion_clausula DESC 
    LIMIT 1
), 2, '{"0-0":"__"}', 2, '{"0-0":[{"auth_id":"0","max":"","min":"","level":"1"}]}', 0, '@%COMMISSION@', 0, '[{"selecto":true,"inicio":0,"fin":0}]', 0, '2019-11-12 01:56:07', 'jugomez', 'ixicale', NOW());

-- try to copy bnf_sub_concepto 32. '%Extras'.
INSERT INTO clv_benefits.bnf_sub_concepto 
(idcontr_categoria_contrato, idbnf_concepto, descripcion, idioma, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES(97, 7, '%Extras', '{"2":"%Extras"}', 1, '2019-11-12 01:56:04', 'marrosas', 'ixicale', NOW());

-- try to copy bnf_configuracion_clausula 31. '%Extras'.
INSERT INTO clv_benefits.bnf_configuracion_clausula 
(idbnf_sub_concepto, opcional, nombre, texto, variables, limite_inferior, limite_superior, es_rango, rangos, booking_window_fecha_inicio, booking_window_fecha_fin, travel_window_fecha_inicio, travel_window_fecha_fin, propiedades, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES((
    SELECT x.idbnf_sub_concepto FROM clv_benefits.bnf_sub_concepto x WHERE
        x.usuario_creacion = "marrosas" AND
        x.fecha_creacion = "2019-11-12 01:56:04" AND
        x.idcontr_categoria_contrato = 97
    ORDER BY x.idbnf_sub_concepto DESC
    LIMIT 1
),
0, '%Extras', '{"legal":{"2":"<p style=\"text-align: justify;\">El Hotel otorgará un descuento del 5% del monto total del Evento generado por concepto de habitaciones, que podrá se utilizado para pago de extras del Grupo, como Spa, Gold, así como para servicios prestados por Palace Productions. No aplicará para costos del Manual Técnico de Producción de Palace Productions. Asímismo, no aplicará para gastos derivados de proveedores externos. El monto se calculará después de haber deducido $20.00 USD por persona, por noche, por concepto de propinas e impuestos de las tarifas grupales. Este monto no aplicará para el pago de habitaciones. No se darán créditos ni reembolsos en efectivo por servicios no utilizados y no es acumulable con otros grupos.&nbsp;</p>"},"comercial":{"2":"<p style=\"text-align: justify;\">El Hotel otorgará un descuento del 5% del monto total del Evento generado por concepto de habitaciones, que podrá se utilizado para pago de extras del Grupo, como Spa, Gold, así como para servicios prestados por Palace Productions. No aplicará para costos del Manual Técnico de Producción de Palace Productions. Asímismo, no aplicará para gastos derivados de proveedores externos. El monto se calculará después de haber deducido $20.00 USD por persona, por noche, por concepto de propinas e impuestos de las tarifas grupales. Este monto no aplicará para el pago de habitaciones. No se darán créditos ni reembolsos en efectivo por servicios no utilizados y no es acumulable con otros grupos.&nbsp;</p>"}}', '[]', '0', '0', 0, '[{"selecto":true,"inicio":0,"fin":0}]', '2019-11-11', '2019-11-11', '2019-11-11', '2019-11-11', '["ZHBP","CDS","ZRCZ","ZHIM","ZHLB","ZPLB","ZMNI","ZMSU","ZCJG","ZCMPPC","ZRPL","ZHSP","ZMGR"]', 1, '2019-11-12 02:00:06', 'marrosas', 'ixicale', NOW());

-- try to copy bnf_condicion_variable 42. '@%COMMISSION@'.
INSERT INTO clv_benefits.bnf_condicion_variable
( idbnf_configuracion_clausula, idbnf_variable_beneficio, base, tipo_dato, override_rules, es_global, tag, tipo_rango, rangos, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES((
	SELECT bcc.idbnf_configuracion_clausula FROM clv_benefits.bnf_configuracion_clausula bcc WHERE
	bcc.usuario_creacion = "marrosas" AND
    bcc.fecha_creacion = "2019-11-12 02:00:06" AND
	bcc.idbnf_sub_concepto = (
        SELECT x.idbnf_sub_concepto FROM clv_benefits.bnf_sub_concepto x WHERE
            x.usuario_creacion = "marrosas" AND
            x.fecha_creacion = "2019-11-12 01:56:04" AND
            x.idcontr_categoria_contrato = 97
        ORDER BY x.idbnf_sub_concepto DESC 
        LIMIT 1
	)
    ORDER BY bcc.idbnf_configuracion_clausula DESC 
    LIMIT 1
), 2, '{"0-0":"__"}', 2, '{"0-0":[{"auth_id":"0","max":"","min":"","level":"1"}]}', 1, '@%COMMISSION@', 0, '[{"selecto":true,"inicio":0,"fin":0}]', 0, '2019-11-12 02:00:07', 'marrosas', 'ixicale', NOW());

-- try to copy bnf_sub_concepto 33. 'Moon Vacation Getaway'.
INSERT INTO clv_benefits.bnf_sub_concepto 
(idcontr_categoria_contrato, idbnf_concepto, descripcion, idioma, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES(97, 7, 'Moon Vacation Getaway', '{"2":"Moon Vacation Getaway"}', 1, '2019-11-12 02:01:59', 'marrosas', 'ixicale', NOW());

-- try to copy bnf_configuracion_clausula 32. 'Moon Vacation Getaway'.
INSERT INTO clv_benefits.bnf_configuracion_clausula 
(idbnf_sub_concepto, opcional, nombre, texto, variables, limite_inferior, limite_superior, es_rango, rangos, booking_window_fecha_inicio, booking_window_fecha_fin, travel_window_fecha_inicio, travel_window_fecha_fin, propiedades, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES((
    SELECT x.idbnf_sub_concepto FROM clv_benefits.bnf_sub_concepto x WHERE
        x.usuario_creacion = "marrosas" AND
        x.fecha_creacion = "2019-11-12 02:01:59" AND
        x.idcontr_categoria_contrato = 97
    ORDER BY x.idbnf_sub_concepto DESC
    LIMIT 1
),
0, 'Moon Vacation Getaway', '{"legal":{"2":"<p style=\"text-align: justify;\">Cada participante del Grupo tendrá la oportunidad de participar en el programa Moon Vacation Getaway, el cual ofrece tarifas preferenciales para una estancia futura.</p>"},"comercial":{"2":"Cada participante del Grupo tendrá la oportunidad de participar en el programa Moon Vacation Getaway, el cual ofrece tarifas preferenciales para una estancia futura."}}', '[]', '0', '0', 0, '[{"selecto":true,"inicio":0,"fin":0}]', '2019-11-11', '2019-11-11', '2019-11-11', '2019-11-11', '["ZHBP","CDS","ZRCZ","ZHIM","ZHLB","ZMNI","ZMSU","ZCJG","ZCMPPC","ZRPL","ZHSP","ZMGR"]', 1, '2019-11-12 02:03:19', 'marrosas', 'ixicale', NOW());

-- try to copy bnf_condicion_variable 43. '@%COMMISSION@'.
INSERT INTO clv_benefits.bnf_condicion_variable
( idbnf_configuracion_clausula, idbnf_variable_beneficio, base, tipo_dato, override_rules, es_global, tag, tipo_rango, rangos, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES((
	SELECT bcc.idbnf_configuracion_clausula FROM clv_benefits.bnf_configuracion_clausula bcc WHERE
	bcc.usuario_creacion = "marrosas" AND
    bcc.fecha_creacion = "2019-11-12 02:03:19" AND
	bcc.idbnf_sub_concepto = (
        SELECT x.idbnf_sub_concepto FROM clv_benefits.bnf_sub_concepto x WHERE
            x.usuario_creacion = "marrosas" AND
            x.fecha_creacion = "2019-11-12 02:01:59" AND
            x.idcontr_categoria_contrato = 97
        ORDER BY x.idbnf_sub_concepto DESC 
        LIMIT 1
	)
    ORDER BY bcc.idbnf_configuracion_clausula DESC 
    LIMIT 1
), 2, '{"0-0":"__"}', 2, '{"0-0":[{"auth_id":"0","max":"","min":"","level":"1"}]}', 0, '@%COMMISSION@', 0, '[{"selecto":true,"inicio":0,"fin":0}]', 0, '2019-11-12 02:03:19', 'marrosas', 'ixicale', NOW());

-- try to copy bnf_sub_concepto 34. 'Staff'.
INSERT INTO clv_benefits.bnf_sub_concepto 
(idcontr_categoria_contrato, idbnf_concepto, descripcion, idioma, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES(97, 7, 'Staff', '{"2":"Staff"}', 1, '2019-11-12 02:06:19', 'marrosas', 'ixicale', NOW());

-- try to copy bnf_configuracion_clausula 33. 'Staff'.
INSERT INTO clv_benefits.bnf_configuracion_clausula 
(idbnf_sub_concepto, opcional, nombre, texto, variables, limite_inferior, limite_superior, es_rango, rangos, booking_window_fecha_inicio, booking_window_fecha_fin, travel_window_fecha_inicio, travel_window_fecha_fin, propiedades, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES((
    SELECT x.idbnf_sub_concepto FROM clv_benefits.bnf_sub_concepto x WHERE
        x.usuario_creacion = "marrosas" AND
        x.fecha_creacion = "2019-11-12 02:06:19" AND
        x.idcontr_categoria_contrato = 97
    ORDER BY x.idbnf_sub_concepto DESC
    LIMIT 1
),
0, 'Staff', '{"legal":{"2":"<p style=\"text-align: justify;\">El Hotel otorgará un cuarto noche en ocupación sencilla o doble con 50% de descuento sobre la tarifa grupal por cada&nbsp;@COMPS@ habitaciones pagadas por noche, para el staff del Grupo. Válido únicamente durante las fechas grupales. Esta tarifa de staff es aplicable dos noches antes y una después de las fechas grupales. Para noches adicionales se aplicará la tarifa grupal. Máximo @MAXCOMPS@ habitaciones.</p>"},"comercial":{"2":"<p style=\"text-align: justify;\">El Hotel otorgará un cuarto noche en ocupación sencilla o doble con 50% de descuento sobre la tarifa grupal por cada&nbsp;@COMPS@ habitaciones pagadas por noche, para el staff del Grupo. Válido únicamente durante las fechas grupales. Esta tarifa de staff es aplicable dos noches antes y una después de las fechas grupales. Para noches adicionales se aplicará la tarifa grupal. Máximo&nbsp;@MAXCOMPS@ habitaciones.</p>"}}', '["@COMPS@","@MAXCOMPS@"]', '0', '0', 1, '[{"selecto":true,"inicio":10,"fin":149},{"inicio":150,"fin":499},{"inicio":500,"fin":10000}]', '2019-11-19', '2019-11-19', '2019-11-19', '2019-11-19', '["ZHBP","CDS","ZRCZ","ZHIM","ZHLB","ZPLB","ZMNI","ZMSU","ZCJG","ZCMPPC","ZRPL","ZHSP","ZMGR"]', 1, '2019-11-12 02:16:30', 'marrosas', 'ixicale', NOW());

-- try to copy bnf_condicion_variable 44. '@COMPS@'.
INSERT INTO clv_benefits.bnf_condicion_variable
( idbnf_configuracion_clausula, idbnf_variable_beneficio, base, tipo_dato, override_rules, es_global, tag, tipo_rango, rangos, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES((
	SELECT bcc.idbnf_configuracion_clausula FROM clv_benefits.bnf_configuracion_clausula bcc WHERE
	bcc.usuario_creacion = "marrosas" AND
    bcc.fecha_creacion = "2019-11-12 02:16:30" AND
	bcc.idbnf_sub_concepto = (
        SELECT x.idbnf_sub_concepto FROM clv_benefits.bnf_sub_concepto x WHERE
            x.usuario_creacion = "marrosas" AND
            x.fecha_creacion = "2019-11-12 02:06:19" AND
            x.idcontr_categoria_contrato = 97
        ORDER BY x.idbnf_sub_concepto DESC 
        LIMIT 1
	)
    ORDER BY bcc.idbnf_configuracion_clausula DESC 
    LIMIT 1
), 1, '{"10-149":"50","150-499":"50","500-10000":"50"}', 1, '{"10-149":[{"auth_id":0,"min":"50","max":"25","level":0},{"auth_id":0,"min":"20","max":"24","level":1},{"auth_id":0,"min":"19","max":"1","level":2}],"150-499":[{"auth_id":0,"min":"50","max":"25","level":0},{"auth_id":0,"min":"24","max":"20","level":1},{"auth_id":0,"min":"19","max":"1","level":2}],"500-10000":[{"auth_id":0,"min":"100","max":"50","level":0},{"auth_id":0,"min":"49","max":"45","level":1},{"auth_id":0,"min":"44","max":"1","level":2}]}', 1, '@COMPS@', 1, '[{"selecto":true,"inicio":10,"fin":149},{"selecto":false,"inicio":150,"fin":499},{"selecto":false,"inicio":500,"fin":10000}]', 1, '2019-11-12 02:16:31', 'marrosas', 'ixicale', NOW());

-- try to copy bnf_condicion_variable 45. '@MAXCOMPS@'.
INSERT INTO clv_benefits.bnf_condicion_variable
( idbnf_configuracion_clausula, idbnf_variable_beneficio, base, tipo_dato, override_rules, es_global, tag, tipo_rango, rangos, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES((
	SELECT bcc.idbnf_configuracion_clausula FROM clv_benefits.bnf_configuracion_clausula bcc WHERE
	bcc.usuario_creacion = "marrosas" AND
    bcc.fecha_creacion = "2019-11-12 02:16:30" AND
	bcc.idbnf_sub_concepto = (
        SELECT x.idbnf_sub_concepto FROM clv_benefits.bnf_sub_concepto x WHERE
            x.usuario_creacion = "marrosas" AND
            x.fecha_creacion = "2019-11-12 02:06:19" AND
            x.idcontr_categoria_contrato = 97
        ORDER BY x.idbnf_sub_concepto DESC 
        LIMIT 1
	)
    ORDER BY bcc.idbnf_configuracion_clausula DESC 
    LIMIT 1
), 3, '{"10-149":"1","150-499":"1","500-10000":"10"}', 1, '{"10-149":[{"auth_id":0,"min":"1","max":"6","level":0},{"auth_id":0,"min":"7","max":"10","level":1},{"auth_id":0,"min":"11","max":"20","level":2}],"150-499":[{"auth_id":0,"min":"1","max":"10","level":0},{"auth_id":0,"min":"11","max":"15","level":1},{"auth_id":0,"min":"16","max":"20","level":2}],"500-10000":[{"auth_id":0,"min":"1","max":"10","level":0},{"auth_id":0,"min":"11","max":"15","level":1},{"auth_id":0,"min":"16","max":"20","level":2}]}', 1, '@MAXCOMPS@', 1, '[{"selecto":false,"inicio":10,"fin":149},{"selecto":false,"inicio":150,"fin":499},{"selecto":true,"inicio":500,"fin":10000}]', 1, '2019-11-12 02:16:31', 'marrosas', 'ixicale', NOW());

-- try to copy bnf_sub_concepto 35. 'Complementarias'.
INSERT INTO clv_benefits.bnf_sub_concepto 
(idcontr_categoria_contrato, idbnf_concepto, descripcion, idioma, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES(97, 7, 'Complementarias', '{"2":"Complementarias"}', 1, '2019-11-12 02:19:02', 'marrosas', 'ixicale', NOW());

-- try to copy bnf_configuracion_clausula 34. 'Complementarias Le Blancs TG y MJ'.
INSERT INTO clv_benefits.bnf_configuracion_clausula 
(idbnf_sub_concepto, opcional, nombre, texto, variables, limite_inferior, limite_superior, es_rango, rangos, booking_window_fecha_inicio, booking_window_fecha_fin, travel_window_fecha_inicio, travel_window_fecha_fin, propiedades, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES((
    SELECT x.idbnf_sub_concepto FROM clv_benefits.bnf_sub_concepto x WHERE
        x.usuario_creacion = "marrosas" AND
        x.fecha_creacion = "2019-11-12 02:19:02" AND
        x.idcontr_categoria_contrato = 97
    ORDER BY x.idbnf_sub_concepto DESC
    LIMIT 1
),
0, 'Complementarias Le Blancs TG y MJ', '{"legal":{"2":"<p style=\"text-align: justify;\">El Hotel otorgará un cuarto noche, en ocupación sencilla o doble en cortesía, por cada&nbsp;@COMPS@ habitaciones pagadas por noche. Válidas durante las fechas grupales. Noches antes y/o después aplican tarifas grupales. Se aplicará un cobro por persona de $20.00 USD&nbsp; por persona por noche por concepto de impuestos y propinas. Máximo&nbsp;@MAXCOMPS@ habitaciones.&nbsp;</p>"},"comercial":{"2":"<p style=\"text-align: justify;\">El Hotel otorgará un cuarto noche, en ocupación sencilla o doble en cortesía, por cada&nbsp;@COMPS@ habitaciones pagadas por noche. Válidas durante las fechas grupales. Noches antes y/o después aplican tarifas grupales. Se aplicará un cobro por persona de $20.00 USD&nbsp; por persona por noche por concepto de impuestos y propinas. Máximo&nbsp;@MAXCOMPS@ habitaciones.</p>"}}', '["@MAXCOMPS@","@COMPS@"]', '0', '0', 1, '[{"selecto":true,"inicio":10,"fin":149},{"inicio":150,"fin":499},{"inicio":500,"fin":10000}]', '2019-11-19', '2019-11-19', '2019-11-19', '2019-11-19', '["ZHBP","CDS","ZRCZ","ZHIM","ZMNI","ZMSU","ZCMPPC","ZRPL","ZHSP"]', 1, '2019-11-12 02:24:14', 'marrosas', 'ixicale', NOW());

-- try to copy bnf_condicion_variable 46. '@MAXCOMPS@'.
INSERT INTO clv_benefits.bnf_condicion_variable
( idbnf_configuracion_clausula, idbnf_variable_beneficio, base, tipo_dato, override_rules, es_global, tag, tipo_rango, rangos, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES((
	SELECT bcc.idbnf_configuracion_clausula FROM clv_benefits.bnf_configuracion_clausula bcc WHERE
	bcc.usuario_creacion = "marrosas" AND
    bcc.fecha_creacion = "2019-11-12 02:24:14" AND
	bcc.idbnf_sub_concepto = (
        SELECT x.idbnf_sub_concepto FROM clv_benefits.bnf_sub_concepto x WHERE
            x.usuario_creacion = "marrosas" AND
            x.fecha_creacion = "2019-11-12 02:19:02" AND
            x.idcontr_categoria_contrato = 97
        ORDER BY x.idbnf_sub_concepto DESC 
        LIMIT 1
	)
    ORDER BY bcc.idbnf_configuracion_clausula DESC 
    LIMIT 1
), 3, '{"10-149":"1","150-499":"1","500-10000":"10"}', 1, '{"10-149":[{"auth_id":0,"min":"1","max":"6","level":0},{"auth_id":0,"min":"7","max":"10","level":1},{"auth_id":0,"min":"11","max":"20","level":2}],"150-499":[{"auth_id":0,"min":"1","max":"10","level":0},{"auth_id":0,"min":"11","max":"15","level":1},{"auth_id":0,"min":"16","max":"20","level":2}],"500-10000":[{"auth_id":0,"min":"1","max":"10","level":0},{"auth_id":0,"min":"11","max":"15","level":1},{"auth_id":0,"min":"16","max":"20","level":2}]}', 1, '@MAXCOMPS@', 1, '[{"selecto":true,"inicio":10,"fin":149},{"selecto":false,"inicio":150,"fin":499},{"selecto":false,"inicio":500,"fin":10000}]', 1, '2019-11-12 02:24:14', 'marrosas', 'ixicale', NOW());

-- try to copy bnf_condicion_variable 47. '@COMPS@'.
INSERT INTO clv_benefits.bnf_condicion_variable
( idbnf_configuracion_clausula, idbnf_variable_beneficio, base, tipo_dato, override_rules, es_global, tag, tipo_rango, rangos, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES((
	SELECT bcc.idbnf_configuracion_clausula FROM clv_benefits.bnf_configuracion_clausula bcc WHERE
	bcc.usuario_creacion = "marrosas" AND
    bcc.fecha_creacion = "2019-11-12 02:24:14" AND
	bcc.idbnf_sub_concepto = (
        SELECT x.idbnf_sub_concepto FROM clv_benefits.bnf_sub_concepto x WHERE
            x.usuario_creacion = "marrosas" AND
            x.fecha_creacion = "2019-11-12 02:19:02" AND
            x.idcontr_categoria_contrato = 97
        ORDER BY x.idbnf_sub_concepto DESC 
        LIMIT 1
	)
    ORDER BY bcc.idbnf_configuracion_clausula DESC 
    LIMIT 1
), 1, '{"10-149":"50","150-499":"50","500-10000":"50"}', 1, '{"10-149":[{"auth_id":0,"min":"50","max":"25","level":0},{"auth_id":0,"min":"20","max":"24","level":1},{"auth_id":0,"min":"19","max":"1","level":2}],"150-499":[{"auth_id":0,"min":"50","max":"25","level":0},{"auth_id":0,"min":"24","max":"20","level":1},{"auth_id":0,"min":"19","max":"1","level":2}],"500-10000":[{"auth_id":0,"min":"100","max":"50","level":0},{"auth_id":0,"min":"49","max":"45","level":1},{"auth_id":0,"min":"44","max":"1","level":2}]}', 1, '@COMPS@', 1, '[{"selecto":true,"inicio":10,"fin":149},{"selecto":false,"inicio":150,"fin":499},{"selecto":false,"inicio":500,"fin":10000}]', 1, '2019-11-12 02:24:14', 'marrosas', 'ixicale', NOW());


-- try to copy bnf_configuracion_clausula 35. 'Complementarias PR'.
INSERT INTO clv_benefits.bnf_configuracion_clausula 
(idbnf_sub_concepto, opcional, nombre, texto, variables, limite_inferior, limite_superior, es_rango, rangos, booking_window_fecha_inicio, booking_window_fecha_fin, travel_window_fecha_inicio, travel_window_fecha_fin, propiedades, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES((
    SELECT x.idbnf_sub_concepto FROM clv_benefits.bnf_sub_concepto x WHERE
        x.usuario_creacion = "marrosas" AND
        x.fecha_creacion = "2019-11-12 02:19:02" AND
        x.idcontr_categoria_contrato = 97
    ORDER BY x.idbnf_sub_concepto DESC
    LIMIT 1
),
0, 'Complementarias PR', '{"legal":{"2":"El Hotel otorgará un cuarto noche, en ocupación sencilla o doble en cortesía, por cada&nbsp;@COMPS@ habitaciones pagadas por noche. Válidas durante las fechas grupales. Noches antes y/o después aplican tarifas grupales. Se aplicará un cobro por persona de $10.00 USD&nbsp; por persona por noche por concepto de impuestos y propinas. Máximo&nbsp;@MAXCOMPS@ habitaciones."},"comercial":{"2":"El Hotel otorgará un cuarto noche, en ocupación sencilla o doble en cortesía, por cada&nbsp;@COMPS@ habitaciones pagadas por noche. Válidas durante las fechas grupales. Noches antes y/o después aplican tarifas grupales. Se aplicará un cobro por persona de $10.00 USD&nbsp; por persona por noche por concepto de impuestos y propinas. Máximo&nbsp;@MAXCOMPS@ habitaciones."}}', '["@MAXCOMPS@","@COMPS@"]', '0', '0', 1, '[{"selecto":true,"inicio":10,"fin":149},{"inicio":150,"fin":499},{"inicio":500,"fin":10000}]', '2019-11-20', '2019-11-20', '2019-11-20', '2019-11-20', '["ZHBP","CDS","ZRCZ","ZHIM","ZMNI","ZMSU","ZCMPPC","ZRPL","ZHSP"]', 1, '2019-11-12 02:26:27', 'marrosas', 'ixicale', NOW());

-- try to copy bnf_condicion_variable 48. '@MAXCOMPS@'.
INSERT INTO clv_benefits.bnf_condicion_variable
( idbnf_configuracion_clausula, idbnf_variable_beneficio, base, tipo_dato, override_rules, es_global, tag, tipo_rango, rangos, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES((
	SELECT bcc.idbnf_configuracion_clausula FROM clv_benefits.bnf_configuracion_clausula bcc WHERE
	bcc.usuario_creacion = "marrosas" AND
    bcc.fecha_creacion = "2019-11-12 02:26:27" AND
	bcc.idbnf_sub_concepto = (
        SELECT x.idbnf_sub_concepto FROM clv_benefits.bnf_sub_concepto x WHERE
            x.usuario_creacion = "marrosas" AND
            x.fecha_creacion = "2019-11-12 02:19:02" AND
            x.idcontr_categoria_contrato = 97
        ORDER BY x.idbnf_sub_concepto DESC 
        LIMIT 1
	)
    ORDER BY bcc.idbnf_configuracion_clausula DESC 
    LIMIT 1
), 3, '{"10-149":"1","150-499":"1","500-10000":"10"}', 1, '{"10-149":[{"auth_id":0,"min":"1","max":"6","level":0},{"auth_id":0,"min":"7","max":"10","level":1},{"auth_id":0,"min":"11","max":"20","level":2}],"150-499":[{"auth_id":0,"min":"1","max":"10","level":0},{"auth_id":0,"min":"11","max":"15","level":1},{"auth_id":0,"min":"16","max":"20","level":2}],"500-10000":[{"auth_id":0,"min":"1","max":"10","level":0},{"auth_id":0,"min":"11","max":"15","level":1},{"auth_id":0,"min":"16","max":"20","level":2}]}', 1, '@MAXCOMPS@', 1, '[{"selecto":false,"inicio":10,"fin":149},{"selecto":false,"inicio":150,"fin":499},{"selecto":true,"inicio":500,"fin":10000}]', 1, '2019-11-12 02:26:28', 'marrosas', 'ixicale', NOW());

-- try to copy bnf_condicion_variable 49. '@COMPS@'.
INSERT INTO clv_benefits.bnf_condicion_variable
( idbnf_configuracion_clausula, idbnf_variable_beneficio, base, tipo_dato, override_rules, es_global, tag, tipo_rango, rangos, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES((
	SELECT bcc.idbnf_configuracion_clausula FROM clv_benefits.bnf_configuracion_clausula bcc WHERE
	bcc.usuario_creacion = "marrosas" AND
    bcc.fecha_creacion = "2019-11-12 02:26:27" AND
	bcc.idbnf_sub_concepto = (
        SELECT x.idbnf_sub_concepto FROM clv_benefits.bnf_sub_concepto x WHERE
            x.usuario_creacion = "marrosas" AND
            x.fecha_creacion = "2019-11-12 02:19:02" AND
            x.idcontr_categoria_contrato = 97
        ORDER BY x.idbnf_sub_concepto DESC 
        LIMIT 1
	)
    ORDER BY bcc.idbnf_configuracion_clausula DESC 
    LIMIT 1
), 1, '{"10-149":"50","150-499":"50","500-10000":"50"}', 1, '{"10-149":[{"auth_id":0,"min":"50","max":"25","level":0},{"auth_id":0,"min":"20","max":"24","level":1},{"auth_id":0,"min":"19","max":"1","level":2}],"150-499":[{"auth_id":0,"min":"50","max":"25","level":0},{"auth_id":0,"min":"24","max":"20","level":1},{"auth_id":0,"min":"19","max":"1","level":2}],"500-10000":[{"auth_id":0,"min":"100","max":"50","level":0},{"auth_id":0,"min":"49","max":"45","level":1},{"auth_id":0,"min":"44","max":"1","level":2}]}', 1, '@COMPS@', 1, '[{"selecto":true,"inicio":10,"fin":149},{"selecto":false,"inicio":150,"fin":499},{"selecto":false,"inicio":500,"fin":10000}]', 1, '2019-11-12 02:26:28', 'marrosas', 'ixicale', NOW());

-- try to copy bnf_sub_concepto 36. 'Upgrades'.
INSERT INTO clv_benefits.bnf_sub_concepto 
(idcontr_categoria_contrato, idbnf_concepto, descripcion, idioma, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES(97, 7, 'Upgrades', '{"2":"Upgrades"}', 1, '2019-11-12 02:30:21', 'marrosas', 'ixicale', NOW());

-- try to copy bnf_configuracion_clausula 36. 'Upgrades'.
INSERT INTO clv_benefits.bnf_configuracion_clausula 
(idbnf_sub_concepto, opcional, nombre, texto, variables, limite_inferior, limite_superior, es_rango, rangos, booking_window_fecha_inicio, booking_window_fecha_fin, travel_window_fecha_inicio, travel_window_fecha_fin, propiedades, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES((
    SELECT x.idbnf_sub_concepto FROM clv_benefits.bnf_sub_concepto x WHERE
        x.usuario_creacion = "marrosas" AND
        x.fecha_creacion = "2019-11-12 02:30:21" AND
        x.idcontr_categoria_contrato = 97
    ORDER BY x.idbnf_sub_concepto DESC
    LIMIT 1
),
0, 'Upgrades', '{"legal":{"2":"<p style=\"text-align: justify;\">El Hotel otorgará un up-grade a suite a una habitación por cada&nbsp;@COMPS@ habitaciones pagadas por noche. Válidas durante las fechas grupales. Para noches antes y/o después aplican las tarifas grupales. Sujeto a disponibilidad a la firma del Contrato y primer pago. Máximo&nbsp;@MAXCOMPS@ habitaciones.</p>"},"comercial":{"2":"El Hotel otorgará un up-grade a suite a una habitación por cada&nbsp;@COMPS@ habitaciones pagadas por noche. Válidas durante las fechas grupales. Para noches antes y/o después aplican las tarifas grupales. Sujeto a disponibilidad a la firma del Contrato y primer pago. Máximo&nbsp;@MAXCOMPS@ habitaciones."}}', '["@MAXCOMPS@","@COMPS@"]', '0', '0', 1, '[{"selecto":true,"inicio":10,"fin":149},{"inicio":150,"fin":499},{"inicio":500,"fin":10000}]', '2019-11-19', '2019-11-19', '2019-11-19', '2019-11-19', '["ZHBP","CDS","ZRCZ","ZHIM","ZHLB","ZPLB","ZMNI","ZMSU","ZCJG","ZCMPPC","ZRPL","ZHSP","ZMGR"]', 1, '2019-11-12 02:34:31', 'marrosas', 'ixicale', NOW());

-- try to copy bnf_condicion_variable 50. '@MAXCOMPS@'.
INSERT INTO clv_benefits.bnf_condicion_variable
( idbnf_configuracion_clausula, idbnf_variable_beneficio, base, tipo_dato, override_rules, es_global, tag, tipo_rango, rangos, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES((
	SELECT bcc.idbnf_configuracion_clausula FROM clv_benefits.bnf_configuracion_clausula bcc WHERE
	bcc.usuario_creacion = "marrosas" AND
    bcc.fecha_creacion = "2019-11-12 02:34:31" AND
	bcc.idbnf_sub_concepto = (
        SELECT x.idbnf_sub_concepto FROM clv_benefits.bnf_sub_concepto x WHERE
            x.usuario_creacion = "marrosas" AND
            x.fecha_creacion = "2019-11-12 02:30:21" AND
            x.idcontr_categoria_contrato = 97
        ORDER BY x.idbnf_sub_concepto DESC 
        LIMIT 1
	)
    ORDER BY bcc.idbnf_configuracion_clausula DESC 
    LIMIT 1
), 3, '{"10-149":"1","150-499":"1","500-10000":"10"}', 1, '{"10-149":[{"auth_id":0,"min":"1","max":"6","level":0},{"auth_id":0,"min":"7","max":"10","level":1},{"auth_id":0,"min":"11","max":"20","level":2}],"150-499":[{"auth_id":0,"min":"1","max":"10","level":0},{"auth_id":0,"min":"11","max":"15","level":1},{"auth_id":0,"min":"16","max":"20","level":2}],"500-10000":[{"auth_id":0,"min":"1","max":"10","level":0},{"auth_id":0,"min":"11","max":"15","level":1},{"auth_id":0,"min":"16","max":"20","level":2}]}', 1, '@MAXCOMPS@', 1, '[{"selecto":false,"inicio":10,"fin":149},{"selecto":false,"inicio":150,"fin":499},{"selecto":true,"inicio":500,"fin":10000}]', 1, '2019-11-12 02:34:31', 'marrosas', 'ixicale', NOW());

-- try to copy bnf_condicion_variable 51. '@COMPS@'.
INSERT INTO clv_benefits.bnf_condicion_variable
( idbnf_configuracion_clausula, idbnf_variable_beneficio, base, tipo_dato, override_rules, es_global, tag, tipo_rango, rangos, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES((
	SELECT bcc.idbnf_configuracion_clausula FROM clv_benefits.bnf_configuracion_clausula bcc WHERE
	bcc.usuario_creacion = "marrosas" AND
    bcc.fecha_creacion = "2019-11-12 02:34:31" AND
	bcc.idbnf_sub_concepto = (
        SELECT x.idbnf_sub_concepto FROM clv_benefits.bnf_sub_concepto x WHERE
            x.usuario_creacion = "marrosas" AND
            x.fecha_creacion = "2019-11-12 02:30:21" AND
            x.idcontr_categoria_contrato = 97
        ORDER BY x.idbnf_sub_concepto DESC 
        LIMIT 1
	)
    ORDER BY bcc.idbnf_configuracion_clausula DESC 
    LIMIT 1
), 1, '{"10-149":"50","150-499":"50","500-10000":"50"}', 1, '{"10-149":[{"auth_id":0,"min":"50","max":"25","level":0},{"auth_id":0,"min":"20","max":"24","level":1},{"auth_id":0,"min":"19","max":"1","level":2}],"150-499":[{"auth_id":0,"min":"50","max":"25","level":0},{"auth_id":0,"min":"24","max":"20","level":1},{"auth_id":0,"min":"19","max":"1","level":2}],"500-10000":[{"auth_id":0,"min":"100","max":"50","level":0},{"auth_id":0,"min":"49","max":"45","level":1},{"auth_id":0,"min":"44","max":"1","level":2}]}', 1, '@COMPS@', 1, '[{"selecto":true,"inicio":10,"fin":149},{"selecto":false,"inicio":150,"fin":499},{"selecto":false,"inicio":500,"fin":10000}]', 1, '2019-11-12 02:34:31', 'marrosas', 'ixicale', NOW());

-- try to copy bnf_sub_concepto 37. 'Complementarias'.
INSERT INTO clv_benefits.bnf_sub_concepto 
(idcontr_categoria_contrato, idbnf_concepto, descripcion, idioma, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES(97, 7, 'Complementarias', '{"1":"Complementarias"}', 1, '2019-12-13 23:39:08', 'jugomez', 'ixicale', NOW());

-- try to copy bnf_configuracion_clausula 38. 'complementarias. '.
INSERT INTO clv_benefits.bnf_configuracion_clausula 
(idbnf_sub_concepto, opcional, nombre, texto, variables, limite_inferior, limite_superior, es_rango, rangos, booking_window_fecha_inicio, booking_window_fecha_fin, travel_window_fecha_inicio, travel_window_fecha_fin, propiedades, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES((
    SELECT x.idbnf_sub_concepto FROM clv_benefits.bnf_sub_concepto x WHERE
        x.usuario_creacion = "jugomez" AND
        x.fecha_creacion = "2019-12-13 23:39:08" AND
        x.idcontr_categoria_contrato = 97
    ORDER BY x.idbnf_sub_concepto DESC
    LIMIT 1
),
0, 'complementarias. ', '{"legal":{"1":"The Company will cause the Hotel to provide private group functions without surcharge in meeting rooms and outdoor areas when using inclusive Hotel menus. (See exceptions under Additional Costs)."},"comercial":{"1":"The Company will cause the Hotel to provide private group functions without surcharge in meeting rooms and outdoor areas when using inclusive Hotel menus. (See exceptions under Additional Costs)."}}', '[]', '0', '0', 0, '[{"selecto":true,"inicio":0,"fin":0}]', '2019-12-13', '2019-12-13', '2019-12-13', '2019-12-13', '["ZCJG"]', 1, '2019-12-13 23:44:17', 'jugomez', 'ixicale', NOW());

-- try to copy bnf_condicion_variable 55. '@%COMMISSION@'.
INSERT INTO clv_benefits.bnf_condicion_variable
( idbnf_configuracion_clausula, idbnf_variable_beneficio, base, tipo_dato, override_rules, es_global, tag, tipo_rango, rangos, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES((
	SELECT bcc.idbnf_configuracion_clausula FROM clv_benefits.bnf_configuracion_clausula bcc WHERE
	bcc.usuario_creacion = "jugomez" AND
    bcc.fecha_creacion = "2019-12-13 23:44:17" AND
	bcc.idbnf_sub_concepto = (
        SELECT x.idbnf_sub_concepto FROM clv_benefits.bnf_sub_concepto x WHERE
            x.usuario_creacion = "jugomez" AND
            x.fecha_creacion = "2019-12-13 23:39:08" AND
            x.idcontr_categoria_contrato = 97
        ORDER BY x.idbnf_sub_concepto DESC 
        LIMIT 1
	)
    ORDER BY bcc.idbnf_configuracion_clausula DESC 
    LIMIT 1
), 2, '{"0-0":"__"}', 2, '{"0-0":[{"auth_id":"0","max":"","min":"","level":"1"}]}', 0, '@%COMMISSION@', 0, '[{"selecto":true,"inicio":0,"fin":0}]', 0, '2019-12-13 23:44:17', 'jugomez', 'ixicale', NOW());

-- try to copy bnf_sub_concepto 112. 'Food and Beverage'.
INSERT INTO clv_benefits.bnf_sub_concepto 
(idcontr_categoria_contrato, idbnf_concepto, descripcion, idioma, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES(97, 9, 'Food and Beverage', '{"1":"Food and Beverage"}', 1, '2020-01-22 17:00:20', 'ersanchez', 'ixicale', NOW());
-- try to copy bnf_sub_concepto 113. 'Commission'.
INSERT INTO clv_benefits.bnf_sub_concepto 
(idcontr_categoria_contrato, idbnf_concepto, descripcion, idioma, estado, fecha_creacion, usuario_creacion, usuario_ultima_modificacion, fecha_ultima_modificacion)
VALUES(97, 10, 'Commission', '{"1":"Commission"}', 1, '2020-01-22 17:00:21', 'jugomez', 'ixicale', NOW());
