# Análisis del desempeño financiero con SQL

Análisis de rentabilidad y retorno de inversión en campañas de marketing, por país, a partir de datos de ventas 2017, catálogo de productos y costos de campañas.

## Objetivo

Calcular KPIs financieros (margen bruto, ROI de campañas) por país para entender qué mercados son más eficientes y detectar oportunidades de mejora en la asignación del gasto de marketing.

## Herramientas

SQL (joins múltiples, agregaciones, casting, validación de datos) + Google Sheets para el resumen ejecutivo y dashboard.

## Proceso

**1. Exploración del esquema**
Revisión inicial de la tabla de campañas para entender su estructura antes de construir las consultas de negocio.

**2. Extracción y limpieza de datos**
Unión de ventas, productos, categorías y territorios en una sola vista, calculando ingreso y costo total por línea de pedido. Se usó `COALESCE` para blindar los cálculos contra valores nulos.

**3. Cálculo de KPIs financieros**
Agregación por país de ingresos, costos y costo de campaña, para obtener:
- **Beneficio bruto** = Ingresos − Costos
- **Margen %** = Beneficio bruto / Ingresos
- **ROI %** = Beneficio bruto / Costo de campaña

**4. Validación y QA**
Verificación de que no existan productos con precio inválido (≤ 0) antes de confiar en los resultados agregados.

## Resultados por país

| País | Ingresos | Costos | Costo campaña | Beneficio bruto | Margen % | ROI % |
|---|---|---|---|---|---|---|
| Estados Unidos | $3,353,940 | $1,899,471 | $1,920,000 | $1,454,469 | 43.4% | 75.8% |
| Australia | $2,532,003 | $1,474,958 | $2,150,400 | $1,057,045 | 41.8% | 49.2% |
| Reino Unido | $1,189,637 | $681,509 | $2,304,000 | $508,128 | 42.7% | 22.1% |
| Alemania | $1,071,460 | $611,295 | $2,265,600 | $460,165 | 43.0% | 20.3% |
| Francia | $924,317 | $527,797 | $2,208,000 | $396,520 | 42.9% | 18.0% |
| Canadá | $710,205 | $392,326 | $1,824,000 | $317,879 | 44.8% | 17.4% |

## Hallazgos principales

**El margen bruto es consistente entre países (~42-45%)**, lo cual es una señal saludable de negocio. Sin embargo, el costo de campaña es muy similar entre países pese a las grandes diferencias en volumen de ventas — no hay proporcionalidad entre inversión en marketing y volumen de ingresos.

**¿Margen vs. ROI?** El margen mide qué % de los ingresos se convierte en utilidad; el ROI mide cuánto se gana en relación con lo invertido en campañas.

**Estados Unidos tiene el ROI más alto (75.8%)** con uno de los costos de campaña más bajos relativos a su volumen. Canadá, en cambio, tiene el ROI más bajo — su costo de campaña es proporcionalmente muy alto frente a sus ingresos.

## Simulación: ¿qué pasaría si el gasto en campañas subiera 50%?

El ROI bajaría en todos los países, pero de forma desigual. En Estados Unidos el impacto sería menor gracias a su gran volumen de ingresos; en países como Canadá y Francia la caída del ROI sería considerable.

## Recomendación

Definir el costo de las campañas de forma proporcional al beneficio bruto de cada país, en lugar de un monto similar para todos. Se sugiere analizar el modelo de asignación de Estados Unidos como referencia para replicarlo en los países con ROI más bajo.

## Archivos

- [`consultas.sql`](./consultas.sql) — las 4 consultas del análisis, comentadas.
- [`Proyecto_3_Analisis_desempeno_financiero_resumen_ejecutivo.xlsx`](./Proyecto_3_Analisis_desempeno_financiero_resumen_ejecutivo.xlsx) — dashboard con los KPIs, insights y respuestas a las preguntas de negocio.
