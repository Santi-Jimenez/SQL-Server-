
SELECT dbo.nombrefun(5)
CREATE FUNCTION nombrefun (@var int)
RETURNS int

AS 
BEGIN
	set @var = @var * 5 
	return @var
END
---------------------
--FUNCIONES DEFINIDAS POR EL USUARIO, TIPO ESCALARES Y TIPO TABLA
--Escalares, permitir retornar valores especificos y tipos de datos.
--Tabla, funciones q retornan multiples registros.

SELECT dbo.concatenar('Lopez','Roberto')

CREATE FUNCTION concatenar (
		@apelldio varchar(50),
		@nombre varchar(50)
		)
RETURNS varchar(100)
AS
BEGIN
	declare @resultado varchar(100)
	set @resultado = @apelldio + ', ' + @nombre
	RETURN @resultado
END

SELECT dbo.obtenerPais (9)

ALTER FUNCTION obtenerPais(
				@idpaciente paciente
				)
RETURNS varchar(50)
AS
BEGIN
	declare @pais varchar(50)
	SET @pais = (SELECT PA.pais FROM Paciente AS P
		INNER JOIN Pais AS PA
		ON PA.idPais = P.idPais
		WHERE idPaciente = @idpaciente)

	RETURN @pais
END

------------------------
--Funciones tipo tabla, recibir uno o mas parametros y con ellos retornar una tabla. 
SELECT * FROM dbo.listaPaises()

CREATE FUNCTION listaPaises()
RETURNS @paises TABLE(idPais char(3),pais varchar(50)) --aclaramos que va a retonar una tabla como resultado
AS
BEGIN
	INSERT INTO @paises VALUES('ESP','España')
	INSERT INTO @paises VALUES('MEX','Mexico')
	INSERT INTO @paises VALUES('CHI','Chile')
	INSERT INTO @paises VALUES('PER','Peru')
	INSERT INTO @paises VALUES('ARG','Argentina')

	RETURN
END