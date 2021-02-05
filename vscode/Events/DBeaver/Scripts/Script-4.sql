use clv_events;
ALTER TABLE clv_events.event_reserva_grupo_agencia ADD aprobado TINYINT(1) DEFAULT 0 NOT NULL COMMENT 'validacion de aprobacion de noches y cuartos
0: No aprobado
1: Aprobado'AFTER id_agencia;
