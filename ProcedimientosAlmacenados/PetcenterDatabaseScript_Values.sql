
insert into Areas( Nombre, Descripcion)
values 
('Area de Recepción','Area de espera'),
('Area de Caja','Area para pagos varios')
;

select * from Articulos
insert into Articulos (Nombre, Descripcion, Precio)
values 
('Collar para perro', 'Collar ajustable de nylon para razas medianas', 150.00),
('Comida para gato', 'Alimento seco premium para gatos adultos', 300.00),
('Juguete para mascota', 'Pelota interactiva para estimular a tu mascota', 75.00),
('Vitaminas para perro', 'Suplemento multivitamínico para perros', 200.00),
('Cama para mascota', 'Cama acolchada y lavable para gatos y perros pequeños', 450.00);

-- Insertar datos en la tabla Clientes
INSERT INTO Clientes (Nombre, Apellido, Telefono, Correo, Direccion) VALUES
('Juan', 'Perez', '1234567890', 'juan.perez@example.com', 'Calle 1 #123'),
('Maria', 'Gomez', '0987654321', 'maria.gomez@example.com', 'Avenida 45 #456');

-- Insertar datos en la tabla Especies
INSERT INTO Especies (Nombre, Detalles) VALUES
('Canino', 'Perros de todas las razas'),
('Felino', 'Gatos domésticos y silvestres');

-- Insertar datos en la tabla Mascotas
INSERT INTO Mascotas (Nombre, EspecieID, ClienteID, FechaNacimiento, Sexo, Raza) VALUES
('Bobby', 1, 1, '2020-06-15', 'Macho', 'Labrador'),
('Michi', 2, 2, '2019-09-10', 'Hembra', 'Siamés');

-- Insertar datos en la tabla Proveedores
INSERT INTO Proveedores (Nombre, Telefono, Correo, Direccion) VALUES
('PetFood Inc.', '1112223333', 'contact@petfood.com', 'Calle Comercial 12'),
('Vetsupply', '4445556666', 'support@vetsupply.com', 'Avenida Central 34');

-- Insertar datos en la tabla Articulos
INSERT INTO Articulos (Nombre, Descripcion, Precio, ProveedorID) VALUES
('Croquetas Premium', 'Alimento balanceado para perros', 150.00, 1),
('Arena para gatos', 'Arena sanitaria aglomerante', 80.00, 2);

-- Insertar datos en la tabla Areas
INSERT INTO Areas (Nombre, Descripcion) VALUES
('Consultorio', 'Área de consulta médica'),
('Estética', 'Área de aseo y peluquería');

-- Insertar datos en la tabla Salas
INSERT INTO Salas (Nombre, AreaID, Estado) VALUES
('Consulta 1', 1, 'Disponible'),
('Peluquería', 2, 'Ocupada');

-- Insertar datos en la tabla Cuentas
INSERT INTO Cuentas (NumCuenta, Banco, Titular) VALUES
('1234567890', 'Banco Nacional', 'Juan Perez'),
('0987654321', 'Banco Global', 'Maria Gomez');

-- Insertar datos en la tabla Especialidades
INSERT INTO Especialidades (Nombre, Descripcion, AreaID) VALUES
('Veterinario General', 'Consulta y diagnóstico general', 1),
('Estilista Canino', 'Corte y aseo de mascotas', 2);

-- Insertar datos en la tabla Empleados
INSERT INTO Empleados (Nombre, Apellido, Telefono, Correo, Direccion, EspecialidadID, AreaID) VALUES
('Carlos', 'Ramirez', '7778889999', 'carlos.ramirez@vetclinic.com', 'Calle Salud 45', 1, 1),
('Laura', 'Fernandez', '6667778888', 'laura.fernandez@vetclinic.com', 'Avenida Estética 23', 2, 2);

-- Insertar datos en la tabla Vehiculos
INSERT INTO Vehiculos (Placa, Marca, Modelo, Estado, EmpleadoID) VALUES
('ABC123', 'Toyota', 'Hilux', 'Disponible', 1),
('XYZ789', 'Ford', 'Ranger', 'Ocupado', 2);

-- Insertar datos en la tabla Servicios
INSERT INTO Servicios (Nombre, Descripcion, PrecioUnitario, AreaID) VALUES
('Consulta Médica', 'Consulta con veterinario', 300.00, 1),
('Baño y Corte', 'Aseo completo de la mascota', 200.00, 2);

