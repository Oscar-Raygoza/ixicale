use clv_benefits;


-- clv_benefits.bnf_concepto definition

CREATE TABLE `bnf_concepto` (
  `idbnf_concepto` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT ' ' COMMENT 'Nombre concepto',
  `idioma` text CHARACTER SET utf8 NOT NULL COMMENT 'JSON de idiomas a mostrar en propuestas (Multiidiomas)',
  `estado` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Estado. 0 = Inactivo, 1 = Activo, 2 = Cancelado',
  `fecha_creacion` datetime NOT NULL DEFAULT '1000-01-01 00:00:00' COMMENT 'Fecha de Creación',
  `usuario_creacion` varchar(45) CHARACTER SET utf8 NOT NULL DEFAULT ' ',
  `usuario_ultima_modificacion` varchar(45) CHARACTER SET utf8 NOT NULL DEFAULT ' ',
  `fecha_ultima_modificacion` datetime NOT NULL DEFAULT '1000-01-01 00:00:00' COMMENT 'Fecha de la ultima modificación',
  PRIMARY KEY (`idbnf_concepto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


-- clv_benefits.bnf_configuracion_clausula definition

CREATE TABLE `bnf_configuracion_clausula` (
  `idbnf_configuracion_clausula` int(11) NOT NULL AUTO_INCREMENT,
  `idbnf_sub_concepto` int(11) NOT NULL DEFAULT '0',
  `opcional` tinyint(4) DEFAULT '0' COMMENT '0: SIEMPRE se envia\n1: Puede escogerse, indican las clausulas espontaneas',
  `nombre` text NOT NULL COMMENT 'nombre para identificar clausula',
  `texto` text NOT NULL COMMENT 'JSON de idiomas de la clausula',
  `variables` text COMMENT 'lista con los registros de condicion variable, usados en el texto clausula',
  `es_rango` tinyint(4) NOT NULL DEFAULT '0',
  `rangos` text NOT NULL COMMENT 'JSON de rangos []',
  `booking_window_fecha_inicio` date DEFAULT '1000-01-01',
  `booking_window_fecha_fin` date DEFAULT '1000-01-01',
  `travel_window_fecha_inicio` date DEFAULT '1000-01-01',
  `travel_window_fecha_fin` date DEFAULT '1000-01-01',
  `propiedades` text NOT NULL COMMENT 'Array de propiedades\n''["PR1","PR2"]''',
  `idfrm_auth_concepto` int(11) NOT NULL DEFAULT '1' COMMENT '- Primary Key de tabla conceptos en frm para autorizaciones \n- Funciona para filtro de clausulas y enviar tipo de autorizador',
  `tipo_familia` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Tipo de clausula para diferenciar en proposal:\n0 - Común\n1 - Pagos\n2 - Cancelación | Reducción (no visibles)\n',
  `id_referencia_clausula` text COMMENT 'Clausulas de cancelacion y reduccion unicamente para PAGOS.\nObjeto ejemplo con id referenciados:\n  { "can": 0, "red":0 }\nEstructura esperada:\n{\n  "can": idbnf_configuracion_cluasula,\n  "red": idbnf_configuracion_cluasula\n}\n',
  `estado` tinyint(4) NOT NULL,
  `fecha_creacion` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `usuario_creacion` varchar(45) NOT NULL DEFAULT '',
  `usuario_ultima_modificacion` varchar(45) NOT NULL DEFAULT '',
  `fecha_ultima_modificacion` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  PRIMARY KEY (`idbnf_configuracion_clausula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- clv_benefits.bnf_variable_beneficio definition

CREATE TABLE `bnf_variable_beneficio` (
  `idbnf_variable_beneficio` int(11) NOT NULL AUTO_INCREMENT,
  `tag` varchar(45) NOT NULL DEFAULT '' COMMENT 'nombre de referencia\nejemplo: @referencia@',
  `base` text NOT NULL COMMENT 'Resultado por defecto global',
  `idfrm_auth_concepto` int(11) NOT NULL DEFAULT '1' COMMENT 'Primary Key de tabla conceptos en frm para autorizaciones',
  `override_rules` text NOT NULL COMMENT 'JSON de niveles de autorizacion',
  `tipo_dato` int(11) NOT NULL COMMENT 'Tipo de dato para la base o valor de la variable:\n1 = Entero (valores redondeados)\n2 = Texto (string)\n3 = Fecha (string)\n4 = Pagos (tabla - json)\n5 = Double (numero con decimales)\n6 = Cancelacion (tabla - json)\n7 = Reduccion (tabla - json)',
  `tipo_rango` tinyint(5) DEFAULT '0',
  `rangos` text COMMENT 'JSON de rangos',
  `estado` tinyint(5) NOT NULL,
  `fecha_creacion` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `usuario_creacion` varchar(45) NOT NULL DEFAULT '',
  `usuario_ultima_modificacion` varchar(45) NOT NULL DEFAULT '',
  `fecha_ultima_modificacion` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  PRIMARY KEY (`idbnf_variable_beneficio`),
  UNIQUE KEY `tag_UNIQUE` (`tag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- clv_benefits.bnf_condicion_variable definition

CREATE TABLE `bnf_condicion_variable` (
  `idbnf_condicion_variable` int(11) NOT NULL AUTO_INCREMENT,
  `idbnf_configuracion_clausula` int(11) NOT NULL,
  `idbnf_variable_beneficio` int(11) NOT NULL,
  `base` text NOT NULL COMMENT 'Dato para remplazar (rendereo)',
  `tipo_dato` int(11) NOT NULL DEFAULT '1' COMMENT '0 = double,\n1 = int (valores redondeados),\n2 = text,\n3 = fecha,\n4 = json',
  `override_rules` text NOT NULL COMMENT 'Reglas para nivel de autorizacion',
  `es_global` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0= toma datos de la vista\n1= inserto datos de la variable',
  `tag` varchar(45) NOT NULL DEFAULT '',
  `tipo_rango` tinyint(5) NOT NULL DEFAULT '0',
  `rangos` text NOT NULL COMMENT 'JSON de rangos []',
  `estado` tinyint(4) NOT NULL,
  `fecha_creacion` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `usuario_creacion` varchar(45) NOT NULL DEFAULT '',
  `usuario_ultima_modificacion` varchar(45) NOT NULL DEFAULT '',
  `fecha_ultima_modificacion` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  PRIMARY KEY (`idbnf_condicion_variable`),
  KEY `fk_bnf_condicion_variable_bnf_configuracion_clausula1_idx` (`idbnf_configuracion_clausula`),
  KEY `fk_bnf_condicion_variable_bnf_variable_beneficio1_idx` (`idbnf_variable_beneficio`),
  CONSTRAINT `fk_bnf_condicion_variable_bnf_configuracion_clausula1` FOREIGN KEY (`idbnf_configuracion_clausula`) REFERENCES `bnf_configuracion_clausula` (`idbnf_configuracion_clausula`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_bnf_condicion_variable_bnf_variable_beneficio1` FOREIGN KEY (`idbnf_variable_beneficio`) REFERENCES `bnf_variable_beneficio` (`idbnf_variable_beneficio`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- clv_benefits.bnf_sub_concepto definition

CREATE TABLE `bnf_sub_concepto` (
  `idbnf_sub_concepto` int(11) NOT NULL AUTO_INCREMENT,
  `idcontr_categoria_contrato` int(11) NOT NULL DEFAULT '0',
  `idbnf_concepto` int(11) NOT NULL,
  `descripcion` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT ' ' COMMENT 'Nombre sub concepto',
  `idioma` text CHARACTER SET utf8 NOT NULL COMMENT 'JSON de idiomas a mostrar en propuestas (Multiidiomas)',
  `estado` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Estado. 0 = Inactivo, 1 = Activo, 2 = Cancelado',
  `fecha_creacion` datetime NOT NULL DEFAULT '1000-01-01 00:00:00' COMMENT 'Fecha de Creación',
  `usuario_creacion` varchar(45) CHARACTER SET utf8 NOT NULL DEFAULT ' ',
  `usuario_ultima_modificacion` varchar(45) CHARACTER SET utf8 NOT NULL DEFAULT ' ',
  `fecha_ultima_modificacion` datetime NOT NULL DEFAULT '1000-01-01 00:00:00' COMMENT 'Fecha de la ultima modificación',
  PRIMARY KEY (`idbnf_sub_concepto`),
  KEY `fk_bnf_sub_concepto_bnf_concepto1_idx` (`idbnf_concepto`),
  CONSTRAINT `fk_bnf_sub_concepto_bnf_concepto1` FOREIGN KEY (`idbnf_concepto`) REFERENCES `bnf_concepto` (`idbnf_concepto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


-- clv_benefits.bit_valor_varchar definition

CREATE TABLE `bit_valor_varchar` (
  `idbit_valor_varchar` int(11) NOT NULL AUTO_INCREMENT,
  `idbit_entidad_bitacora` int(11) NOT NULL DEFAULT '0',
  `atributo` varchar(60) NOT NULL DEFAULT '' COMMENT 'attt',
  `bit_valor` varchar(256) NOT NULL DEFAULT '',
  `bit_valor_remplazo` varchar(256) NOT NULL DEFAULT '',
  `llave_primaria` varchar(200) NOT NULL DEFAULT '0',
  `usuario_modificacion` varchar(45) NOT NULL DEFAULT '',
  `fecha_modificacion` date NOT NULL DEFAULT '1000-01-01',
  `hora_modificacion` time NOT NULL DEFAULT '01:01:00',
  `pid` int(11) NOT NULL DEFAULT '0',
  `type` varchar(45) NOT NULL DEFAULT 'UPDATE',
  `command` varchar(200) NOT NULL DEFAULT '',
  PRIMARY KEY (`idbit_valor_varchar`),
  KEY `fk_bit_valor_varchar_entidad_idx` (`idbit_entidad_bitacora`),
  KEY `llave_primaria` (`llave_primaria`),
  CONSTRAINT `fk_bit_valor_varchar_entidad` FOREIGN KEY (`idbit_entidad_bitacora`) REFERENCES `bit_entidad_bitacora` (`idbit_entidad_bitacora`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


#
