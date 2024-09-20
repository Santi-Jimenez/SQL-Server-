--Obtener todas las especialidades medicas que hay en el sistema

EXEC SEL_EspecialidadMedica 

CREATE PROC SEL_EspecialidadMedica --()  como no recibe parametros no lleva parentesis
AS
SET NOCOUNT ON

IF EXISTS (SELECT * FROM Especialidad)
	SELECT * FROM Especialidad
ELSE
	--Print 'No hay medico con esa especialidad'
	SELECT 0 AS Resultado