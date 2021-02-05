use clv_events;

SELECT * FROM clv_events.event_detalle_extrainfo WHERE idevent_detalle IN ('42', '12');
SELECT * FROM clv_events.event_detalle_item edi;
SELECT * FROM clv_events.event_evento_locacion eel;
SELECT * FROM clv_events.event_locacion el;
SELECT * FROM clv_events.event_evento ee;

#SELECT
#ee.idevent_evento,
#SUM(1)
DESC
SELECT
	ee.idevent_grupo,
	ee.idevent_evento,
	el.idevent_locacion,
	el.descripcion,
	edi.idevent_detalle_item,
	edi.*,
	el.*,
	ee.*
FROM
	clv_events.event_detalle_item edi
INNER JOIN clv_events.event_evento ee ON
	edi.idevent_evento = ee.idevent_evento
INNER JOIN clv_events.event_evento_locacion eel ON
	eel.idevent_evento = edi.idevent_evento 
INNER JOIN clv_events.event_locacion el ON
	eel.idevent_locacion = el.idevent_locacion
WHERE
	ee.idevent_grupo = :idevent_grupo
	AND edi.estado = 1
	AND el.estado = 1
	AND ee.estado = 1
	AND eel.estado = 1
	AND eel.idevent_locacion > 0
	AND el.idevent_locacion > 0
	AND edi.idevent_detalle_item > 0
	AND ee.idevent_evento > 0
ORDER BY
	ee.fecha_ultima_modificacion ASC,
	el.fecha_ultima_modificacion ASC,
	edi.fecha_ultima_modificacion

GROUP BY ee.idevent_evento 
;	

SELECT
	el.idevent_evento_locacion ,
	el.idevent_locacion,
	el.idevent_evento,
	e.descripcion as descripcionevento,
	el.fecha_inicia_evento,
	el.fecha_fin_evento,
	el.orden,
	CONCAT(e.descripcion, ' / ' , DATE_FORMAT(el.fecha_inicia_evento, '%Y-%m-%d %H:%i'), ' - ', DATE_FORMAT(el.fecha_fin_evento, '%Y-%m-%d %H:%i')) rango_fecha,
	el.estado,
	el.unir_locaciones
FROM
	clv_events.event_evento_locacion el
INNER JOIN event_locacion e ON
	e.idevent_locacion = el.idevent_locacion
WHERE
	el.idevent_evento in (228, 234, 268, 269);


SELECT
	eel.idevent_evento_locacion,
	el.idevent_locacion,
	edi.idevent_detalle_item,
	eel.*,
	el.*,
	edi.*
FROM
	clv_events.event_evento_locacion eel
INNER JOIN clv_events.event_locacion el ON
	el.idevent_locacion = eel.idevent_locacion
INNER JOIN clv_events.event_detalle_item edi ON
	edi.id_locacion = eel.idevent_evento_locacion
WHERE
	eel.idevent_evento_locacion = :id_locacion
	AND eel.estado = 1
	AND eel.idevent_evento_locacion > 0
	AND el.estado = 1
	AND el.idevent_locacion > 0
	AND edi.estado = 1
	AND edi.idevent_detalle_item > 0
ORDER BY
	eel.idevent_evento_locacion ASC,
	el.idevent_locacion ASC,
	edi.idevent_detalle_item ASC

;

#SELECT * FROM clv_events.


DROP TABLE `bank_code`;
CREATE TABLE IF NOT EXISTS `bank_code` (
  `idbank_code` int(11) NOT NULL AUTO_INCREMENT,
  `bank_code` varchar(10) COLLATE utf8_bin NOT NULL COMMENT 'Código de banco alfanumerico',
  `origen` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'Desde dónde se toma referencia el código',
  `description` text COLLATE utf8_bin NOT NULL COMMENT 'mensaje real del codigo',
  `type` tinyint(3) NOT NULL DEFAULT '0' COMMENT 'Tipo de error. Clasificador:\n0 - sin definir\n1 - error de opera\n2 - error de finanzas\n3 - error de tesoreria',
  `message` text COLLATE utf8_bin NOT NULL COMMENT 'Mensaje personalizado a mostrar del error en json. Ej:\n{"1":"My own error message description",\n "2":"Mi propia descripción de mensaje erroneo"}',
  `tag_norification` varchar(45) COLLATE utf8_bin NOT NULL COMMENT 'id para el tag de notificaciones',
  `usuario_creacion` varchar(45) COLLATE utf8_bin NOT NULL DEFAULT '',
  `fecha_creacion` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `usuario_ultima_modificacion` varchar(45) COLLATE utf8_bin NOT NULL DEFAULT '',
  `fecha_ultima_modificacion` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `estado` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idbank_code`),
  KEY `NewTable_idbank_code_IDX` (`idbank_code`) USING BTREE,
  KEY `NewTable_bank_code_IDX` (`bank_code`) USING BTREE,
  KEY `bank_code_origen_IDX` (`origen`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;



SELECT
            ee.idevent_grupo,
            ee.idevent_evento,
            el.idevent_locacion,
            edi.idevent_detalle_item,
            edi.pax `s_pax`,
            edi.usuario_creacion `s_usuario_creacion`,
            edi.fecha_creacion `s_fecha_creacion`,
            edi.usuario_ultima_modificacion `s_usuario_ultima_modificacion`,
            edi.fecha_ultima_modificacion `s_fecha_ultima_modificacion`,
            edi.estado `s_estado`,
            el.idclv_propiedad `l_idclv_propiedad`,
            CONCAT(DATE_FORMAT(eel.fecha_inicia_evento, '%Y-%m-%d %H:%i'), ' - ', DATE_FORMAT(eel.fecha_fin_evento, '%Y-%m-%d %H:%i')) rango_fechas,
            el.descripcion `l_descripcion`,
            el.usuario_creacion `l_usuario_creacion`,
            el.fecha_creacion `l_fecha_creacion`,
            el.usuario_ultima_modificacion `l_usuario_ultima_modificacion`,
            el.fecha_ultima_modificacion `l_fecha_ultima_modificacion`,
            el.estado `l_estado`,
            ee.descripcion `e_descripcion`,
            ee.idclv_propiedad `e_idclv_propiedad`,
            ee.pax `e_pax`,
            ee.usuario_creacion `e_usuario_creacion`,
            ee.fecha_creacion `e_fecha_creacion`,
            ee.usuario_ultima_modificacion `e_usuario_ultima_modificacion`,
            ee.fecha_ultima_modificacion `e_fecha_ultima_modificacion`,
            ee.estado `e_estado`,
            edi.*,
            el.*,
            eel.*,
            ee.*
        FROM
            clv_events.event_detalle_item edi
        INNER JOIN clv_events.event_evento ee ON
            edi.idevent_evento = ee.idevent_evento
            AND ee.estado = 1
        INNER JOIN clv_events.event_evento_locacion eel ON
            eel.idevent_evento_locacion = edi.id_locacion 
            AND eel.estado = 1
        INNER JOIN clv_events.event_locacion el ON
            eel.idevent_locacion = el.idevent_locacion
            AND el.estado = 1
        WHERE
            ee.idevent_grupo = :idevent_grupo AND edi.estado = 1
        ORDER BY
            ee.fecha_ultima_modificacion ASC,
            el.fecha_ultima_modificacion ASC,
            edi.fecha_ultima_modificacion ASC
;