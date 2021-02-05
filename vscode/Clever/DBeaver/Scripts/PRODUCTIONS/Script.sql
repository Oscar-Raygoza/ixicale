use clv_productions;

SHOW TABLES;

SELECT * FROM prod_montaje;

SELECT
	*
FROM
	prod_montaje_fase pmf
INNER JOIN prod_montaje pm ON
	pm.idprod_montaje = pmf.idprod_montaje
	AND pmf.estado > 0
	AND pm.estado = 1
	AND pm.almacen = :almacen
	AND pmf.almacen = :almacen
	AND pmf.idprod_montaje_fase = :folio
;


SELECT
	pmf.idprod_montaje AS idprod_montaje,
	pmf.estado,
	pmo.idprod_montaje_orden,
	pmf.idprod_montaje_fase,
	pmf.estado_montaje,
	DATE_FORMAT(pmf.hora_inicio, '%d/%m/%Y %H:%i:%s') AS horainicio,
	DATE_FORMAT(pmf.hora_fin, '%d/%m/%Y %H:%i:%s') AS horafin
FROM
	prod_montaje pm
JOIN prod_montaje_fase pmf ON
	pm.idprod_montaje = pmf.idprod_montaje
LEFT JOIN prod_montaje_orden pmo ON
	pmf.idprod_montaje_fase = pmo.idprod_montaje_fase
WHERE
	idevent_grupo = :idgrupo
	AND idevent_locacion = :idlocacion
	AND pm.estado = 1
	AND pmf.estado > 0 
;



# ENDS