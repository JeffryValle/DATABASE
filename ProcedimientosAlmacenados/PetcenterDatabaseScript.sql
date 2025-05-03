

CREATE TABLE Clientes (
    ClienteID     INT IDENTITY(1,1),
    Nombre        NVARCHAR(50) NOT NULL,
    Apellido      NVARCHAR(50) NOT NULL,
    Telefono      NVARCHAR(15) NOT NULL,
    Correo        NVARCHAR(100) NOT NULL,
    Direccion     NVARCHAR(255) NOT NULL,

    CONSTRAINT PK_Clientes PRIMARY KEY (ClienteID),
);
GO

CREATE TABLE Especies (
    EspecieID     INT IDENTITY(1,1),
    Nombre        NVARCHAR(50) NOT NULL UNIQUE,
    Detalles     NVARCHAR(255) NULL,

    CONSTRAINT PK_Especies PRIMARY KEY (EspecieID),
);
GO
--alter table Mascotas alter column FechaNacimiento varchar(50)
drop table Mascotas
CREATE TABLE Mascotas (
    MascotaID     INT IDENTITY(1,1),
    Nombre        NVARCHAR(50) NOT NULL,
    EspecieID     INT NOT NULL,
    ClienteID     INT NOT NULL,
    FechaNacimiento varchar(50) NOT NULL,
    Sexo          NVARCHAR(10) NOT NULL CHECK (Sexo IN ('Macho', 'Hembra')),
    Raza          NVARCHAR(50) NOT NULL,

    CONSTRAINT PK_Mascotas PRIMARY KEY (MascotaID),
    CONSTRAINT FK_Mascotas_Especies FOREIGN KEY (EspecieID) REFERENCES Especies (EspecieID),
    CONSTRAINT FK_Mascotas_Clientes FOREIGN KEY (ClienteID) REFERENCES Clientes (ClienteID),
);
GO
CREATE TABLE Proveedores (
    ProveedorID   INT IDENTITY(1,1),
    Nombre        NVARCHAR(50) NOT NULL,
    Telefono      NVARCHAR(15) NOT NULL,
    Correo        NVARCHAR(100) NOT NULL,
    Direccion     NVARCHAR(255) NOT NULL,

    CONSTRAINT PK_Proveedores PRIMARY KEY (ProveedorID),
);
GO  
CREATE TABLE Articulos (
    ArticuloID    INT IDENTITY(1,1),
    Nombre        NVARCHAR(50) NOT NULL,
    Descripcion   NVARCHAR(255) NULL,
    Precio        DECIMAL(10, 2) NOT NULL,
    ProveedorID   INT NOT NULL,

    CONSTRAINT PK_Articulos PRIMARY KEY (ArticuloID),
    CONSTRAINT FK_Articulos_Proveedores FOREIGN KEY (ProveedorID) REFERENCES Proveedores (ProveedorID),
);
GO
CREATE TABLE Areas (
    AreaID        INT IDENTITY(1,1),
    Nombre        NVARCHAR(50) NOT NULL,
    Descripcion   NVARCHAR(255) NULL,

    CONSTRAINT PK_Areas PRIMARY KEY (AreaID),
);
GO
CREATE TABLE Salas(
    SalaID        INT IDENTITY(1,1),
    Nombre        NVARCHAR(50) NOT NULL,
    AreaID        INT NOT NULL,
    Estado       NVARCHAR(20) NOT NULL CHECK (Estado IN ('Disponible', 'Ocupada')),

    CONSTRAINT PK_Salas PRIMARY KEY (SalaID),
    CONSTRAINT FK_Salas_Areas FOREIGN KEY (AreaID) REFERENCES Areas (AreaID),
);
GO
CREATE TABLE Cuentas(
    CuentaID     INT IDENTITY(1,1),
    NumCuenta     NVARCHAR(30) NOT NULL,
    Banco         NVARCHAR(50) NOT NULL,
    Titular       NVARCHAR(50) NOT NULL,

    CONSTRAINT PK_Cuentas PRIMARY KEY (CuentaID),
    CONSTRAINT UQ_Cuentas_NumCuenta UNIQUE (NumCuenta, Banco),
);
GO

