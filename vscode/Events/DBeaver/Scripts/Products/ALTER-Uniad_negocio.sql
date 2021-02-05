USE clv_products;

ALTER TABLE clv_products.service_unidad_negocio ADD enable_online TINYINT(1) DEFAULT '0' NOT NULL COMMENT 'Uso en weddings 
0: NO contemplado
1: contemplado' AFTER descripcion;

UPDATE `clv_products`.`service_unidad_negocio` SET `enable_online` = '1' WHERE (`idservice_unidad_negocio` = 2);
UPDATE `clv_products`.`service_unidad_negocio` SET `enable_online` = '1' WHERE (`idservice_unidad_negocio` = 4);
UPDATE `clv_products`.`service_unidad_negocio` SET `enable_online` = '1' WHERE (`idservice_unidad_negocio` = 5);
UPDATE `clv_products`.`service_unidad_negocio` SET `enable_online` = '1' WHERE (`idservice_unidad_negocio` = 12);

SELECT * FROM clv_products.service_unidad_negocio where enable_online = 1;