-- Insertar Proveedor

create procedure spInsertarProveedor @Nombre varchar(50), @Telefono varchar(15), @Correo varchar(100),
    @Direccion varchar(255)
as
	begin
		insert into Proveedores (Nombre, Telefono, Correo, Direccion)
		values (@Nombre, @Telefono, @Correo, @Direccion);
	end;
go

create procedure spSelectProveedor
as
	begin
		select * from Proveedores
	end
go