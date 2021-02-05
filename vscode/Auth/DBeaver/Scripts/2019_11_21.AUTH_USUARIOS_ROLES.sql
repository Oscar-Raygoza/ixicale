-- Script Generado por ixicale; 
-- 2019_11_21 10:00:00
-- ixicale@palaceresorts.com

-- Creacion de usuarios [davazquez & javivaldez] (Sin No. Colaborador)

INSERT INTO clv_auth.frm_usuario (username,username_sistema_externo,no_colaborador,name,idfrm_tipo_usuario,password,auth_key,access_token,tittle,email,tipo_autenticacion,interno,id_empresa,bloqueado,logged_in_ip,`session`,estado,numero_accesos_erroneos,fecha_ultimo_acceso_erroneo,fecha_creacion,usuario_creacion,usuario_ultima_modificacion,fecha_ultima_modificacion) VALUES ('davazquez','davazquez','','Daniel Vazquez Rodriguez',1,'','','','admin','davazquez@palaceresorts.com',1,1,0,0,'0',0,'1',0,'1000-01-01 00:00:00','2019-11-21 14:50:00','ixicale','','1000-01-01 00:00:00');
INSERT INTO clv_auth.frm_usuario (username,username_sistema_externo,no_colaborador,name,idfrm_tipo_usuario,password,auth_key,access_token,tittle,email,tipo_autenticacion,interno,id_empresa,bloqueado,logged_in_ip,`session`,estado,numero_accesos_erroneos,fecha_ultimo_acceso_erroneo,fecha_creacion,usuario_creacion,usuario_ultima_modificacion,fecha_ultima_modificacion) VALUES ('javivaldez','javivaldez','','Javier Oswaldo Valdez Delgado',1,'','','','admin','javivaldez@palaceresorts.com',1,1,0,0,'0',0,'1',0,'1000-01-01 00:00:00','2019-11-21 14:50:00','ixicale','','1000-01-01 00:00:00');

-- Asignacion de rol BENEFITS a los usuarios [davazquez & javivaldez]
INSERT INTO clv_auth.auth_assignment (item_name,user_id,created_at,estado,fecha_creacion,usuario_creacion,fecha_ultima_modificacion,usuario_ultima_modificacion) VALUES ('admin_benefit','javivaldez',0,1,NOW(),'ixicale','1000-01-01 00:00:00','');
INSERT INTO clv_auth.auth_assignment (item_name,user_id,created_at,estado,fecha_creacion,usuario_creacion,fecha_ultima_modificacion,usuario_ultima_modificacion) VALUES ('admin_benefit','davazquez',0,1,NOW(),'ixicale','1000-01-01 00:00:00','');