-- Insertar datos en la tabla Factura
INSERT INTO Factura (ClienteID, Subtotal, Impuesto, Total, Estado, MetodoPago, CuentaID) VALUES
(1, 500.00, 50.00, 550.00, 'Pagada', 'Tarjeta', 1),
(2, 400.00, 40.00, 440.00, 'Pendiente', 'Efectivo', NULL);

-- Insertar datos en la tabla FacturaDetalles
INSERT INTO FacturaDetalles (FacturaID, ArticuloID, Cantidad, PrecioUnitario, Descuento) VALUES
(1, 3, 2, 150.00, 0.00),
(1, 4, 3, 80.00, 10.00);

-- Insertar datos en la tabla Citas
INSERT INTO Citas (MascotaID, Fecha, Motivo, Estado) VALUES
(1, '2025-04-01 10:00:00', 'Chequeo general', 'Pendiente'),
(2, '2025-04-02 14:00:00', 'Vacunación', 'Pendiente');

-- Insertar datos en la tabla ServiciosHospedaje
INSERT INTO ServiciosHospedaje (ServicioID, FacturaID, MascotaID, FechaInicio, FechaFin, Costo, EmpleadoID) VALUES
(1, 1, 1, '2025-03-20', '2025-03-25', 1000.00, 1);

-- Insertar datos en la tabla Horarios
INSERT INTO Horarios (Hora, Tipo, Descripcion, MascotaID, EmpleadoID, ServicioHospedajeID) VALUES
('08:00', 'Comida', 'Croquetas premium', 1, 1, 1);

-- Insertar datos en la tabla ServiciosMedicos
INSERT INTO ServiciosMedicos (ServicioID, FacturaID, MascotaID, NecesitaInternar, Fecha, Costo, EmpleadoID, SalaID) VALUES
(1, 1, 1, 1, '2025-03-28 09:30:00', 500.00, 1, 1);

-- Insertar datos en la tabla ServiciosTransportes
INSERT INTO ServiciosTransportes (FacturaID, MascotaID, ServicioID, Fecha, Costo, Distancia, Detalles, Estado, EmpleadoID, VehiculoID) VALUES
(1, 1, 1, '2025-03-29 08:00:00', 150.00, 10.00, 'Recogida de la mascota en casa', 'Completado', 1, 1);

insert into Compras (ProveedorID, Total, Estado) values
(1, 500.00, 'Completado'),(2, 1000.00, 'Pendiente');

insert into ComprasDetalles (CompraID, ArticuloID, Cantidad, Costo) values
(1, 3, 5, 100.00), (2, 4, 2, 200.00);

insert into FichaRecepcion (MascotaID, EmpleadoID, CitaID, Motivo, Observaciones, ContactoAlterno, TelefonoAlterno, Tipo, Estado)
values (1, 1, 1, 'Ingreso a veterinaria por un chequeo general', 'La mascota presenta comportamientos involuntarios', 'juan.perez@example.com','95563530', 'Atencion normal', 'Pendiente');

insert into Pagos (CompraID, Descripcion, Monto, MetodoPago, CuentaID) values
(1, 'Alimento para mascota', 500.00, 'Efectivo', 1);

insert into ServiciosEspecies (ServicioID, EspecieID) values
(2, 2);

insert into ServiciosEsteticos (ServicioID, FacturaID, MascotaID, Fecha, Costo, EmpleadoID) values
(1, 1, 1, '2025-04-04', 500.00, 1),(2, 2, 2, '2025-04-05', 1000.00, 2);


-- Sin Llaves Foraneas
select * from Clientes *
select * from Especies 
select * from Proveedores 
select * from Areas
select * from Cuentas

-- Con Llaves Foraneas
select * from Mascotas *
select * from Articulos
select * from Salas
select * from Especialidades
select * from Empleados * 
select * from Vehiculos
select * from Servicios 
select * from ServiciosEspecies
select * from Factura *
select * from FacturaDetalles
select * from ServiciosHospedaje
select * from Horarios 
select * from ServiciosMedicos
select * from ServiciosEsteticos
select * from ServiciosTransportes
select * from Compras *
select * from ComprasDetalles
select * from Pagos * 
select * from Citas * 
select * from FichaRecepcion *


