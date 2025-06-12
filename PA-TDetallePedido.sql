-- LISTAR DETALLE DE PEDIDO
IF OBJECT_ID('spListarDetallePedido') IS NOT NULL
    DROP PROC spListarDetallePedido
GO
CREATE PROCEDURE spListarDetallePedido
AS
BEGIN
    SELECT IdDetallePedido, IdPedido, IdPlato, Cantidad, PrecioUnitario
    FROM TDetallePedido
END
GO

-- Ejecutar el procedimiento para listar todos los detalles de pedidos
EXEC spListarDetallePedido
GO


-- AGREGAR DETALLE DE PEDIDO
IF OBJECT_ID('spAgregarDetallePedido', 'P') IS NOT NULL
    DROP PROCEDURE spAgregarDetallePedido
GO
CREATE PROCEDURE spAgregarDetallePedido
    @IdPedido INT, 
    @IdPlato INT, 
    @Cantidad INT, 
    @PrecioUnitario DECIMAL(10,2)
AS
BEGIN
    -- Verificar si el pedido existe
    IF NOT EXISTS (SELECT IdPedido FROM TPedido WHERE IdPedido = @IdPedido)
    BEGIN
        SELECT CodError = 1, Mensaje = 'Error: El pedido no existe'
        RETURN
    END

    -- Verificar si el plato existe
    IF NOT EXISTS (SELECT IdPlato FROM TPlato WHERE IdPlato = @IdPlato)
    BEGIN
        SELECT CodError = 1, Mensaje = 'Error: El plato no existe'
        RETURN
    END

    -- Insertar detalle de pedido
    INSERT INTO TDetallePedido (IdPedido, IdPlato, Cantidad, PrecioUnitario)
    VALUES (@IdPedido, @IdPlato, @Cantidad, @PrecioUnitario)

    SELECT CodError = 0, Mensaje = 'Detalle del pedido agregado correctamente'
END
GO

-- Ejecutar el procedimiento para agregar un detalle al pedido
EXEC spAgregarDetallePedido 
    @IdPedido = 1, 
    @IdPlato = 2, 
    @Cantidad = 3, 
    @PrecioUnitario = 12.99
GO


-- ELIMINAR DETALLE DE PEDIDO
IF OBJECT_ID('spEliminarDetallePedido', 'P') IS NOT NULL
    DROP PROC spEliminarDetallePedido
GO
CREATE PROCEDURE spEliminarDetallePedido
    @IdDetallePedido INT
AS
BEGIN
    -- Verificar si el detalle de pedido existe
    IF EXISTS (SELECT IdDetallePedido FROM TDetallePedido WHERE IdDetallePedido = @IdDetallePedido)
    BEGIN
        -- Eliminar el detalle del pedido
        DELETE FROM TDetallePedido WHERE IdDetallePedido = @IdDetallePedido
        SELECT CodError = 0, Mensaje = 'Detalle del pedido eliminado correctamente'
    END
    ELSE 
        SELECT CodError = 1, Mensaje = 'Error: El detalle del pedido no existe'
END
GO

-- Ejecutar el procedimiento para eliminar un detalle de pedido con IdDetallePedido = 1
EXEC spEliminarDetallePedido @IdDetallePedido = 1
GO


-- ACTUALIZAR DETALLE DE PEDIDO
IF OBJECT_ID('spActualizarDetallePedido', 'P') IS NOT NULL
    DROP PROC spActualizarDetallePedido
GO
CREATE PROCEDURE spActualizarDetallePedido
    @IdDetallePedido INT, 
    @NuevoIdPedido INT, 
    @NuevoIdPlato INT, 
    @NuevaCantidad INT, 
    @NuevoPrecioUnitario DECIMAL(10,2)
AS
BEGIN
    -- Verificar si el detalle de pedido existe
    IF EXISTS (SELECT IdDetallePedido FROM TDetallePedido WHERE IdDetallePedido = @IdDetallePedido)
    BEGIN
        -- Verificar si el nuevo pedido existe
        IF NOT EXISTS (SELECT IdPedido FROM TPedido WHERE IdPedido = @NuevoIdPedido)
        BEGIN
            SELECT CodError = 1, Mensaje = 'Error: El nuevo pedido no existe'
            RETURN
        END

        -- Verificar si el nuevo plato existe
        IF NOT EXISTS (SELECT IdPlato FROM TPlato WHERE IdPlato = @NuevoIdPlato)
        BEGIN
            SELECT CodError = 1, Mensaje = 'Error: El nuevo plato no existe'
            RETURN
        END

        -- Actualizar el detalle del pedido
        UPDATE TDetallePedido
        SET IdPedido = @NuevoIdPedido, 
            IdPlato = @NuevoIdPlato, 
            Cantidad = @NuevaCantidad, 
            PrecioUnitario = @NuevoPrecioUnitario
        WHERE IdDetallePedido = @IdDetallePedido

        SELECT CodError = 0, Mensaje = 'Detalle del pedido actualizado correctamente'
    END
    ELSE
    BEGIN
        SELECT CodError = 1, Mensaje = 'Error: El detalle del pedido no existe'
    END
END
GO

-- Ejecutar el procedimiento para actualizar un detalle del pedido con IdDetallePedido = 1
EXEC spActualizarDetallePedido 
    @IdDetallePedido = 1, 
    @NuevoIdPedido = 2, 
    @NuevoIdPlato = 3, 
    @NuevaCantidad = 5, 
    @NuevoPrecioUnitario = 10.99
GO


-- BUSCAR DETALLE DE PEDIDO
IF OBJECT_ID('spBuscarDetallePedido', 'P') IS NOT NULL
    DROP PROC spBuscarDetallePedido
GO
CREATE PROCEDURE spBuscarDetallePedido
    @Texto INT, 
    @Criterio VARCHAR(10)
AS
BEGIN
    IF (@Criterio = 'IdDetallePedido')
        -- Búsqueda exacta por IdDetallePedido
        SELECT IdDetallePedido, IdPedido, IdPlato, Cantidad, PrecioUnitario
        FROM TDetallePedido
        WHERE IdDetallePedido = @Texto
    ELSE IF (@Criterio = 'IdPedido')
        -- Búsqueda sensitiva por IdPedido
        SELECT IdDetallePedido, IdPedido, IdPlato, Cantidad, PrecioUnitario
        FROM TDetallePedido
        WHERE IdPedido = @Texto
    ELSE IF (@Criterio = 'IdPlato')
        -- Búsqueda sensitiva por IdPlato
        SELECT IdDetallePedido, IdPedido, IdPlato, Cantidad, PrecioUnitario
        FROM TDetallePedido
        WHERE IdPlato = @Texto
    ELSE IF (@Criterio = 'Cantidad')
        -- Búsqueda sensitiva por Cantidad
        SELECT IdDetallePedido, IdPedido, IdPlato, Cantidad, PrecioUnitario
        FROM TDetallePedido
        WHERE Cantidad = @Texto
END
GO

-- Ejecutar el procedimiento para buscar un detalle de pedido por IdDetallePedido
EXEC spBuscarDetallePedido 
    @Texto = 1, 
    @Criterio = 'IdDetallePedido'
GO
