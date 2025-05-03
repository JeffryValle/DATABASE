-- Insertar una Especie

create procedure spInsertarEspecie @Nombre varchar(50), @Detalles varchar(255) = null
as
	begin
		insert into Especies (Nombre, Detalles)
		values (@Nombre, @Detalles)
	end
go

create procedure spSelectEspecie 
as
	begin
		select EspecieID, Nombre, Detalles 
		from Especies
	end
go


select * from Mascotas
