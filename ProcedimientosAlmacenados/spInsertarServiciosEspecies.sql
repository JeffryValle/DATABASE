-- Insertar ServiciosEspecies

-- ServicioID -> Servicios
-- EspecieID -> Especies

create procedure spInsertarServiciosEspecies
    @ServicioID int,
    @EspecieID int
as
begin
    insert into ServiciosEspecies (ServicioID, EspecieID)
    values (@ServicioID, @EspecieID);
end;
go