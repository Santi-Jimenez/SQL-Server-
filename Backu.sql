--REALIZA UN BACKUP CON NOMBRE DISTINTO, OSEA, CON FECHA Y HORA EN QUE SE REALIZO
DECLARE @fecha char(12)
DECLARE  @path varchar(100)
DECLARE @name varchar(20)

--PRINT convert(char(8),GETDATE(),112) --getdate fecha y hora en el momento de su ejecucion
--PRINT convert(char(5),GETDATE(),108) --retorna la hora y minuto
SET @fecha = convert(char(8),GETDATE(),112) + replace(convert(char(5),GETDATE(),108),':','') --replace reemplaza caracteres
SET @path = 'C:\Backup\CentroMedico'+ @fecha+'.bak'
SET @name = 'CentroMedico'+@fecha

BACKUP DATABASE CentroMedico1
TO DISK = @path
WITH NO_COMPRESSION, NAME = @name