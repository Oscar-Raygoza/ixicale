USE clv_events;
SELECT
	idevent_reserva_grupo_agencia_link,
	idevent_grupo,
	idclv_propiedad,
	origen,
	idclv_sistema,
	descripcion,
	tipo_link,
	link,
	usuario_validacion,
	fecha_validacion,
	usuario_creacion,
	fecha_creacion,
	usuario_ultima_modificacion,
	fecha_ultima_modificacion,
	estado
FROM
	clv_events.event_reserva_grupo_agencia_link rgal
WHERE
	rgal.idevent_grupo = 10
	AND rgal.estado > 0
ORDER BY rgal.fecha_creacion DESC
;


INSERT INTO clv_events.event_reserva_grupo_agencia_link (idevent_grupo,idclv_propiedad,origen,idclv_sistema,descripcion,tipo_link,link,usuario_validacion,fecha_validacion,usuario_creacion,fecha_creacion,usuario_ultima_modificacion,fecha_ultima_modificacion,estado) VALUES 
(10,'ZHMI',3,NULL,'Link de reservas de pruebas ',1,'https://www3.palaceresorts.com/NET/Formularios/Nd/Groups_nd.aspx?gc=wdrusrasa&sb=BODA&ag=wdrusrasa','ixicale',NOW(),'ixicale',NOW(),'','1000-01-01 00:00:00',1)
;


