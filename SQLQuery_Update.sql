USE [EncriptacionUdi]
GO
--Wolverine
/****** Object:  StoredProcedure [dbo].[prModificarUsuarios]    Script Date: 13/9/2020 5:34:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
-- Crea el procedimiento que modifica datos de usuario
ALTER PROCEDURE [dbo].[prModificarUsuarios]
(
@IdUsuario integer, @PrimerNombre varchar(50),
@SegundoNombre varchar(50), @PrimerApellido varchar(50),
@SegundoApellido varchar(50),
@Correo varchar(100)
)
AS
BEGIN
/*
La llave: @CodigoUsuario, será el medio para actualizar el resto de los 
datos del usuario.
No nse cambiará el código de usuario
*/
 
    SET NOCOUNT ON;
 
    -- Insert statements for procedure here
    UPDATE p
    SET
     [PrimerNombre]   = @PrimerNombre
    ,[SegundoNombre]   = @SegundoNombre
    ,[PrimerApellido] = @PrimerApellido
    ,[SegundoApellido] = @SegundoApellido
    ,[Correo] = @Correo
    FROM [dbo].[Perfil] p
    where
    p.IdUsuario = @IdUsuario
END
