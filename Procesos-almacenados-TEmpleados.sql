-- LISTAR EMPLEADOS
IF OBJECT_ID('spListarEmpleado') IS NOT NULL
    DROP PROC spListarEmpleado
GO
CREATE PROC spListarEmpleado
AS
BEGIN
    SELECT IdEmpleado, Nombre, Apellido, Cargo, Telefono, Correo
    FROM TEmpleado
END
GO

EXEC spListarEmpleado
GO


-- AGREGAR EMPLEADO
IF OBJECT_ID('spAgregarEmpleado', 'P') IS NOT NULL
    DROP PROCEDURE spAgregarEmpleado
GO
CREATE PROCEDURE spAgregarEmpleado
    @Nombre VARCHAR(100), 
    @Apellido VARCHAR(100), 
    @Cargo VARCHAR(50), 
    @Telefono VARCHAR(15), 
    @Correo VARCHAR(100), 
    @IdUsuario INT
AS
BEGIN
    -- Verificar si el Usuario asociado al empleado existe
    IF EXISTS (SELECT IdUsuario FROM TUsuario WHERE IdUsuario = @IdUsuario)
    BEGIN
        INSERT INTO TEmpleado (Nombre, Apellido, Cargo, Telefono, Correo, IdUsuario) 
        VALUES (@Nombre, @Apellido, @Cargo, @Telefono, @Correo, @IdUsuario)
        SELECT CodError = 0, Mensaje = 'Correcto, empleado insertado'
    END
    ELSE 
        SELECT CodError = 1, Mensaje = 'Error: El Usuario no existe'
END
GO


-- ELIMINAR EMPLEADO
IF OBJECT_ID('spEliminarEmpleado', 'P') IS NOT NULL
    DROP PROC spEliminarEmpleado
GO
CREATE PROC spEliminarEmpleado
    @IdEmpleado INT
AS
BEGIN
    -- Verificar si el empleado existe
    IF EXISTS (SELECT IdEmpleado FROM TEmpleado WHERE IdEmpleado = @IdEmpleado)
    BEGIN
        -- Verificar si el empleado está relacionado con algún pedido
        IF EXISTS (SELECT IdEmpleado FROM TPedido WHERE IdEmpleado = @IdEmpleado)
        BEGIN
            -- Si está relacionado, no eliminar y dar mensaje de error
            SELECT CodError = 1, Mensaje = 'Error: El empleado está relacionado con pedidos y no se puede eliminar'
        END
        ELSE
        BEGIN
            -- Eliminar el empleado si no está relacionado
            DELETE FROM TEmpleado WHERE IdEmpleado = @IdEmpleado
            SELECT CodError = 0, Mensaje = 'Correcto, empleado eliminado'
        END
    END
    ELSE 
        SELECT CodError = 1, Mensaje = 'Error: El empleado no existe'
END
GO



-- ACTUALIZAR EMPLEADO
IF OBJECT_ID('spActualizarEmpleado', 'P') IS NOT NULL
    DROP PROC spActualizarEmpleado
GO
CREATE PROC spActualizarEmpleado
    @IdEmpleado INT,
    @NuevoNombre VARCHAR(100),
    @NuevoApellido VARCHAR(100),
    @NuevoCargo VARCHAR(50),
    @NuevoTelefono VARCHAR(15),
    @NuevoCorreo VARCHAR(100),
    @NuevoIdUsuario INT
AS
BEGIN
    -- Verificar si el empleado existe
    IF EXISTS (SELECT IdEmpleado FROM TEmpleado WHERE IdEmpleado = @IdEmpleado)
    BEGIN
        -- Verificar si el nuevo Usuario asociado al empleado existe
        IF EXISTS (SELECT IdUsuario FROM TUsuario WHERE IdUsuario = @NuevoIdUsuario)
        BEGIN
            -- Actualizar los campos del empleado
            UPDATE TEmpleado
            SET Nombre = @NuevoNombre, 
                Apellido = @NuevoApellido, 
                Cargo = @NuevoCargo, 
                Telefono = @NuevoTelefono, 
                Correo = @NuevoCorreo, 
                IdUsuario = @NuevoIdUsuario
            WHERE IdEmpleado = @IdEmpleado

            SELECT CodError = 0, Mensaje = 'Empleado actualizado correctamente'
        END
        ELSE 
            SELECT CodError = 1, Mensaje = 'Error: El nuevo Usuario no existe'
    END
    ELSE
    BEGIN
        SELECT CodError = 1, Mensaje = 'Error: El empleado no existe'
    END
END
GO


-- BUSCAR EMPLEADO
IF OBJECT_ID('spBuscarEmpleado', 'P') IS NOT NULL
    DROP PROC spBuscarEmpleado
GO
CREATE PROC spBuscarEmpleado
    @Texto VARCHAR(50), 
    @Criterio VARCHAR(10)
AS
BEGIN
    IF (@Criterio = 'IdEmpleado')
        -- Búsqueda exacta por IdEmpleado
        SELECT IdEmpleado, Nombre, Apellido, Cargo, Telefono, Correo
        FROM TEmpleado
        WHERE IdEmpleado = @Texto
    ELSE IF (@Criterio = 'Nombre')
        -- Búsqueda sensitiva por Nombre
        SELECT IdEmpleado, Nombre, Apellido, Cargo, Telefono, Correo
        FROM TEmpleado
        WHERE Nombre LIKE '%' + @Texto + '%'
    ELSE IF (@Criterio = 'Apellido')
        -- Búsqueda sensitiva por Apellido
        SELECT IdEmpleado, Nombre, Apellido, Cargo, Telefono, Correo
        FROM TEmpleado
        WHERE Apellido LIKE '%' + @Texto + '%'
    ELSE IF (@Criterio = 'Cargo')
        -- Búsqueda sensitiva por Cargo
        SELECT IdEmpleado, Nombre, Apellido, Cargo, Telefono, Correo
        FROM TEmpleado
        WHERE Cargo LIKE '%' + @Texto + '%'
END
GO


--PRUEBAS DE EMPLEADOS
-- Comprobar LISTAR EMPLEADOS
EXEC spListarEmpleado
GO


-- Comprobar AGREGAR EMPLEADO
EXEC spAgregarEmpleado 
    @Nombre = 'Juan', 
    @Apellido = 'Perez', 
    @Cargo = 'Chef', 
    @Telefono = '987654321', 
    @Correo = 'juanperez@email.com', 
    @IdUsuario = 1
GO


-- Comprobar ELIMINAR EMPLEADO
EXEC spEliminarEmpleado 
    @IdEmpleado = 1
GO


-- Comprobar ACTUALIZAR EMPLEADO
EXEC spActualizarEmpleado 
    @IdEmpleado = 1, 
    @NuevoNombre = 'Carlos', 
    @NuevoApellido = 'Gonzales', 
    @NuevoCargo = 'Mesero', 
    @NuevoTelefono = '987654322', 
    @NuevoCorreo = 'carlosgonzales@email.com', 
    @NuevoIdUsuario = 2
GO


-- Comprobar BUSCAR EMPLEADO (por Nombre)
EXEC spBuscarEmpleado 
    @Texto = 'Carlos', 
    @Criterio = 'Nombre'
GO

-- Comprobar BUSCAR EMPLEADO (por Cargo)
EXEC spBuscarEmpleado 
    @Texto = 'Chef', 
    @Criterio = 'Cargo'
GO
