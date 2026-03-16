# Definir número de simulaciones
n_sim <- 10000 

# Movimientos posibles
movimientos <- list(
  N = c(0, 1),
  O = c(-1, 0),
  S = c(0, -1),
  E = c(1, 0)
)

# Simular los dos pasos
paso1 <- sample(names(movimientos), n_sim, replace = TRUE)
paso2 <- sample(names(movimientos), n_sim, replace = TRUE)

# Calcular destino en 2 pasos
destinos <- t(sapply(1:n_sim, function(i) {
  m1 <- movimientos[[paso1[i]]]
  m2 <- movimientos[[paso2[i]]]
  return(m1 + m2)  # Sumar vectores
}))

# Guardar trayectorias para graficar
trayectorias <- data.frame(
  x0 = rep(0, n_sim),
  y0 = rep(0, n_sim),
  x1 = destinos[,1],
  y1 = destinos[,2]
)

# Contar llegadas
puntos_finales <- paste(destinos[,1], destinos[,2], sep = ",")
conteo <- table(puntos_finales)
probabilidades <- prop.table(conteo)

# Ver probabilidades estimadas
library(ggplot2)

# Graficar flechas desde (0,0) hasta los destinos
ggplot(trayectorias, aes(x = x0, y = y0, xend = x1, yend = y1)) +
  geom_segment(arrow = arrow(length = unit(0.1, "inches")), alpha = 0.2, color = "grey30") +
  geom_point(aes(x = x1, y = y1), alpha = 0.3, color = "black") +
  theme_minimal() +
  coord_fixed() +
  labs(
    title = "Trayectorias de caminata aleatoria en 2 pasos desde el origen",
    x = "Eje X", y = "Eje Y"
  )


# Crear data frame de probabilidades
df_prob <- as.data.frame(probabilidades)
colnames(df_prob) <- c("Destino", "Probabilidad")

# Ordenar destinos para visualización
df_prob$Destino <- factor(df_prob$Destino, levels = df_prob$Destino[order(-df_prob$Probabilidad)])

# Gráfico de barras
ggplot(df_prob, aes(x = Destino, y = Probabilidad)) +
  geom_bar(stat = "identity", fill = "grey50", color = "black") +
  geom_text(aes(label = sprintf("%.3f", Probabilidad)), 
            vjust = -0.5, size = 4.5) +
  theme_minimal() +
  labs(
    title = "Probabilidad estimada de llegar a cada punto en 2 pasos",
    x = "Destino (x,y)", y = "Probabilidad estimada"
  ) +
  ylim(0, max(df_prob$Probabilidad) + 0.01)

