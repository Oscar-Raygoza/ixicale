use clv_products;

ALTER TABLE clv_products.service_servicio ADD is_gallery TINYINT(1) DEFAULT 0 NOT NULL COMMENT 'Define si es coleccion o si es para vista ''galeria''' AFTER coleccion;
ALTER TABLE clv_products.service_servicio ADD classifier TINYINT(3) DEFAULT 0 NOT NULL COMMENT 'Define el tipo de servicio. Opciones:
  - 1 => Interno
  - 2 => Externo
  - 3 => Combo' AFTER is_gallery;


UPDATE clv_products.service_servicio SET is_gallery = 1, classifier = 1 WHERE coleccion = 2;
UPDATE clv_products.service_servicio SET is_gallery = 1, classifier = 3 WHERE coleccion = 3;




-- ends