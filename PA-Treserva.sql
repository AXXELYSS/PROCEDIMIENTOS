-- LISTAR RESERVAS
IF OBJECT_ID('spListarReserva') IS NOT NULL
    DROP PROC spListarReserva
GO
CREATE PROCEDURE spListarReserva
AS
BEGIN
    SELECT IdReserva, Fecha, Hora, IdCliente, IdMesa
    FROM TReserva
END
GO

-- Ejecutar el procedimiento para listar todas las reservas
EXEC spListarReserva
GO

-- AGREGAR RESERVA
IF OBJECT_ID('spAgregarReserva', 'P') IS NOT NULL
    DROP PROCEDURE spAgregarReserva
GO
CREATE PROCEDURE spAgregarReserva
    @Fecha DATE, 
    @Hora TIME, 
    @IdCliente INT, 
    @IdMesa INT
AS
BEGIN
    -- Verificar si el cliente existe
    IF NOT EXISTS (SELECT IdCliente FROM TCliente WHERE IdCliente = @IdCliente)
    BEGIN
        SELECT CodError = 1, Mensaje = 'Error: El cliente no existe'
        RETURN
    END

    -- Verificar si la mesa existe
    IF NOT EXISTS (SELECT IdMesa FROM TMesa WHERE IdMesa = @IdMesa)
    BEGIN
        SELECT CodError = 1, Mensaje = 'Error: La mesa no existe'
        RETURN
    END

    -- Verificar si ya existe una reserva para esa fecha y hora para esa mesa
    IF EXISTS (SELECT IdReserva FROM TReserva WHERE IdMesa = @IdMesa AND Fecha = @Fecha AND Hora = @Hora)
    BEGIN
        SELECT CodError = 1, Mensaje = 'Error: Ya existe una reserva para esta mesa en ese horario'
        RETURN
    END

    -- Insertar nueva reserva
    INSERT INTO TReserva (Fecha, Hora, IdCliente, IdMesa)
    VALUES (@Fecha, @Hora, @IdCliente, @IdMesa)

    SELECT CodError = 0, Mensaje = 'Reserva agregada correctamente'
END
GO

-- Ejecutar el procedimiento para agregar una reserva
EXEC spAgregarReserva 
    @Fecha = '2025-06-12', 
    @Hora = '19:00', 
    @IdCliente = 1, 
    @IdMesa = 3
GO

-- ELIMINAR RESERVA
IF OBJECT_ID('spEliminarReserva', 'P') IS NOT NULL
    DROP PROC spEliminarReserva
GO
CREATE PROCEDURE spEliminarReserva
    @IdReserva INT
AS
BEGIN
    -- Verificar si la reserva existe
    IF EXISTS (SELECT IdReserva FROM TReserva WHERE IdReserva = @IdReserva)
    BEGIN
        -- Eliminar la reserva
        DELETE FROM TReserva WHERE IdReserva = @IdReserva
        SELECT CodError = 0, Mensaje = 'Reserva eliminada correctamente'
    END
    ELSE 
        SELECT CodError = 1, Mensaje = 'Error: La reserva no existe'
END
GO

-- Ejecutar el procedimiento para eliminar una reserva con IdReserva = 1
EXEC spEliminarReserva @IdReserva = 1
GO

-- ACTUALIZAR RESERVA
IF OBJECT_ID('spActualizarReserva', 'P') IS NOT NULL
    DROP PROC spActualizarReserva
GO
CREATE PROCEDURE spActualizarReserva
    @IdReserva INT,
    @NuevaFecha DATE, 
    @NuevaHora TIME, 
    @NuevoIdCliente INT, 
    @NuevoIdMesa INT
AS
BEGIN
    -- Verificar si la reserva existe
    IF EXISTS (SELECT IdReserva FROM TReserva WHERE IdReserva = @IdReserva)
    BEGIN
        -- Verificar si el cliente existe
        IF NOT EXISTS (SELECT IdCliente FROM TCliente WHERE IdCliente = @NuevoIdCliente)
        BEGIN
            SELECT CodError = 1, Mensaje = 'Error: El cliente no existe'
            RETURN
        END

        -- Verificar si la mesa existe
        IF NOT EXISTS (SELECT IdMesa FROM TMesa WHERE IdMesa = @NuevoIdMesa)
        BEGIN
            SELECT CodError = 1, Mensaje = 'Error: La mesa no existe'
            RETURN
        END

        -- Actualizar la reserva
        UPDATE TReserva
        SET Fecha = @NuevaFecha, 
            Hora = @NuevaHora, 
            IdCliente = @NuevoIdCliente, 
            IdMesa = @NuevoIdMesa
        WHERE IdReserva = @IdReserva

        SELECT CodError = 0, Mensaje = 'Reserva actualizada correctamente'
    END
    ELSE
    BEGIN
        SELECT CodError = 1, Mensaje = 'Error: La reserva no existe'
    END
END
GO

-- Ejecutar el procedimiento para actualizar una reserva con IdReserva = 1
EXEC spActualizarReserva 
    @IdReserva = 1, 
    @NuevaFecha = '2025-06-12', 
    @NuevaHora = '20:00', 
    @NuevoIdCliente = 2, 
    @NuevoIdMesa = 4
GO

-- BUSCAR RESERVA
IF OBJECT_ID('spBuscarReserva', 'P') IS NOT NULL
    DROP PROC spBuscarReserva
GO
CREATE PROCEDURE spBuscarReserva
    @Texto VARCHAR(50), 
    @Criterio VARCHAR(10)
AS
BEGIN
    IF (@Criterio = 'IdReserva')
        -- Búsqueda exacta por IdReserva
        SELECT IdReserva, Fecha, Hora, IdCliente, IdMesa
        FROM TReserva
        WHERE IdReserva = @Texto
    ELSE IF (@Criterio = 'IdCliente')
        -- Búsqueda sensitiva por IdCliente
        SELECT IdReserva, Fecha, Hora, IdCliente, IdMesa
        FROM TReserva
        WHERE IdCliente = @Texto
    ELSE IF (@Criterio = 'IdMesa')
        -- Búsqueda sensitiva por IdMesa
        SELECT IdReserva, Fecha, Hora, IdCliente, IdMesa
        FROM TReserva
        WHERE IdMesa = @Texto
    ELSE IF (@Criterio = 'Fecha')
        -- Búsqueda sensitiva por Fecha
        SELECT IdReserva, Fecha, Hora, IdCliente, IdMesa
        FROM TReserva
        WHERE Fecha LIKE '%' + @Texto + '%'
END
GO

-- Ejecutar el procedimiento para buscar una reserva por IdReserva
EXEC spBuscarReserva 
    @Texto = '2025-06-12', 
    @Criterio = 'Fecha'
GO
