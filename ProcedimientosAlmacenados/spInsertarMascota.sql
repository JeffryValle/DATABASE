-- Insertar Mascota

use DB20212000673
go

-- EspecieID -> Especies
-- ClienteID -> Clientes

create or alter procedure spInsertarMascota
    @Nombre varchar(50),
    @ClienteID int,
    @EspecieID int,
    @FechaNacimiento date,
    @Sexo varchar(10),
    @Raza varchar(50)
as
	begin
		insert into Mascotas (Nombre, ClienteID, EspecieID, FechaNacimiento, Sexo, Raza, Fecha)
		values (@Nombre, @ClienteID, @EspecieID, @FechaNacimiento, @Sexo, @Raza, GETDATE());
	end
go

create or alter procedure spSelectMascota
as
	begin
		select MascotaID, Nombre, EspecieID, ClienteID, FechaNacimiento, Sexo, Raza
		from Mascotas
	end
go

select * from Mascotas
go

CREATE OR ALTER PROCEDURE spInsertarMascota
    @Nombre NVARCHAR(50),
    @ClienteID INT,
    @EspecieID INT,
    @RazaID INT,
    @FechaNacimiento DATE,
    @Sexo NVARCHAR(10)
AS
BEGIN
    INSERT INTO Mascotas (Nombre, ClienteID, EspecieID, Raza, FechaNacimiento, Sexo)
    VALUES (@Nombre, @ClienteID, @EspecieID, @RazaID, @FechaNacimiento, @Sexo);
END;

CREATE OR ALTER PROCEDURE spUpdateMascotaa
    @MascotaID INT,
    @Nombre NVARCHAR(50),
    @ClienteID INT,
    @EspecieID INT,
    @RazaID INT,
    @FechaNacimiento DATE,
    @Sexo NVARCHAR(10)
AS
BEGIN
    UPDATE Mascotas
    SET Nombre = @Nombre,
        ClienteID = @ClienteID,
        EspecieID = @EspecieID,
        Raza = @RazaID,
        FechaNacimiento = @FechaNacimiento,
        Sexo = @Sexo
    WHERE MascotaID = @MascotaID;
END;


create or alter procedure spUpdateMascotaa
    @MascotaID int,
    @Nombre varchar(50),
    @ClienteID int,
    @EspecieID int,
    @FechaNacimiento date,
    @Sexo varchar(10),
    @Raza varchar(50)
as
begin
    update Mascotas
    set 
        Nombre = @Nombre,
        ClienteID = @ClienteID,
        EspecieID = @EspecieID,
        FechaNacimiento = @FechaNacimiento,
        Sexo = @Sexo,
        Raza = @Raza,
        Fecha = GETDATE()
    where MascotaID = @MascotaID;
end
go

create or alter procedure spDeleteMascota @MascotaID int
as
	begin
		delete from Mascotas
		where MascotaID = @MascotaID
	end
go

select * from Mascotas

create or alter procedure spSelectMascota
as
begin
    select 
        m.MascotaID as Mascota,
        m.Nombre as Nombre,
        e.Nombre as Especie,
        e.EspecieID as EspecieID,  -- Add EspecieID
        e.Detalles as Detalles,
        (c.Nombre + ' ' + c.Apellido) as Propietario,
        c.ClienteID as ClienteID,  -- Add ClienteID
        m.FechaNacimiento as Nacimiento,
        m.Sexo as Sexo,
        m.Raza as Raza,
        m.Fecha as Fecha
    from Mascotas m
    inner join Especies as e on e.EspecieID = m.EspecieID
    inner join Clientes as c on c.ClienteID = m.ClienteID
end
go


create or alter procedure spGetMascotaByID
    @MascotaID int
as
begin
    select 
        m.MascotaID,
        m.Nombre,
        m.ClienteID,
        m.EspecieID,
        m.FechaNacimiento,
        m.Sexo,
        m.Raza RazaID
    from Mascotas m
	inner join Razas r on r.RazaID = m.MA
    where m.MascotaID = @MascotaID
end
go

select * from Razas

