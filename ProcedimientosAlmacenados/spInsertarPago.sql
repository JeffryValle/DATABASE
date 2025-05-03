-- Insertar Pago

--CompraID -> Compras
--CuentaID -> ? Cuentas

create procedure spInsertarPago
    @CompraID int = null,
    @Descripcion varchar(255) = null,
    @Monto decimal(10, 2),
    @MetodoPago varchar(20),
    @CuentaID int = null
as
	begin
		insert into Pagos (CompraID, Descripcion, Monto, MetodoPago, CuentaID)
		values (@CompraID, @Descripcion, @Monto, @MetodoPago, @CuentaID)
	end
go

create procedure spSelectPago
as
	begin
		select * from Pagos
	end
go

create procedure spUpdatePago
    @CompraID int,
    @Descripcion varchar(255),
    @Monto decimal(10, 2),
    @MetodoPago varchar(20),
    @CuentaID int,
	@PagoID int
as
	begin
		update Pagos set
		CompraID = @CompraID, Descripcion = @Descripcion, Monto = @Monto,
		MetodoPago = @MetodoPago, CuentaID = @CuentaID
		where PagoID = @PagoID
	end
go

create procedure spDeletePago @PagoID int
as
	begin
		delete from Pagos
		where PagoID = @PagoID
	end
go
	