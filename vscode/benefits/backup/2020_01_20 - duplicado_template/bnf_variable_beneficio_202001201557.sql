INSERT INTO clv_benefits.bnf_variable_beneficio (tag,base,override_rules,tipo_dato,tipo_rango,rangos,estado,fecha_creacion,usuario_creacion,usuario_ultima_modificacion,fecha_ultima_modificacion) VALUES 
('@COMPS@','{"10-149":"50","150-499":"50","500-10000":"50"}','{"10-149":[{"auth_id":0,"min":"50","max":"25","level":0},{"auth_id":0,"min":"20","max":"24","level":1},{"auth_id":0,"min":"19","max":"1","level":2}],"150-499":[{"auth_id":0,"min":"50","max":"25","level":0},{"auth_id":0,"min":"24","max":"20","level":1},{"auth_id":0,"min":"19","max":"1","level":2}],"500-10000":[{"auth_id":0,"min":"100","max":"50","level":0},{"auth_id":0,"min":"49","max":"45","level":1},{"auth_id":0,"min":"44","max":"1","level":2}]}',1,1,'[{"selecto":true,"inicio":10,"fin":149},{"selecto":false,"inicio":150,"fin":499},{"selecto":false,"inicio":500,"fin":10000}]',1,'2019-10-24 22:43:32','jugomez','marrosas','2019-11-19 22:09:12')
,('@%COMMISSION@','{"0-0":"10"}','{"0-0":[{"auth_id":0,"min":"10","max":"12","level":0},{"auth_id":0,"min":"13","max":"15","level":1},{"auth_id":0,"min":"16","max":"20","level":2}]}',1,0,'[{"selecto":true,"inicio":0,"fin":0}]',1,'2019-10-24 23:25:04','jugomez','','2019-10-24 23:25:04')
,('@MAXCOMPS@','{"10-149":"1","150-499":"1","500-10000":"10"}','{"10-149":[{"auth_id":0,"min":"1","max":"6","level":0},{"auth_id":0,"min":"7","max":"10","level":1},{"auth_id":0,"min":"11","max":"20","level":2}],"150-499":[{"auth_id":0,"min":"1","max":"10","level":0},{"auth_id":0,"min":"11","max":"15","level":1},{"auth_id":0,"min":"16","max":"20","level":2}],"500-10000":[{"auth_id":0,"min":"1","max":"10","level":0},{"auth_id":0,"min":"11","max":"15","level":1},{"auth_id":0,"min":"16","max":"20","level":2}]}',1,1,'[{"selecto":false,"inicio":10,"fin":149},{"selecto":false,"inicio":150,"fin":499},{"selecto":true,"inicio":500,"fin":10000}]',1,'2019-10-24 23:31:32','jugomez','','2019-10-24 23:31:32')
,('@GOLF%@','{"10-149":"40","150-499":"40","500-10000":"40"}','{"10-149":[{"auth_id":0,"min":"40","max":"50","level":0},{"auth_id":0,"min":"51","max":"55","level":1},{"auth_id":0,"min":"56","max":"100","level":2}],"150-499":[{"auth_id":0,"min":"40","max":"50","level":0},{"auth_id":0,"min":"51","max":"55","level":1},{"auth_id":0,"min":"56","max":"100","level":2}],"500-10000":[{"auth_id":0,"min":"40","max":"50","level":0},{"auth_id":0,"min":"51","max":"55","level":1},{"auth_id":0,"min":"56","max":"100","level":2}]}',1,1,'[{"selecto":false,"inicio":10,"fin":149},{"selecto":false,"inicio":150,"fin":499},{"selecto":true,"inicio":500,"fin":10000}]',1,'2019-10-26 16:06:31','jugomez','','2019-10-26 16:06:31')
,('@SPA%@','{"10-149":"10","150-499":"10","500-10000":"10"}','{"10-149":[{"auth_id":0,"min":"10","max":"15","level":0}],"150-499":[{"auth_id":0,"min":"15","max":"20","level":1},{"auth_id":0,"min":"21","max":"100","level":2},{"auth_id":0,"min":"10","max":"15","level":0}],"500-10000":[{"auth_id":0,"min":"10","max":"15","level":0},{"auth_id":0,"min":"16","max":"20","level":1},{"auth_id":0,"min":"21","max":"100","level":2}]}',1,1,'[{"selecto":false,"inicio":10,"fin":149},{"selecto":false,"inicio":150,"fin":499},{"selecto":true,"inicio":500,"fin":10000}]',1,'2019-10-26 16:33:38','jugomez','','2019-10-26 16:33:38')
,('@MASTERACCOUNT%@','{"10-149":"3","150-499":"3","500-10000":"3"}','{"10-149":[{"auth_id":0,"min":"3","max":"5","level":0},{"auth_id":0,"min":"6","max":"8","level":1},{"auth_id":0,"min":"9","max":"15","level":2}],"150-499":[{"auth_id":0,"min":"3","max":"5","level":0},{"auth_id":0,"min":"6","max":"8","level":1},{"auth_id":0,"min":"9","max":"15","level":2}],"500-10000":[{"auth_id":0,"min":"3","max":"5","level":0},{"auth_id":0,"min":"6","max":"8","level":1},{"auth_id":0,"min":"9","max":"15","level":2}]}',1,1,'[{"selecto":true,"inicio":10,"fin":149},{"selecto":false,"inicio":150,"fin":499},{"selecto":false,"inicio":500,"fin":10000}]',1,'2019-10-26 16:45:46','jugomez','jugomez','2019-10-26 17:01:42')
,('@VIPSTATUS@','{"150-499":"8","500-10000":"10"}','{"150-499":[{"auth_id":0,"min":"1","max":"8","level":0},{"auth_id":0,"min":"9","max":"10","level":1},{"auth_id":0,"min":"11","max":"20","level":2}],"500-10000":[{"auth_id":0,"min":"1","max":"10","level":0},{"auth_id":0,"min":"11","max":"12","level":1},{"auth_id":0,"min":"13","max":"20","level":2}]}',1,1,'[{"selecto":true,"inicio":150,"fin":499},{"selecto":false,"inicio":500,"fin":10000}]',1,'2019-10-26 17:40:51','jugomez','jugomez','2019-10-26 17:54:39')
,('@OPTIONAL@','{"0-0":"__"}','{"0-0":[{"auth_id":"0","max":"","min":"","level":"1"}]}',2,0,'[{"selecto":true,"inicio":0,"fin":0}]',1,'2019-10-26 17:55:01','jugomez','','2019-10-26 17:55:01')
,('@%COMISIONMX@','{"0-0":"1"}','{"0-0":[{"auth_id":0,"min":"1","max":"15","level":0}]}',1,0,'[{"selecto":true,"inicio":0,"fin":0}]',1,'2019-11-12 01:13:40','marrosas','','2019-11-12 01:13:40')
,('@MESEROS@','{"0-0":"1"}','{"0-0":[{"auth_id":0,"min":"01","max":"5","level":0},{"auth_id":0,"min":"6","max":"9","level":1},{"auth_id":0,"min":"11","max":"20","level":2}]}',1,0,'[{"selecto":true,"inicio":0,"fin":0}]',1,'2019-11-12 01:24:13','marrosas','marrosas','2019-11-12 01:24:56')
;
INSERT INTO clv_benefits.bnf_variable_beneficio (tag,base,override_rules,tipo_dato,tipo_rango,rangos,estado,fecha_creacion,usuario_creacion,usuario_ultima_modificacion,fecha_ultima_modificacion) VALUES 
('@PROMOTION@','{"10-20":"1","21-25":"1","26-30":"1"}','{"10-20":[{"auth_id":0,"min":"10","max":"20","level":0},{"auth_id":0,"min":"21","max":"25","level":1},{"auth_id":0,"min":"26","max":"30","level":2}],"21-25":[{"auth_id":0,"min":"10","max":"20","level":0},{"auth_id":0,"min":"21","max":"25","level":1},{"auth_id":0,"min":"26","max":"30","level":2}],"26-30":[{"auth_id":0,"min":"10","max":"20","level":2},{"auth_id":0,"min":"10","max":"20","level":0},{"auth_id":0,"min":"21","max":"25","level":1}]}',1,2,'[{"selecto":false,"inicio":10,"fin":20},{"selecto":false,"inicio":21,"fin":25},{"selecto":true,"inicio":26,"fin":30}]',1,'2019-11-19 15:31:41','marrosas','','2019-11-19 15:31:41')
;