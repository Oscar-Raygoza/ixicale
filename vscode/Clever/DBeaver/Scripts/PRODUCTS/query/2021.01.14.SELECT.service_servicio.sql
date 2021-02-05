use clv_products;

SELECT * FROM clv_products.service_servicio ss WHERE ss.idservice_evento_coleccion = 5825;

SELECT
	ss.idservice_evento_coleccion,
	ss.idservice_servicio_principal,
	ss.*
FROM
	clv_products.service_servicio ss;
    
   
   