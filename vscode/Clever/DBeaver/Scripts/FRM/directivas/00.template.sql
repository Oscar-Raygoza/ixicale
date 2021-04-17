use clv_frm;
-- verificar directivas POSTLOGIN
SET @id_vista = 11;
SET @directiva = "{{'SEND_ANOTHER_PAYMENT'}}";
SELECT
  d.idclv_directiva,
--  vd.idclv_vista_directiva,
--  vd.idclv_vista,
  di.idclv_idioma,
  di.idclv_directiva_idioma,
  d.directiva,
  di.texto_traduccion
FROM clv_directiva d
INNER JOIN
  clv_directiva_idioma di ON d.idclv_directiva = di.idclv_directiva
LEFT JOIN
  clv_vista_directiva vd ON di.idclv_directiva = vd.idclv_directiva
WHERE
  di.idclv_idioma IN ( 1, 2 )
  AND vd.idclv_vista = @id_vista
  AND d.directiva = @directiva
ORDER BY d.directiva ASC
LIMIT 2000;



-- insert directivas nuevas POSTLOGIN
SET @usr_creacion = 'ixicale';
SET @traduccionIngles = 'Send another payment';
SET @traduccionEspanol = 'Enviar otro pago';

# solo aplicar si no devuelve nada el select
INSERT INTO `clv_frm`.`clv_directiva` (`directiva`, `descripcion`, `estado`, `fecha_creacion`, `usuario_creacion`, `usuario_ultima_modificacion`, `fecha_ultima_modificacion`)
  VALUES (@directiva, @traduccionIngles,'1', NOW(), @usr_creacion,' ', '1000-01-01 00:00:00');

SET @id_directiva := (SELECT idclv_directiva FROM clv_directiva WHERE directiva = @directiva );

-- Agregar a Vista
INSERT INTO `clv_frm`.`clv_vista_directiva` (`idclv_vista`, `idclv_directiva`, `estado`, `fecha_creacion`, `usuario_creacion`, `usuario_ultima_modificacion`, `fecha_ultima_modificacion`)
  VALUES (@id_vista, @id_directiva, '1', NOW(), @usr_creacion, ' ', '1000-01-01 00:00:00');

-- insert traducciones
-- Ingles
INSERT INTO `clv_frm`.`clv_directiva_idioma` (`idclv_directiva`, `idclv_idioma`, `texto_traduccion`, `estado`, `fecha_creacion`, `usuario_creacion`, `usuario_ultima_modificacion`, `fecha_ultima_modificacion`)
  VALUES (@id_directiva, '1',@traduccionIngles, '1', NOW(), @usr_creacion, ' ', '1000-01-01 00:00:00');

-- Español
INSERT INTO `clv_frm`.`clv_directiva_idioma` (`idclv_directiva`, `idclv_idioma`, `texto_traduccion`, `estado`, `fecha_creacion`, `usuario_creacion`, `usuario_ultima_modificacion`, `fecha_ultima_modificacion`)
  VALUES (@id_directiva, '2',@traduccionEspanol, '1', NOW(), @usr_creacion, ' ', '1000-01-01 00:00:00');




-- ends
