-- Insertar Especialidad

-- AreaID -> Areas

create procedure spInsertarEspecialidad
    @Nombre varchar(50),
    @Descripcion varchar(255) = null,
    @AreaID int
as
	begin
		insert into Especialidades (Nombre, Descripcion, AreaID)
		values (@Nombre, @Descripcion, @AreaID)
	end
go
create or alter procedure spSelectEspecialidad
as
	begin
		select 
			e.EspecialidadID EspecialidadID,
			e.Nombre Nombre,
			e.Descripcion Descripcion,
			a.Nombre as Area
		from Especialidades e
		inner join Areas a ON a.AreaID = e.AreaID
	end
go

create procedure spUpdateEspecialidad
	@Nombre varchar(100),
	@Descripcion varchar(200),
	@AreaID int,
	@EspecialidadID int
as
	begin
		update Especialidades set Nombre = @Nombre, Descripcion = @Descripcion, AreaID = @AreaID
		where EspecialidadID = @EspecialidadID
	end
go

create procedure spDeleteEspecialidad
	@EspecialidadID int
as
	begin
		delete from Especialidades
		where EspecialidadID = @EspecialidadID
	end
go

CREATE OR ALTER PROCEDURE spGetEspecialidadByID
    @EspecialidadID int
AS
BEGIN
    SELECT 
        e.EspecialidadID as EspecialidadID,
        e.Nombre as Nombre,
        e.Descripcion as Descripcion,
        e.AreaID as AreaID  -- Return AreaID instead of Area name
    FROM Especialidades e
    WHERE e.EspecialidadID = @EspecialidadID
END
GO