
 --print dbo.FCN_FechaTexto ('20191021')

 ALTER FUNCTION FCN_FechaTexto (@fecha datetime)

 RETURNS VARCHAR(60)

 AS
 BEGIN

 declare @dia varchar(20)
 declare @mes varchar(20)
 declare @fechaTexto varchar(50)

set @dia = (CASE WHEN datepart(dw,@fecha) = 1 THEN 'Domingo ' + convert(char(2),DATEPART(dd,@fecha))
					WHEN datepart(dw,@fecha) = 2 THEN 'Lunes ' + convert(char(2),DATEPART(dd,@fecha))
					WHEN datepart(dw,@fecha) = 3 THEN 'Martes ' + convert(char(2),DATEPART(dd,@fecha))
					WHEN datepart(dw,@fecha) = 4 THEN 'Miercoles ' + convert(char(2),DATEPART(dd,@fecha))
					WHEN datepart(dw,@fecha) = 5 THEN 'Jueves ' + convert(char(2),DATEPART(dd,@fecha))
					WHEN datepart(dw,@fecha) = 6 THEN 'Viernes ' + convert(char(2),DATEPART(dd,@fecha))
					WHEN datepart(dw,@fecha) = 7 THEN 'Sabado ' + convert(char(2),DATEPART(dd,@fecha))
				END)

set @mes= (CASE WHEN DATEPART(MM,@fecha) = 1 THEN 'Enero'
				WHEN DATEPART(MM,@fecha) = 2 THEN 'Febrero'
				WHEN DATEPART(MM,@fecha) = 3 THEN 'Marzo'
				WHEN DATEPART(MM,@fecha) = 4 THEN 'Abril'
				WHEN DATEPART(MM,@fecha) = 5 THEN 'Mayo'
				WHEN DATEPART(MM,@fecha) = 6 THEN 'Junio'
				WHEN DATEPART(MM,@fecha) = 7 THEN 'Julio'
				WHEN DATEPART(MM,@fecha) = 8 THEN 'Agosto'
				WHEN DATEPART(MM,@fecha) = 9 THEN 'Septiembre'
				WHEN DATEPART(MM,@fecha) = 10 THEN 'Octubre'
				WHEN DATEPART(MM,@fecha) = 11 THEN 'Noviembre'
				WHEN DATEPART(MM,@fecha) = 12 THEN 'Diciembre'
			END)

set @fechaTexto = @dia + ' de ' + @mes
RETURN @fechaTexto
 END