ALTER TABLE clv_benefits.bnf_configuracion_clausula ADD tipo_familia TINYINT(4) DEFAULT 0 NOT NULL COMMENT 'Tipo de clausula para diferenciar en propousal:
0 - Común
1 - Pagos
2 - Cancelación | Reducción (no visibles)
' AFTER propiedades;

ALTER TABLE clv_benefits.bnf_configuracion_clausula ADD id_referencia_clausula TEXT NULL COMMENT 'Clausulas de cancelacion y reduccion unicamente para PAGOS.
Objeto ejemplo con id referenciados:
  { "can": 0, "red":0 }
Estructura esperada:
{
  "can": idbnf_configuracion_cluasula,
  "red": idbnf_configuracion_cluasula
}
' AFTER tipo_familia;
  