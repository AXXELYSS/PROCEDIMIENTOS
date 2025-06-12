-- Inserciones en la tabla TUsuario
INSERT INTO TUsuario (NombreUsuario, Clave, TipoUsuario) VALUES
('admin1', 'adminpass', 'Administrador'),
('chef1', 'chefpass', 'Chef'),
('mesero1', 'meseropass', 'Mesero'),
('admin2', 'adminpass2', 'Administrador'),
('chef2', 'chefpass2', 'Chef'),
('mesero2', 'meseropass2', 'Mesero'),
('admin3', 'adminpass3', 'Administrador'),
('chef3', 'chefpass3', 'Chef'),
('mesero3', 'meseropass3', 'Mesero'),
('admin4', 'adminpass4', 'Administrador'),
('chef4', 'chefpass4', 'Chef'),
('mesero4', 'meseropass4', 'Mesero'),
('admin5', 'adminpass5', 'Administrador'),
('chef5', 'chefpass5', 'Chef'),
('mesero5', 'meseropass5', 'Mesero'),
('admin6', 'adminpass6', 'Administrador'),
('chef6', 'chefpass6', 'Chef'),
('mesero6', 'meseropass6', 'Mesero'),
('admin7', 'adminpass7', 'Administrador'),
('chef7', 'chefpass7', 'Chef');


-- Inserciones en la tabla TCliente
INSERT INTO TCliente (Nombre, Apellido, Telefono, Correo, Direccion) VALUES
('Carlos', 'Ramirez', '987654321', 'carlos@email.com', 'Av. Central 123'),
('Lucía', 'Pérez', '912345678', 'lucia@email.com', 'Calle Lima 456'),
('Juan', 'Gonzales', '987654322', 'juan@email.com', 'Av. Morales 789'),
('María', 'Lopez', '912345679', 'maria@email.com', 'Calle Balta 101'),
('Pedro', 'Martínez', '987654323', 'pedro@email.com', 'Av. San Martín 202'),
('Ana', 'Rodríguez', '912345680', 'ana@email.com', 'Calle Jirón 303'),
('Luis', 'Fernández', '987654324', 'luis@email.com', 'Av. Grau 404'),
('Sofía', 'García', '912345681', 'sofia@email.com', 'Calle Ayacucho 505'),
('Miguel', 'Díaz', '987654325', 'miguel@email.com', 'Av. Arequipa 606'),
('Laura', 'González', '912345682', 'laura@email.com', 'Calle Santa Teresa 707'),
('Carlos', 'Ramírez', '987654326', 'carlosr@email.com', 'Calle Puno 808'),
('Gloria', 'Sánchez', '912345683', 'gloria@email.com', 'Av. Javier Prado 909'),
('José', 'Torres', '987654327', 'jose@email.com', 'Calle Cajamarca 1010'),
('Elena', 'Martínez', '912345684', 'elena@email.com', 'Av. Belén 1111'),
('David', 'López', '987654328', 'david@email.com', 'Calle San Pedro 1212'),
('Gabriela', 'Morales', '912345685', 'gabriela@email.com', 'Av. Colón 1313'),
('Andrés', 'Hernández', '987654329', 'andres@email.com', 'Calle San José 1414'),
('Rosa', 'Ramírez', '912345686', 'rosa@email.com', 'Av. Santa Cruz 1515'),
('Carlos', 'Cruz', '987654330', 'carloscruz@email.com', 'Calle Los Álamos 1616'),
('Sandra', 'Fernández', '912345687', 'sandra@email.com', 'Av. El Sol 1717');


