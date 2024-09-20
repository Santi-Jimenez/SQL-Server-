	
	--Sirven para agregar laves foraneas.

ALTER TABLE Paciente
	ADD FOREIGN KEY (idPais) REFERENCES Pais(idPais)

ALTER TABLE HistoriaPacienteMedico
	ADD FOREIGN KEY (idPaciente) REFERENCES Paciente(idPaciente)


	--mandamos a lllamar la funcion.
	--create para las funciones
	select dbo.nombreFun (256)  

ALTER FUNCTION nombreFun (@var int)
	RETURNS int 

AS
BEGIN
	SET @var = @var * 5
	return @var
END

CREATE TABLE Ejemplo (campo0 int IDENTITY(1,1),campo1 int, campo2 int)
SELECT * FROM Ejemplo
	INSERT INTO Ejemplo
		VALUES(4,7)

--Sentencia DROP, borra tabla o borra la base de dato.
DROP TABLE Ejemplo

--Sentencia Truncate, eliminar por completo los registros de una tabla y resetea los valores de identity.
TRUNCATE TABLE Ejemplo