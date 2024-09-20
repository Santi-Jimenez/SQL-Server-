--LEFT Y RIGHT, listado de pacientes--> obtener iniciales
SELECT * FROM Paciente 
SELECT Nombre, Apellido FROM Paciente
SELECT LEFT(Nombre, 1) + LEFT(Apellido,1) AS InicialesPacientes FROM Paciente 

--LEN, lista de la cantidad de caracteres que tiene el campo domiciolio de paciente
SELECT * FROM Paciente
SELECT Domicilio FROM Paciente
SELECT LEN(Domicilio) AS TotalDeCaracteres FROM Paciente 



