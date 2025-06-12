-- LISTAR PEDIDOS
IF OBJECT_ID('spListarPedido') IS NOT NULL
    DROP PROC spListarPedido
GO
CREATE PROCEDURE spListarPedido
AS
BEGIN
    SELECT IdPedido, Fecha, Hora, IdCliente, IdEmpleado
    FROM TPedido
END
GO

-- Ejecutar el procedimiento para listar todos los pedidos
EXEC spListarPedido
GO


-- AGREGAR PEDIDO
IF OBJECT_ID('spAgregarPedido', 'P') IS NOT NULL
    DROP PROCEDURE spAgregarPedido
GO
CREATE PROCEDURE spAgregarPedido
    @Fecha DATE, 
    @Hora TIME, 
    @IdCliente INT, 
    @IdEmpleado INT
AS
BEGIN
    -- Verificar si el cliente existe
    IF NOT EXISTS (SELECT IdCliente FROM TCliente WHERE IdCliente = @IdCliente)
    BEGIN
        SELECT CodError = 1, Mensaje = 'Error: El cliente no existe'
        RETURN
    END

    -- Verificar si el empleado existe
    IF NOT EXISTS (SELECT IdEmpleado FROM TEmpleado WHERE IdEmpleado = @IdEmpleado)
    BEGIN
        SELECT CodError = 1, Mensaje = 'Error: El empleado no existe'
        RETURN
    END

    -- Insertar nuevo pedido
    INSERT INTO TPedido (Fecha, Hora, IdCliente, IdEmpleado)
    VALUES (@Fecha, @Hora, @IdCliente, @IdEmpleado)

    SELECT CodError = 0, Mensaje = 'Pedido agregado correctamente'
END
GO

-- Ejecutar el procedimiento para agregar un pedido
EXEC spAgregarPedido 
    @Fecha = '2025-06-12', 
    @Hora = '19:30', 
    @IdCliente = 1, 
    @IdEmpleado = 2
GO


-- ELIMINAR PEDIDO
IF OBJECT_ID('spEliminarPedido', 'P') IS NOT NULL
    DROP PROC spEliminarPedido
GO
CREATE PROCEDURE spEliminarPedido
    @IdPedido INT
AS
BEGIN
    -- Verificar si el pedido existe
    IF EXISTS (SELECT IdPedido FROM TPedido WHERE IdPedido = @IdPedido)
    BEGIN
        -- Eliminar el pedido
        DELETE FROM TPedido WHERE IdPedido = @IdPedido
        SELECT CodError = 0, Mensaje = 'Pedido eliminado correctamente'
    END
    ELSE 
        SELECT CodError = 1, Mensaje = 'Error: El pedido no existe'
END
GO

-- Ejecutar el procedimiento para eliminar un pedido con IdPedido = 1
EXEC spEliminarPedido @IdPedido = 1
GO


-- ACTUALIZAR PEDIDO
IF OBJECT_ID('spActualizarPedido', 'P') IS NOT NULL
    DROP PROC spActualizarPedido
GO
CREATE PROCEDURE spActualizarPedido
    @IdPedido INT, 
    @NuevaFecha DATE, 
    @NuevaHora TIME, 
    @NuevoIdCliente INT, 
    @NuevoIdEmpleado INT
AS
BEGIN
    -- Verificar si el pedido existe
    IF EXISTS (SELECT IdPedido FROM TPedido WHERE IdPedido = @IdPedido)
    BEGIN
        -- Verificar si el nuevo cliente existe
        IF NOT EXISTS (SELECT IdCliente FROM TCliente WHERE IdCliente = @NuevoIdCliente)
        BEGIN
            SELECT CodError = 1, Mensaje = 'Error: El nuevo cliente no existe'
            RETURN
        END

        -- Verificar si el nuevo empleado existe
        IF NOT EXISTS (SELECT IdEmpleado FROM TEmpleado WHERE IdEmpleado = @NuevoIdEmpleado)
        BEGIN
            SELECT CodError = 1, Mensaje = 'Error: El nuevo empleado no existe'
            RETURN
        END

        -- Actualizar el pedido
        UPDATE TPedido
        SET Fecha = @NuevaFecha, 
            Hora = @NuevaHora, 
            IdCliente = @NuevoIdCliente, 
            IdEmpleado = @NuevoIdEmpleado
        WHERE IdPedido = @IdPedido

        SELECT CodError = 0, Mensaje = 'Pedido actualizado correctamente'
    END
    ELSE
    BEGIN
        SELECT CodError = 1, Mensaje = 'Error: El pedido no existe'
    END
END
GO

-- Ejecutar el procedimiento para actualizar un pedido con IdPedido = 1
EXEC spActualizarPedido 
    @IdPedido = 1, 
    @NuevaFecha = '2025-06-12', 
    @NuevaHora = '20:00', 
    @NuevoIdCliente = 2, 
    @NuevoIdEmpleado = 3
GO


-- BUSCAR PEDIDO
IF OBJECT_ID('spBuscarPedido', 'P') IS NOT NULL
    DROP PROC spBuscarPedido
GO
CREATE PROCEDURE spBuscarPedido
    @Texto INT, 
    @Criterio VARCHAR(10)
AS
BEGIN
    IF (@Criterio = 'IdPedido')
        -- Búsqueda exacta por IdPedido
        SELECT IdPedido, Fecha, Hora, IdCliente, IdEmpleado
        FROM TPedido
        WHERE IdPedido = @Texto
    ELSE IF (@Criterio = 'IdCliente')
        -- Búsqueda sensitiva por IdCliente
        SELECT IdPedido, Fecha, Hora, IdCliente, IdEmpleado
        FROM TPedido
        WHERE IdCliente = @Texto
    ELSE IF (@Criterio = 'IdEmpleado')
        -- Búsqueda sensitiva por IdEmpleado
        SELECT IdPedido, Fecha, Hora, IdCliente, IdEmpleado
        FROM TPedido
        WHERE IdEmpleado = @Texto
    ELSE IF (@Criterio = 'Fecha')
        -- Búsqueda sensitiva por Fecha
        SELECT IdPedido, Fecha, Hora, IdCliente, IdEmpleado
        FROM TPedido
        WHERE Fecha LIKE '%' + @Texto + '%'
END
GO

-- Ejecutar el procedimiento para buscar un pedido por IdPedido
EXEC spBuscarPedido 
    @Texto = 1, 
    @Criterio = 'IdPedido'
GO
