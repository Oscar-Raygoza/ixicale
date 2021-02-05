-- clv_events.event_reserva_grupo_agencia_gift definition
USE clv_events;

DROP TABLE IF EXISTS clv_events.event_reserva_grupo_agencia_gift;

CREATE TABLE IF NOT EXISTS `event_reserva_grupo_agencia_gift` (
  `idevent_reserva_grupo_agencia_gift` int(11) NOT NULL AUTO_INCREMENT,
  `idevent_grupo` int(11) DEFAULT NULL,
  `idclv_propiedad` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `nombre_familiar` varchar(120) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `correo_familiar` varchar(120) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `monto_regalo` decimal(18,2) NOT NULL DEFAULT '0.00',
  `fecha_regalo` datetime NOT NULL DEFAULT '1000-01-01 00:00:00' COMMENT 'Fecha que se envia regalo',
  `link_regalo` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'Enlace que se envia en el correo para enviar regalo',
  `comentario_familiar` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'Texto que escribe el familiar',
  `usuario_creacion` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `fecha_creacion` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `usuario_ultima_modificacion` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `fecha_ultima_modificacion` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `estado` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 Activo\n0 Inactivo',
  PRIMARY KEY (`idevent_reserva_grupo_agencia_gift`),
  KEY `event_reserva_grupo_agencia_gift_idevent_grupo_IDX` (`idevent_grupo`) USING BTREE,
  KEY `event_reserva_grupo_agencia_gift_idclv_propiedad_IDX` (`idclv_propiedad`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Registro de regalos para PostLogin de Weddings'
