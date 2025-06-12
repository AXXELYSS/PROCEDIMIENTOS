-- LISTAR PLATOS
IF OBJECT_ID('spListarPlato') IS NOT NULL
    DROP PROC spListarPlato
GO
CREATE PROC spListarPlato
AS
BEGIN
    SELECT IdPlato, Nombre, Descripcion, Precio, Categoria
    FROM TPlato
END
GO

EXEC spListarPlato
GO


-- AGREGAR PLATO
IF OBJECT_ID('spAgregarPlato', 'P') IS NOT NULL
    DROP PROCEDURE spAgregarPlato
GO
CREATE PROCEDURE spAgregarPlato
    @Nombre VARCHAR(100), 
    @Descripcion VARCHAR(255), 
    @Precio DECIMAL(10,2), 
    @Categoria VARCHAR(100)
AS
BEGIN
    -- Verificar si el Nombre del Plato no está duplicado
    IF NOT EXISTS (SELECT Nombre FROM TPlato WHERE Nombre = @Nombre)
    BEGIN
        INSERT INTO TPlato (Nombre, Descripcion, Precio, Categoria) 
        VALUES (@Nombre, @Descripcion, @Precio, @Categoria)
        SELECT CodError = 0, Mensaje = 'Correcto, plato insertado'
    END
    ELSE 
        SELECT CodError = 1, Mensaje = 'Error: Plato duplicado'
END
GO


-- ELIMINAR PLATO
IF OBJECT_ID('spEliminarPlato', 'P') IS NOT NULL
    DROP PROC spEliminarPlato
GO
CREATE PROC spEliminarPlato
    @IdPlato INT
AS
BEGIN
    -- Verificar si el plato existe
    IF EXISTS (SELECT IdPlato FROM TPlato WHERE IdPlato = @IdPlato)
    BEGIN
        -- Verificar si el plato está relacionado con algún detalle de pedido
        IF EXISTS (SELECT IdPlato FROM TDetallePedido WHERE IdPlato = @IdPlato)
        BEGIN
            -- Eliminar primero los detalles del pedido que contienen el plato
            DELETE FROM TDetallePedido WHERE IdPlato = @IdPlato
            SELECT CodError = 0, Mensaje = 'Detalles de pedido eliminados'
        END
        
        -- Ahora eliminar el plato
        DELETE FROM TPlato WHERE IdPlato = @IdPlato
        SELECT CodError = 0, Mensaje = 'Correcto, plato eliminado'
    END
    ELSE 
        SELECT CodError = 1, Mensaje = 'Error: El plato no existe'
END
GO




-- ACTUALIZAR PLATO
IF OBJECT_ID('spActualizarPlato', 'P') IS NOT NULL
    DROP PROC spActualizarPlato
GO
CREATE PROC spActualizarPlato
    @IdPlato INT,
    @NuevoNombre VARCHAR(100),
    @NuevaDescripcion VARCHAR(255),
    @NuevoPrecio DECIMAL(10,2),
    @NuevaCategoria VARCHAR(100)
AS
BEGIN
    -- Verificar si el plato existe
    IF EXISTS (SELECT IdPlato FROM TPlato WHERE IdPlato = @IdPlato)
    BEGIN
        -- Actualizar los campos del plato
        UPDATE TPlato
        SET Nombre = @NuevoNombre, 
            Descripcion = @NuevaDescripcion, 
            Precio = @NuevoPrecio, 
            Categoria = @NuevaCategoria
        WHERE IdPlato = @IdPlato

        SELECT CodError = 0, Mensaje = 'Plato actualizado correctamente'
    END
    ELSE
    BEGIN
        SELECT CodError = 1, Mensaje = 'Error: El plato no existe'
    END
END
GO


-- BUSCAR PLATO
IF OBJECT_ID('spBuscarPlato', 'P') IS NOT NULL
    DROP PROC spBuscarPlato
GO
CREATE PROC spBuscarPlato
    @Texto VARCHAR(50), 
    @Criterio VARCHAR(10)
AS
BEGIN
    IF (@Criterio = 'IdPlato')
        -- Búsqueda exacta por IdPlato
        SELECT IdPlato, Nombre, Descripcion, Precio, Categoria
        FROM TPlato
        WHERE IdPlato = @Texto
    ELSE IF (@Criterio = 'Nombre')
        -- Búsqueda sensitiva por Nombre
        SELECT IdPlato, Nombre, Descripcion, Precio, Categoria
        FROM TPlato
        WHERE Nombre LIKE '%' + @Texto + '%'
    ELSE IF (@Criterio = 'Categoria')
        -- Búsqueda sensitiva por Categoria
        SELECT IdPlato, Nombre, Descripcion, Precio
        FROM TPlato
        WHERE Categoria LIKE '%' + @Texto + '%'
END
GO


--Comprobacion del codigo

-- Ejecutar el procedimiento para listar todos los platos
EXEC spListarPlato
GO

-- Ejecutar el procedimiento para agregar un plato
EXEC spAgregarPlato 
    @Nombre = 'Pizza Margherita', 
    @Descripcion = 'Pizza con tomate, mozzarella y albahaca', 
    @Precio = 15.99, 
    @Categoria = 'Plato de Fondo'
GO

-- Ejecutar el procedimiento para eliminar un plato con IdPlato = 1
EXEC spEliminarPlato @IdPlato = 1
GO

-- Ejecutar el procedimiento para actualizar un plato con IdPlato = 1
EXEC spActualizarPlato 
    @IdPlato = 1, 
    @NuevoNombre = 'Pizza Margherita Deluxe', 
    @NuevaDescripcion = 'Pizza con tomate, mozzarella, albahaca y aceite de oliva extra virgen', 
    @NuevoPrecio = 18.99, 
    @NuevaCategoria = 'Plato de Fondo'
GO

-- Ejecutar el procedimiento para buscar un plato por Nombre
EXEC spBuscarPlato 
    @Texto = 'Pizza', 
    @Criterio = 'Nombre'
GO

-- Ejecutar el procedimiento para buscar un plato por Categoria
EXEC spBuscarPlato 
    @Texto = 'Plato de Fondo', 
    @Criterio = 'Categoria'
GO
