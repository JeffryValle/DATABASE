-- Insertar ServiciosHospedaje

-- ServicioID -> Servicios
-- FacturaID -> Facturas
-- MascotaID -> Mascotas

create procedure spInsertarServicioHospedaje
    @ServicioID int,
    @FacturaID int,
    @MascotaID int,
    @FechaInicio datetime,
    @FechaFin datetime,
    @Costo decimal(10, 2),
    @EmpleadoID int
as
begin
    insert into ServiciosHospedaje (ServicioID, FacturaID, MascotaID, FechaInicio, FechaFin, Costo, EmpleadoID)
    values (@ServicioID, @FacturaID, @MascotaID, @FechaInicio, @FechaFin, @Costo, @EmpleadoID);
end;
go