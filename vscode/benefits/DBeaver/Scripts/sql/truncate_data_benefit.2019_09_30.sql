-- Script 2019/09/30 
-- 1° Eliminar datos de tablas

TRUNCATE TABLE clv_benefits.bnf_sub_concepto;

TRUNCATE TABLE clv_benefits.bnf_condicion_variable;

DELETE FROM clv_benefits.bnf_configuracion_clausula WHERE idbnf_configuracion_clausula!=0;
ALTER TABLE clv_benefits.bnf_configuracion_clausula AUTO_INCREMENT=1;

DELETE FROM clv_benefits.bnf_variable_beneficio WHERE tag!='';
ALTER TABLE clv_benefits.bnf_variable_beneficio AUTO_INCREMENT=1;

TRUNCATE TABLE clv_benefits.bit_valor_date;

TRUNCATE TABLE clv_benefits.bit_valor_decimal;

TRUNCATE TABLE clv_benefits.bit_valor_integer;

TRUNCATE TABLE clv_benefits.bit_valor_text;

TRUNCATE TABLE clv_benefits.bit_valor_varchar;

DELETE FROM clv_benefits.bit_entidad_bitacora WHERE idbit_entidad_bitacora!=0;
ALTER TABLE clv_benefits.bit_entidad_bitacora AUTO_INCREMENT=1;

-- 2° Eliminar tablas no utilizadas

DROP TABLE clv_benefits.bnf_clausula_propiedad;
DROP TABLE clv_benefits.bnf_transaccion;
