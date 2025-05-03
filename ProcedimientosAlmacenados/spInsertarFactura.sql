-- Insertar Cuenta

-- ClienteID -> Clientes
-- CuentaID -> ? Cuentas

create or alter procedure spInsertarFactura
    @ClienteID int,
    @Subtotal decimal(10, 2),
    @Estado varchar(20),
    @MetodoPago varchar(20),
    @CuentaID int = null
as
	begin
		insert into Factura (ClienteID, Subtotal, Estado, MetodoPago, CuentaID)
		values (@ClienteID, @Subtotal, @Estado, @MetodoPago, @CuentaID)
	end
go

select * from Factura

create procedure spSelectFactura
as
	begin
		select * from Factura
	end
go

create or alter procedure spUpdateFactura
	@ClienteID int,
    @Subtotal decimal(10, 2),
    @Estado varchar(20),
    @MetodoPago varchar(20),
    @CuentaID int,
	@FacturaID int
as
	begin
		update Factura set 
		ClienteID = @ClienteID, 
		Subtotal = @Subtotal,
		Estado = @Estado, 
		MetodoPago = @MetodoPago, 
		CuentaID = @CuentaID
		where FacturaID = @FacturaID
	end
go

create procedure spDeleteFactura @FacturaID int
as
	begin
		delete from Factura
		where FacturaID = @FacturaID
	end
go
