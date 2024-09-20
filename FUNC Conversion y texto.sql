

--FUNCIONES LEFT Y RIGHT

--LEFT(1,2) recibe dos parametros, el primero(1) es la cadena de caracteres la que yo quiero cuanto caracteres quiero tomar 
--Y el segundo(2) parametro va a ser la cantidad de caracteres que va a tomar de la izquierda.

declare @var1 varchar(20)
declare @var2 varchar(20)

	set @var1 = 'Ramiro'
	set @var2 = 'Gonzalez'
print LEFT(@var1,1) + LEFT (@var2,1) -- imprime en la consola 'Ra'
print RIGHT(@var1,1) -- Igual que el LEFT, pero el segundo toma los valores de la derecha. imprime 'ro'

--FUNCION LEN, CONTAR LA CANTIDAD DE CARACTERES DE TIPO CHAR O VARCHAR

print LEFT(@var1,LEN(@var1)-1) + LEFT (@var2,1) 
print LEN(@var2)

--FUNCION LOWER Y UPPER, sirven para formatear variables de tipo texto o campos de una table.
--
--LOWER, convierte toda la cadena de caracteres a minusculas. UPPER, convierte todo a mayusculas.
declare @var3 varchar(20)
declare @var4 varchar(20)
set @var3 = 'CARLOS'
set @var4 = 'MIGUEL'
--print LOWER(@var3) + UPPER(@var4)
print UPPER(LEFT(@var3,1)) + LOWER(RIGHT(@var3,LEN(@var3)-1)) +' '+UPPER(LEFT(@var4,1)) + LOWER(RIGHT(@var4,LEN(@var4)-1))
--Lo que hace esto es poner la iniciales en Mayusculas en caso que el usuario no lo haya hecho.

--FUNCION REPLACE, nos permite reemplazar un caracter por otro en una variable de tipo string o en el campo de un tabla.
declare @var5 varchar(20)
set @var5 = 'Fr@nco'
print @var5
--recibe 3 parametros, el primero el string(varchar). El segundo el caracter que quiero reemplazar y el tercero es el nuevo caracter
SELECT REPLACE(@var5,'@','a') AS Solucion --Se puede utilizar para modificar los campos.

--FUNCIO REPLICATE, repitir un caracter o una cadena de caracteres la cantidad de veces que nosotros quisieramos.
--Recibe dos parametros, el primero es el string y el segundo es la cantidad de veces q queremos repetir.
declare @var6 varchar(20)
set @var6 = 'Seba'
print REPLICATE(@var6,2) --Nos sirve para mostrar numeros, por ejemplos los IDS formateados con una cant de caracteres iguales,
       
--FUNCIONES LTRIM Y RTRIM, Eliminar los espacios tantos a la izquierda como a la derecha.
--Asegurarnos de limpiar registros del usuarios con caracteres vacios con estas funciones.
declare @var7 varchar(20)
declare @var8 varchar(20)
	set @var7 = '    Ramiro    '
	set @var8 = 'Gonzalez     '
--SELECT LTRIM(RTRIM(@var7)) + ' ' + RTRIM(@var8) + '*' --Elimina los espacios de de los nombres declarados

--FUNCION CONCAT, concatena dos valores diferentes. su ventaja es que podemos concatenar dos o mas valores. PEGA LAS CADENAS
SELECT CONCAT(LTRIM(RTRIM(@var7)),' ',LTRIM(RTRIM(@var8)))

--FUNCION GETDATE Y GETUTCDATE, son utilizadas en los casos que queremos almacenar en las tablas en un campo la fecha y la hora
--que fueron creados. las mas utilizada es la GETDATE
SELECT GETDATE() --Nos muestra la hora en que se realizo la funcion, es la hora de nuestro sistema.
SELECT GETUTCDATE()--Nos muestra la hora universal, que esta basada en las coordenadas del meridiano de greenwich.

--FUNCION DATEADD, permite agregarle a una fecha intervalos, es decir, guias-años-mesees,etc.
--recibe 3 parametros, el primero es el que queremos actualizar(dia, mes, etc) el segundo es la cantidad de dia o lo que fuera,
--y el 3ro es la fecha que nosotros queremos restarle o sumarle intervalos
SELECT DATEADD( hour,3,GETDATE()) --sirve para las diferencias horarios de cada pais, es decir, programarlo para que se ponga
--el horario correcto de cada pais donde esta instalado el SQL SERVER.

--FUNCION DATEDIFF, nos devuelve la diferencia de dos fechas.
--1ER parametro es intervalo a modificar. El 2do y 3ro son para las fechas donde queremos aplicar la diferncia 
SELECT DATEDIFF(YEAR,GETDATE(),'20210120')--nos va permitir si una fehca esta vencida o esta por vencer, entre otras funciones.

--FUNCION DATEPART, nos permite obtener un intervalo especifico de una fecha.
--dos parametros. uno es el intervalo y el segundo es una fecha
SELECT DATEPART(DW, GETDATE())

--FUNCION ISDATE, Nos permite evaluar una fehca especifica si tiene formato correcto o no .
IF ISDATE('20021140') = 1 --TRUE=1 FALSE=0. Se puede evaluar con el condicional if
	print'Es una fecha valida'
Else
	print'Es una fecha inexistente'

--FUNCIONES CAST Y CONVERT,
--CAST, es una funcion generica lo que hace es convertir un tipo de dato en otro, siempre y cuando sea del mismo genero, osea dentro de numeros o letras.
--CONVERT, es una implementacion de la funcion cast pero con unos parametros que nos va a permitir convertir esos tipos de datos
--COnvierte a un tipo de dato especifico el valor de un campo o variable
DECLARE @numero money
	SET @numero = 500.40
print @numero

SELECT CAST(idPaciente AS money) FROM Paciente
SELECT CAST(@numero AS int) AS entero --lo castea(convierte erl valor en el momento para la visualizacion), 
--cambia su tipo de dato que este solamente relacionado con numeros o letras.

DECLARE @numero2 money
	SET @numero2 = 490.23
print @numero2
--1er párametro es el tipo de dato al que yo quiero convertir. el 2do es el dato que quiero convertir. 3er 
SELECT CONVERT(int,@numero2) 

--3er parametro, sirve para especificar que tipo de dato quiero devolver
DECLARE @fecha datetime
	set @fecha = GETDATE()
print @fecha
SELECT CONVERT(char(20),@fecha,104) --112 es una formato de fecha utilizada por SQL, 104 es otra