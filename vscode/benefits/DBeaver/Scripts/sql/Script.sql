SELECT
        	cv.idbnf_condicion_variable,
            cv.idbnf_configuracion_clausula,
            cv.idbnf_variable_beneficio,
            cv.base,
            cv.tipo_dato,
            cv.tipo_rango `cv_tipo_rango`,
            cv.rangos `cv_rangos`,
            cv.override_rules `cv_override_rules`,
            cv.es_global,
            cv.estado `cv_estado`,
            cv.fecha_creacion `cv_fecha_creacion`,
            cv.usuario_creacion `cv_usuario_creacion`,
            cv.usuario_ultima_modificacion `cv_usuario_ultima_modificacion`,
            cv.fecha_ultima_modificacion `cv_fecha_ultima_modificacion`,
            cc.idbnf_configuracion_clausula,
            cc.idbnf_sub_concepto,
            cc.opcional,
            cc.nombre,
            cc.texto,
            cc.variables,
            cc.limite_inferior,
            cc.limite_superior,
            cc.es_rango,
            cc.rangos,
            cc.booking_window_fecha_inicio,
            cc.booking_window_fecha_fin,
            cc.travel_window_fecha_inicio,
            cc.travel_window_fecha_fin,
            cc.propiedades,
            cc.estado,
            cc.fecha_creacion,
            cc.usuario_creacion,
            cc.usuario_ultima_modificacion,
            cc.fecha_ultima_modificacion
        FROM
            clv_benefits.bnf_configuracion_clausula cc
                INNER JOIN
            clv_benefits.bnf_condicion_variable cv ON cv.idbnf_configuracion_clausula = cc.idbnf_configuracion_clausula
        WHERE
            cc.idbnf_sub_concepto = 4
            and cc.idbnf_configuracion_clausula > 0