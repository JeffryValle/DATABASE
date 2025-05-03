-- Insertar Sala

-- AreaID -> Areas

create procedure spInsertarSala
    @Nombre varchar(50),
    @AreaID int,
    @Estado varchar(20)
as
	begin
		insert into Salas (Nombre, AreaID, Estado)
		values (@Nombre, @AreaID, @Estado);
	end;
go

CREATE OR ALTER PROCEDURE spSelectSala
AS
BEGIN
    SELECT 
        s.SalaID,
        s.Nombre,
        a.Nombre AS Area,  -- Get the Area name instead of AreaID
        s.Estado
    FROM Salas s
    INNER JOIN Areas a ON a.AreaID = s.AreaID
END
GO

create procedure spUpdateSala
	@Nombre	varchar(100),
	@AreaID	int,
	@Estado varchar(15),
	@SalaID int
as
	begin
		update Salas set Nombre = @Nombre, AreaID = @AreaID, Estado = @Estado
		where SalaID = @SalaID
	end
go

create procedure spDeleteSala
	@SalaID int
as
	begin
		delete from Salas
		where SalaID = @SalaID
	end
go

create or alter procedure spGetSalaByID
    @SalaID int
as
begin
		SELECT 
        s.SalaID as SalaID,
        s.Nombre as Nombre,
        s.AreaID as AreaID,  
        s.Estado as Estado
    FROM Salas s
    WHERE SalaID = @SalaID
end
go

select * from Salas

CREATE OR ALTER PROCEDURE spBuscarSala
    @Columna VARCHAR(50),
    @Texto VARCHAR(150)
AS
BEGIN
    DECLARE @buscarTexto VARCHAR(150)
    SET @buscarTexto = '%' + @Texto + '%'

		SELECT 
		s.SalaID as SalaID,
		s.Nombre as Nombre,
		a.Nombre as Area,
		s.Estado as Estado
	FROM Salas s
	INNER JOIN Areas a ON a.AreaID = s.AreaID
	WHERE 
		((@Columna = 'Sala' OR @Columna = 'SalaID') AND CAST(s.SalaID AS VARCHAR) LIKE @buscarTexto) OR
		(@Columna = 'Nombre' AND s.Nombre LIKE @buscarTexto) OR
		((@Columna = 'Area' OR @Columna = 'AreaID') AND CAST(a.AreaID AS VARCHAR) LIKE @buscarTexto) OR
		(@Columna = 'Estado' AND s.Estado LIKE @buscarTexto)
END
GO