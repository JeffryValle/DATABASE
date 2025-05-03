-- Insertar Horarios

-- MascotaID -> Mascotas
-- EmpleadoID -> Empleados
-- ServicioHospedajeID -> ServiciosHospedaje

create procedure spInsertarHorario
    @Hora varchar(5),
    @Tipo varchar(20),
    @Descripcion varchar(255) = null,
    @MascotaID int,
    @EmpleadoID int,
    @ServicioHospedajeID int
as
begin
    insert into Horarios (Hora, Tipo, Descripcion, MascotaID, EmpleadoID, ServicioHospedajeID)
    values (@Hora, @Tipo, @Descripcion, @MascotaID, @EmpleadoID, @ServicioHospedajeID);
end;
go