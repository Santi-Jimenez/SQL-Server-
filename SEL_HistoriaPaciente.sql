--Stored Procedure para obtener historia clinica de un paciente

EXEC SEL_HistoriaPaciente 0

ALTER PROC SEL_HistoriaPaciente(
			@idpaciente paciente
			
			)
AS
set nocount on
/*
SELECT * FROM Historia
SELECT * FROM Medico
SELECT * FROM Especialidad
SELECT * FROM MedicoEspecialidad
SELECT * FROM HistoriaPacienteMedico
INSERT INTO Historia
	VALUES('20190215 16:00','Se lo encontro muy bien')
INSERT INTO HistoriaPacienteMedico
	VALUES(1,7,2)
*/

IF EXISTS(
		SELECT * FROM Paciente AS P
		INNER JOIN HistoriaPacienteMedico AS HP --CONECTAMOS IDHISTORIA,IDPACIENTE,IDMEDICO  x eso primero.
		ON HP.idPaciente = P.idPaciente
		INNER JOIN Historia AS H
		ON H.idHistoria = HP.idHistoria
		INNER JOIN MedicoEspecialidad AS ME
		ON ME.idMedico = HP.idMedico
		INNER JOIN Medico AS M
		ON M.idMedico = ME.idMedico --Para obtener la especialidad del medico.
		WHERE P.idPaciente = @idpaciente
	) --Si esto esta da True ejecutamos la misma consulta para que se muestre en consola

	SELECT * FROM Paciente AS P
	INNER JOIN HistoriaPacienteMedico AS HP --CONECTAMOS IDHISTORIA,IDPACIENTE,IDMEDICO  x eso primero.
	ON HP.idPaciente = P.idPaciente
	INNER JOIN Historia AS H
	ON H.idHistoria = HP.idHistoria
	INNER JOIN MedicoEspecialidad AS ME
	ON ME.idMedico = HP.idMedico
	INNER JOIN Medico AS M
	ON M.idMedico = ME.idMedico --Para obtener la especialidad del medico.
	WHERE P.idPaciente = @idpaciente

ELSE
	PRINT 'No existe historia clinica del paciente'
	--SELECT 0 AS RESULTADO


