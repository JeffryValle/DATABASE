-- Insertar Servicio Medico

-- ServicioID -> Servicios
-- FacturaID -> Factura
-- MascotaID -> Mascotas
-- EmpleadoID -> Empleados
-- SalaID -> Salas

create procedure spInsertarServicioMedico
    @ServicioID int,
    @FacturaID int,
    @MascotaID int,
    @NecesitaInternar bit,
    @Fecha datetime,
    @Costo decimal(10, 2),
    @EmpleadoID int,
    @SalaID int
as
begin
    insert into ServiciosMedicos (ServicioID, FacturaID, MascotaID, NecesitaInternar, Fecha, Costo, EmpleadoID, SalaID)
    values (@ServicioID, @FacturaID, @MascotaID, @NecesitaInternar, @Fecha, @Costo, @EmpleadoID, @SalaID);
end;
go