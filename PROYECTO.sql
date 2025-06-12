-- Crear la base de datos
CREATE DATABASE PROYECTO;
GO

USE PROYECTO;
GO

-- Tabla: Usuarios (Incluye tipo directamente)
CREATE TABLE TUsuario (
    IdUsuario INT PRIMARY KEY IDENTITY(1,1),
    NombreUsuario VARCHAR(50) NOT NULL,
    Clave VARCHAR(100) NOT NULL,
    TipoUsuario VARCHAR(50) NOT NULL -- ejemplo: 'Administrador', 'Chef'
);

-- Tabla: Clientes
CREATE TABLE TCliente (
    IdCliente INT PRIMARY KEY IDENTITY(1,1),
    Nombre VARCHAR(100) NOT NULL,
    Apellido VARCHAR(100) NOT NULL,
    Telefono VARCHAR(15),
    Correo VARCHAR(100),
    Direccion VARCHAR(200)
);

-- Tabla: Empleados
CREATE TABLE TEmpleado (
    IdEmpleado INT PRIMARY KEY IDENTITY(1,1),
    Nombre VARCHAR(100) NOT NULL,
    Apellido VARCHAR(100) NOT NULL,
    Cargo VARCHAR(50),
    Telefono VARCHAR(15),
    Correo VARCHAR(100),
    IdUsuario INT,
    FOREIGN KEY (IdUsuario) REFERENCES TUsuario(IdUsuario)
);

-- Tabla: Platos (Incluye categoría directamente)
CREATE TABLE TPlato (
    IdPlato INT PRIMARY KEY IDENTITY(1,1),
    Nombre VARCHAR(100) NOT NULL,
    Descripcion VARCHAR(255),
    Precio DECIMAL(10,2) NOT NULL,
    Categoria VARCHAR(100) NOT NULL -- ejemplo: 'Entradas', 'Plato de Fondo'
);

-- Tabla: Mesas
CREATE TABLE TMesa (
    IdMesa INT PRIMARY KEY IDENTITY(1,1),
    NumeroMesa INT NOT NULL,
    Capacidad INT NOT NULL
);

-- Tabla: Reservas
CREATE TABLE TReserva (
    IdReserva INT PRIMARY KEY IDENTITY(1,1),
    Fecha DATE NOT NULL,
    Hora TIME NOT NULL,
    IdCliente INT NOT NULL,
    IdMesa INT NOT NULL,
    FOREIGN KEY (IdCliente) REFERENCES TCliente(IdCliente),
    FOREIGN KEY (IdMesa) REFERENCES TMesa(IdMesa)
);

-- Tabla: Pedidos
CREATE TABLE TPedido (
    IdPedido INT PRIMARY KEY IDENTITY(1,1),
    Fecha DATE NOT NULL,
    Hora TIME NOT NULL,
    IdCliente INT NOT NULL,
    IdEmpleado INT NOT NULL,
    FOREIGN KEY (IdCliente) REFERENCES TCliente(IdCliente),
    FOREIGN KEY (IdEmpleado) REFERENCES TEmpleado(IdEmpleado)
);

-- Tabla: Detalles del Pedido
CREATE TABLE TDetallePedido (
    IdDetallePedido INT PRIMARY KEY IDENTITY(1,1),
    IdPedido INT NOT NULL,
    IdPlato INT NOT NULL,
    Cantidad INT NOT NULL,
    PrecioUnitario DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (IdPedido) REFERENCES TPedido(IdPedido),
    FOREIGN KEY (IdPlato) REFERENCES TPlato(IdPlato)
);
