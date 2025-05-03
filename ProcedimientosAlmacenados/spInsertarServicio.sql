-- Insertar Servicio

-- AreaID -> Areas

create procedure spInsertarServicio
    @Nombre varchar(50),
    @Descripcion varchar(255) = null,
    @PrecioUnitario decimal(10, 2),
    @AreaID int
as
begin
    insert into Servicios (Nombre, Descripcion, PrecioUnitario, AreaID)
    values (@Nombre, @Descripcion, @PrecioUnitario, @AreaID);
end;
go