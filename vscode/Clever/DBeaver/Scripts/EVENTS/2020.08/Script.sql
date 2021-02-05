USE clv_events;

SELECT
	ede.idevent_detalle_extrainfo `pk_e`,
	ede.extra_informacion `contenido`,
	ede.fecha_creacion `e_fc`,
	ede.usuario_creacion `e_uc`,
	edi.usuario_creacion,
	edi.fecha_creacion,
	edi.*,
	ede.*
FROM
	clv_events.event_detalle_item edi
INNER JOIN clv_events.event_detalle_extrainfo ede ON
	edi.idevent_detalle_item = ede.idevent_detalle
	AND ede.idevent_detalle_extrainfo != 0
	AND edi.idevent_detalle_item != 0
WHERE
	edi.idevent_detalle_item = :idevent_detalle_item
ORDER BY
	`e_fc` ASC
;