-- Inserciones en la tabla TEmpleado
INSERT INTO TEmpleado (Nombre, Apellido, Cargo, Telefono, Correo, IdUsuario) VALUES
('Juan', 'Gonzales', 'Administrador', '999111222', 'juan@quinta.com', 1),
('María', 'Lopez', 'Mesero', '999111223', 'maria@quinta.com', 2),
('José', 'García', 'Chef', '999111224', 'jose@quinta.com', 3),
('Luis', 'Martínez', 'Administrador', '999111225', 'luis@quinta.com', 4),
('Ana', 'Rodríguez', 'Mesero', '999111226', 'ana@quinta.com', 5),
('Miguel', 'Fernández', 'Chef', '999111227', 'miguel@quinta.com', 6),
('Carlos', 'Díaz', 'Administrador', '999111228', 'carlos@quinta.com', 7),
('Laura', 'González', 'Mesero', '999111229', 'laura@quinta.com', 8),
('Elena', 'Sánchez', 'Chef', '999111230', 'elena@quinta.com', 9),
('David', 'Torres', 'Administrador', '999111231', 'david@quinta.com', 10),
('Gabriela', 'López', 'Mesero', '999111232', 'gabriela@quinta.com', 11),
('Andrés', 'Martínez', 'Chef', '999111233', 'andres@quinta.com', 12),
('Rosa', 'Ramírez', 'Administrador', '999111234', 'rosa@quinta.com', 13),
('Carlos', 'Hernández', 'Mesero', '999111235', 'carlos@quinta.com', 14),
('Sandra', 'Cruz', 'Chef', '999111236', 'sandra@quinta.com', 15),
('José', 'Sánchez', 'Administrador', '999111237', 'jose@quinta.com', 16),
('Marta', 'García', 'Mesero', '999111238', 'marta@quinta.com', 17),
('Juan', 'Martínez', 'Chef', '999111239', 'juan@quinta.com', 18),
('Gloria', 'López', 'Administrador', '999111240', 'gloria@quinta.com', 19),
('Sofía', 'Fernández', 'Mesero', '999111241', 'sofia@quinta.com', 20);

SELECT * FROM TEmpleado;


-- Inserciones en la tabla TPlato
INSERT INTO TPlato (Nombre, Descripcion, Precio, Categoria) VALUES
('Sopa de Pollo', 'Sopa de pollo con verduras frescas', 15.50, 'Entradas'),
('Ensalada César', 'Ensalada con lechuga, pollo y aderezo César', 10.00, 'Entradas'),
('Lomo Saltado', 'Lomo de res con papas fritas y arroz', 20.00, 'Plato de Fondo'),
('Arroz Chaufa', 'Arroz frito con pollo y vegetales', 18.75, 'Plato de Fondo'),
('Ceviche', 'Pescado marinado con limón, cebolla y cilantro', 12.50, 'Entradas'),
('Pasta Alfredo', 'Pasta con salsa cremosa de queso', 10.00, 'Plato de Fondo'),
('Pescado a la Parrilla', 'Pescado fresco a la parrilla con guarnición', 20.00, 'Plato de Fondo'),
('Tacos de Pollo', 'Tacos con pollo, lechuga y salsa', 18.75, 'Entradas'),
('Pizza Margarita', 'Pizza con salsa de tomate, queso y albahaca', 12.50, 'Plato de Fondo'),
('Sándwich Club', 'Sándwich con jamón, pollo, lechuga y tomate', 15.50, 'Entradas'),
('Sopa Criolla', 'Sopa con carne de res, papas y fideos', 10.00, 'Entradas'),
('Chicharrón de Pollo', 'Pollo empanado con papas fritas', 20.00, 'Plato de Fondo'),
('Lasaña', 'Lasaña con carne molida y salsa bechamel', 18.75, 'Plato de Fondo'),
('Tiradito de Pescado', 'Pescado crudo con salsa picante', 12.50, 'Entradas'),
('Pollo a la Brasa', 'Pollo asado con papas y ensalada', 15.50, 'Plato de Fondo'),
('Paella', 'Arroz con mariscos y vegetales', 10.00, 'Plato de Fondo'),
('Chupe de Camarones', 'Sopa de camarones con papa y leche', 20.00, 'Plato de Fondo'),
('Arroz con Mariscos', 'Arroz con mariscos frescos', 18.75, 'Plato de Fondo'),
('Sushi', 'Rollos de sushi con pescado y aguacate', 12.50, 'Entradas'),
('Lomo de Cerdo', 'Lomo de cerdo al horno con ensalada', 15.50, 'Plato de Fondo');


