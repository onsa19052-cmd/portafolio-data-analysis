# Resumen ejecutivo de ventas — Walmart

Análisis del impacto de cada departamento en las ventas totales de la organización, para identificar qué departamentos generan mayor movimiento y así orientar la estrategia de comercialización.

## Objetivo

Determinar qué categorías de departamento son más eficientes generando ventas y cuáles están por debajo de su potencial, para apoyar decisiones sobre asignación de espacio y enfoque comercial.

## Herramientas

Excel (tablas dinámicas, dashboard, fórmulas de validación de calidad de datos)

## Estructura del archivo

| Hoja | Descripción | Tipo |
|---|---|---|
| `raw_ventas` | Datos originales de ventas semanales por tienda y departamento | Raw Data |
| `raw_departamento` | Catálogo de departamentos | Lookup |
| `raw_tiendas` | Catálogo de tiendas con tipo (A/B) y tamaño en m² | Lookup |
| `clean_ventas` | Datos depurados con uniones de catálogos y estandarización | Clean Data |
| `Pivot` | Tablas dinámicas asociadas a los datos limpios | Pivot |
| `Dashboard` | KPIs y gráficos ejecutivos | Dashboard |
| `Resumen` | Preguntas de negocio, insights y evidencias | Resumen |

## KPIs utilizados

| KPI | Descripción | Interpretación |
|---|---|---|
| Ventas por m² | Ventas ajustadas por tamaño de tienda | A mayor cifra, mayor eficiencia por metro cuadrado |
| % de participación | Participación del departamento sobre el total de ventas | A mayor %, mayor volumen relativo de venta |

## Validaciones de calidad de datos (QA)

Antes de analizar, se verificó la integridad del dataset:
- Tiendas sin departamento asignado: **6,435** registros identificados y tratados.
- Ventas negativas o nulas: **27** registros revisados.
- Tamaños en m² con valor 0: **0** — sin inconsistencias.

## Hallazgos principales

**¿Qué departamentos fueron más eficientes generando ventas?**
Despensa y básicos, comida y artículos del hogar concentran el 38% del total de ventas, mientras que los 4 departamentos más pequeños suman apenas entre 10-12% combinado.

**¿Qué implica esto para el negocio?**
La dependencia en 3 departamentos representa un riesgo de concentración: cualquier disrupción en despensa/básicos o comida fresca afectaría desproporcionadamente el total de ventas.

**¿Qué departamentos están por debajo de su potencial?**
Jardín, vida al aire libre y oficina muestran baja eficiencia de ventas por metro cuadrado frente a despensa y básicos, que es por mucho el departamento más eficiente en uso de espacio.

## Recomendación

Reducir el metraje asignado a jardín, vida al aire libre y oficina, y reasignar ese espacio para expandir despensa y básicos, comida fresca o artículos para el hogar.

## Archivo

[`Proyecto_2_Resumen_Ejecutivo_de_Ventas_Walmart.xlsx`](./Proyecto_2_Resumen_Ejecutivo_de_Ventas_Walmart.xlsx)
