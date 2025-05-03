-- Insertar FacturaDetalle

-- FaturaID -> Factura
-- Articulos -> Articulo

create procedure spInsertarFacturaDetalle
    @FacturaID int,
    @ArticuloID int,
    @Cantidad int,
    @PrecioUnitario decimal(10, 2),
    @Descuento decimal(10, 2)
as
begin
    insert into FacturaDetalles (FacturaID, ArticuloID, Cantidad, PrecioUnitario, Descuento)
    values (@FacturaID, @ArticuloID, @Cantidad, @PrecioUnitario, @Descuento);
end;
go