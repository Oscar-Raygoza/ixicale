use clv_products;

SELECT * FROM inv_movimiento_item imi;

# getReporteItems
SELECT
	DISTINCT sst.idservice_servicio_tipo,
	sst.nombre,
	invi.idinv_almacen
FROM
	inv_item invi
INNER JOIN service_servicio ss ON
	invi.idservice_servicio = ss.idservice_servicio
INNER JOIN service_servicio_tipo sst ON
	ss.idservice_servicio_tipo = sst.idservice_servicio_tipo
	AND invi.idinv_almacen = :almacen
	AND invi.idinv_item > 2
ORDER BY
	sst.item_order ASC
;
	
/* idservice_servicio_tipo
42, 149, 154, 151, 25, 152, 169, 49

WHITE COUNTER BAR
*/
# getServicesByType
 SELECT
	DISTINCT ss.descripcion,
	ss.idservice_servicio_tipo,
	ss.idservice_servicio,
	sum(tipo_volumen) AS cantidad,
	invi.estado,
	IF(seriado = 1, 'Serial', 'Manual') AS `type`
FROM
	inv_item invi
INNER JOIN service_servicio ss ON
	invi.idservice_servicio = ss.idservice_servicio
	AND ss.idservice_servicio_tipo IN ( 42, 149, 154, 151, 25, 152, 169, 49 )
WHERE
	invi.idinv_almacen = :almacen
	AND invi.idinv_item > 2
	AND invi.estado < 6
GROUP BY
	ss.idservice_servicio,
	invi.estado
ORDER BY
	ss.idservice_servicio_tipo ASC,
	ss.descripcion ASC 
;



EXPLAIN
SELECT DISTINCT
    ss.descripcion,
    ss.idservice_servicio_tipo,
    ss.idservice_servicio,
    SUM(tipo_volumen) AS cantidad,
    ii.estado,
    IF(seriado = 1, 'Serial', 'Manual') AS `type`,
    iua.descripcion almacen
FROM
    inv_item ii
        INNER JOIN
    service_servicio ss ON ii.idservice_servicio = ss.idservice_servicio
        INNER JOIN
    service_servicio_tipo sst ON ss.idservice_servicio_tipo = sst.idservice_servicio_tipo
        INNER JOIN
    inv_unidad_almacen iua ON iua.idinv_almacen = ii.idinv_almacen
        AND iua.idinv_almacen = :almacen
WHERE
    ii.estado < 6
GROUP BY ss.idservice_servicio , ii.estado
ORDER BY ss.idservice_servicio_tipo ASC , ss.descripcion ASC
;

SELECT
	*
FROM
	inv_unidad_almacen
where
	estado = 1
	and idinv_almacen = :almacen
;


SELECT  count(*)
        FROM  inv_item  invi
        inner join service_servicio ss 
        where invi.idservice_servicio = ss.idservice_servicio
        and invi.idinv_almacen = :almacen and invi.idinv_item > 2
        group by ss.idservice_servicio
;

SELECT 
	ii.idinv_almacen, 
	ii.idservice_servicio 
FROM inv_item ii 
WHERE idinv_almacen = 8 
AND ii.estado < 6
GROUP BY ii.idservice_servicio; 


# ENDS