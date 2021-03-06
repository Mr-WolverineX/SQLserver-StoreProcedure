USE [EncriptacionUdi]
GO

--Wolverine
/****** Object:  StoredProcedure [dbo].[prConsultarUsuarios]    Script Date: 13/9/2020 5:19:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[prConsultarUsuarios]
(@IdUsuario integer , @Contraseña varchar(50))
AS
BEGIN
/*
La llave: @Id, será el medio para consultar los 
datos del usuario.
*/
    SET NOCOUNT ON;
 
    -- Insert statements for procedure here
    if @IdUsuario <> 0 
    begin
        SELECT
        p.[PrimerNombre], p.[SegundoNombre], 
        p.[PrimerApellido] ,p.[SegundoApellido], p.[Correo]
        FROM [dbo].[Perfil] p
        where
        p.IdUsuario = @IdUsuario 
		AND p.Contraseña = @Contraseña
    end
    else
    begin
        SELECT
        p.[PrimerNombre], p.[SegundoNombre], 
        p.[PrimerApellido] ,p.[SegundoApellido], p.[Correo]
        FROM [dbo].[Perfil] p
    end
END