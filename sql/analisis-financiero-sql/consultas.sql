/* ============================================================
   Análisis del desempeño financiero — SQL
   Cálculo de KPIs financieros (margen, ROI) por país a partir
   de datos de ventas, productos, territorios y campañas.
   ============================================================ */


/* -------------------------------------------------------------
   Parte 1: Explorar el esquema
   Vista rápida de la tabla de campañas para entender su estructura
   antes de construir las consultas principales.
   ------------------------------------------------------------- */

SELECT *
FROM campanas
LIMIT 10;


/* -------------------------------------------------------------
   Parte 2: Extraer y limpiar datos
   Une ventas 2017 con catálogo de productos, categorías y
   territorios. Calcula ingreso y costo total por línea de pedido,
   usando COALESCE para blindar contra valores nulos.
   ------------------------------------------------------------- */

SELECT
    v.numero_pedido,
    v.clave_producto,
    p.nombre_producto,
    pc.clave_categoria,
    COALESCE(p.precio_producto, 0)  AS precio_producto,
    COALESCE(v.cantidad_pedido, 0)  AS cantidad_pedido,
    (COALESCE(p.precio_producto, 0) * COALESCE(v.cantidad_pedido, 0)) AS ingreso_total,
    COALESCE(p.costo_producto, 0)   AS costo_producto,
    (COALESCE(p.costo_producto, 0) * COALESCE(v.cantidad_pedido, 0)) AS costo_total,
    t.pais,
    t.continente,
    v.clave_territorio
FROM ventas_2017 AS v
LEFT JOIN productos AS p
    ON v.clave_producto = p.clave_producto
LEFT JOIN productos_categorias AS pc
    ON p.clave_subcategoria = pc.clave_subcategoria
LEFT JOIN territorios AS t
    ON v.clave_territorio = t.clave_territorio;


/* -------------------------------------------------------------
   Parte 3: Calcular KPIs financieros
   Agrega ingresos, costos y costo de campaña por país.
   Calcula beneficio bruto, margen % y ROI % de las campañas.
   ------------------------------------------------------------- */

SELECT
    p.pais,
    p.clave_territorio,
    SUM(p.ingresos)::integer AS ingresos,
    SUM(p.costos)::integer AS costos,
    COALESCE(SUM(c.costo_campana), 0)::integer AS costo_campana,
    (SUM(p.ingresos)::integer - SUM(p.costos)::integer) AS beneficio_bruto,
    ((SUM(p.ingresos) - SUM(p.costos)) * 100 / NULLIF(SUM(p.ingresos), 0)) AS margen_pct,
    (((SUM(p.ingresos) - SUM(p.costos))) * 100 / NULLIF(COALESCE(SUM(c.costo_campana), 0), 0)) AS roi_pct
FROM pais_ingreso_costo AS p
LEFT JOIN pais_campanas AS c
    ON p.clave_territorio = c.clave_territorio
GROUP BY
    p.pais,
    p.clave_territorio
ORDER BY
    p.clave_territorio, ingresos, costos;


/* -------------------------------------------------------------
   Parte 4: Validar resultados y QA
   Verifica que no existan productos con precio inválido (<= 0)
   antes de confiar en los cálculos anteriores.
   ------------------------------------------------------------- */

SELECT
    SUM(CASE WHEN precio_producto <= 0 THEN 1 ELSE 0 END) AS productos_precio_no_valido
FROM productos;
