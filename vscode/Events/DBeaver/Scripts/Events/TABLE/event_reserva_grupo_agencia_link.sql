USE clv_events;

DROP TABLE IF EXISTS clv_events.event_reserva_grupo_agencia_link;

CREATE TABLE `event_reserva_grupo_agencia_link` (
  `idevent_reserva_grupo_agencia_link` int(11) NOT NULL AUTO_INCREMENT,
  `idevent_grupo` int(11) NOT NULL DEFAULT '0',
  `idclv_propiedad` varchar(100) NOT NULL DEFAULT '',
  `origen` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Opciones:\n1 - Link de bodas\n2 - Book Engine\n3 - Agencia Directa',
  `idclv_sistema` int(11) DEFAULT NULL COMMENT 'Vacio si no aplica',
  `descripcion` text COMMENT 'comentario para referencia link',
  `tipo_link` tinyint(2) NOT NULL DEFAULT '1' COMMENT 'Tipo de link\n1 - Link reservas POSTLOGIN',
  `link` text NOT NULL COMMENT 'enlace, campo obligatorio',
  `usuario_validacion` varchar(100) NOT NULL DEFAULT '',
  `fecha_validacion` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `usuario_creacion` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `fecha_creacion` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `usuario_ultima_modificacion` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `fecha_ultima_modificacion` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `estado` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idevent_reserva_grupo_agencia_link`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Registro links para redireccionar en POSTLOGIN';
