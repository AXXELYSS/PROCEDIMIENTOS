-- LISTAR USUARIOS
IF OBJECT_ID('spListarUsuario') IS NOT NULL
    DROP PROC spListarUsuario
GO
CREATE PROC spListarUsuario
AS
BEGIN
    SELECT IdUsuario, NombreUsuario, TipoUsuario
    FROM TUsuario
END
GO

EXEC spListarUsuario
GO


-- AGREGAR USUARIO
IF OBJECT_ID('spAgregarUsuario', 'P') IS NOT NULL
    DROP PROCEDURE spAgregarUsuario
GO
CREATE PROCEDURE spAgregarUsuario
    @NombreUsuario VARCHAR(50), 
    @Clave VARCHAR(100), 
    @TipoUsuario VARCHAR(50)
AS
BEGIN
    -- Verificar si el NombreUsuario no está duplicado
    IF NOT EXISTS (SELECT NombreUsuario FROM TUsuario WHERE NombreUsuario = @NombreUsuario)
    BEGIN
        INSERT INTO TUsuario (NombreUsuario, Clave, TipoUsuario) 
        VALUES (@NombreUsuario, @Clave, @TipoUsuario)
        SELECT CodError = 0, Mensaje = 'Correcto, usuario insertado'
    END
    ELSE 
        SELECT CodError = 1, Mensaje = 'Error: NombreUsuario duplicado'
END
GO


-- ELIMINAR USUARIO
IF OBJECT_ID('spEliminarUsuario', 'P') IS NOT NULL
    DROP PROC spEliminarUsuario
GO
CREATE PROC spEliminarUsuario
    @IdUsuario INT
AS
BEGIN
    -- Verificar si el usuario existe
    IF EXISTS (SELECT IdUsuario FROM TUsuario WHERE IdUsuario = @IdUsuario)
    BEGIN
        -- Verificar si el usuario está relacionado con algún empleado
        IF EXISTS (SELECT IdUsuario FROM TEmpleado WHERE IdUsuario = @IdUsuario)
        BEGIN
            -- Si está relacionado, no eliminar y dar mensaje de error
            SELECT CodError = 1, Mensaje = 'Error: El usuario está relacionado con empleados y no se puede eliminar'
        END
        ELSE
        BEGIN
            -- Eliminar el usuario si no está relacionado
            DELETE FROM TUsuario WHERE IdUsuario = @IdUsuario
            SELECT CodError = 0, Mensaje = 'Correcto, usuario eliminado'
        END
    END
    ELSE 
        SELECT CodError = 1, Mensaje = 'Error: El usuario no existe'
END
GO


-- ACTUALIZAR USUARIO
IF OBJECT_ID('spActualizarUsuario', 'P') IS NOT NULL
    DROP PROC spActualizarUsuario
GO
CREATE PROC spActualizarUsuario
    @IdUsuario INT,
    @NuevoNombreUsuario VARCHAR(50),
    @NuevaClave VARCHAR(100),
    @NuevoTipoUsuario VARCHAR(50)
AS
BEGIN
    -- Verificar si el usuario existe
    IF EXISTS (SELECT IdUsuario FROM TUsuario WHERE IdUsuario = @IdUsuario)
    BEGIN
        -- Actualizar los campos del usuario
        UPDATE TUsuario
        SET NombreUsuario = @NuevoNombreUsuario, 
            Clave = @NuevaClave, 
            TipoUsuario = @NuevoTipoUsuario
        WHERE IdUsuario = @IdUsuario

        SELECT CodError = 0, Mensaje = 'Usuario actualizado correctamente'
    END
    ELSE
    BEGIN
        SELECT CodError = 1, Mensaje = 'Error: El usuario no existe'
    END
END
GO


-- BUSCAR USUARIO
IF OBJECT_ID('spBuscarUsuario', 'P') IS NOT NULL
    DROP PROC spBuscarUsuario
GO
CREATE PROC spBuscarUsuario
    @Texto VARCHAR(50), 
    @Criterio VARCHAR(10)
AS
BEGIN
    IF (@Criterio = 'IdUsuario')
        -- Búsqueda exacta por IdUsuario
        SELECT IdUsuario, NombreUsuario, TipoUsuario
        FROM TUsuario
        WHERE IdUsuario = @Texto
    ELSE IF (@Criterio = 'NombreUsuario')
        -- Búsqueda sensitiva por NombreUsuario
        SELECT IdUsuario, NombreUsuario, TipoUsuario
        FROM TUsuario
        WHERE NombreUsuario LIKE '%' + @Texto + '%'
    ELSE IF (@Criterio = 'TipoUsuario')
        -- Búsqueda sensitiva por TipoUsuario
        SELECT IdUsuario, NombreUsuario
        FROM TUsuario
        WHERE TipoUsuario LIKE '%' + @Texto + '%'
END
GO


--COMPROBACION
-- Ejecutar el procedimiento para listar todos los usuarios
EXEC spListarUsuario
GO

-- Ejecutar el procedimiento para agregar un usuario con los siguientes parámetros
EXEC spAgregarUsuario 
    @NombreUsuario = 'admin123', 
    @Clave = 'password123', 
    @TipoUsuario = 'Administrador'
GO


-- Ejecutar el procedimiento para eliminar un usuario con IdUsuario = 1
EXEC spEliminarUsuario @IdUsuario = 1
GO

-- Ejecutar el procedimiento para actualizar un usuario con IdUsuario = 1
EXEC spActualizarUsuario 
    @IdUsuario = 1, 
    @NuevoNombreUsuario = 'admin_updated', 
    @NuevaClave = 'newpassword123', 
    @NuevoTipoUsuario = 'Chef'
GO

-- Ejecutar el procedimiento para buscar un usuario por IdUsuario
EXEC spBuscarUsuario 
    @Texto = '1', 
    @Criterio = 'IdUsuario'
GO

-- Ejecutar el procedimiento para buscar un usuario por NombreUsuario
EXEC spBuscarUsuario 
    @Texto = 'admin', 
    @Criterio = 'NombreUsuario'
GO

-- Ejecutar el procedimiento para buscar un usuario por TipoUsuario
EXEC spBuscarUsuario 
    @Texto = 'Chef', 
    @Criterio = 'TipoUsuario'
GO
