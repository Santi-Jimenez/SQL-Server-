--CREAR UNA VISTA
--Nos sirve para guardar consultas especificas, podemos tratarla como si fuera una tabla mas esta nueva vista.

--SELECT * FROM VistaDePruebas Creada desde el entorno grafico

--SELECT * FROM PacientesTurnosPendientes ES LA VISTA QUE ACABAMOS DE GENERAR

CREATE VIEW PacientesTurnosPendientes AS
--viene todo lo q vamos almacenar, almacena una consulta en una base de datos.

SELECT P.idPaciente,P.Nombre,P.Apellido,T.idTurno,T.estado 
	FROM Paciente AS P
		INNER JOIN TurnoPacienteMedico AS TP
		ON TP.idPaciente = P.idPaciente
		INNER JOIN Turno AS T
		ON T.idTurno = TP.idTurno
WHERE ISNULL(T.estado,0) = 2
----------------------------------------------
SELECT * FROM VIEW_MedicoEspecialidades

CREATE VIEW VIEW_MedicoEspecialidades AS 

SELECT M.idMedico,M.nombre,M.apellido, ME.idEspecialidad,ME.descripcion FROM Medico AS M
INNER JOIN MedicoEspecialidad AS ME
ON ME.idMedico = M.idMedico





---------------------------------------------

--TRIGGER es un desencadenado por un disparador o un disparador de un evento.
--INSERT UPDATE DELETE, con estos 3 eventos se puede conseguiir un trigger. poder emitir alrta o mandar mail auto para un miembro.
--Se dispara en funcion de estos 3 eventos.
--Trigger para guardar un paciente de mexico
--El on sirve para identificar en que tabla va a disparar este evento

CREATE TRIGGER PacienteCreados ON Paciente
AFTER INSERT 
AS
--inserted, toms rl ultimo registrado en la tabla paciente
IF (SELECT idpais FROM inserted) = 'MEX'
	INSERT INTO PacienteLog (idpaciente, idpais, fechaAlta)
		SELECT i.idPaciente, i.idPais,getdate() FROM inserted i



----------------------------------------------
--TRIGGER TIPO UPDATE, se dispara cuando actulicemos un determinado registro

SELECT * FROM PacienteLog
CREATE TABLE PacienteLog ADD fechaModificacion DATETIME

SELECT * FROM Paciente WHERE idPaciente = 64
UPDATE Paciente SET Nombre = 'Antonio' WHERE idPaciente = 64

CREATE TRIGGER PacienteModificado ON Paciente
AFTER UPDATE
AS
IF EXISTS (SELECT idpaciente from PacienteLog
		WHERE idpaciente = (SELECT idpaciente FROM inserted)) --colocamos inserted xq forma parte de los trigger
	UPDATE PacienteLog SET fechaModificacion = GETDATE()
		WHERE idpaciente = (SELECT idpaciente FROM inserted)
ELSE
	INSERT INTO PacienteLog (idpaciente, idpais, fechaModificacion)
	SELECT idpaciente, idpais, GETDATE() FROM inserted