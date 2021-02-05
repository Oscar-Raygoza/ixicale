-- subconcepto
SELECT x.idbnf_sub_concepto, x.usuario_creacion, x.fecha_creacion, x.* FROM clv_benefits.bnf_sub_concepto x
WHERE idcontr_categoria_contrato = 95 AND idbnf_sub_concepto not in (2)
;

-- clausulas
SELECT bcc.idbnf_configuracion_clausula, bcc.usuario_creacion, bcc.fecha_creacion, bcc.idbnf_sub_concepto, bcc.* FROM clv_benefits.bnf_configuracion_clausula bcc
WHERE idbnf_sub_concepto = (
	SELECT x.idbnf_sub_concepto FROM clv_benefits.bnf_sub_concepto x WHERE 
	usuario_creacion = "jugomez" AND
	fecha_creacion = "2019-10-24 22:54:56" AND
	x.idcontr_categoria_contrato = 95
);

-- variables
SELECT x.* FROM clv_benefits.bnf_condicion_variable x
WHERE x.idbnf_configuracion_clausula = (
	SELECT bcc.idbnf_configuracion_clausula FROM clv_benefits.bnf_configuracion_clausula bcc WHERE
	usuario_creacion = "jugomez" AND
	fecha_creacion = "2019-10-24 22:59:23" AND
	idbnf_sub_concepto = (
		SELECT x.idbnf_sub_concepto FROM clv_benefits.bnf_sub_concepto x WHERE
		usuario_creacion = "jugomez" AND
		fecha_creacion = "2019-10-24 22:54:56" AND
		x.idcontr_categoria_contrato = 95
	)
);

-- huh?

    SELECT x.idbnf_sub_concepto FROM clv_benefits.bnf_sub_concepto x WHERE
        x.usuario_creacion = "jugomez" AND
        x.fecha_creacion = "2019-10-24 22:35:08" 
--        AND x.idcontr_categoria_contrato = 97
    ORDER BY x.idbnf_sub_concepto DESC
    LIMIT 1


