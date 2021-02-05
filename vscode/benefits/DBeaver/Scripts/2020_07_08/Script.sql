USE clv_benefits;
ALTER TABLE clv_benefits.bnf_variable_beneficio ADD idfrm_auth_concepto int(11) DEFAULT 1 NOT NULL COMMENT 'Primary Key de tabla conceptos en frm para autorizaciones' AFTER base;
ALTER TABLE clv_benefits.bnf_variable_beneficio MODIFY COLUMN tipo_dato int(11) NOT NULL COMMENT 'Tipo de dato para la base o valor de la variable:
1 = Entero (valores redondeados)
2 = Texto (string)
3 = Fecha (string)
4 = Pagos (tabla - json)
5 = Double (numero con decimales)
6 = Cancelacion (tabla - json)
7 = Reduccion (tabla - json)';

ALTER TABLE clv_benefits.bnf_configuracion_clausula ADD idfrm_auth_concepto INT(11) DEFAULT 1 NOT NULL COMMENT '- Primary Key de tabla conceptos en frm para autorizaciones 
- Funciona para filtro de clausulas y enviar tipo de autorizador' AFTER propiedades;



/*
SELECT
	cc.idbnf_configuracion_clausula,
	sc.idbnf_sub_concepto,
	sc.idcontr_categoria_contrato,
	sc.idbnf_concepto,
	cc.nombre,
	cc.opcional,
	cc.booking_window_fecha_inicio `bwfi`,
	cc.booking_window_fecha_fin `bwff`,
	cc.travel_window_fecha_inicio `twfi`,
	cc.travel_window_fecha_fin `twff`,
	cc.propiedades,
	cc.tipo_familia,
	cc.id_referencia_clausula,
	cc.*
FROM
	clv_benefits.bnf_sub_concepto sc
INNER JOIN clv_benefits.bnf_configuracion_clausula cc ON
	cc.idbnf_sub_concepto = sc.idbnf_sub_concepto
	AND cc.idbnf_configuracion_clausula > 0
	AND sc.idbnf_sub_concepto > 0
WHERE
	sc.idcontr_categoria_contrato = 42
	AND sc.estado != 0
	AND cc.estado != 0;
	

INSERT INTO clv_benefits.bnf_sub_concepto (idcontr_categoria_contrato,idbnf_concepto,descripcion,idioma,estado,fecha_creacion,usuario_creacion,usuario_ultima_modificacion,fecha_ultima_modificacion) VALUES 
(42,3,'Pago Ejemplo','{"1":"Payment Sample","2":"Pago Ejemplo"}',1,'2020-07-01 16:36:42','ersanchez',' ','2020-07-01 16:36:42')
,(42,4,'Reduction Sample','{"1":"Reduction Sample","2":"Reducción Ejemplo"}',1,'2020-07-06 15:46:46','ersanchez',' ','2020-07-06 15:46:46')
,(42,5,'Cancellation Sample','{"1":"Cancellation Sample","2":"Cancelación Ejemplo"}',1,'2020-07-06 15:47:42','ersanchez',' ','2020-07-06 15:47:42')
;

INSERT INTO clv_benefits.bnf_configuracion_clausula (idbnf_sub_concepto,opcional,nombre,texto,variables,es_rango,rangos,booking_window_fecha_inicio,booking_window_fecha_fin,travel_window_fecha_inicio,travel_window_fecha_fin,propiedades,tipo_familia,id_referencia_clausula,estado,fecha_creacion,usuario_creacion,usuario_ultima_modificacion,fecha_ultima_modificacion) VALUES 
(438,0,'Payment Sample clausula','{"legal":{"1":"<p>legal<br></p><p>@VARIABLE-TEST-PAYMENTS@</p><p><br></p>","2":"<p>Legal</p><p>pago:</p><p>@VARIABLE-TEST-PAYMENTS@</p><p>cancelacion:</p><p><meta http-equiv=\\"content-type\\" content=\\"text/html; charset=utf-8\\">@VARIABLE-TEST-CANCELLATION@</p><p><br></p>"},"comercial":{"1":"<p><meta http-equiv=\\"content-type\\" content=\\"text/html; charset=utf-8\\">comercial</p><p>@VARIABLE-TEST-PAYMENTS@</p>","2":"<p>Comercial</p><p>pago:</p><p>@VARIABLE-TEST-PAYMENTS@</p><p>cancelación:</p><p><meta http-equiv=\\"content-type\\" content=\\"text/html; charset=utf-8\\">@VARIABLE-TEST-CANCELLATION@</p>"}}','["@VARIABLE-TEST-CANCELLATION@","@VARIABLE-TEST-PAYMENTS@"]',0,'[{"selecto":true,"inicio":0,"fin":0}]','2020-07-08','2020-07-08','2020-07-08','2020-07-08','["ZHBP","ZRCZ","ZHIM","ZHLB","ZPLB","ZMNI","ZMSU","ZCJG","ZCMPPC","ZRPL","ZHSP","ZMGR"]',1,'{ "can": 453, "red":452 }',1,'2020-07-01 18:55:36','ixicale','ixicale','2020-07-08 14:12:33')
,(439,0,'Reduction Sample clausula','{"legal":{"1":"<p>@VARIABLE-TEST-REDUCTION@</p>","2":"<p>@VARIABLE-TEST-REDUCTION@</p>"},"comercial":{"1":"<p>@VARIABLE-TEST-REDUCTION@</p>","2":"<p>@VARIABLE-TEST-REDUCTION@</p>"}}','["@VARIABLE-TEST-REDUCTION@"]',0,'[{"selecto":true,"inicio":0,"fin":0}]','2020-07-06','2020-07-06','2020-07-06','2020-07-06','["ZHBP","ZRCZ","ZHIM","ZHLB","ZPLB","ZMNI","ZMSU","ZCJG","ZCMPPC","ZRPL","ZHSP","ZMGR"]',2,'',1,'2020-07-06 15:49:40','ersanchez','ersanchez','2020-07-06 15:50:20')
,(440,0,'Cancellation Sample clausula','{"legal":{"1":"<p>@VARIABLE-TEST-CANCELLATION@</p>","2":"<p>@VARIABLE-TEST-CANCELLATION@</p>"},"comercial":{"1":"<p>@VARIABLE-TEST-CANCELLATION@</p>","2":"<p>@VARIABLE-TEST-CANCELLATION@</p>"}}','["@VARIABLE-TEST-CANCELLATION@"]',0,'[{"selecto":true,"inicio":0,"fin":0}]','2020-07-06','2020-07-06','2020-07-06','2020-07-06','["ZHBP","ZRCZ","ZHIM","ZHLB","ZPLB","ZMNI","ZMSU","ZCJG","ZCMPPC","ZRPL","ZHSP","ZMGR"]',2,'',1,'2020-07-06 15:51:32','ersanchez','','2020-07-06 15:51:32')
,(438,0,'testing up','{"legal":{"1":"@VARIABLE-TEST-PAYMENTS@"},"comercial":{"1":"<meta http-equiv=\\"content-type\\" content=\\"text/html; charset=utf-8\\">@VARIABLE-TEST-PAYMENTS@"}}','["@VARIABLE-TEST-PAYMENTS@"]',0,'[{"selecto":true,"inicio":0,"fin":0}]','2020-07-08','2020-07-08','2020-07-08','2020-07-08','["ZHBP","ZRCZ","ZHIM","ZHLB","ZPLB","ZMNI","ZMSU","ZCJG","ZCMPPC","ZRPL","ZHSP","ZMGR"]',1,'-',0,'2020-07-08 11:17:51','ersanchez','','2020-07-08 11:17:51')
;

INSERT INTO clv_benefits.bnf_variable_beneficio (tag,base,override_rules,tipo_dato,tipo_rango,rangos,estado,fecha_creacion,usuario_creacion,usuario_ultima_modificacion,fecha_ultima_modificacion) VALUES 
('@VARIABLE-TEST-PAYMENTS@','{"0-0":{"clausula":{},"variables":["@quantity@","@type@","@amount@","@begins_day@","@last_day@","@date@"],"filas":[{"@begins_day@":"On confirmation day","@last_day@":"On confirmation day","@quantity@":10,"@type@":"Percent"},{"@begins_day@":"On confirmation day","@last_day@":180,"@quantity@":40,"@type@":"Percent"},{"@begins_day@":"179","@last_day@":90,"@quantity@":40,"@type@":"Percent"},{"@begins_day@":"89","@last_day@":30,"@quantity@":10,"@type@":"Percent"}]}}','{"0-0":[{"auth_id":"0","max":"","min":"","level":"1"}]}',4,0,'[{"selecto":true,"inicio":0,"fin":0}]',1,'2020-07-01 14:55:40','ersanchez','','1000-01-01 00:00:00')
,('@VARIABLE-TEST-CANCELLATION@','{"0-0":{"clausula":{},"variables":["@quantity@","@type@","@amount@","@begins_day@","@last_day@","@date@"],"filas":[{"@begins_day@":"On confirmation day","@last_day@":"On confirmation day","@quantity@":10,"@type@":"Percent"},{"@begins_day@":"On confirmation day","@last_day@":90,"@quantity@":40,"@type@":"Percent"},{"@begins_day@":"89","@last_day@":50,"@quantity@":40,"@type@":"Percent"},{"@begins_day@":"49","@last_day@":10,"@quantity@":10,"@type@":"Percent"}]}}','{"0-0":[{"auth_id":"0","max":"","min":"","level":"1"}]}',6,0,'[{"selecto":true,"inicio":0,"fin":0}]',1,'2020-07-02 10:54:01','ersanchez','','2020-07-02 10:54:01')
,('@VARIABLE-TEST-REDUCTION@','{"0-0":{"clausula":{},"variables":["@quantity@","@type@","@amount@","@begins_day@","@last_day@","@date@"],"filas":[{"@begins_day@":"On confirmation day","@last_day@":"On confirmation day","@quantity@":5,"@type@":"Percent"},{"@begins_day@":"On confirmation day","@last_day@":180,"@quantity@":15,"@type@":"Percent"},{"@begins_day@":"179","@last_day@":90,"@quantity@":20,"@type@":"Percent"},{"@begins_day@":"89","@last_day@":30,"@quantity@":60,"@type@":"Percent"}]}}','{"0-0":[{"auth_id":"0","max":"","min":"","level":"1"}]}',7,0,'[{"selecto":true,"inicio":0,"fin":0}]',1,'2020-07-06 15:43:35','ersanchez','ersanchez','2020-07-06 15:49:09')
;

INSERT INTO clv_benefits.bnf_condicion_variable (idbnf_configuracion_clausula,idbnf_variable_beneficio,base,tipo_dato,override_rules,es_global,tag,tipo_rango,rangos,estado,fecha_creacion,usuario_creacion,usuario_ultima_modificacion,fecha_ultima_modificacion) VALUES 
(451,13,'{"0-0":{"clausula":{},"variables":["@quantity@","@type@","@amount@","@begins_day@","@last_day@","@date@"],"filas":[{"@begins_day@":"On confirmation day","@last_day@":"On confirmation day","@quantity@":10,"@type@":"Percent"},{"@begins_day@":"On confirmation day","@last_day@":90,"@quantity@":40,"@type@":"Percent"},{"@begins_day@":"89","@last_day@":50,"@quantity@":40,"@type@":"Percent"},{"@begins_day@":"49","@last_day@":10,"@quantity@":10,"@type@":"Percent"}]}}',4,'{"0-0":[{"auth_id":"0","max":"","min":"","level":"1"}]}',1,'@VARIABLE-TEST-CANCELLATION@',0,'[{"selecto":true,"inicio":0,"fin":0}]',0,'2020-07-01 18:55:38','ixicale','ixicale','2020-07-08 14:12:34')
,(451,12,'{"0-0":{"clausula":{},"variables":["@quantity@","@type@","@amount@","@begins_day@","@last_day@","@date@"],"filas":[{"@begins_day@":"On confirmation day","@last_day@":"On confirmation day","@quantity@":10,"@type@":"Percent"},{"@begins_day@":"On confirmation day","@last_day@":180,"@quantity@":40,"@type@":"Percent"},{"@begins_day@":"179","@last_day@":90,"@quantity@":40,"@type@":"Percent"},{"@begins_day@":"89","@last_day@":30,"@quantity@":10,"@type@":"Percent"}]}}',4,'{"0-0":[{"auth_id":"0","max":"","min":"","level":"1"}]}',1,'@VARIABLE-TEST-PAYMENTS@',0,'[{"selecto":true,"inicio":0,"fin":0}]',1,'2020-07-02 11:00:58','ersanchez','ixicale','2020-07-08 14:12:34')
,(452,14,'{"0-0":{"clausula":{},"variables":["@quantity@","@type@","@amount@","@begins_day@","@last_day@","@date@"],"filas":[{"@begins_day@":"On confirmation day","@last_day@":"On confirmation day","@quantity@":5,"@type@":"Percent"},{"@begins_day@":"On confirmation day","@last_day@":180,"@quantity@":15,"@type@":"Percent"},{"@begins_day@":"179","@last_day@":90,"@quantity@":20,"@type@":"Percent"},{"@begins_day@":"89","@last_day@":30,"@quantity@":60,"@type@":"Percent"}]}}',4,'{"0-0":[{"auth_id":"0","max":"","min":"","level":"1"}]}',1,'@VARIABLE-TEST-REDUCTION@',0,'[{"selecto":true,"inicio":0,"fin":0}]',1,'2020-07-06 15:49:41','ersanchez','ersanchez','2020-07-06 15:50:20')
,(453,13,'{"0-0":{"clausula":{},"variables":["@quantity@","@type@","@amount@","@begins_day@","@last_day@","@date@"],"filas":[{"@begins_day@":"On confirmation day","@last_day@":"On confirmation day","@quantity@":10,"@type@":"Percent"},{"@begins_day@":"On confirmation day","@last_day@":90,"@quantity@":40,"@type@":"Percent"},{"@begins_day@":"89","@last_day@":50,"@quantity@":40,"@type@":"Percent"},{"@begins_day@":"49","@last_day@":10,"@quantity@":10,"@type@":"Percent"}]}}',4,'{"0-0":[{"auth_id":"0","max":"","min":"","level":"1"}]}',1,'@VARIABLE-TEST-CANCELLATION@',0,'[{"selecto":true,"inicio":0,"fin":0}]',1,'2020-07-06 15:51:33','ersanchez','','2020-07-06 15:51:33')
,(454,12,'{"0-0":{"clausula":{},"variables":["@quantity@","@type@","@amount@","@begins_day@","@last_day@","@date@"],"filas":[{"@begins_day@":"On confirmation day","@last_day@":"On confirmation day","@quantity@":10,"@type@":"Percent"},{"@begins_day@":"On confirmation day","@last_day@":180,"@quantity@":40,"@type@":"Percent"},{"@begins_day@":"179","@last_day@":90,"@quantity@":40,"@type@":"Percent"},{"@begins_day@":"89","@last_day@":30,"@quantity@":10,"@type@":"Percent"}]}}',4,'{"0-0":[{"auth_id":"0","max":"","min":"","level":"1"}]}',1,'@VARIABLE-TEST-PAYMENTS@',0,'[{"selecto":true,"inicio":0,"fin":0}]',1,'2020-07-08 11:17:54','ersanchez','','2020-07-08 11:17:54')
;
*/
/*
ALTER TABLE clv_benefits.bnf_configuracion_clausula ADD tipo_familia TINYINT(4) DEFAULT 0 NOT NULL COMMENT 'Tipo de clausula para diferenciar en proposal:
0 - Común
1 - Pagos
2 - Cancelación | Reducción (no visibles)
' AFTER propiedades;

ALTER TABLE clv_benefits.bnf_configuracion_clausula ADD id_referencia_clausula TEXT NULL COMMENT 'Clausulas de cancelacion y reduccion unicamente para PAGOS.
Objeto ejemplo con id referenciados:
  { "can": 0, "red":0 }
Estructura esperada:
{
  "can": idbnf_configuracion_cluasula,
  "red": idbnf_configuracion_cluasula
}
' AFTER tipo_familia;

ALTER TABLE clv_benefits.bnf_configuracion_clausula DROP COLUMN limite_superior;
ALTER TABLE clv_benefits.bnf_configuracion_clausula DROP COLUMN limite_inferior;
*/

