-- Insertar Cita

-- MascotaID -> Mascotas

create procedure spInsertarCita
    @MascotaID int,
    @Fecha varchar(50),
    @Motivo varchar(255),
    @Estado varchar(20)
as
	begin
		insert into Citas (MascotaID, Fecha, Motivo, Estado)
		values (@MascotaID, @Fecha, @Motivo, @Estado)
	end
go

	select * from Citas
	select * from FichaRecepcion

create procedure spSelectCita
as
	begin
		select * from Citas
	end
go

create procedure spUpdateCita
    @MascotaID int,
    @Fecha varchar(50),
    @Motivo varchar(255),
    @Estado varchar(20),
	@CitaID int
as
	begin
		update Citas set MascotaID = @MascotaID, Fecha = @Fecha, Motivo = @Motivo,
		Estado = @Estado 
		where CitaID = @CitaID
	end
go

create procedure spDeleteCita @CitaID int
as
	begin
		delete from Citas
		where CitaID = @CitaID
	end
go

select * from FichaRecepcion