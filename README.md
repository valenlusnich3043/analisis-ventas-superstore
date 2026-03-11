# 📊 Análisis de Ventas — Superstore Dataset

Proyecto de análisis de datos end-to-end desarrollado como parte de mi portafolio para Data Analyst Junior.
Incluye limpieza de datos con SQL, análisis exploratorio, dashboard en Excel y visualización en Power BI.

---

## 🎯 Objetivo

Identificar oportunidades de mejora en la rentabilidad de una cadena minorista analizando
patrones de ventas, márgenes por categoría, impacto de descuentos y rendimiento regional.

---

## 🛠️ Herramientas utilizadas

| Herramienta | Uso |
|---|---|
| SQLite + DBeaver | Limpieza y análisis exploratorio |
| Excel | Tablas dinámicas y análisis avanzado |
| Power BI | Dashboard interactivo |

---

## 📁 Estructura del repositorio

```
📂 analisis-ventas-superstore
├── 📄 README.md
├── 📂 sql
│   └── analisis_ventas.sql       ← Queries de limpieza y EDA
├── 📂 excel
│   └── analisis_ventas.xlsx      ← Tablas dinámicas y gráficos
├── 📂 powerbi
│   └── dashboard_ventas.pbix     ← Dashboard interactivo
└── 📂 data
    └── superstore_clean.csv      ← Dataset limpio (sin datos sensibles)
```

---

## 🔍 Hallazgos principales

### 1. Technology es la categoría más rentable
Con un margen del 17.4%, Technology supera ampliamente a Furniture (2.5%) y Office Supplies (17.0%).
A pesar de tener menos órdenes, genera $145.454 de ganancia — la más alta de las tres categorías.

### 2. Tables y Bookcases generan pérdidas activas
Dentro de Furniture, dos subcategorías destruyen valor:
- **Tables**: vende $206.965 pero **pierde $17.725** (margen -8.6%)
- **Bookcases**: vende $114.880 pero **pierde $3.472** (margen -3%)

**Recomendación:** revisar la política de precios y descuentos en estas subcategorías.

### 3. Los descuentos mayores al 20% son siempre unprofitable
| Rango de descuento | Ganancia promedio por orden |
|---|---|
| 0% | +$66,9 ✅ |
| 1% - 20% | +$26,5 ✅ |
| 21% - 40% | -$77,8 🔴 |
| Más de 40% | -$106,7 🔴 |

El 14% de las órdenes (1.393 ventas) tiene descuentos superiores al 20%,
generando una pérdida acumulada de **$135.376**.

**Recomendación:** establecer un tope máximo de 20% de descuento en toda la operación.

### 4. La región West lidera, Central necesita atención
| Región | Margen |
|---|---|
| West | 14.9% ✅ |
| East | 13.5% ✅ |
| South | 11.9% |
| Central | 7.9% 🔴 |

---

## ▶️ Cómo reproducir el análisis

1. Descargá el dataset desde [Kaggle — Superstore Sales](https://www.kaggle.com/datasets/vivek468/superstore-dataset-final)
2. Instalá [DBeaver Community](https://dbeaver.io/) (gratuito)
3. Creá una nueva conexión SQLite y una base de datos `ventas_proyecto.db`
4. Importá el CSV como tabla `Sample`
5. Ejecutá los queries en `/sql/analisis_ventas.sql` en orden

---

## 📈 Dashboard

> 🔗 [Ver dashboard en Power BI](#) ← (agregar link cuando esté publicado)

---

## 👤 Autor

Valentín Lusnich
[LinkedIn](https://www.linkedin.com/in/valent%C3%ADn-lusnich-144503230/) · [GitHub](https://github.com/valenlusnich3043)
