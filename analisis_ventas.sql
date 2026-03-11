-- ============================================================
-- PROYECTO: Análisis de Ventas - Superstore Dataset
-- AUTOR: [Valentin Lusnich]
-- FECHA: 2026
-- HERRAMIENTA: SQLite / DBeaver
-- ============================================================


-- ------------------------------------------------------------
-- FASE 1: EXPLORACIÓN Y LIMPIEZA DE DATOS
-- ------------------------------------------------------------

-- Total de filas del dataset
SELECT COUNT(*) AS total_filas 
FROM Sample;
-- Resultado: 9.994 filas

-- Verificar nulos en columnas clave
SELECT
  COUNT(*) - COUNT([Order ID])      AS nulos_order_id,
  COUNT(*) - COUNT([Customer Name]) AS nulos_cliente,
  COUNT(*) - COUNT(Sales)           AS nulos_ventas,
  COUNT(*) - COUNT(Profit)          AS nulos_profit,
  COUNT(*) - COUNT(Region)          AS nulos_region
FROM Sample;
-- Resultado: 0 nulos en todas las columnas clave

-- Verificar duplicados por Order ID
-- (es normal que un Order ID se repita por tener múltiples productos)
SELECT [Order ID], COUNT(*) AS veces
FROM Sample
GROUP BY [Order ID]
HAVING COUNT(*) > 1
ORDER BY veces DESC
LIMIT 10;


-- ------------------------------------------------------------
-- FASE 2: ANÁLISIS EXPLORATORIO (EDA)
-- ------------------------------------------------------------

-- 1. Rendimiento por categoría
-- Hallazgo: Technology tiene el mejor margen. Furniture vende mucho pero gana poco.
SELECT 
  Category,
  COUNT([Order ID])                            AS total_ordenes,
  ROUND(SUM(Sales), 2)                         AS ventas_totales,
  ROUND(SUM(Profit), 2)                        AS ganancia_total,
  ROUND(SUM(Profit) / SUM(Sales) * 100, 1)    AS margen_pct
FROM Sample
GROUP BY Category
ORDER BY ventas_totales DESC;


-- 2. Subcategorías de Furniture con pérdidas
-- Hallazgo: Tables pierde $17.725 y Bookcases pierde $3.472
SELECT
  [Sub-Category],
  ROUND(SUM(Sales), 2)                         AS ventas,
  ROUND(SUM(Profit), 2)                        AS ganancia,
  ROUND(SUM(Profit) / SUM(Sales) * 100, 1)    AS margen_pct
FROM Sample
WHERE Category LIKE '%Furniture%'
GROUP BY [Sub-Category]
ORDER BY ganancia ASC;


-- 3. Impacto de los descuentos en la rentabilidad
-- Hallazgo: Descuentos mayores al 20% generan pérdida promedio de $77 a $107 por orden
SELECT
  CASE
    WHEN Discount = 0       THEN '0% descuento'
    WHEN Discount <= 0.2    THEN '1-20% descuento'
    WHEN Discount <= 0.4    THEN '21-40% descuento'
    ELSE                         'Más de 40%'
  END AS rango_descuento,
  COUNT(*)                       AS ordenes,
  ROUND(SUM(Profit), 2)          AS ganancia_total,
  ROUND(AVG(Profit), 2)          AS ganancia_promedio
FROM Sample
GROUP BY rango_descuento
ORDER BY ganancia_promedio DESC;


-- 4. Rendimiento por región
-- Hallazgo: West lidera con 14.9% de margen. Central es la región más débil (7.9%)
SELECT
  Region,
  COUNT([Order ID])                            AS ordenes,
  ROUND(SUM(Sales), 2)                         AS ventas_totales,
  ROUND(SUM(Profit), 2)                        AS ganancia_total,
  ROUND(SUM(Profit) / SUM(Sales) * 100, 1)    AS margen_pct
FROM Sample
GROUP BY Region
ORDER BY ganancia_total DESC;