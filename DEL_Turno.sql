ELIMINAR UN TURNO

SELECT * FROM TURNO
SELECT * FROM TURNOPACIENTEMEDICO

EXEC DEL_Turno 53
--ocurre un error ya que no podemos eliminar de la tabla turno, porque hay una restriccion con turnopaciente
ALTER PROC DEL_Turno (
		@idTurno turno
		)
AS
set nocount on

IF EXISTS(SELECT * FROM Turno WHERE idTurno = @idTurno)--como la instruccion es unica, no hace falta colocar begin y end. 
BEGIN --Lo necesita ya que son dos instrucciones
	DELETE FROM TurnoPacienteMedico WHERE idTurno =@idTurno --SE Tuvieron que invertir ya que primero eliminaba en turnopaciente y provocaba error
	DELETE FROM Turno WHERE idTurno = @idTurno
END
ELSE
	SELECT 0 AS Resultado
	