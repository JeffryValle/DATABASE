
CREATE OR ALTER PROCEDURE spBuscarEmpleado
    @Columna VARCHAR(50),
    @Texto VARCHAR(150)
AS
BEGIN
    DECLARE @buscarTexto VARCHAR(150)
    SET @buscarTexto = '%' + @Texto + '%'

    SELECT 
        e.EmpleadoID as Empleado,
        (e.Nombre + ' ' + e.Apellido) as Nombre,
        e.Telefono as Telefono,
        e.Correo as Correo,
        e.Direccion as Direccion,
        es.Nombre as Especialidad,
        a.Nombre as Area
    FROM Empleados e
    INNER JOIN Especialidades es ON es.EspecialidadID = e.EspecialidadID
    INNER JOIN Areas a ON a.AreaID = e.AreaID
    WHERE 
        (@Columna = 'Empleado' AND CAST(e.EmpleadoID AS VARCHAR) LIKE @buscarTexto) OR
        (@Columna = 'Nombre' AND (e.Nombre + ' ' + e.Apellido) LIKE @buscarTexto) OR
        (@Columna = 'Telefono' AND e.Telefono LIKE @buscarTexto) OR
        (@Columna = 'Correo' AND e.Correo LIKE @buscarTexto) OR
        (@Columna = 'Direccion' AND e.Direccion LIKE @buscarTexto) OR
        (@Columna = 'Especialidad' AND es.Nombre LIKE @buscarTexto) OR
        (@Columna = 'Area' AND a.Nombre LIKE @buscarTexto)
END
GO
use DB20212000673

CREATE OR ALTER PROCEDURE spBuscarEspecialidadd
    @Columna VARCHAR(50), 
    @Texto VARCHAR(150)
AS
BEGIN
    DECLARE @buscarTexto VARCHAR(150)
    SET @buscarTexto = '%' + @Texto + '%'

    SELECT 
		e.EspecialidadID EspecialidadID,
		e.Nombre Nombre,
		e.Descripcion Descripcion,
		a.Nombre as Area
    FROM Especialidades e
	inner join Areas a on a.AreaID = e.AreaID
    WHERE 
        ((@Columna = 'Especialidad' OR @Columna = 'ID') AND CAST(e.EspecialidadID AS VARCHAR) LIKE @buscarTexto) OR
        (@Columna = 'Nombre' AND e.Nombre LIKE @buscarTexto) OR
        (@Columna = 'Descripcion' AND e.Descripcion LIKE @buscarTexto) OR
        ((@Columna = 'Area' OR @Columna = 'AreaID') AND CAST(a.Nombre AS VARCHAR) LIKE @buscarTexto)
END
GO

select * from Especialidades
go

CREATE OR ALTER PROCEDURE spBuscarMascota
    @Columna VARCHAR(50),
    @Texto VARCHAR(150)
AS
BEGIN
    DECLARE @buscarTexto VARCHAR(150)
    SET @buscarTexto = '%' + @Texto + '%'

    SELECT 
        m.MascotaID as Mascota,
        m.Nombre as Nombre,
        e.Nombre as Especie,
        e.EspecieID as EspecieID,  -- Added for consistency
        e.Detalles as Detalles,
        (c.Nombre + ' ' + c.Apellido) as Propietario,
        c.ClienteID as ClienteID,  -- Added for consistency
        m.FechaNacimiento as Nacimiento,
        m.Sexo as Sexo,
        m.Raza as Raza,
        m.Fecha as Fecha
    FROM Mascotas m
    INNER JOIN Especies e ON e.EspecieID = m.EspecieID
    INNER JOIN Clientes c ON c.ClienteID = m.ClienteID
    WHERE 
        (@Columna = 'Nombre' AND m.Nombre LIKE @buscarTexto) OR
        (@Columna = 'Especie' AND e.Nombre LIKE @buscarTexto) OR
        (@Columna = 'Detalles' AND e.Detalles LIKE @buscarTexto) OR
        (@Columna = 'Propietario' AND (c.Nombre + ' ' + c.Apellido) LIKE @buscarTexto) OR
        (@Columna = 'Nacimiento' AND CAST(m.FechaNacimiento AS VARCHAR) LIKE @buscarTexto) OR
        (@Columna = 'Sexo' AND m.Sexo LIKE @buscarTexto) OR
        (@Columna = 'Raza' AND m.Raza LIKE @buscarTexto) OR
        (@Columna = 'Fecha' AND CAST(m.Fecha AS VARCHAR) LIKE @buscarTexto)
