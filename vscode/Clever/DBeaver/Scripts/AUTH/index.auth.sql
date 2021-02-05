use clv_auth;
show tables;

SELECT * FROM auth_profile_view WHERE idfrm_sistema = 6;
EXPLAIN SELECT * FROM auth_assignment c WHERE c.user_id = 'ixicale';
DESC auth_assignment;

SELECT * from auth_profile_view where `action` in ('getinvclose', 'getElementById', 'post', 'getReporteInventario') and controller ='Inventario';


SELECT aa.item_name `role`, aa.user_id `user`, pv.`action` `function`, pv.controller from auth_profile_view pv 
INNER JOIN auth_item ai ON ai.name = pv.auth_item 
INNER JOIN auth_assignment aa ON aa.item_name = ai.name AND ai.estado = 1
WHERE pv.`action` = 'callDetailSheetPDF' and pv.controller ='Grupo'


INSERT INTO clv_auth.auth_profile_view (idfrm_sistema,auth_item,modulo,controller,`action`,estado,fecha_creacion,usuario_creacion) VALUES 
(0000000,'__rol__','__modulo__','__controller__','__action__',1,NOW(),'__usuario_creacion__');



# 2020.01.06.1
INSERT INTO clv_auth.auth_profile_view (idfrm_sistema,auth_item,modulo,controller,`action`,estado,fecha_creacion,usuario_creacion) VALUES 
(6,'admin_services','products','Serviciopropiedad','saveServiceResorts',1,NOW(),'ixicale');
# 2020.01.05.1
INSERT INTO clv_auth.auth_profile_view (idfrm_sistema,auth_item,modulo,controller,`action`,estado,fecha_creacion,usuario_creacion) VALUES 
(6,'admin_services','products','Serviciotipo','dropdownFamilyByBussinessUnit',1,NOW(),'ixicale');
# 2020.12.29.2
INSERT INTO clv_auth.auth_profile_view (idfrm_sistema,auth_item,modulo,controller,`action`,estado,fecha_creacion,usuario_creacion) VALUES 
(6,'admin_services','products','Servicio','getServiceByBisUnit',1,NOW(),'ixicale');
# 2020.12.29.1
INSERT INTO clv_auth.auth_profile_view (idfrm_sistema,auth_item,modulo,controller,`action`,estado,fecha_creacion,usuario_creacion) VALUES 
(6,'admin_services','products','Servicio','getComboPackage',1,NOW(),'ixicale');
# 2020.11.20.1
INSERT INTO clv_auth.auth_profile_view (idfrm_sistema,auth_item,modulo,controller,`action`,estado,fecha_creacion,usuario_creacion) VALUES 
(6,'admin_services','products','Reports','getGroupServices',1,NOW(),'ixicale');
# 2020.11.18.1
INSERT INTO clv_auth.auth_profile_view (idfrm_sistema,auth_item,modulo,controller,`action`,estado,fecha_creacion,usuario_creacion) VALUES 
(6,'admin_services','products','Reports','getInvItemByIdService',1,NOW(),'ixicale');
# 2020.11.17.1
INSERT INTO clv_auth.auth_profile_view (idfrm_sistema,auth_item,modulo,controller,`action`,estado,fecha_creacion,usuario_creacion) VALUES 
(6,'admin_services','products','Inventario','getinvclose',1,NOW(),'ixicale');
# 2020.11.17.2
INSERT INTO clv_auth.auth_profile_view (idfrm_sistema,auth_item,modulo,controller,`action`,estado,fecha_creacion,usuario_creacion) VALUES 
(6,'admin_services','products','Inventario','post',1,NOW(),'ixicale');
# 2020.11.17.3
INSERT INTO clv_auth.auth_profile_view (idfrm_sistema,auth_item,modulo,controller,`action`,estado,fecha_creacion,usuario_creacion) VALUES 
(6,'admin_services','products','Inventario','getElementById',1,NOW(),'ixicale');
# 2020.11.17.4
INSERT INTO clv_auth.auth_profile_view (idfrm_sistema,auth_item,modulo,controller,`action`,estado,fecha_creacion,usuario_creacion) VALUES 
(6,'admin_services','products','Inventarioitem','getReporteInventario',1,NOW(),'ixicale');

INSERT INTO clv_auth.auth_profile_view (idfrm_sistema,auth_item,modulo,controller,`action`,estado,fecha_creacion,usuario_creacion) VALUES 
(7,'admin_WeddingWeb','events','Detalleitem','getEventLocationService',1,NOW(),'ixicale');
INSERT INTO clv_auth.auth_profile_view (idfrm_sistema,auth_item,modulo,controller,`action`,estado,fecha_creacion,usuario_creacion) VALUES 
(7,'admin_events','events','Detalleitem','getEventLocationService',1,NOW(),'ixicale');


INSERT INTO clv_auth.auth_profile_view (idfrm_sistema,auth_item,modulo,controller,`action`,estado,fecha_creacion,usuario_creacion) VALUES 
(7,'admin_events','events','EventTraduccionAtributo','getTableLanguagebyMultiKey',1,NOW(),'ixicale');



INSERT INTO clv_auth.auth_profile_view (idfrm_sistema,auth_item,modulo,controller,`action`,estado,fecha_creacion,usuario_creacion) VALUES 
(6,'admin_services','products','Reports','getServices',1,NOW(),'ixicale');
INSERT INTO clv_auth.auth_profile_view (idfrm_sistema,auth_item,modulo,controller,`action`,estado,fecha_creacion,usuario_creacion) VALUES 
(6,'admin_services','products','Reports','getPDFServices',1,NOW(),'ixicale');

#
#
# ENDS