CREATE TABLE Especialidades(
    EspecialidadID INT IDENTITY(1,1),
    Nombre         NVARCHAR(50) NOT NULL,
    Descripcion    NVARCHAR(255) NULL,
    AreaID        INT NOT NULL,

    CONSTRAINT PK_Especialidades PRIMARY KEY (EspecialidadID),
    CONSTRAINT FK_Especialidades_Areas FOREIGN KEY (AreaID) REFERENCES Areas (AreaID),
    CONSTRAINT UQ_Especialidades_Nombre UNIQUE (Nombre, AreaID),
);
GO
CREATE TABLE Empleados(
    EmpleadoID     INT IDENTITY(1,1),
    Nombre         NVARCHAR(50) NOT NULL,
    Apellido       NVARCHAR(50) NOT NULL,
    Telefono       NVARCHAR(15) NOT NULL,
    Correo         NVARCHAR(100) NOT NULL,
    Direccion      NVARCHAR(255) NOT NULL,
    EspecialidadID INT NOT NULL,
    AreaID        INT NOT NULL,

    CONSTRAINT PK_Empleados PRIMARY KEY (EmpleadoID),
    CONSTRAINT FK_Empleados_Especialidades FOREIGN KEY (EspecialidadID) REFERENCES Especialidades (EspecialidadID),
    CONSTRAINT FK_Empleados_Areas FOREIGN KEY (AreaID) REFERENCES Areas (AreaID),
);
GO
CREATE TABLE Vehiculos(
    VehiculoID     INT IDENTITY(1,1),
    Placa          NVARCHAR(10) NOT NULL,
    Marca          NVARCHAR(50) NOT NULL,
    Modelo         NVARCHAR(50) NOT NULL,
    Estado         NVARCHAR(20) NOT NULL CHECK (Estado IN ('Disponible', 'Ocupado')),
    EmpleadoID     INT NOT NULL,

    CONSTRAINT PK_Vehiculos PRIMARY KEY (VehiculoID),
    CONSTRAINT UQ_Vehiculos_Placa UNIQUE (Placa),
    CONSTRAINT FK_Vehiculos_Empleados FOREIGN KEY (EmpleadoID) REFERENCES Empleados (EmpleadoID),
);
GO
CREATE TABLE Servicios(
    ServicioID     INT IDENTITY(1,1),
    Nombre         NVARCHAR(50) NOT NULL,
    Descripcion    NVARCHAR(255) NULL,
    PrecioUnitario         DECIMAL(10, 2) NOT NULL,
    AreaID        INT NOT NULL,

    CONSTRAINT PK_Servicios PRIMARY KEY (ServicioID),
    CONSTRAINT FK_Servicios_Areas FOREIGN KEY (AreaID) REFERENCES Areas (AreaID),
    CONSTRAINT UQ_Servicios_Nombre UNIQUE (Nombre, AreaID),
);
GO
CREATE TABLE ServiciosEspecies(
    ServiciosEspeciesID INT IDENTITY(1,1),
    ServicioID     INT NOT NULL,
    EspecieID      INT NOT NULL,

    CONSTRAINT PK_ServiciosEspecies PRIMARY KEY (ServiciosEspeciesID),
    CONSTRAINT FK_ServiciosEspecies_Servicios FOREIGN KEY (ServicioID) REFERENCES Servicios (ServicioID),
    CONSTRAINT FK_ServiciosEspecies_Especies FOREIGN KEY (EspecieID) REFERENCES Especies (EspecieID),
);
GO

