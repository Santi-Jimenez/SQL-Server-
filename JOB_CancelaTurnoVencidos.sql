
use CentroMedico1

UPDATE Turno set estado = 2 
	where convert(char(8),fechaTurno,112) < convert(char(8),GETDATE(),112)
		and estado = 0
-- siempre el where este en la misma linea del update
--SELECT * FROM Turno Siempre probar con un select lo que vamos actualizar o borrar para asegurarnos de que lo modificado sea lo deseado.
	