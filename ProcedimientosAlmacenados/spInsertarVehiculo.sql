-- Insertar Vehiculos

-- EmpleadoID -> Empleados

create or alter procedure spInsertarVehiculo
    @Placa varchar(10),
    @Marca varchar(50),
    @Modelo varchar(50),
    @Estado varchar(20),
    @Empleado int
as
	begin
		insert into Vehiculos (Placa, Marca, Modelo, Estado, EmpleadoID)
		values (@Placa, @Marca, @Modelo, @Estado, @Empleado);
	end
go

create or alter procedure spSelectVehiculo
as
	begin
		select 
			v.VehiculoID as VehiculoID,
			v.Placa Placa,
			v.Marca Marca,
			v.Modelo Modelo,
			v.Estado Estado,
			(e.Nombre + ' ' + E.Apellido) as Empleado
		from Vehiculos v
		inner join Empleados e on e.EmpleadoID = v.EmpleadoID
	end
go

create or alter procedure spUpdateVehiculo
	@Placa varchar(10),
    @Marca varchar(50),
    @Modelo varchar(50),
    @Estado varchar(20),
    @Empleado int,
	@VehiculoID int
as
	begin
		update Vehiculos set  Placa = @Placa, Marca = @Marca, Modelo = @Modelo,
		Estado = @Estado, EmpleadoID = @Empleado where VehiculoID = @VehiculoID
	end
go

create procedure spDeleteVehiculo @VehiculoID int
as
	begin
		delete from Vehiculos
		where VehiculoID = @VehiculoID
	end
go

CREATE OR ALTER PROCEDURE spGetVehiculoByID
    @VehiculoID int
AS
BEGIN
    SELECT 
        e.VehiculoID as VehiculoID,
        e.Placa Placa,
        e.Marca Marca,
        e.Modelo Modelo,
        e.Estado Estado,
		e.EmpleadoID as Empleado
    FROM Vehiculos e
    WHERE e.VehiculoID = @VehiculoID
END
GO

select * from Vehiculos
go