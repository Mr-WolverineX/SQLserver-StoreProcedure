USE [EncriptacionUdi]
GO

--Wolverine
/****** Object:  StoredProcedure [dbo].[prEliminarUsuarios]    Script Date: 13/9/2020 5:33:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Crea el procedimiento que elimina datos de usuario
ALTER PROCEDURE [dbo].[prEliminarUsuarios]
(@IdUsuario integer)
AS
BEGIN
/*
La llave: @CodigoUsuario, será el medio para eliminar los 
datos del usuario.
*/
    SET NOCOUNT ON;
 
    -- Insert statements for procedure here
    delete p
    FROM [dbo].[Perfil] p
    where
    p.IdUsuario = @IdUsuario
END
