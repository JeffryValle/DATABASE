-- Insertar Empleado

-- EspecialidadID -> Especialidades
-- AreaID -> Areas

create procedure spInsertarEmpleado
    @Nombre varchar(50),
    @Apellido varchar(50),
    @Telefono varchar(15),
    @Correo varchar(100),
    @Direccion varchar(255),
    @EspecialidadID int,
    @AreaID int
as
	begin
		insert into Empleados (Nombre, Apellido, Telefono, Correo, Direccion, EspecialidadID, AreaID)
		values (@Nombre, @Apellido, @Telefono, @Correo, @Direccion, @EspecialidadID, @AreaID);
	end;
go

create or alter procedure spSelectEmpleado
as
	begin
		select 
			e.EmpleadoID as Empleado,
			(e.Nombre + ' ' + e.Apellido) as Nombre,
			e.Telefono as Telefono,
			e.Correo as Correo,
			e.Direccion as Direccion,
			es.Nombre as Especialidad,
			a.Nombre as Area
		from Empleados e
		inner join Especialidades es on es.EspecialidadID = e.EspecialidadID
		inner join Areas a on a.AreaID = e.AreaID
	end
go
select * from Empleados
go


create procedure spUpdateEmpleado
	@Nombre varchar(50),
    @Apellido varchar(50),
    @Telefono varchar(15),
    @Correo varchar(100),
    @Direccion varchar(255),
    @EspecialidadID int,
    @AreaID int,
	@EmpleadoID int
as
	begin
		update Empleados set Nombre = @Nombre, Apellido = @Apellido, Telefono = @Telefono,
		Correo = @Correo, Direccion = @Direccion, EspecialidadID = @EspecialidadID, AreaID = @AreaID
		where EmpleadoID = @EmpleadoID
	end
go

create procedure spDeleteEmpleado @EmpleadoID int
as
	begin
		delete from Empleados
		where EmpleadoID = @EmpleadoID
	end
go

CREATE OR ALTER PROCEDURE spGetEmpleadoByID
    @EmpleadoID int
AS
BEGIN
    SELECT 
        e.EmpleadoID,
        e.Nombre,
        e.Apellido,
        e.Telefono,
        e.Correo,
        e.Direccion,
        e.EspecialidadID,
        e.AreaID
    FROM Empleados e
    WHERE e.EmpleadoID = @EmpleadoID
END
GO