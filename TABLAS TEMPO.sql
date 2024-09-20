--TABLAS TEMPORALES, EN MEMORIA Y FISICA. Va a existir mientras el script se este ejecutando.

--En memoria
DECLARE @mitabla TABLE (id int IDENTITY (1,1),pais varchar(50))

INSERT INTO @mitabla VALUES ('Uruguay')
INSERT INTO @mitabla VALUES ('Argentina')
INSERT INTO @mitabla VALUES ('Peru')
INSERT INTO @mitabla VALUES ('Ecuador')
INSERT INTO @mitabla VALUES ('Mexico')

SELECT * FROM @mitabla

--Fisica, se diferencia en que cuando se crea va a existir en la base de datos hasta que reiniciamos los servicios
-- # para que sea fisica
CREATE TABLE #MiTabla (id int IDENTITY(1,1), Nombre varchar(50), apellido varchar(50))

INSERT INTO #MiTabla VALUES ('Alejandro','Lopez')
INSERT INTO #MiTabla VALUES ('Rafael','Castillo')
INSERT INTO #MiTabla VALUES ('Fernando','Gonzalez')

SELECT * FROM #MiTabla

DROP TABLE #MiTabla 

--SCRIPT
SELECT * FROM Turno

DECLARE @turnos TABLE (id INT IDENTITY(1,1),idturno turno, idpaciente paciente)
DECLARE @idpaciente paciente
SET @idpaciente = 8

--Muy utilizado para insertar registros en una tabla desde otro select
INSERT INTO @turnos (idturno, idpaciente)
SELECT TP.idTurno, P.idPaciente FROM Paciente AS P
INNER JOIN TurnoPacienteMedico AS TP
ON TP.idPaciente = P.idPaciente

DECLARE @i int, @total int
SET @i = 1
SET @total = (SELECT COUNT (*) FROM @turnos)
WHILE @i <= @total --Sirve para recorrer la tabla
BEGIN
	IF (SELECT idpaciente FROM @turnos WHERE id = @i) <> @idpaciente
		DELETE FROM @turnos WHERE id = @i

	SET @i = @i+1 --incrementa el valor de la variable cada vez que da una vuelta por el bucle while
END
SELECT * FROM Paciente AS P
	INNER JOIN @turnos T
	ON T.idpaciente = P.idPaciente