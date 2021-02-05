-- Select para buscar todos los registros de la misma variable
SELECT 
	cv.idbnf_condicion_variable, 
	cv.idbnf_configuracion_clausula, 
	cv.idbnf_variable_beneficio,
	cv.es_global, 
	cv.tag,
	cv.base,
	cv.estado,
	cv.usuario_ultima_modificacion, 
	cv.fecha_ultima_modificacion
FROM clv_benefits.bnf_condicion_variable cv
WHERE cv.idbnf_variable_beneficio = 23
;

SELECT * from bnf_configuracion_clausula where idbnf_configuracion_clausula in (
	SELECT 
		cv.idbnf_configuracion_clausula
	FROM clv_benefits.bnf_condicion_variable cv
	WHERE cv.idbnf_variable_beneficio = 23
)
