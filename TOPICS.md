1. FUNDAMENTOS DE SIMULACIÓN
- Concepto de simulación
- Aplicabilidad de la simulación
- Estimación de probabilidades mediante simulación
- Frecuencia absoluta y relativa
- Probabilidad empírica vs teórica

2. FORMULACIÓN DE MODELOS DE SIMULACIÓN
- Definición de sistemas simulados
- Construcción de algoritmos
- Diagramas de flujo
- Variables de estado y acumuladores
- Iteraciones (N simulaciones)
- Reporte de resultados

3. SIMULACIÓN DE JUEGOS DE AZAR
- Ruleta (modelación, probabilidades, frecuencias)
- Dados (comparación de jugadores, conteo de victorias)
- Craps (reglas, eventos de ganar/perder, simulación iterativa)
- Bacarat (reglas, módulo 10, decisiones probabilísticas)

4. CAMINATA ALEATORIA (RANDOM WALK)
- Definición
- Representación en 2D (coordenadas)
- Probabilidades de transición (1/4)
- Generación con números aleatorios uniformes
- Estados del proceso
- Trayectorias posibles
- Probabilidad por trayectoria
- Probabilidad de llegar a un estado en n pasos
- Simulación en R
- Interpretación como proceso estocástico
- Introducción a cadenas de Markov

5. NÚMEROS ALEATORIOS
- Números pseudoaleatorios
- Distribución uniforme (0,1)
- Propiedades: esperanza, varianza, independencia, uniformidad
- Métodos de generación:
  - Manuales
  - Mecánicos
  - Digitales
- Método de cuadrados medios
- Métodos congruenciales (multiplicativo, aditivo, mixto)
- Parámetros: semilla, módulo, constantes
- Propiedades de un buen generador:
  - Independencia
  - Uniformidad
  - Reproducibilidad
  - Periodo largo
  - Eficiencia
- Pruebas de aleatoriedad y uniformidad

6. VARIABLES ALEATORIAS
- Variables aleatorias discretas (moneda, dado, ruleta)
- Distribución de probabilidad
- Función de distribución acumulada (CDF)
- Esperanza, varianza, desviación estándar
- Variables aleatorias continuas
- Distribución uniforme (a,b)

7. GENERACIÓN DE VARIABLES ALEATORIAS
- Método de la transformada inversa
- Uso de la CDF inversa
- Generación de muestras
- Método del rechazo
- Normalización de funciones
- Aceptación/rechazo de muestras
- Método de convolución (conceptual)

8. MÉTODOS DE INTEGRACIÓN POR SIMULACIÓN
- Método de Monte Carlo
- Estimación de área bajo la curva
- Proporción m/n
- Interpretación probabilística

9. IMPLEMENTACIÓN COMPUTACIONAL
- Simulación en R
- Generación de muestras
- Visualización de resultados
- Comparación teoría vs simulación

10. ANÁLISIS DE RESULTADOS
- Validación de modelos
- Comparación teórica vs empírica
- Interpretación de resultados
- Sensibilidad a parámetros