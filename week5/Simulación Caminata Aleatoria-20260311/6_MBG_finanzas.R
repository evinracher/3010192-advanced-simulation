# 1- Ejemplo 2: MBG____________________________________####
#Movimiento Browniano Geométrico Aplicado a Finanzas

# Simulación de Movimiento Browniano Geométrico para
#el precio de activo financiero


# 2- Parámetros de entrada (conocidos o estimados#_____####
S0 <- 43.96        # Precio inicial (11 marzo 2026)
mu <- 0.165        # Rendimiento medio anual
sigma <- 0.212     # Volatilidad anual
dias <- 90         # Horizonte de simulación en días
trayectorias <- 100 # Número de trayectorias

# 3- Configuración temporal____________________________####
dt <- 1/252        # Paso de tiempo (asumiendo 252 días hábiles por año)
tiempo <- seq(0, dias, by = 1)  # Vector de tiempo en días
n <- length(tiempo) - 1         # Número de pasos



# Crear matriz para almacenar las trayectorias
# Filas: tiempo (días), Columnas: trayectorias
precios <- matrix(0, nrow = n + 1, ncol = trayectorias)
precios[1, ] <- S0  # Precio inicial para todas las trayectorias

#Cálculo del  MBG simulado para 90 días

for (j in 1:trayectorias) {
  for (i in 1:n) {
    # Generar variable aleatoria normal estándar
    Z <- rnorm(1)
    
    # Aplicar fórmula del Movimiento Browniano Geométrico
    # S(t+dt) = S(t) * exp((mu - sigma^2/2)*dt + sigma*sqrt(dt)*Z)
    precios[i + 1, j] <- precios[i, j] * 
      exp((mu - sigma^2/2) * dt + sigma * sqrt(dt) * Z)
  }
}

# Crear dataframe con fechas
fecha_inicio <- as.Date("2026-03-11")
fechas <- seq(fecha_inicio, by = "day", length.out = n + 1)

# Convertir a dataframe para facilitar el análisis
df_precios <- as.data.frame(precios)
colnames(df_precios) <- paste0("Trayectoria_", 1:trayectorias)
df_precios$Fecha <- fechas

# Reordenar columnas para tener Fecha primero
df_precios <- df_precios[, c("Fecha", paste0("Trayectoria_", 1:trayectorias))]

# Visualización de resultados
library(ggplot2)
library(reshape2)

# Preparar datos para ggplot
df_long <- melt(df_precios, id.vars = "Fecha", 
                variable.name = "Trayectoria", 
                value.name = "Precio")

# Gráfico de las trayectorias
ggplot(df_long, aes(x = Fecha, y = Precio, color = Trayectoria)) +
  geom_line(alpha = 0.6) +
  scale_color_manual(values = rainbow(trayectorias)) +
  labs(title = paste("Simulación de Movimiento Browniano Geométrico -",
                     trayectorias, "trayectorias"),
       subtitle = paste("Precio inicial: $", S0, " | μ =", mu, 
                        " | σ =", sigma, " | Período:", dias, "días"),
       x = "Fecha", y = "Precio (USD)") +
  theme_minimal() +
  theme(legend.position = "none") +  # Ocultar leyenda por tener muchas trayectorias
  scale_x_date(date_labels = "%b %d", date_breaks = "15 days")

# Estadísticas descriptivas
precio_final <- precios[n + 1, ]
cat("\n=== Estadísticas de la simulación ===\n")
cat("Precio inicial (11/03/2026): $", S0, "\n")
cat("Precio promedio final después de", dias, "días: $", 
    round(mean(precio_final), 2), "\n")
cat("Desviación estándar de precios finales: $", 
    round(sd(precio_final), 2), "\n")
cat("Precio final mínimo: $", round(min(precio_final), 2), "\n")
cat("Precio final máximo: $", round(max(precio_final), 2), "\n")
cat("Percentil 5%: $", round(quantile(precio_final, 0.05), 2), "\n")
cat("Percentil 95%: $", round(quantile(precio_final, 0.95), 2), "\n")

# Histograma de precios finales
hist(precio_final, breaks = 20, 
     main = "Distribución de Precios Finales",
     xlab = "Precio final (USD)", 
     ylab = "Frecuencia",
     col = "lightblue", 
     border = "black")
abline(v = S0, col = "red", lwd = 2, lty = 2)
legend("topright", legend = c("Precio inicial"), 
       col = c("red"), lty = 2, lwd = 2)

# Algunas trayectorias seleccionadas para mejor visualización
set.seed(456)
trayectorias_seleccionadas <- sample(1:trayectorias, 10)
df_seleccion <- df_long[df_long$Trayectoria %in% 
                          paste0("Trayectoria_", trayectorias_seleccionadas), ]

ggplot(df_seleccion, aes(x = Fecha, y = Precio, color = Trayectoria)) +
  geom_line(size = 1) +
  scale_color_manual(values = rainbow(10)) +
  labs(title = "10 Trayectorias Seleccionadas del GBM",
       x = "Fecha", y = "Precio (USD)") +
  theme_minimal() +
  theme(legend.position = "right")

