
--SELECT * FROM Paciente	
--ALTER PARA PODER MODIFICAR EL STORED PROCEDURED
EXEC ALTA_Paciente '2247856','Mauro','torres','20000709','calle 2','MEX','','TORRES@gmail.com',''

ALTER PROC ALTA_Paciente(  
		@dni varchar(20),
		@nombre varchar(50),
		@apellido varchar(50),
		@fNacimiento varchar(8), --siempre que sea tipo de fecha se define con varchar 8, si tuviera hora es mas grande 
		@Domicilio varchar(50),
		@idPais char(3),
		@tel varchar(20)='',
		@email varchar(30),
		@obsevacion observacion = ''/** <-- valor por defecto, vacio */
		)
as
set nocount on
--se lo niega con el not, ya que si no existe se lo agrega con insert

declare @a bigint=0
while @a <= 1500000
	set @a = @a + 1

IF NOT EXISTS (SELECT * FROM Paciente WHERE dni=@dni)
BEGIN  
	INSERT INTO Paciente(dni,Nombre,Apellido,fNacimiento,Domicilio,idPais,Telefono,email,Observacion)
		VALUES (@dni,@nombre,@apellido,@fNacimiento,@Domicilio,@idPais,@tel,@email,@obsevacion)
	print 'El paciente se agrego correctamente'
	return 
END
ELSE
BEGIN
	print 'El paciente ya existe'
	return
END

