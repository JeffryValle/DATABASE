-- Insertar Compra

-- ProveedorID -> Proveedores

create procedure spInsertarCompra
    @ProveedorID int,
    @Total decimal(10, 2),
    @Estado varchar(20)
as
	begin
		insert into Compras (ProveedorID, Total, Estado)
		values (@ProveedorID, @Total, @Estado)
	end
go

create procedure spSelectCompra
as
	begin
		select * from Compras
	end
go

create procedure spUpdateCompra @ProveedorID int, 
	@Total decimal(10,2), @Estado varchar(25), @CompraID int
as
	begin
		update Compras set ProveedorID = @ProveedorID,
		Total = @Total, Estado = @Estado
		where CompraID = @CompraID
	end
go

create procedure spDeleteCompra @CompraID int
as
	begin
		delete from Compras
		where CompraID = @CompraID
	end
go