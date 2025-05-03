-- Insertar Cuenta

create procedure spInsertarCuenta @NumCuenta varchar(30), @Banco varchar(50), @Titular varchar(50)
as
begin
    insert into Cuentas (NumCuenta, Banco, Titular)
    values (@NumCuenta, @Banco, @Titular)
end
go

create procedure spSelectCuenta 
as
	begin
		select * from Cuentas
	end
go

select * from FacturaDetalles
select * from Cuentas