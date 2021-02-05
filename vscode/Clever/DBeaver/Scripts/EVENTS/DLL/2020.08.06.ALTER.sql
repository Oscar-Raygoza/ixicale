USE clv_events;
ALTER TABLE clv_events.event_reserva_grupo_agencia ADD apellido_titular_reserva varchar(120) DEFAULT '' NOT NULL AFTER nombre_titular_reserva;