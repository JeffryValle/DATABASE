
-- 1. Insertar Clientes

create or alter procedure spInsertarCliente 
    @Nombre varchar(50), 
    @Apellido varchar(50),
    @Telefono varchar(15), 
    @Correo varchar(100), 
    @Direccion varchar(255)
as
	begin
		insert into Clientes (Nombre, Apellido, Telefono, Correo, Direccion)
		values (@Nombre, @Apellido, @Telefono, @Correo, @Direccion);

	end
go

create or alter procedure spSelectCliente
as
	begin
		select ClienteID, Nombre, Apellido, Telefono, Correo, Direccion
		from Clientes
	end
go

create or alter procedure spUpdateCliente
    @ClienteID int,
    @Nombre varchar(50), 
    @Apellido varchar(50),
    @Telefono varchar(15), 
    @Correo varchar(100), 
    @Direccion varchar(255)
as
	begin
		update Clientes set Nombre = @Nombre, Apellido = @Apellido, Telefono = @Telefono,
			Correo = @Correo, Direccion = @Direccion
		where ClienteID = @ClienteID;
	end
go

create or alter procedure spDeleteCliente @ClienteID int
as
	begin
		delete from Clientes
		where ClienteID = @ClienteID;
	end
go