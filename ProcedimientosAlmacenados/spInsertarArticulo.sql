-- Insertar Articulo

-- ProveedorID -> Proveedores 

create procedure spInsertarArticulo @Nombre varchar(50), @Descripcion varchar(255) = null,
    @Precio decimal(10, 2), @ProveedorID int
as
	begin
		insert into Articulos (Nombre, Descripcion, Precio, ProveedorID)
		values (@Nombre, @Descripcion, @Precio, @ProveedorID)
	end
go

create procedure spSelectArticulo
as
	begin
		select * 
		from Articulos
	end
go

create procedure spUpdateArticulo
	@ArticuloID int, @Nombre varchar(50), @Descripcion varchar(255),
	@Precio decimal(10,2), @ProveedorID int
as
	begin
		update Articulos set Nombre = @Nombre, Descripcion = @Descripcion,
		Precio = @Precio, ProveedorID = @ProveedorID
		where ArticuloID = @ArticuloID
	end
go

create procedure spDeleteArticulo @ArticuloID int
as
	begin
		delete from Articulos
		where ArticuloID = @ArticuloID
	end
go


exec spSelectProveedor 