/*
INSERT INTO clv_benefits.bnf_sub_concepto (idcontr_categoria_contrato,idbnf_concepto,descripcion,idioma,estado,fecha_creacion,usuario_creacion,usuario_ultima_modificacion,fecha_ultima_modificacion) VALUES 
(42,3,'Pago Ejemplo','{"1":"Payment Sample","2":"Pago Ejemplo"}',1,NOW(),'ixicale',' ',NOW())
,(42,4,'Reduction Sample','{"1":"Reduction Sample","2":"Reducción Ejemplo"}',1,NOW(),'ixicale',' ',NOW())
,(42,5,'Cancellation Sample','{"1":"Cancellation Sample","2":"Cancelación Ejemplo"}',1,NOW(),'ixicale',' ',NOW())
;

INSERT INTO clv_benefits.bnf_configuracion_clausula (idbnf_sub_concepto,opcional,nombre,texto,variables,es_rango,rangos,booking_window_fecha_inicio,booking_window_fecha_fin,travel_window_fecha_inicio,travel_window_fecha_fin,propiedades,tipo_familia,id_referencia_clausula,estado,fecha_creacion,usuario_creacion,usuario_ultima_modificacion,fecha_ultima_modificacion) VALUES 
(442,0,'Payment Sample clausula','{"legal":{"1":"<p>legal<br></p><p>@VARIABLE-TEST-PAYMENTS@</p><p><br></p>","2":"<p>Legal</p><p>pago:</p><p>@VARIABLE-TEST-PAYMENTS@</p><p>cancelacion:</p><p><meta http-equiv=\\"content-type\\" content=\\"text/html; charset=utf-8\\">@VARIABLE-TEST-CANCELLATION@</p><p><br></p>"},"comercial":{"1":"<p><meta http-equiv=\\"content-type\\" content=\\"text/html; charset=utf-8\\">comercial</p><p>@VARIABLE-TEST-PAYMENTS@</p>","2":"<p>Comercial</p><p>pago:</p><p>@VARIABLE-TEST-PAYMENTS@</p><p>cancelación:</p><p><meta http-equiv=\\"content-type\\" content=\\"text/html; charset=utf-8\\">@VARIABLE-TEST-CANCELLATION@</p>"}}','["@VARIABLE-TEST-CANCELLATION@","@VARIABLE-TEST-PAYMENTS@"]',0,'[{"selecto":true,"inicio":0,"fin":0}]','2020-07-08','2020-07-08','2020-07-08','2020-07-08','["ZHBP","ZRCZ","ZHIM","ZHLB","ZPLB","ZMNI","ZMSU","ZCJG","ZCMPPC","ZRPL","ZHSP","ZMGR"]',1,'{ "can": 453, "red":452 }',1,NOW(),'ixicale',' ',NOW())
,(443,0,'Reduction Sample clausula','{"legal":{"1":"<p>@VARIABLE-TEST-REDUCTION@</p>","2":"<p>@VARIABLE-TEST-REDUCTION@</p>"},"comercial":{"1":"<p>@VARIABLE-TEST-REDUCTION@</p>","2":"<p>@VARIABLE-TEST-REDUCTION@</p>"}}','["@VARIABLE-TEST-REDUCTION@"]',0,'[{"selecto":true,"inicio":0,"fin":0}]','2020-07-06','2020-07-06','2020-07-06','2020-07-06','["ZHBP","ZRCZ","ZHIM","ZHLB","ZPLB","ZMNI","ZMSU","ZCJG","ZCMPPC","ZRPL","ZHSP","ZMGR"]',2,'',1,NOW(),'ixicale',' ',NOW())
,(444,0,'Cancellation Sample clausula','{"legal":{"1":"<p>@VARIABLE-TEST-CANCELLATION@</p>","2":"<p>@VARIABLE-TEST-CANCELLATION@</p>"},"comercial":{"1":"<p>@VARIABLE-TEST-CANCELLATION@</p>","2":"<p>@VARIABLE-TEST-CANCELLATION@</p>"}}','["@VARIABLE-TEST-CANCELLATION@"]',0,'[{"selecto":true,"inicio":0,"fin":0}]','2020-07-06','2020-07-06','2020-07-06','2020-07-06','["ZHBP","ZRCZ","ZHIM","ZHLB","ZPLB","ZMNI","ZMSU","ZCJG","ZCMPPC","ZRPL","ZHSP","ZMGR"]',2,'',1,NOW(),'ixicale',' ',NOW())
,(442,0,'testing up','{"legal":{"1":"@VARIABLE-TEST-PAYMENTS@"},"comercial":{"1":"<meta http-equiv=\\"content-type\\" content=\\"text/html; charset=utf-8\\">@VARIABLE-TEST-PAYMENTS@"}}','["@VARIABLE-TEST-PAYMENTS@"]',0,'[{"selecto":true,"inicio":0,"fin":0}]','2020-07-08','2020-07-08','2020-07-08','2020-07-08','["ZHBP","ZRCZ","ZHIM","ZHLB","ZPLB","ZMNI","ZMSU","ZCJG","ZCMPPC","ZRPL","ZHSP","ZMGR"]',1,'-',0,NOW(),'ixicale',' ',NOW())
;

INSERT INTO clv_benefits.bnf_variable_beneficio (tag,base,override_rules,tipo_dato,tipo_rango,rangos,estado,fecha_creacion,usuario_creacion,usuario_ultima_modificacion,fecha_ultima_modificacion) VALUES 
('@VARIABLE-TEST-PAYMENTS@','{"0-0":{"clausula":{},"variables":["@quantity@","@type@","@amount@","@begins_day@","@last_day@","@date@"],"filas":[{"@begins_day@":"On confirmation day","@last_day@":"On confirmation day","@quantity@":10,"@type@":"Percent"},{"@begins_day@":"On confirmation day","@last_day@":180,"@quantity@":40,"@type@":"Percent"},{"@begins_day@":"179","@last_day@":90,"@quantity@":40,"@type@":"Percent"},{"@begins_day@":"89","@last_day@":30,"@quantity@":10,"@type@":"Percent"}]}}','{"0-0":[{"auth_id":"0","max":"","min":"","level":"1"}]}',4,0,'[{"selecto":true,"inicio":0,"fin":0}]',1,'2020-07-01 14:55:40','ersanchez','','1000-01-01 00:00:00')
,('@VARIABLE-TEST-CANCELLATION@','{"0-0":{"clausula":{},"variables":["@quantity@","@type@","@amount@","@begins_day@","@last_day@","@date@"],"filas":[{"@begins_day@":"On confirmation day","@last_day@":"On confirmation day","@quantity@":10,"@type@":"Percent"},{"@begins_day@":"On confirmation day","@last_day@":90,"@quantity@":40,"@type@":"Percent"},{"@begins_day@":"89","@last_day@":50,"@quantity@":40,"@type@":"Percent"},{"@begins_day@":"49","@last_day@":10,"@quantity@":10,"@type@":"Percent"}]}}','{"0-0":[{"auth_id":"0","max":"","min":"","level":"1"}]}',6,0,'[{"selecto":true,"inicio":0,"fin":0}]',1,'2020-07-02 10:54:01','ersanchez','','2020-07-02 10:54:01')
,('@VARIABLE-TEST-REDUCTION@','{"0-0":{"clausula":{},"variables":["@quantity@","@type@","@amount@","@begins_day@","@last_day@","@date@"],"filas":[{"@begins_day@":"On confirmation day","@last_day@":"On confirmation day","@quantity@":5,"@type@":"Percent"},{"@begins_day@":"On confirmation day","@last_day@":180,"@quantity@":15,"@type@":"Percent"},{"@begins_day@":"179","@last_day@":90,"@quantity@":20,"@type@":"Percent"},{"@begins_day@":"89","@last_day@":30,"@quantity@":60,"@type@":"Percent"}]}}','{"0-0":[{"auth_id":"0","max":"","min":"","level":"1"}]}',7,0,'[{"selecto":true,"inicio":0,"fin":0}]',1,'2020-07-06 15:43:35','ersanchez','ersanchez','2020-07-06 15:49:09')
;

INSERT INTO clv_benefits.bnf_condicion_variable (idbnf_configuracion_clausula,idbnf_variable_beneficio,base,tipo_dato,override_rules,es_global,tag,tipo_rango,rangos,estado,fecha_creacion,usuario_creacion,usuario_ultima_modificacion,fecha_ultima_modificacion) VALUES 
(456,13,'{"0-0":{"clausula":{},"variables":["@quantity@","@type@","@amount@","@begins_day@","@last_day@","@date@"],"filas":[{"@begins_day@":"On confirmation day","@last_day@":"On confirmation day","@quantity@":10,"@type@":"Percent"},{"@begins_day@":"On confirmation day","@last_day@":90,"@quantity@":40,"@type@":"Percent"},{"@begins_day@":"89","@last_day@":50,"@quantity@":40,"@type@":"Percent"},{"@begins_day@":"49","@last_day@":10,"@quantity@":10,"@type@":"Percent"}]}}',4,'{"0-0":[{"auth_id":"0","max":"","min":"","level":"1"}]}',1,'@VARIABLE-TEST-CANCELLATION@',0,'[{"selecto":true,"inicio":0,"fin":0}]',0,'2020-07-01 18:55:38','ixicale','ixicale','2020-07-08 14:12:34')
,(456,12,'{"0-0":{"clausula":{},"variables":["@quantity@","@type@","@amount@","@begins_day@","@last_day@","@date@"],"filas":[{"@begins_day@":"On confirmation day","@last_day@":"On confirmation day","@quantity@":10,"@type@":"Percent"},{"@begins_day@":"On confirmation day","@last_day@":180,"@quantity@":40,"@type@":"Percent"},{"@begins_day@":"179","@last_day@":90,"@quantity@":40,"@type@":"Percent"},{"@begins_day@":"89","@last_day@":30,"@quantity@":10,"@type@":"Percent"}]}}',4,'{"0-0":[{"auth_id":"0","max":"","min":"","level":"1"}]}',1,'@VARIABLE-TEST-PAYMENTS@',0,'[{"selecto":true,"inicio":0,"fin":0}]',1,'2020-07-02 11:00:58','ersanchez','ixicale','2020-07-08 14:12:34')
,(457,14,'{"0-0":{"clausula":{},"variables":["@quantity@","@type@","@amount@","@begins_day@","@last_day@","@date@"],"filas":[{"@begins_day@":"On confirmation day","@last_day@":"On confirmation day","@quantity@":5,"@type@":"Percent"},{"@begins_day@":"On confirmation day","@last_day@":180,"@quantity@":15,"@type@":"Percent"},{"@begins_day@":"179","@last_day@":90,"@quantity@":20,"@type@":"Percent"},{"@begins_day@":"89","@last_day@":30,"@quantity@":60,"@type@":"Percent"}]}}',4,'{"0-0":[{"auth_id":"0","max":"","min":"","level":"1"}]}',1,'@VARIABLE-TEST-REDUCTION@',0,'[{"selecto":true,"inicio":0,"fin":0}]',1,'2020-07-06 15:49:41','ersanchez','ersanchez','2020-07-06 15:50:20')
,(458,13,'{"0-0":{"clausula":{},"variables":["@quantity@","@type@","@amount@","@begins_day@","@last_day@","@date@"],"filas":[{"@begins_day@":"On confirmation day","@last_day@":"On confirmation day","@quantity@":10,"@type@":"Percent"},{"@begins_day@":"On confirmation day","@last_day@":90,"@quantity@":40,"@type@":"Percent"},{"@begins_day@":"89","@last_day@":50,"@quantity@":40,"@type@":"Percent"},{"@begins_day@":"49","@last_day@":10,"@quantity@":10,"@type@":"Percent"}]}}',4,'{"0-0":[{"auth_id":"0","max":"","min":"","level":"1"}]}',1,'@VARIABLE-TEST-CANCELLATION@',0,'[{"selecto":true,"inicio":0,"fin":0}]',1,'2020-07-06 15:51:33','ersanchez','','2020-07-06 15:51:33')
,(459,12,'{"0-0":{"clausula":{},"variables":["@quantity@","@type@","@amount@","@begins_day@","@last_day@","@date@"],"filas":[{"@begins_day@":"On confirmation day","@last_day@":"On confirmation day","@quantity@":10,"@type@":"Percent"},{"@begins_day@":"On confirmation day","@last_day@":180,"@quantity@":40,"@type@":"Percent"},{"@begins_day@":"179","@last_day@":90,"@quantity@":40,"@type@":"Percent"},{"@begins_day@":"89","@last_day@":30,"@quantity@":10,"@type@":"Percent"}]}}',4,'{"0-0":[{"auth_id":"0","max":"","min":"","level":"1"}]}',1,'@VARIABLE-TEST-PAYMENTS@',0,'[{"selecto":true,"inicio":0,"fin":0}]',1,'2020-07-08 11:17:54','ersanchez','','2020-07-08 11:17:54')
;
*/