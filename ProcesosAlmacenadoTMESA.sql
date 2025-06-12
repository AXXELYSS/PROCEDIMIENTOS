-- LISTAR MESAS
IF OBJECT_ID('spListarMesa') IS NOT NULL
    DROP PROC spListarMesa
GO
CREATE PROC spListarMesa
AS
BEGIN
    SELECT IdMesa, NumeroMesa, Capacidad
    FROM TMesa
END
GO

-- Ejecutar el procedimiento para listar todas las mesas
EXEC spListarMesa
GO

-- AGREGAR MESA
IF OBJECT_ID('spAgregarMesa', 'P') IS NOT NULL
    DROP PROCEDURE spAgregarMesa
GO
CREATE PROCEDURE spAgregarMesa
    @NumeroMesa INT, 
    @Capacidad INT
AS
BEGIN
    -- Verificar si el número de mesa ya existe
    IF NOT EXISTS (SELECT NumeroMesa FROM TMesa WHERE NumeroMesa = @NumeroMesa)
    BEGIN
        INSERT INTO TMesa (NumeroMesa, Capacidad)
        VALUES (@NumeroMesa, @Capacidad)
        SELECT CodError = 0, Mensaje = 'Correcto, mesa insertada'
    END
    ELSE 
        SELECT CodError = 1, Mensaje = 'Error: Número de mesa duplicado'
END
GO

-- Ejecutar el procedimiento para agregar una mesa
EXEC spAgregarMesa 
    @NumeroMesa = 5, 
    @Capacidad = 4
GO

-- ELIMINAR MESA
IF OBJECT_ID('spEliminarMesa', 'P') IS NOT NULL
    DROP PROC spEliminarMesa
GO
CREATE PROC spEliminarMesa
    @IdMesa INT
AS
BEGIN
    -- Verificar si la mesa existe
    IF EXISTS (SELECT IdMesa FROM TMesa WHERE IdMesa = @IdMesa)
    BEGIN
        -- Verificar si la mesa está asociada a alguna reserva
        IF EXISTS (SELECT IdMesa FROM TReserva WHERE IdMesa = @IdMesa)
        BEGIN
            -- Si está asociada, no eliminar y dar mensaje de error
            SELECT CodError = 1, Mensaje = 'Error: La mesa está asociada a una reserva y no se puede eliminar'
        END
        ELSE
        BEGIN
            -- Eliminar la mesa si no está asociada
            DELETE FROM TMesa WHERE IdMesa = @IdMesa
            SELECT CodError = 0, Mensaje = 'Correcto, mesa eliminada'
        END
    END
    ELSE 
        SELECT CodError = 1, Mensaje = 'Error: La mesa no existe'
END
GO

-- Ejecutar el procedimiento para eliminar una mesa con IdMesa = 5
EXEC spEliminarMesa @IdMesa = 5
GO
-- ACTUALIZAR MESA
IF OBJECT_ID('spActualizarMesa', 'P') IS NOT NULL
    DROP PROCEDURE spActualizarMesa
GO
CREATE PROCEDURE spActualizarMesa
    @IdMesa INT, 
    @NuevoNumeroMesa INT, 
    @NuevaCapacidad INT
AS
BEGIN
    -- Verificar si la mesa existe
    IF EXISTS (SELECT IdMesa FROM TMesa WHERE IdMesa = @IdMesa)
    BEGIN
        -- Verificar si el nuevo número de mesa ya está en uso
        IF EXISTS (SELECT IdMesa FROM TMesa WHERE NumeroMesa = @NuevoNumeroMesa AND IdMesa <> @IdMesa)
        BEGIN
            SELECT CodError = 1, Mensaje = 'Error: El número de mesa ya está en uso'
            RETURN
        END

        -- Actualizar la mesa
        UPDATE TMesa
        SET NumeroMesa = @NuevoNumeroMesa, 
            Capacidad = @NuevaCapacidad
        WHERE IdMesa = @IdMesa

        SELECT CodError = 0, Mensaje = 'Mesa actualizada correctamente'
    END
    ELSE
    BEGIN
        SELECT CodError = 1, Mensaje = 'Error: La mesa no existe'
    END
END
GO

-- Ejecutar el procedimiento para actualizar una mesa con IdMesa = 1
EXEC spActualizarMesa 
    @IdMesa = 1, 
    @NuevoNumeroMesa = 5, 
    @NuevaCapacidad = 6
GO


-- BUSCAR MESA
IF OBJECT_ID('spBuscarMesa', 'P') IS NOT NULL
    DROP PROC spBuscarMesa
GO
CREATE PROCEDURE spBuscarMesa
    @Texto INT, 
    @Criterio VARCHAR(10)
AS
BEGIN
    IF (@Criterio = 'IdMesa')
        -- Búsqueda exacta por IdMesa
        SELECT IdMesa, NumeroMesa, Capacidad
        FROM TMesa
        WHERE IdMesa = @Texto
    ELSE IF (@Criterio = 'NumeroMesa')
        -- Búsqueda sensitiva por NumeroMesa
        SELECT IdMesa, NumeroMesa, Capacidad
        FROM TMesa
        WHERE NumeroMesa = @Texto
    ELSE IF (@Criterio = 'Capacidad')
        -- Búsqueda sensitiva por Capacidad
        SELECT IdMesa, NumeroMesa, Capacidad
        FROM TMesa
        WHERE Capacidad = @Texto
END
GO

-- Ejecutar el procedimiento para buscar una mesa por IdMesa
EXEC spBuscarMesa 
    @Texto = 1, 
    @Criterio = 'IdMesa'
GO

