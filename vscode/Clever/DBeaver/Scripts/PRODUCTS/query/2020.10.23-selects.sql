use `clv_products`;

DESC

SELECT
	un.idservice_unidad_negocio,
	st.idservice_servicio_tipo,
	st.item_order,
	st.idservice_servicio_tipo,
	un.idservice_unidad_negocio,
	st.nombre,
	st.descripcion,
	st.`path`,
	st.*,
	un.*
FROM
	`clv_products`.`service_unidad_negocio` un
INNER JOIN `clv_products`.`service_servicio_tipo` st ON
	st.`idservice_unidad_negocio` = un.`idservice_unidad_negocio`
	AND un.idservice_unidad_negocio > 0
	AND st.idservice_servicio_tipo > 0
WHERE
	un.`idservice_unidad_negocio` = :idbusinessunit
	AND un.estado > 0
	AND st.estado > 0
;

	
# ENDS	