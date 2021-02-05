USE clv_products;

/*
ALTER TABLE `clv_products`.`service_servicio_tipo` ADD `is_base` TINYINT(2) DEFAULT 0 NOT NULL COMMENT 'Clasificador o bandera para indicar si se considera en los servicios como base o individual
- 0 no es base (servicio individual)
- 1 es base (servicio base/galeria)' AFTER `descripcion`;

ALTER TABLE `clv_products`.`service_unidad_negocio`
ADD COLUMN `modifica_costo_venta` TINYINT(1) NOT NULL DEFAULT 0 COMMENT 'Permite modificar el costo de venta';

ALTER TABLE `clv_products`.`service_servicio`
ADD COLUMN `modifica_costo_venta` TINYINT(1) NOT NULL DEFAULT 0 COMMENT 'Permite modificar el costo de venta';

*/

SELECT
	n.idservice_unidad_negocio,
	t.nombre tipo_servicio,
	t.descripcion desc_tipo,
	s.coleccion,
	s.*
FROM
	clv_products.service_servicio s
INNER JOIN clv_products.service_servicio_tipo t ON
	t.idservice_servicio_tipo = s.idservice_servicio_tipo
INNER JOIN clv_products.service_unidad_negocio n ON
	n.idservice_unidad_negocio = t.idservice_unidad_negocio
	AND n.idservice_unidad_negocio = :idservice_unidad_negocio
	AND n.estado = 1
WHERE
	s.idservice_evento_coleccion = 0
	AND s.coleccion = :coleccion
	
            
            
            
	