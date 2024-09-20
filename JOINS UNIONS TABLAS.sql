
--INNER JOIN, cruzar tablas donde nos de un resultado en comun. Con ON se vincula las dos tablas. Ambigua no puede determinar donde pertenece c/u
SELECT * FROM Paciente
SELECT * FROM TurnoPacienteMedico

SELECT * FROM Paciente AS P
INNER JOIN TurnoPacienteMedico AS T --Agregarle Alias para que se puede determinar donde pertenece c/u.
ON T.idPaciente = P.idPaciente --Asegurarnos de hacer la conexion por todas las primary key ya que mejora la perfomance.

--Lado izquierdo sea de la tabla inmediata, la de que sea simple para no forzar.

--LEFT JOIN, obtener todo el registro de la tabla de la izquierda y solamente los que coinciden con los de la derecha
SELECT * FROM Paciente AS P
LEFT JOIN TurnoPacienteMedico AS T
ON T.idPaciente = P.idPaciente

--RIGHT JOIN, obtener todo el registro de la tabla de la derecha y solamente los que coinciden con los de la izquierda
SELECT * FROM Paciente AS P
RIGHT JOIN TurnoPacienteMedico AS T
ON T.idPaciente = P.idPaciente
----------------------------------
--UNION Y UNION ALL, nos permite unir dos resultados de dos consultas diferentes. Se puede obtener dos consultas diferentes con la misma cant de campos
--Utilizarla para sumar resultados de la misma tabla o tabla similar.
SELECT * FROM Turno WHERE estado=0
UNION --unir ambos resultados en una consulta, sean los mismo y mismo tipos de datos. Elimina las repeticiones
--SELECT * FROM Paciente --Da error ya que no tienen la misma estructuras
SELECT * FROM Turno WHERE estado=1
-----------------------
SELECT * FROM Turno 
UNION ALL --Devolver todo, hasta repeticiones
SELECT * FROM Turno 

--SELECT TOP 2 * FROM Paciente ORDER BY fNacimiento DESC
