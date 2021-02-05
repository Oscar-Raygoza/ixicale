INSERT INTO clv_auth.auth_item (name,`type`,description,rule_name,`data`,created_at,updated_at,estado,fecha_creacion,usuario_creacion,fecha_ultima_modificacion,usuario_ultima_modificacion) VALUES 
('auth_query_names',1,'Acceso a informacion dashboard','','',0,0,1,NOW(),'ixicale','1000-01-01 00:00:00','')
;

INSERT INTO clv_auth.auth_profile_view (idfrm_sistema,auth_item,modulo,controller,`action`,estado,fecha_creacion,usuario_creacion,usuario_ultima_modificacion,fecha_ultima_modificacion) VALUES 
(3,'auth_query_names','auth','Usuario','getUserEmails',1,NOW(),'ixicale','','1000-01-01 00:00:00')
;


INSERT INTO clv_auth.auth_assignment (item_name,user_id,created_at,estado,fecha_creacion,usuario_creacion,fecha_ultima_modificacion,usuario_ultima_modificacion) VALUES 
('auth_query_names','ersanchez',0,1,NOW(),'ixicale','1000-01-01 00:00:00','')
,('auth_query_names','ixicale',0,1,NOW(),'ixicale','1000-01-01 00:00:00','')
;

INSERT INTO clv_auth.auth_assignment (item_name,user_id,created_at,estado,fecha_creacion,usuario_creacion,fecha_ultima_modificacion,usuario_ultima_modificacion) VALUES 
('gerente_planner_productions','ixicale',0,1,NOW(),'ixicale','1000-01-01 00:00:00','')
;

INSERT INTO clv_auth.auth_profile_view (idfrm_sistema,auth_item,modulo,controller,`action`,estado,fecha_creacion,usuario_creacion,usuario_ultima_modificacion,fecha_ultima_modificacion) VALUES 
(6,'gerente_planner_productions','products','Unidadnegocio','search',1,NOW(),'ixicale','','1000-01-01 00:00:00')
;