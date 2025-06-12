-- LISTAR CLIENTE
IF OBJECT_ID('spListarCliente') IS NOT NULL
    DROP PROC spListarCliente
GO
CREATE PROC spListarCliente
AS
BEGIN
    SELECT IdCliente, Nombre, Apellido, Direccion
    FROM TCliente
END
GO

EXEC spListarCliente
GO


-- AGREGAR CLIENTE
IF OBJECT_ID('spAgregarCliente', 'P') IS NOT NULL
    DROP PROCEDURE spAgregarCliente
GO
CREATE PROCEDURE spAgregarCliente
    @IdCliente INT, 
    @Nombre VARCHAR(100), 
    @Apellido VARCHAR(100), 
    @Telefono VARCHAR(15), 
    @Correo VARCHAR(100), 
    @Direccion VARCHAR(200)
AS
BEGIN
    -- Verificar si el IdCliente no está duplicado
    IF NOT EXISTS (SELECT IdCliente FROM TCliente WHERE IdCliente = @IdCliente)
    BEGIN
        INSERT INTO TCliente (Nombre, Apellido, Telefono, Correo, Direccion) 
        VALUES (@Nombre, @Apellido, @Telefono, @Correo, @Direccion)
        SELECT CodError = 0, Mensaje = 'Correcto, cliente insertado'
    END
    ELSE 
        SELECT CodError = 1, Mensaje = 'Error: IdCliente duplicado'
END
GO


-- ELIMINAR CLIENTE
IF OBJECT_ID('spEliminarCliente', 'P') IS NOT NULL
    DROP PROC spEliminarCliente
GO
CREATE PROC spEliminarCliente
    @IdCliente INT
AS
BEGIN
    -- Verificar si el cliente existe
    IF EXISTS (SELECT IdCliente FROM TCliente WHERE IdCliente = @IdCliente)
    BEGIN
        -- Verificar si el cliente está relacionado con alguna reserva
        IF EXISTS (SELECT IdCliente FROM TReserva WHERE IdCliente = @IdCliente)
        BEGIN
            -- Si está relacionado, no eliminar y dar mensaje de error
            SELECT CodError = 1, Mensaje = 'Error: El cliente está relacionado con reservas y no se puede eliminar'
        END
        ELSE
        BEGIN
            -- Eliminar el cliente si no está relacionado
            DELETE FROM TCliente WHERE IdCliente = @IdCliente
            SELECT CodError = 0, Mensaje = 'Correcto, cliente eliminado'
        END
    END
    ELSE 
        SELECT CodError = 1, Mensaje = 'Error: El cliente no existe'
END
GO



-- ACTUALIZAR CLIENTE
IF OBJECT_ID('spActualizarCliente', 'P') IS NOT NULL
    DROP PROC spActualizarCliente
GO
CREATE PROC spActualizarCliente
    @IdCliente INT,
    @NuevoNombre VARCHAR(100),
    @NuevoApellido VARCHAR(100),
    @NuevoTelefono VARCHAR(15),
    @NuevoCorreo VARCHAR(100),
    @NuevaDireccion VARCHAR(200)
AS
BEGIN
    -- Verificar si el cliente existe
    IF EXISTS (SELECT IdCliente FROM TCliente WHERE IdCliente = @IdCliente)
    BEGIN
        -- Actualizar los campos del cliente
        UPDATE TCliente
        SET Nombre = @NuevoNombre, 
            Apellido = @NuevoApellido, 
            Telefono = @NuevoTelefono, 
            Correo = @NuevoCorreo, 
            Direccion = @NuevaDireccion
        WHERE IdCliente = @IdCliente

        SELECT CodError = 0, Mensaje = 'Cliente actualizado correctamente'
    END
    ELSE
    BEGIN
        SELECT CodError = 1, Mensaje = 'Error: El cliente no existe'
    END
END
GO


-- BUSCAR CLIENTE
IF OBJECT_ID('spBuscarCliente', 'P') IS NOT NULL
    DROP PROC spBuscarCliente
GO
CREATE PROC spBuscarCliente
    @Texto VARCHAR(50), 
    @Criterio VARCHAR(10)
AS
BEGIN
    IF (@Criterio = 'IdCliente')
        -- Búsqueda exacta por IdCliente
        SELECT IdCliente, Nombre, Apellido, Direccion 
        FROM TCliente
        WHERE IdCliente = @Texto
    ELSE IF (@Criterio = 'Nombre')
        -- Búsqueda sensitiva por Nombre
        SELECT Nombre, Apellido, Direccion
        FROM TCliente
        WHERE Nombre LIKE '%' + @Texto + '%'
    ELSE IF (@Criterio = 'Apellido')
        -- Búsqueda sensitiva por Apellido
        SELECT Nombre, Apellido, Direccion
        FROM TCliente
        WHERE Apellido LIKE '%' + @Texto + '%'
    ELSE IF (@Criterio = 'Direccion')
        -- Búsqueda sensitiva por Dirección
        SELECT Nombre, Apellido, Direccion
        FROM TCliente
        WHERE Direccion LIKE '%' + @Texto + '%'
END
GO


--Procedimeintos xd
-- Ejecutar el procedimiento para listar todos los clientes
EXEC spListarCliente
GO

-- Ejecutar el procedimiento para agregar un cliente
EXEC spAgregarCliente 
    @IdCliente = 21, 
    @Nombre = 'Juan', 
    @Apellido = 'Perez', 
    @Telefono = '987654321', 
    @Correo = 'juanperez@email.com', 
    @Direccion = 'Calle Ficticia 123'
GO

-- Ejecutar el procedimiento para eliminar un cliente con IdCliente = 1
EXEC spEliminarCliente @IdCliente = 21
GO

-- Ejecutar el procedimiento para actualizar un cliente con IdCliente = 1
EXEC spActualizarCliente 
    @IdCliente = 1, 
    @NuevoNombre = 'Carlos', 
    @NuevoApellido = 'Gonzales', 
    @NuevoTelefono = '987654322', 
    @NuevoCorreo = 'carlosgonzales@email.com', 
    @NuevaDireccion = 'Avenida Central 456'
GO

-- Ejecutar el procedimiento para buscar un cliente por Nombre
EXEC spBuscarCliente 
    @Texto = 'Carlos', 
    @Criterio = 'Nombre'
GO

-- Ejecutar el procedimiento para buscar un cliente por Apellido
EXEC spBuscarCliente 
    @Texto = 'Perez', 
    @Criterio = 'Apellido'
GO
