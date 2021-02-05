use clv_products;

SELECT
	*
FROM
	clv_products.service_servicio_propiedad sp
WHERE
	sp.idservice_servicio = 1309
	AND sp.idpropiedad IN ('ZHSP', 'ZMGR', 'ZMNI', 'ZMSU', 'ZHBP', 'ZHIM', 'ZHLB', 'ZHLB', 'ZRPL', 'ZRCZ', 'ZCJG', 'ZPLB', 'ZCJG', 'ZHSP', 'ZCJG','ZPLB', 'ZCMPPC')
;

















-- file ends