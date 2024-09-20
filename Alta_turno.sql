/*
SELECT * FROM Turno
SELECT * FROM TurnoPacienteMedico
SELECT * FROM Medico
*/

EXEC ALTA_turno '20201220 08:15',1,1,'Observacion'

ALTER PROC ALTA_Turno(  
		@fecha char(14), --20190215 12:00
		@idpaciente paciente, 
		@idmedico medico,
		@observacion observacion=''
		)
as

/*
ESTADO = 0 (Pendiente)
ESTADO = 1 (Realizado)
ESTADO = 2 (Cancelado)
*/
--se lo niega con el not, ya que si no existe se lo agrega con insert

set nocount on --cuando hagamos el insert no muestre los registro que se colocaron.

IF NOT EXISTS (SELECT TOP 1 idTurno FROM Turno WHERE fechaTurno=@fecha)
BEGIN  
	INSERT INTO Turno(fechaTurno,estado,observacion)
		VALUES (@fecha,1,@observacion)

	DECLARE @auxIdturno turno
	SET @auxIdturno = @@IDENTITY  --variable del sistema, con doble arroba.

	INSERT INTO TurnoPacienteMedico (idTurno, idPaciente, idMedico)
		VALUES(@auxIdturno,@idpaciente,@idmedico)

	print 'El turno se agrego correctamente'
	return 
END
ELSE
BEGIN
	print 'El turno ya existe'
	return
END