END
GO


select * from Clientes
go

CREATE OR ALTER PROCEDURE spBuscarCliente
    @Columna VARCHAR(50),
    @Texto VARCHAR(150)
AS
BEGIN
    DECLARE @buscarTexto VARCHAR(150)
    SET @buscarTexto = '%' + @Texto + '%'

    SELECT 
        ClienteID,
        Nombre,
        Apellido,
        Telefono,
        Correo,
        Direccion
    FROM Clientes
    WHERE 
        (@Columna = 'Nombre' AND (Nombre + ' ' + Apellido) LIKE @buscarTexto) OR
        (@Columna = 'Apellido' AND Apellido LIKE @buscarTexto) OR
        (@Columna = 'Telefono' AND Telefono LIKE @buscarTexto) OR
        (@Columna = 'Correo' AND Correo LIKE @buscarTexto) OR
        (@Columna = 'Direccion' AND Direccion LIKE @buscarTexto) OR
        ((@Columna = 'ClienteID' OR @Columna = 'Cliente') AND CAST(ClienteID AS VARCHAR) LIKE @buscarTexto)
END
GO

select * from Clientes
go


CREATE OR ALTER PROCEDURE spBuscarVehiculo 
    @Columna VARCHAR(50), 
    @Texto VARCHAR(150)
AS
BEGIN
    DECLARE @buscarTexto VARCHAR(150)
    SET @buscarTexto = '%' + @Texto + '%'

    SELECT 
		v.VehiculoID VehiculoID,
		v.Placa Placa,
		v.Marca Marca,
		v.Modelo Modelo,
		v.Estado Estado,
		(e.Nombre + ' ' + e.Apellido) as Empleado
    FROM Vehiculos v
	INNER JOIN Empleados e ON e.EmpleadoID = v.EmpleadoID
    WHERE 
        (@Columna = 'Placa' AND v.Placa LIKE @buscarTexto) OR
        (@Columna = 'Marca' AND v.Marca LIKE @buscarTexto) OR
        (@Columna = 'Modelo' AND v.Modelo LIKE @buscarTexto) OR
        (@Columna = 'Estado' AND v.Estado LIKE @buscarTexto) or
        (@Columna = 'Empleado' AND (e.Nombre + ' ' + e.Apellido) LIKE @buscarTexto)
END
GO

select * from Empleados
go

CREATE OR ALTER PROCEDURE spBuscarArea
    @Columna VARCHAR(50),
    @Texto VARCHAR(150)
AS
BEGIN
    DECLARE @buscarTexto VARCHAR(150)
    SET @buscarTexto = '%' + @Texto + '%'

    SELECT 
        AreaID,
        Nombre,
        Descripcion
    FROM Areas
    WHERE 
        ((@Columna = 'Area' OR @Columna = 'AreaID') AND CAST(AreaID AS VARCHAR) LIKE @buscarTexto) or
        (@Columna = 'Nombre' AND Nombre  LIKE @buscarTexto) OR
        (@Columna = 'Descripcion' AND Descripcion LIKE @buscarTexto)
END
GO


CREATE OR ALTER PROCEDURE spBuscarSala
    @Columna VARCHAR(50),
    @Texto VARCHAR(150)
AS
BEGIN
    DECLARE @buscarTexto VARCHAR(150)
    SET @buscarTexto = '%' + @Texto + '%'

    SELECT 
		s.SalaID SalaID,
		s.Nombre Nombre,
		a.Nombre as Area,
		s.Estado Estado
    FROM Salas s
	inner join Areas a on a.AreaID = s.AreaID
    WHERE 
        ((@Columna = 'Sala' OR @Columna = 'SalaID') AND CAST(s.SalaID AS VARCHAR) LIKE @buscarTexto) or
        (@Columna = 'Nombre' AND s.Nombre  LIKE @buscarTexto) OR
		((@Columna = 'Area' OR @Columna = 'AreaID') AND CAST(a.Nombre AS VARCHAR) LIKE @buscarTexto) or
        (@Columna = 'Estado' AND s.Estado LIKE @buscarTexto)
END
GO

select * from Salas
select * from Areas