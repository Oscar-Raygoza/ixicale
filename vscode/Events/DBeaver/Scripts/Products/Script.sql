USE clv_products;

SELECT 
	sun.nombre as unidad_negocio, 
	ss.idservice_servicio as id_servicio, 
	ssa.idservice_servicio_asset as id_image, 
	ss.codigo_produccion,  
	sst.descripcion as family, 
	ss.descripcion as service, 
	ss.codigo_produccion,
	concat('<img src="', ssa.`path`, '" width="150"/>') `img_principal`, concat('<img src="', ssa.thumb, '" width="150"/>') `image_mini`, 
	ss.estado estado_servicio, 
	ss.usuario_creacion, 
	ss.fecha_creacion,
	concat('https://s3.amazonaws.com/webfiles_palace/clever/products/assets/', LOWER(ss.codigo_produccion),'.PNG')`_PNG`,
	concat('https://s3.amazonaws.com/webfiles_palace/clever/products/assets/', LOWER(ss.codigo_produccion),'.png')`_png`,
	concat('https://s3.amazonaws.com/webfiles_palace/clever/products/assets/', LOWER(ss.codigo_produccion),'.JPG')`_JPG`,
	concat('https://s3.amazonaws.com/webfiles_palace/clever/products/assets/', LOWER(ss.codigo_produccion),'.jpg')`_jpg`
FROM service_servicio_asset ssa
RIGHT JOIN service_servicio ss ON ssa.idservice_servicio = ss.idservice_servicio
INNER JOIN service_servicio_tipo sst ON ss.idservice_servicio_tipo = sst.idservice_servicio_tipo
INNER JOIN service_unidad_negocio sun ON sst.idservice_unidad_negocio = sun.idservice_unidad_negocio
WHERE ss.estado  = 1 
and sst.idservice_unidad_negocio  in (2) 
and ss.usuario_creacion  <> 'joaponce' 
and ss.fecha_creacion <> '2020-01-01 00:00:00' 
AND ss.codigo_produccion  <> '0' 
AND ss.codigo_produccion <> 'COM-001' 
AND ss.codigo_produccion  <> 'DONUT WALL'
AND ssa.path is null
ORDER BY `unidad_negocio` , `family`, `service`, `id_servicio` ASC;
;


SELECT sun.nombre as unidad_negocio, ss.idservice_servicio as id_servicio, ssa.idservice_servicio_asset as id_image, ss.codigo_produccion,  sst.descripcion as family, ss.descripcion as service, ss.codigo_produccion,
       concat('<img src="', ssa.`path`, '" width="150"/>') `img_principal`, concat('<img src="', ssa.thumb, '" width="150"/>') `image_mini`, ss.estado estado_servicio, ss.usuario_creacion , ss.fecha_creacion
FROM service_servicio_asset ssa
RIGHT JOIN service_servicio ss ON ssa.idservice_servicio = ss.idservice_servicio
INNER JOIN service_servicio_tipo sst ON ss.idservice_servicio_tipo = sst.idservice_servicio_tipo
INNER JOIN service_unidad_negocio sun ON sst.idservice_unidad_negocio = sun.idservice_unidad_negocio
WHERE ss.estado  = 1 
and sst.idservice_unidad_negocio  in (2) 
and ss.usuario_creacion  <> 'joaponce' 
and ss.fecha_creacion > '2020-01-01 00:00:00' 
and ss.codigo_produccion  <> '0' 
and ss.codigo_produccion <> 'COM-001' 
and ss.codigo_produccion  <> 'DONUT WALL'
and ssa.`path` is null
ORDER BY `unidad_negocio` , `family`, `service`, `id_servicio` ASC;


/*
 * codigo produccion (un '_' por espacio)
 * coparar nombre servicio
 * 
 * 		si -> insert para assets
 * INSERT INTO `clv_products`.`service_servicio_asset` (`idservice_servicio`, `idcliente`, `path`, `externo`, `thumb`, `estado`, `usuario_creacion`, `fecha_creacion`, `usuario_ultima_modificacion`, `fecha_ultima_modificacion`) VALUES (id_servicio, '1', 'https://s3.amazonaws.com/webfiles_palace/clever/products/assets/codigo_produccion_minusculas.(jpg/png)', '1', 'https://s3.amazonaws.com/webfiles_palace/clever/products/assets/codigo_produccion_minusculas_thumb.(jpg/png)', '1', 'tu_usuario', '2020-06-04 00:00:00', 'tu_usuario', '2020-06-04 00:00:00');
 * 		
 * */


SELECT sun.nombre as unidad_negocio, ss.idservice_servicio as id_servicio, ssa.idservice_servicio_asset as id_image, ss.codigo_produccion,  sst.descripcion as family, ss.descripcion as service, ss.codigo_produccion,
       concat('<img src="', ssa.`path`, '" width="150"/>') `img_principal`, concat('<img src="', ssa.thumb, '" width="150"/>') `image_mini`, ss.estado estado_servicio, ss.usuario_creacion , ss.fecha_creacion
FROM service_servicio_asset ssa
RIGHT JOIN service_servicio ss ON ssa.idservice_servicio = ss.idservice_servicio
INNER JOIN service_servicio_tipo sst ON ss.idservice_servicio_tipo = sst.idservice_servicio_tipo
INNER JOIN service_unidad_negocio sun ON sst.idservice_unidad_negocio = sun.idservice_unidad_negocio
WHERE ss.estado  = 1 and sst.idservice_unidad_negocio  in (2,5) and ss.usuario_creacion  <> 'joaponce' and
      ss.fecha_creacion <> '2020-01-21 00:00:00 ' and ss.codigo_produccion  <> '0' and ss.codigo_produccion <> 'COM-001' and ss.codigo_produccion  <> 'DONUT WALL'
      and ssa.path is null
ORDER BY `unidad_negocio` , `family`, `service`, `id_servicio` ASC;



