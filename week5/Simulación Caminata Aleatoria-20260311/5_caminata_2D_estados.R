library(ggplot2)

# Definir los movimientos posibles
movimientos <- list(
  c(1, 0),   # Este
  c(-1, 0),  # Oeste
  c(0, 1),   # Norte
  c(0, -1)   # Sur
)

# Función recursiva para generar todas las posiciones posibles en n pasos
generar_posiciones <- function(n) {
  if (n == 0) {
    return(matrix(c(0, 0), ncol = 2))
  } else {
    anteriores <- generar_posiciones(n - 1)
    nuevas <- do.call(rbind, lapply(1:nrow(anteriores), function(i) {
      pos <- anteriores[i, ]
      do.call(rbind, lapply(movimientos, function(m) pos + m))
    }))
    return(unique(nuevas))
  }
}

# Elegir número de pasos
n <- 2
posiciones <- generar_posiciones(n)
df_pos <- as.data.frame(posiciones)
colnames(df_pos) <- c("x", "y")

# Graficar los puntos alcanzables
ggplot(df_pos, aes(x = x, y = y)) +
  geom_point(size = 3, color = "black") +
  geom_point(data = data.frame(x = 0, y = 0), aes(x = x, y = y), color = "red", size = 4) +
  coord_fixed() +
  theme_minimal() +
  labs(
    title = paste("Estados alcanzables en", n, "pasos desde el origen"),
    x = "Coordenada X",
    y = "Coordenada Y"
  ) +
  theme(panel.grid = element_blank())

