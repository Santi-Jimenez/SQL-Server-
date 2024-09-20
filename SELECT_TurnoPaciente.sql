--Stored Procedures para obtener turno de un paciente con su medico y especialidad.

EXEC SELECT_TurnoPaciente 7

CREATE PROC SELECT_TurnoPaciente(
		@idpaciente paciente

)
AS
set nocount on
/*
SELECT * FROM Turno
SELECT * FROM TurnoPacienteMedico
SELECT * FROM Paciente
SELECT * FROM MedicoEspecialidad
INSERT INTO MedicoEspecialidad
	VALUES(1,2,'Medico clinico')
	*/

SELECT * FROM Paciente AS P
INNER JOIN TurnoPacienteMedico AS TP --ORDEN DEL INNER JOIN ES IMPORTANTE
ON TP.idPaciente = P.idPaciente
INNER JOIN Turno AS T
ON T.idTurno = TP.idTurno --sean igualados por el campo de una tabla no por una variable
INNER JOIN MedicoEspecialidad AS M
ON M.idMedico = TP.idMedico
WHERE P.idPaciente = @idpaciente --Recomendable usar los parametro @etc en where


 

