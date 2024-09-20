/*
SELECT * FROM Medico
SELECT * FROM MedicoEspecialidad
SELECT * FROM Especialidad
*/


EXEC ALTA_medico 'Maria', 'Lopez',4, 'Medico ingresante'

ALTER PROC ALTA_medico(  
		@nombre varchar(50),
		@apellido varchar(50),
		@idEspecialidad especialidad,
		@descripcion varchar(50)
		)
as
set nocount  on

IF NOT EXISTS (SELECT TOP 1 idMedico FROM Medico WHERE nombre=@nombre and apellido=@apellido)
BEGIN  
	INSERT INTO Medico(nombre,apellido)
		VALUES (@nombre,@apellido)

	DECLARE @auxIdmedico medico
	SET @auxIdmedico = @@IDENTITY  --variable del sistema, con doble arroba.

	INSERT INTO MedicoEspecialidad(idMedico, idEspecialidad, descripcion)
		VALUES(@auxIdmedico,@idEspecialidad,@descripcion	)

	print 'El medico se registro con exito'
	return 
END
ELSE
BEGIN
	print 'El medico ya esta registrado'
	return
END