CREATE TABLE Factura (
    FacturaID      INT IDENTITY(1,1),
    ClienteID      INT NOT NULL,
    Fecha          DATETIME NOT NULL DEFAULT GETDATE(),
    Subtotal       DECIMAL(10, 2) NOT NULL,
    Impuesto       as cast(Subtotal * 0.15 as decimal(10,2)),
    Total          as cast(Subtotal + (Subtotal * 0.15) as decimal(10,2),
    Estado         NVARCHAR(20) NOT NULL CHECK (Estado IN ('Pagada', 'Pendiente')),
    MetodoPago     NVARCHAR(20) NOT NULL CHECK (MetodoPago IN ('Efectivo', 'Tarjeta', 'Transferencia')),
    CuentaID      INT NULL,

    CONSTRAINT PK_Factura PRIMARY KEY (FacturaID),
    CONSTRAINT FK_Factura_Clientes FOREIGN KEY (ClienteID) REFERENCES Clientes (ClienteID),
);
GO
CREATE TABLE FacturaDetalles (
    FacturaDetalleID INT IDENTITY(1,1),
    FacturaID      INT NOT NULL,
    ArticuloID     INT NOT NULL,
    Cantidad       INT NOT NULL,
    PrecioUnitario DECIMAL(10, 2) NOT NULL,
    Descuento      DECIMAL(10, 2) NOT NULL,

    CONSTRAINT PK_FacturaDetalles PRIMARY KEY (FacturaDetalleID),
    CONSTRAINT FK_FacturaDetalles_Factura FOREIGN KEY (FacturaID) REFERENCES Factura (FacturaID),
    CONSTRAINT FK_FacturaDetalles_Articulos FOREIGN KEY (ArticuloID) REFERENCES Articulos (ArticuloID),
);
GO
CREATE TABLE ServiciosHospedaje(
    ServicioHospedajeID INT IDENTITY(1,1),
    ServicioID     INT NOT NULL,
    FacturaID      INT NOT NULL,
    MascotaID      INT NOT NULL,
    FechaInicio    DATETIME NOT NULL,
    FechaFin       DATETIME NOT NULL,
    Costo          DECIMAL(10, 2) NOT NULL,
    EmpleadoID     INT NOT NULL,

    CONSTRAINT PK_ServiciosHospedaje PRIMARY KEY (ServicioHospedajeID),
    CONSTRAINT FK_ServiciosHospedaje_Factura FOREIGN KEY (FacturaID) REFERENCES Factura (FacturaID),
    CONSTRAINT FK_ServiciosHospedaje_Mascotas FOREIGN KEY (MascotaID) REFERENCES Mascotas (MascotaID),
);

alter table Horarios alter column Hora varchar(5);
CREATE TABLE Horarios(
    HorarioID      INT IDENTITY(1,1),
    Hora           NVARCHAR(5) NOT NULL,
    Tipo          NVARCHAR(20) NOT NULL CHECK (Tipo IN ('Comida', 'Medicamente')),
    Descripcion    NVARCHAR(255) NULL,
    MascotaID      INT NOT NULL,
    EmpleadoID     INT NOT NULL,
    ServicioHospedajeID INT NOT NULL,

    CONSTRAINT PK_Horarios PRIMARY KEY (HorarioID),
    CONSTRAINT FK_Horarios_Mascotas FOREIGN KEY (MascotaID) REFERENCES Mascotas (MascotaID),
    CONSTRAINT FK_Horarios_Empleados FOREIGN KEY (EmpleadoID) REFERENCES Empleados (EmpleadoID),
    CONSTRAINT FK_Horarios_ServiciosHospedaje FOREIGN KEY (ServicioHospedajeID) REFERENCES ServiciosHospedaje (ServicioHospedajeID),
);
GO
CREATE TABLE ServiciosMedicos(
    ServicioMedicoID INT IDENTITY(1,1),
    ServicioID     INT NOT NULL,
    FacturaID      INT NOT NULL,
    MascotaID      INT NOT NULL,
    NecesitaInternar BIT NOT NULL,
    Fecha          DATETIME NOT NULL,
    Costo          DECIMAL(10, 2) NOT NULL,
    EmpleadoID     INT NOT NULL,
    SalaID       INT NOT NULL,

    CONSTRAINT PK_ServiciosMedicos PRIMARY KEY (ServicioMedicoID),
    CONSTRAINT FK_ServiciosMedicos_Factura FOREIGN KEY (FacturaID) REFERENCES Factura (FacturaID),
    CONSTRAINT FK_ServiciosMedicos_Mascotas FOREIGN KEY (MascotaID) REFERENCES Mascotas (MascotaID),
    CONSTRAINT FK_ServiciosMedicos_Empleados FOREIGN KEY (EmpleadoID) REFERENCES Empleados (EmpleadoID),
    CONSTRAINT FK_ServiciosMedicos_Salas FOREIGN KEY (SalaID) REFERENCES Salas (SalaID),
);
GO
CREATE TABLE ServiciosEsteticos (
    ServicioEsteticoID INT IDENTITY(1,1),
    ServicioID     INT NOT NULL,
    FacturaID      INT NOT NULL,
    MascotaID      INT NOT NULL,
    Fecha          DATETIME NOT NULL,
    Costo          DECIMAL(10, 2) NOT NULL,
    EmpleadoID     INT NOT NULL,

    CONSTRAINT PK_ServiciosEsteticos PRIMARY KEY (ServicioEsteticoID),
    CONSTRAINT FK_ServiciosEsteticos_Factura FOREIGN KEY (FacturaID) REFERENCES Factura (FacturaID),
    CONSTRAINT FK_ServiciosEsteticos_Mascotas FOREIGN KEY (MascotaID) REFERENCES Mascotas (MascotaID),
    CONSTRAINT FK_ServiciosEsteticos_Empleados FOREIGN KEY (EmpleadoID) REFERENCES Empleados (EmpleadoID),
);
GO
CREATE TABLE ServiciosTransportes (
    ServicioTransporteID INT IDENTITY(1,1),
    FacturaID      INT NOT NULL,
    MascotaID      INT NOT NULL,
    ServicioID     INT NOT NULL,
    Fecha          DATETIME NOT NULL,
    Costo          DECIMAL(10, 2) NOT NULL,
    Distancia      DECIMAL(10, 2) NOT NULL, -- Distancia en kilómetros
    Detalles       NVARCHAR(255) NULL,
    Estado         NVARCHAR(20) NOT NULL CHECK (Estado IN ('Pendiente', 'Completado')),
    EmpleadoID     INT NOT NULL,
    VehiculoID     INT NOT NULL,

    CONSTRAINT PK_ServiciosTransportes PRIMARY KEY (ServicioTransporteID),
    CONSTRAINT FK_ServiciosTransportes_Factura FOREIGN KEY (FacturaID) REFERENCES Factura (FacturaID),
    CONSTRAINT FK_ServiciosTransportes_Mascotas FOREIGN KEY (MascotaID) REFERENCES Mascotas (MascotaID),
    CONSTRAINT FK_ServiciosTransportes_Empleados FOREIGN KEY (EmpleadoID) REFERENCES Empleados (EmpleadoID),
    CONSTRAINT FK_ServiciosTransportes_Vehiculos FOREIGN KEY (VehiculoID) REFERENCES Vehiculos (VehiculoID),
    CONSTRAINT FK_ServiciosTransportes_Servicios FOREIGN KEY (ServicioID) REFERENCES Servicios (ServicioID),
);
GO
CREATE TABLE Compras(
    CompraID       INT IDENTITY(1,1),
    ProveedorID    INT NOT NULL,
    Fecha          DATETIME NOT NULL DEFAULT GETDATE(),
    Total          DECIMAL(10, 2) NOT NULL,
    Estado         NVARCHAR(20) NOT NULL CHECK (Estado IN ('Pendiente', 'Completado')),

    CONSTRAINT PK_Compras PRIMARY KEY (CompraID),
    CONSTRAINT FK_Compras_Proveedores FOREIGN KEY (ProveedorID) REFERENCES Proveedores (ProveedorID),
);
GO
CREATE TABLE ComprasDetalles(
    CompraDetalleID INT IDENTITY(1,1),
    CompraID       INT NOT NULL,
    ArticuloID     INT NOT NULL,
    Cantidad       INT NOT NULL,
    Costo DECIMAL(10, 2) NOT NULL,

    CONSTRAINT PK_ComprasDetalles PRIMARY KEY (CompraDetalleID),
    CONSTRAINT FK_ComprasDetalles_Compras FOREIGN KEY (CompraID) REFERENCES Compras (CompraID),
    CONSTRAINT FK_ComprasDetalles_Articulos FOREIGN KEY (ArticuloID) REFERENCES Articulos (ArticuloID),
);
GO
CREATE TABLE Pagos(
    PagoID         INT IDENTITY(1,1),
    CompraID       INT NULL,
    Descripcion    NVARCHAR(255) NULL,
    Fecha          DATETIME NOT NULL DEFAULT GETDATE(),
    Monto          DECIMAL(10, 2) NOT NULL,
    MetodoPago     NVARCHAR(20) NOT NULL CHECK (MetodoPago IN ('Efectivo', 'Tarjeta', 'Transferencia')),
    CuentaID      INT NULL,

    CONSTRAINT PK_Pagos PRIMARY KEY (PagoID),
    CONSTRAINT FK_Pagos_Compras FOREIGN KEY (CompraID) REFERENCES Compras (CompraID),
    CONSTRAINT FK_Pagos_Cuentas FOREIGN KEY (CuentaID) REFERENCES Cuentas (CuentaID),
);
GO
CREATE TABLE Citas (
    CitaID         INT IDENTITY(1,1),
    MascotaID      INT NOT NULL,
    Fecha          varchar(50) NOT NULL,
    Motivo         NVARCHAR(255) NULL,
    Estado         NVARCHAR(20) NOT NULL CHECK (Estado IN ('Pendiente', 'Completada')),

    CONSTRAINT PK_Citas PRIMARY KEY (CitaID),
    CONSTRAINT FK_Citas_Mascotas FOREIGN KEY (MascotaID) REFERENCES Mascotas (MascotaID),
);
GO

CREATE TABLE FichaRecepcion (
    FichaID        INT IDENTITY(1,1),
    MascotaID      INT NOT NULL,
    Fecha          DATETIME NOT NULL DEFAULT GETDATE(),
    Motivo         NVARCHAR(255) NULL,
    Observaciones   NVARCHAR(255) NULL,
    EmpleadoID     INT NOT NULL,
    Contacto NVARCHAR(50) NULL,
    Telefono NVARCHAR(15) NULL,
    Tipo         NVARCHAR(20) NOT NULL CHECK (Tipo IN ('Emergencia', 'Cita','Atencion normal')),
    Estado         NVARCHAR(20) NOT NULL CHECK (Estado IN ('Pendiente', 'Atendido')),
    CitaID        INT NULL,


    CONSTRAINT PK_FichaRecepcion PRIMARY KEY (FichaID),
    CONSTRAINT FK_FichaRecepcion_Mascotas FOREIGN KEY (MascotaID) REFERENCES Mascotas (MascotaID),
    CONSTRAINT FK_FichaRecepcion_Empleados FOREIGN KEY (EmpleadoID) REFERENCES Empleados (EmpleadoID),
    CONSTRAINT FK_FichaRecepcion_Citas FOREIGN KEY (CitaID) REFERENCES Citas (CitaID),
);
GO
