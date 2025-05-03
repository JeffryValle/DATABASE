-- Insertar FichaRecepcion

-- MascotaID -> Mascotas
-- EmpleadoID -> Empleados
-- CitaID -> ? Citas

create or alter procedure spInsertarFichaRecepcion
    @MascotaID int,
    @Motivo varchar(255) = null,
    @Observaciones varchar(255) = null,
    @EmpleadoID int,
    @Contacto varchar(50) = null,
    @Telefono varchar(15) = null,
    @Tipo varchar(20),
    @Estado varchar(20),
    @CitaID int = null
as
	begin
		insert into FichaRecepcion (MascotaID, Motivo, Observaciones, EmpleadoID, Contacto, Telefono, Tipo, Estado, CitaID)
		values (@MascotaID, @Motivo, @Observaciones, @EmpleadoID, @Contacto, @Telefono, @Tipo, @Estado, @CitaID)
	end
go

create procedure spSelectFichaRecepcion
as
	begin
		select * from FichaRecepcion
	end
go

create or alter procedure spUpdateFichaRecepcion
	@MascotaID int, @Motivo varchar(255), @Observaciones varchar(255),
	@EmpleadoID int, @Contacto varchar(100), @Telefono varchar(20),
	@Tipo varchar(50), @Estado varchar(100), @CitaID int, @FichaID int
as
	begin
		update FichaRecepcion set
		MascotaID = @MascotaID, Motivo = @Motivo, Observaciones = @Observaciones,
		EmpleadoID = @EmpleadoID, Contacto = @Contacto, Telefono = @Telefono,
		Tipo = @Tipo, Estado = @Estado, CitaID = @CitaID
		where FichaID = @FichaID
	end
go

create procedure spDeleteFichaRecepcion @FichaID int
as
	begin
		delete from FichaRecepcion
		where FichaID = @FichaID
	end
go

