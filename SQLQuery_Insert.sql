USE [EncriptacionUdi]
GO
--Wolverine
/****** Object:  StoredProcedure [dbo].[prInsertarUsuario]    Script Date: 13/9/2020 5:34:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
-- Crear procedimiento de Inserción de datos de usuarios
ALTER procedure [dbo].[prInsertarUsuario]
( 
@IdUsuario integer output, -- Es identity:autoincremental. Se genera automáticamente. debe devolverse al aplicativo
@PrimerNombre varchar(50), @SegundoNombre varchar(50), 
@PrimerApellido varchar(50), @SegundoApellido varchar(50), @Correo varchar(100),
@Contraseña varchar(50)
)
--WITH ENCRYPTION
as
begin
    -- La función dbo.usp_LibreriaX usa el DLL que hemos creado para desencriptar
    -- @Pass queda desencriptado
    --SELECT @Pass = CONVERT( varchar(500), dbo.usp_LibreriaX (@Pass))
    -------------------------------------------------------------------------------------
     
    -- Abrir la llave simétrica
   -- Open SYMMETRIC KEY symllaveEjemplo
    --DECRYPTION BY PASSWORD = 'La/Super/Clave/Super/Secreta/Mas/Super/Que/Los/Super/Amigos'
 
    -- Insertar los datos en la tabla con la contraseña encriptada con la llave simetrica
    insert into Perfil
    (
    PrimerNombre, SegundoNombre , PrimerApellido , SegundoApellido ,
    Correo , Contraseña 
    )
    values
    (
    @PrimerNombre, @SegundoNombre, @PrimerApellido, @SegundoApellido, 
    @Correo, @Contraseña


    --EncryptByPassPhrase(@Pass, EncryptByKey(Key_GUID('symllaveEjemplo'), @Pass) )
 
    )
     
    set @IdUsuario = @@IDENTITY -- obtiene el nuevo valor generado para @CodigoUsuario

    -- Cerrar la llave simétrica
    --CLOSE SYMMETRIC KEY symllaveEjemplo
     
end