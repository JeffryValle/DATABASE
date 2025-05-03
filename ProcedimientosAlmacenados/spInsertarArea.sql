-- Insertar Areas

create procedure spInsertarArea @Nombre varchar(50), @Descripcion varchar(255) = null
as
	begin
		insert into Areas (Nombre, Descripcion)
		values (@Nombre, @Descripcion)
	end
go

create procedure spSelectArea
as
	begin
		select * from Areas
	end
go

create procedure spUpdateArea
	@Nombre varchar(120),
	@Descripcion varchar(200),
	@AreaID int
as
	begin
		update Areas set Nombre = @Nombre, Descripcion = @Descripcion
		where AreaID = @AreaID
	end
go

create procedure spDeleteArea
	@AreaID int
as
	begin
		delete from Areas
		where AreaID = @AreaID
	end
go