-- Inserciones en la tabla TMesa
INSERT INTO TMesa (NumeroMesa, Capacidad) VALUES
(1, 4),
(2, 2),
(3, 6),
(4, 4),
(5, 8),
(6, 2),
(7, 4),
(8, 6),
(9, 2),
(10, 4),
(11, 6),
(12, 8),
(13, 4),
(14, 2),
(15, 4),
(16, 6),
(17, 2),
(18, 4),
(19, 6),
(20, 4);


-- Inserciones en la tabla TReserva
INSERT INTO TReserva (Fecha, Hora, IdCliente, IdMesa) VALUES
('2025-06-01', '12:30:00', 1, 1),
('2025-06-02', '13:00:00', 2, 2),
('2025-06-03', '14:15:00', 3, 3),
('2025-06-04', '15:45:00', 4, 4),
('2025-06-05', '16:00:00', 5, 5),
('2025-06-06', '17:20:00', 6, 6),
('2025-06-07', '18:05:00', 7, 7),
('2025-06-08', '19:30:00', 8, 8),
('2025-06-09', '20:10:00', 9, 9),
('2025-06-10', '21:25:00', 10, 10),
('2025-06-11', '12:45:00', 11, 11),
('2025-06-12', '14:00:00', 12, 12),
('2025-06-13', '15:30:00', 13, 13),
('2025-06-14', '16:15:00', 14, 14),
('2025-06-15', '17:50:00', 15, 15),
('2025-06-16', '18:25:00', 16, 16),
('2025-06-17', '19:00:00', 17, 17),
('2025-06-18', '20:30:00', 18, 18),
('2025-06-19', '21:10:00', 19, 19),
('2025-06-20', '22:00:00', 20, 20);


-- Inserciones en la tabla TPedido
INSERT INTO TPedido (Fecha, Hora, IdCliente, IdEmpleado) VALUES
('2025-06-01', '12:30:00', 1, 1),
('2025-06-02', '13:00:00', 2, 2),
('2025-06-03', '14:15:00', 3, 3),
('2025-06-04', '15:45:00', 4, 4),
('2025-06-05', '16:00:00', 5, 5),
('2025-06-06', '17:20:00', 6, 6),
('2025-06-07', '18:05:00', 7, 7),
('2025-06-08', '19:30:00', 8, 8),
('2025-06-09', '20:10:00', 9, 9),
('2025-06-10', '21:25:00', 10, 10),
('2025-06-11', '12:45:00', 11, 11),
('2025-06-12', '14:00:00', 12, 12),
('2025-06-13', '15:30:00', 13, 13),
('2025-06-14', '16:15:00', 14, 14),
('2025-06-15', '17:50:00', 15, 15),
('2025-06-16', '18:25:00', 16, 16),
('2025-06-17', '19:00:00', 17, 17),
('2025-06-18', '20:30:00', 18, 18),
('2025-06-19', '21:10:00', 19, 19),
('2025-06-20', '22:00:00', 20, 20);


-- Inserciones en la tabla TDetallePedido
INSERT INTO TDetallePedido (IdPedido, IdPlato, Cantidad, PrecioUnitario) VALUES
(1, 1, 2, 15.50),
(2, 2, 1, 10.00),
(3, 3, 1, 20.00),
(4, 4, 2, 18.75),
(5, 5, 1, 12.50),
(6, 2, 3, 10.00),
(7, 1, 1, 15.50),
(8, 3, 2, 20.00),
(9, 4, 1, 18.75),
(10, 5, 2, 12.50),
(11, 3, 1, 20.00),
(12, 4, 2, 18.75),
(13, 5, 1, 12.50),
(14, 1, 3, 15.50),
(15, 2, 1, 10.00),
(16, 3, 2, 20.00),
(17, 4, 1, 18.75),
(18, 5, 2, 12.50),
(19, 1, 1, 15.50),
(20, 2, 3, 10.00);
