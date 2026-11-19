/* La sentencia u orden siguiente pone en uso la base de datos o esquema
world, para realizar consultas a sus tablas */
use world;

-- Comentario a nivel de linea.
-- La sintaxis de la sentencia de SQL mas pequeña que se puede ejecutar
-- por ejemplo, para recuperar todos los registros de la tabla country.
select * from country;

table country;

-- Recuperar el campo Region de la tabla
SELECT 
    Region as LaRegion
FROM
    country;
    
-- No es necesarion la palabra reservada as para establecer un alias, actualmente
select Region LaRegion
from country; 

-- ¿Como hacer para que al alias lleve un espacio en blanco entre medias "La Region"
-- Rta. Encerrando el alias entre backticks, que es tipo de comillas que en el teclado
-- esta a la derecha de la tecla P   
select Region `La Region` from country;

-- Se pueden recuperar varios campos separados por comas
select Region, SurfaceArea, Population, IndepYear
from country;

-- Uso de la clausula distinct, por ejemplo para ver cuantas regiones diferentes existen en la tabla
-- country
select distinct Region
from country
order by Region asc;

-- Para limitar la cantidad de registros devueltos por la consulta se utiliza la clausula LIMIT
select distinct Region
from country
order by Region asc limit 3;

-- Si quisieramos pasar por alto los tres primeros registros y recuperar los 5 restantes
select distinct Region
from country
order by Region asc limit 3,5;

-- Ejercicio: Recuperar el pais (name) que tiene la mayor poblacion (Population)
-- Solucion con las clausulas estudiadas hasta el presente
select Name, Population
from country
order by Population desc limit 1;

-- La solucion correcta optima, Si?. Para los principiantes tienen que esperar a ver las clausulas
-- where, concepto de Subquery, concepto de funcion.
select Name, Population
from country
where Population = (select max(Population) from country);

-- LA CLAUSULA WHERE 
-- Por ejemplo: Recuperar los paises que tienen una poblacion superior a los 10 millones de habitantes
select *
from country
where Population > 10000000
order by Population asc;

-- A la consulta anterior agregarle la condicion de que el pais haya obtenido su independencia
select *
from country
where Population > 10000000 and IndepYear is not null
order by Population asc;

-- La misma consulta anterior pero que todavia no haya obtenido la independencia
select *
from country
where Population > 10000000 and IndepYear is null 
order by Population asc;

-- En la consulta anterior agregar la condicion de que la region sea del Caribe
select *
from country
where Population > 10000 and IndepYear is null or Region = 'Caribbean'
order by Population asc;

/* Uso del operador LIKE. Para busquedas exactas se utiliza el operador de asignacion (=),
pero para busquedas mas relajadas se utiliza el Operador LIKE 

A modo de ejemplo: Recuperar todos los paises donde el campo continent contenga 
la palabra America */
select Name `Pais`, Continent
from country
where Continent like '%America%'; 

-- Recuperar todos los paises donde la primera letra del Continente sea la letra A
select Name `El Pais`, Continent
from country
where Continent like '%A';


