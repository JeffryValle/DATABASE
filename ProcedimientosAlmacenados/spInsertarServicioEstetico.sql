-- Insertar Servicio Estetico

-- ServicioID -> Servicios
-- FacturaID -> Factura
-- MascotaID -> Mascotas
-- EmpleadoID -> Empleados

create procedure spInsertarServicioEstetico
    @ServicioID int,
    @FacturaID int,
    @MascotaID int,
    @Fecha datetime,
    @Costo decimal(10, 2),
    @EmpleadoID int
as
begin
    insert into ServiciosEsteticos (ServicioID, FacturaID, MascotaID, Fecha, Costo, EmpleadoID)
    values (@ServicioID, @FacturaID, @MascotaID, @Fecha, @Costo, @EmpleadoID);
end;
go