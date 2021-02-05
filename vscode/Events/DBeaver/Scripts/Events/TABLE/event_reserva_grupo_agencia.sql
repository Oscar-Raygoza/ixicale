-- clv_events.event_reserva_grupo_agencia definition
USE clv_events;

DROP TABLE IF EXISTS clv_events.event_reserva_grupo_agencia;

CREATE TABLE `event_reserva_grupo_agencia` (
  `idevent_reserva_grupo_agencia` int(11) NOT NULL AUTO_INCREMENT,
  `idevent_grupo` int(11) DEFAULT NULL,
  `idclv_propiedad` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `id_agencia` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `aprobado` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'validacion de aprobacion de noches y cuartos\n0: No aprobado\n1: Aprobado',
  `folio_confirmacion` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  `nombre_titular_reserva` varchar(120) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `nombre_agencia_reserva` varchar(120) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `arrival_date` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',  
  `departure_date` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `cant_adults` int(11) DEFAULT '0' NOT NULL COMMENT 'Numero de adultos',
  `cant_childs` int(11) DEFAULT '0' NOT NULL COMMENT 'Numero de menores',
  `cant_nights` int(11) DEFAULT '0' NOT NULL COMMENT 'Numero de noches',
  `cant_rooms` int(11) DEFAULT '0' NOT NULL COMMENT 'Numero de cuartos',
  `usuario_creacion` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `fecha_creacion` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `usuario_ultima_modificacion` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `fecha_ultima_modificacion` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `estado` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 Activo\n0 Inactivo',
  PRIMARY KEY (`idevent_reserva_grupo_agencia`),
  KEY `event_reserva_grupo_agencia_idevent_grupo_IDX` (`idevent_grupo`) USING BTREE,
  KEY `event_reserva_grupo_agencia_idclv_propiedad_IDX` (`idclv_propiedad`) USING BTREE,
  KEY `event_reserva_grupo_agencia_id_agencia_IDX` (`id_agencia`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Registro de reservas para PostLogin de Weddings';

