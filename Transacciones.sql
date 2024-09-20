
--TRANSACCIONES, nos va a permiter realizar una transaccion validarala y si se realzan los procedimientos deseados vamos a ejecutar
--un comick, es decir confirmala. o vamos a ejecutar un roll back, una cancelacion de esa transaccion.
--Una transaccion se utiliza para evaluar una porcion de codigo donde estamos actualizando o borrando datos en donde no estamos
--seguros de lo que estamos haciendo, el cual se cancela la transaccion y se deja todo como estaba

 --BEGIN TRANSACTION
 SELECT * FROM Paciente

 BEGIN TRAN --cuando se utiliza una transaccion, la tabla involucrada queda bloqueada por los comandos hasta que ejecutemos un commit o roll back
	UPDATE Paciente SET Telefono=444 WHERE Apellido = 'Lopez'
IF @@ROWCOUNT = 1 --cuantos registros fueron modificados en l instruccion anterior
	COMMIT TRAN
ELSE 
	ROLLBACK TRAN --CANCELA el update y deja los valores como estan, evitando modificaciones

--Otro ejemplo

SELECT * FROM Turno

BEGIN TRAN
	DELETE from Turno WHERE estado = 2
IF @@ROWCOUNT = 1
	COMMIT TRAN
ELSE
	ROLLBACK TRAN