-- Insertar Compra Detalle

-- CompraID -> Compras
-- Articulos -> Articulos

create procedure spInsertarCompraDetalle
    @CompraID int,
    @ArticuloID int,
    @Cantidad int,
    @Costo decimal(10, 2)
as
begin
    insert into ComprasDetalles (CompraID, ArticuloID, Cantidad, Costo)
    values (@CompraID, @ArticuloID, @Cantidad, @Costo);
end;
go