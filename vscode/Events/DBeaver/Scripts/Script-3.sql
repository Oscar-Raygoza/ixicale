use clv_events;

SELECT * FROM clv_events.event_detalle_extrainfo ede WHERE ede.idevent_detalle=10;
SELECT * FROM clv_events.event_detalle_item edi;

EXPLAIN

SELECT 
	edi.*,
	ede.*
FROM clv_events.event_detalle_item edi
INNER JOIN clv_events.event_detalle_extrainfo ede 
	ON edi.idevent_detalle_item = ede.idevent_detalle 
	AND ede.idevent_detalle_extrainfo!=0 
	AND edi.idevent_detalle_item!=0
WHERE edi.idevent_detalle_item = 10



