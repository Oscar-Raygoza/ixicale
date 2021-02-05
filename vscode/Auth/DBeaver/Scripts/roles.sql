# Obtener rol por usuario 
SELECT item_name, user_id, created_at, estado, fecha_creacion, usuario_creacion, fecha_ultima_modificacion, usuario_ultima_modificacion FROM clv_auth.auth_assignment
WHERE user_id = "ixicale";

# Agregar rol a usuario
INSERT INTO clv_auth.auth_assignment 
(item_name, user_id, created_at, estado, fecha_creacion, usuario_creacion, fecha_ultima_modificacion, usuario_ultima_modificacion) 
VALUES('admin_fin', 'ixicale', 0, 1, NOW(), 'ixicale', '1000-01-01 00:00:00', ' ');
