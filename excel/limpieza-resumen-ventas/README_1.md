# Limpieza y resumen de datos de ventas

Análisis de un trimestre de ventas (753 transacciones) de una tienda de electrónica con presencia en varias ciudades de Latinoamérica. El objetivo fue limpiar datos con errores reales de captura y generar un resumen ejecutivo con hallazgos accionables.

## Objetivo

Partir de un dataset de ventas con errores típicos de un sistema real (valores nulos, inconsistencias de texto, duplicados) y convertirlo en información lista para presentar a dirección.

## Herramientas

Excel (fórmulas, tablas dinámicas, gráficos)

## Proceso

**1. Limpieza de datos**
- Se identificaron 16 celdas vacías en las columnas `Precio unitario` y `Monto total`; se corrigieron y se marcaron en amarillo para trazabilidad.
- Se detectaron inconsistencias de formato en nombres de ciudad (mayúsculas/minúsculas mezcladas, ej. `CALI` vs `cali`) y espacios extra en correos y nombres de cliente.
- Se verificó ausencia de registros duplicados (0 encontrados).

**2. Análisis**
- Cálculo de ventas totales del trimestre, venta promedio por transacción y número de transacciones.
- Identificación del producto más vendido por cantidad.
- Identificación de la ciudad con mayor volumen de ventas.
- Identificación del mes con mejor desempeño.
- Precio promedio por categoría de producto.

**3. Visualización y reporte ejecutivo**
- Tabla dinámica para explorar ventas por ciudad, producto y mes.
- Informe ejecutivo en lenguaje de negocio con hallazgos y una recomendación operativa.

## Hallazgos principales

| Métrica | Resultado |
|---|---|
| Ventas totales del trimestre | $2,944,620.61 |
| Venta promedio por transacción | $3,910.52 |
| Transacciones totales | 753 |
| Producto más vendido (por cantidad) | Laptop-Oficina-32GB |
| Ciudad con mayores ventas | Monterrey ($541,137.36) |
| Mejor mes | Noviembre |
| Precio promedio por categoría | $1,269.01 |

## Recomendación

Se identificó una caída general del 11.3% en el periodo, no uniforme entre sucursales. Se recomienda revisar particularmente las sucursales de Ciudad de México y Medellín para entender la causa.

## Limitaciones

El análisis se basa en un solo trimestre. Se sugiere incorporar el mismo trimestre del año anterior para determinar si la caída observada es estacional o una alerta real de negocio.

## Archivo

[`Proyecto_1_Limpieza_y_resumen_de_datos.xlsx`](./Proyecto_1_Limpieza_y_resumen_de_datos.xlsx) — contiene las hojas: Datos originales, Datos limpios, Tabla dinámica, Análisis, Visualizaciones e Informe ejecutivo.
