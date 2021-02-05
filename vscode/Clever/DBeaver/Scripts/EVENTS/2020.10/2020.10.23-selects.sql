use clv_events;

SELECT
	*
FROM
	`clv_events`.`event_traduccion_atributo` eta
WHERE
	LOWER(nombre_tabla) LIKE LOWER(:table)	
	AND eta.id_idioma = :language
	AND eta.llave_registro IN ( :ids )
	AND eta.idevent_traduccion_atributo > 0
	AND eta.estado = 1
;



#ENDS