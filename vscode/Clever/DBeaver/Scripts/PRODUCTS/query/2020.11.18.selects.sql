USE clv_products;


SELECT
	ii.SKU_serie,
	ii.tipo_volumen `cantidad`,
	iua.descripcion `familia`,
	iua.idinv_almacen,
	iua.descripcion `almacen`,
	sun.idservice_unidad_negocio,
	sun.descripcion `negocio`,
	COUNT(imi.idinv_item) `process`,
	imi.idinv_movimiento_item,
	imi.estado,
	ii.idinv_item,
	ii.idservice_servicio,
	ss.descripcion,
	ii.serie,
	ii.estado,
	ii.picking,
	ii.seriado,
	IF(ii.seriado = 1, 'Serial', 'Manual') `tipo`,
	ma.idinv_marca,
	ma.descripcion `marca`,
	ma.estado `marca_estado`,
	mo.idinv_modelo,
	mo.descripcion `modelo`,
	mo.estado `modelo_estado`
FROM
	inv_item ii
INNER JOIN inv_marca ma ON
	ma.idinv_marca = ii.idinv_marca
	AND ma.estado = 1
INNER JOIN inv_modelo mo ON
	mo.idinv_modelo = ii.idinv_modelo
	AND mo.estado = 1
INNER JOIN service_servicio ss ON
	ss.idservice_servicio = ii.idservice_servicio
	AND ss.idservice_servicio = :idServicio
INNER JOIN service_servicio_tipo sst ON 
	sst.idservice_servicio_tipo = ss.idservice_servicio_tipo
INNER JOIN inv_unidad_almacen iua ON 
	iua.idinv_almacen = ii.idinv_almacen
INNER JOIN service_unidad_negocio sun ON 
	sun.idservice_unidad_negocio = iua.idservice_unidad_negocio
LEFT JOIN inv_movimiento_item imi ON
	imi.idinv_item = ii.idinv_item
	AND imi.cantidad_item != imi.cantidad_item_regresada
	AND imi.movimiento_extra = 0
	AND imi.estado IN (1,3,4,5)
GROUP BY
	ii.idinv_item
;


# idservice_servicio, descripcion, SKU_serie, serie, estado, picking, tipo, idinv_marca, marca, marca_estado, idinv_modelo, modelo, modelo_estado



SELECT
	imi.cantidad_item,
	imi.cantidad_item_regresada,
	imi.inv_tipo_movimiento_item,
	imi.*
FROM
	inv_movimiento_item imi
where
	imi.cantidad_item != imi.cantidad_item_regresada
	AND imi.idservice_servicio = 5146
	AND imi.inv_tipo_movimiento_item IN (1,3,4,5)
;

SELECT 
    ss.idservice_servicio,
    inv.idinv_item,
    IFNULL(GROUP_CONCAT(imi.idinv_movimiento_item), 0) AS ids,
    COUNT(imi.idinv_movimiento_item) AS procesos,
    sun.nombre AS negocio,
    sst.nombre AS familia,
    inv.seriado,
    IF(inv.seriado = 0, 'descripcion', 'serial') AS 'tipoingreso',
    iua.descripcion AS almacen,
    iua.idinv_almacen,
    tipo_volumen AS cantidad,
    SUM(tipo_volumen) AS volumenreal,
    (COUNT(*) - 1) AS poragregar,
    IF(inv.tag = '', 0, 0) AS tag,
    IF(inv.picking = '', 'N/A', inv.picking) AS picking,
    ss.descripcion AS servicio,
    inv.SKU_serie,
    inv.serie,
    IF(inv.picking = '', 'N/A', inv.picking) AS ubicacion,
    im.idinv_marca,
    im.descripcion AS marca,
    imo.idinv_modelo,
    imo.descripcion AS modelo,
    inv.estado
FROM
    inv_item inv
        INNER JOIN
    inv_unidad_almacen iua ON iua.idinv_almacen = inv.idinv_almacen
        INNER JOIN
    service_servicio ss ON ss.idservice_servicio = inv.idservice_servicio
        INNER JOIN
    service_servicio_tipo sst ON sst.idservice_servicio_tipo = ss.idservice_servicio_tipo
        INNER JOIN
    service_unidad_negocio sun ON sun.idservice_unidad_negocio = sst.idservice_unidad_negocio
        LEFT JOIN
    inv_marca im ON im.idinv_marca = inv.idinv_marca
        LEFT JOIN
    inv_modelo imo ON imo.idinv_modelo = inv.idinv_modelo
        LEFT JOIN
    (SELECT 
        *
    FROM
        inv_movimiento_item inmovi
    WHERE
        CASE
            WHEN
                inmovi.tipoingreso = 1
            THEN
                inmovi.cantidad_item_regresada = 0
                    AND inmovi.inv_tipo_movimiento_item IN (1 , 3, 4, 5)
            WHEN
                inmovi.tipoingreso = 0
            THEN
                CASE
                    WHEN
                        inmovi.inv_tipo_movimiento_item = 1
                    THEN
                        inmovi.hora_entrada = '1000-01-01 00:00:00'
                            AND estado = 1
                    WHEN inmovi.inv_tipo_movimiento_item IN (3 , 4, 5) THEN inmovi.hora_entrada = '1000-01-01 00:00:00'
                END
        END) AS imi ON imi.idinv_item = inv.idinv_item
WHERE
    sun.idservice_unidad_negocio = 5
    AND inv.idinv_almacen = 8
    AND sst.idservice_servicio_tipo = 25
    AND IF(inv.seriado = 0, (inv.estado > 0 && inv.estado != 6), inv.estado)
    AND IF(0 != '0', inv.idservice_servicio = 0, TRUE)
    AND IF(7 != '7', inv.estado = 7, TRUE)
GROUP BY (CASE
    WHEN inv.seriado = 0 THEN CONCAT(inv.idservice_servicio, inv.idinv_marca, inv.idinv_modelo)
    WHEN inv.seriado = 1 THEN CONCAT(inv.idservice_servicio, inv.idinv_item)
END)
ORDER BY procesos DESC;




# end line