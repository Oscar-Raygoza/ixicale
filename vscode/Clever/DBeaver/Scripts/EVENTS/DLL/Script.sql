use clv_events;

CREATE TABLE `event_reserva_grupo_agencia_link` (
  `idevent_reserva_grupo_agencia_link` int(11) NOT NULL AUTO_INCREMENT,
  `idevent_grupo` int(11) NOT NULL DEFAULT '0',
  `id_sub_booking` varchar(25) NOT NULL,
  `origen` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Opciones:\n1 - Link de bodas\n2 - Book Engine\n3 - Agencia Directa',
  `descripcion` varchar(200) NOT NULL DEFAULT ' ' COMMENT 'comentario para referencia link',
  `comentario` varchar(200) NOT NULL DEFAULT ' ',
  `link` text NOT NULL COMMENT 'enlace, campo obligatorio',
  `usuario_validacion` varchar(45) NOT NULL DEFAULT '',
  `fecha_validacion` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `estado` tinyint(1) NOT NULL DEFAULT '1',
  `usuario_creacion` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `fecha_creacion` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `usuario_ultima_modificacion` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `fecha_ultima_modificacion` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  PRIMARY KEY (`idevent_reserva_grupo_agencia_link`),
  KEY `event_reserva_grupo_agencia_link_idevent_grupo_IDX` (`idevent_grupo`) USING BTREE,
  KEY `event_reserva_grupo_agencia_link_usuario_validacion_IDX` (`usuario_validacion`) USING BTREE,
  KEY `id_sub_booking` (`id_sub_booking`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Registro links para redireccionar en POSTLOGIN'


CREATE TABLE `event_reserva_grupo_agencia_gift` (
  `idevent_reserva_grupo_agencia_gift` int(11) NOT NULL AUTO_INCREMENT,
  `idevent_grupo` int(11) DEFAULT NULL,
  `nombre_familiar` varchar(120) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `correo_familiar` varchar(120) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `monto_regalo` decimal(18,2) NOT NULL DEFAULT '0.00',
  `fecha_regalo` datetime NOT NULL DEFAULT '1000-01-01 00:00:00' COMMENT 'Fecha que se envia regalo',
  `comentario_familiar` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'Texto que escribe el familiar',
  `usuario_creacion` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `fecha_creacion` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `usuario_ultima_modificacion` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `fecha_ultima_modificacion` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `estado` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 Activo\n0 Inactivo',
  PRIMARY KEY (`idevent_reserva_grupo_agencia_gift`),
  KEY `event_reserva_grupo_agencia_gift_idevent_grupo_IDX` (`idevent_grupo`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Registro de regalos para PostLogin de Weddings'



CREATE TABLE `event_reserva_grupo_agencia` (
  `idevent_reserva_grupo_agencia` int(11) NOT NULL AUTO_INCREMENT,
  `idevent_grupo` int(11) DEFAULT NULL,
  `idclv_propiedad` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `id_agencia` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `aprobado` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'validacion de aprobacion de noches y cuartos\n0: No aprobado\n1: Aprobado',
  `usuario_aprobacion` varchar(45) NOT NULL DEFAULT '' COMMENT 'usuario que aprobo la reserva',
  `folio_confirmacion` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  `nombre_titular_reserva` varchar(120) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `apellido_titular_reserva` varchar(120) NOT NULL DEFAULT '',
  `nombre_agencia_reserva` varchar(120) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `arrival_date` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `departure_date` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `cant_adults` int(11) NOT NULL DEFAULT '0' COMMENT 'Numero de adultos',
  `cant_childs` int(11) NOT NULL DEFAULT '0' COMMENT 'Numero de menores',
  `cant_nights` int(11) NOT NULL DEFAULT '0' COMMENT 'Numero de noches',
  `cant_rooms` int(11) NOT NULL DEFAULT '0' COMMENT 'Numero de cuartos',
  `usuario_creacion` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `fecha_creacion` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `usuario_ultima_modificacion` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `fecha_ultima_modificacion` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `estado` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 Activo\n0 Inactivo',
  PRIMARY KEY (`idevent_reserva_grupo_agencia`),
  KEY `event_reserva_grupo_agencia_idevent_grupo_IDX` (`idevent_grupo`) USING BTREE,
  KEY `event_reserva_grupo_agencia_idclv_propiedad_IDX` (`idclv_propiedad`) USING BTREE,
  KEY `event_reserva_grupo_agencia_id_agencia_IDX` (`id_agencia`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Registro de reservas para PostLogin de Weddings'



