CREATE TABLE IF NOT EXISTS clv_events.`event_cubo_descripcion_corte` (
  `id_event_descripcion_corte` INT NOT NULL AUTO_INCREMENT,
  `descripcion` TEXT NOT NULL COMMENT 'JSON\n{\n	\'1\':\'Presupuesto de ixicale\',\n	\'2\':\'Ventas de mlira\'\n}',
  `estado` TINYINT(1) NOT NULL,
  `usuario_creacion` VARCHAR(20) NOT NULL,
  `fecha_creacion` DATETIME NOT NULL,
  `usuario_ultima_modificacion` VARCHAR(20) NULL,
  `fecha_ultima_modificacion` DATETIME NULL,
  `wording` TEXT NULL COMMENT 'JSON\n{\n	\'1\':\'Welcome\',\n	\'2\':\'Hola\'\n}',
  `origen` TEXT NOT NULL COMMENT 'JSON\n{\n	\'id.propiedad\':\'LBC\',\n	\'market_code:\'LATAM\'.\n	\'pivote\':\'mlira\'\n	\'pivote_acumulador\':\'monto\'\n	\'tipo_pivote\':\'Numero\'\n}',
  `api` TEXT NOT NULL COMMENT 'JSON\n{\n	\'sistema\':\'/endpoint\'\n}',
  PRIMARY KEY (`id_event_descripcion_corte`))



CREATE TABLE IF NOT EXISTS `clv_events`.`event_cubo_corte` (
  `id_event_corte` INT NOT NULL AUTO_INCREMENT,
  `fecha_filtro_inicio` DATE NOT NULL,
  `fecha_filtro_fin` DATE NOT NULL,
  `hora_inicio` TIME(0) NULL,
  `hora_fin` TIME(0) NULL,
  `id_event_descripcion_corte` INT NOT NULL,
  `valor` DECIMAL(18,2) NOT NULL,
  `historial` TEXT NOT NULL COMMENT 'Tipo JSON\n{\n	\'vaor\': \'10000\'\n}',
  `clasificador` TEXT NOT NULL COMMENT 'JSON\n{\n	\'Tipo\':\'USD\',	\n}',
  `estado` TINYINT(1) NOT NULL,
  `usuario_creacion` VARCHAR(20) NOT NULL,
  `fecha_creacion` DATETIME NOT NULL,
  `usuario_ultima_modificacion` VARCHAR(20) NULL,
  `fecha_ultima_modificacion` DATETIME NULL,
  PRIMARY KEY (`id_event_corte`),
  INDEX `id_event_corte` (`id_event_descripcion_corte` ASC))