/*2. La Floristería "Fiorella" quiere saber cómo se compran sus productos, y tiene la data
de tres departamentos del país, por lo cual les pide su opinión sobre qué productos sobresalen,
que combinaciones son mejores y quieren este estudio por departamento y también por país.*/

--Usamos la tabla
use Fiorella;

--Analisis para sucursal en San Salvador
select * from flores_sa;

--Query para saber que articulo habia comprado cada cliente
select id as Cliente, Articulo, Venta
from flores_sa
UNPIVOT ( 
	Venta for Articulo in (Rosas, Claveles, Macetas, Tierra, Girasoles, Hortensia, Globos, Tarjetas, fOrquídias, Carmesí, Lirios, Aurora, Tulipanes, Listón)
	) as UnpivotedData 
where Venta = 1;

--Para ver el total de ventas de un articulo
SELECT 'Total' AS CombinacionFlores, COUNT(*) AS TotalVentas
FROM flores_sa
UNPIVOT (
    Venta FOR Flor IN (Rosas, Claveles, Macetas, Tierra, Girasoles, Hortensia, Globos, Tarjetas, fOrquídias, Carmesí, Lirios, Aurora, Tulipanes, Listón)
) AS UnpivotedData
WHERE Venta = 1
UNION ALL
SELECT Flor AS CombinacionFlores, COUNT(*) AS TotalVentas
FROM flores_sa
UNPIVOT (
    Venta FOR Flor IN (Rosas, Claveles, Macetas, Tierra, Girasoles, Hortensia, Globos, Tarjetas, fOrquídias, Carmesí, Lirios, Aurora, Tulipanes, Listón)
) AS UnpivotedData
WHERE Venta = 1
GROUP BY Flor
ORDER BY TotalVentas DESC;

--Para saber cual fue la combinación más vendida en sucursal San Salvador
	SELECT TOP 1
    Rosas,
    Claveles,
    Macetas,
    Tierra,
    Girasoles,
    Hortensia,
    Globos,
    Tarjetas,
    fOrquídias,
    Carmesí,
    Lirios,
    Aurora,
    Tulipanes,
    Listón,
    COUNT(*) AS TotalVentas
FROM flores_sa
GROUP BY
    Rosas,
    Claveles,
    Macetas,
    Tierra,
    Girasoles,
    Hortensia,
    Globos,
    Tarjetas,
    fOrquídias,
    Carmesí,
    Lirios,
    Aurora,
    Tulipanes,
    Listón
ORDER BY TotalVentas DESC;

--Respuesta: La combinación más vendida fue: Girasoles, Tarjetas, Orquideias, Auroras y Tulipanes repitiendose está combinación dos veces

--Analisis para sucursal en San Miguel

select * from flores_sm;

SELECT TOP 1
    Rosas,
    Claveles,
    Macetas,
    Tierra,
    Girasoles,
    Hortensia,
    Globos,
    Tarjetas,
    fOrquídias,
    Carmesí,
    Lirios,
    Aurora,
    Tulipanes,
    Listón,
    COUNT(*) AS TotalVentas
FROM flores_sm
GROUP BY
    Rosas,
    Claveles,
    Macetas,
    Tierra,
    Girasoles,
    Hortensia,
    Globos,
    Tarjetas,
    fOrquídias,
    Carmesí,
    Lirios,
    Aurora,
    Tulipanes,
    Listón
ORDER BY TotalVentas DESC;

--Respuesta: La combinación más vendida fue: Tierra, Hortensias, Orquidias, Auroras y Tulipanes repitiendose está combinación dos veces

--Analisis para sucursal en Santa Ana

select * from flores_sa;

SELECT TOP 1
    Rosas,
    Claveles,
    Macetas,
    Tierra,
    Girasoles,
    Hortensia,
    Globos,
    Tarjetas,
    fOrquídias,
    Carmesí,
    Lirios,
    Aurora,
    Tulipanes,
    Listón,
    COUNT(*) AS TotalVentas
FROM flores_sa
GROUP BY
    Rosas,
    Claveles,
    Macetas,
    Tierra,
    Girasoles,
    Hortensia,
    Globos,
    Tarjetas,
    fOrquídias,
    Carmesí,
    Lirios,
    Aurora,
    Tulipanes,
    Listón
ORDER BY TotalVentas DESC;

--Respuesta: La combinación más vendida fue: Girasoles, Tarjetas, Orquidias, Auroras y Tulipanes repitiendose está combinación dos veces.
