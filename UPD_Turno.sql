--ACTULIZAR TURNOS

SELECT * FROM TURNO
SELECT * FROM TURNOPACIENTEMEDICO

EXEC UPD_Turno 55,1,'El paciente ha sido atendido'

ALTER PROC UPD_Turno (
		@idTurno turno,
		@estado tinyint,
		@observacion observacion
		)

AS
set nocount on

IF EXISTS(SELECT * FROM Turno WHERE idTurno = @idTurno)--como la instruccion es unica, no hace falta colocar begin y end. 
	UPDATE Turno SET estado = @estado,            --si en este bloque hay mas, va begin end
                   observacion = @observacion    --dejando el update asi actualiza todos los registros ya que no tiene el where, el update
	WHERE idTurno = @idTurno --nunca olvidarse este parametro

ELSE
	SELECT 0 AS Resultado
	