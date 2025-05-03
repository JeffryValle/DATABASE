-- Insertar Servicio Transporte

-- FacturaID -> Factura
-- MascotaID -> Mascotas 
-- ServicioID -> Servicios
-- EmpleadoID -> Empleados
-- VehiculoID -> Vehiculos

create procedure spInsertarServicioTransporte
    @FacturaID int,
    @MascotaID int,
    @ServicioID int,
    @Fecha datetime,
    @Costo decimal(10, 2),
    @Distancia decimal(10, 2),
    @Detalles varchar(255) = null,
    @Estado varchar(20),
    @EmpleadoID int,
    @VehiculoID int
as
begin
    insert into ServiciosTransportes (FacturaID, MascotaID, ServicioID, Fecha, Costo, Distancia, Detalles, Estado, EmpleadoID, VehiculoID)
    values (@FacturaID, @MascotaID, @ServicioID, @Fecha, @Costo, @Distancia, @Detalles, @Estado, @EmpleadoID, @VehiculoID);
end;
go