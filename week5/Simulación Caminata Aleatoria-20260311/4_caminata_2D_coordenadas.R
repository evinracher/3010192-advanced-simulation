library(ggplot2)
library(dplyr)

# Definir movimientos cardinales
movimientos <- list(
  c(1, 0),   # Este
  c(-1, 0),  # Oeste
  c(0, 1),   # Norte
  c(0, -1)   # Sur
)

# Función para generar trayectorias
generar_trayectorias <- function(n, pos = c(0, 0), camino = list()) {
  if (n == 0) {
    return(list(c(camino, list(pos))))
  } else {
    rutas <- list()
    for (m in movimientos) {
      nueva_pos <- pos + m
      nuevas_rutas <- generar_trayectorias(n - 1, nueva_pos, c(camino, list(pos)))
      rutas <- c(rutas, nuevas_rutas)
    }
    return(rutas)
  }
}

# Número de pasos
n <- 2

# Generar trayectorias
trayectorias <- generar_trayectorias(n)

# Convertir trayectorias a data frame
df_trayectorias <- do.call(rbind, lapply(1:length(trayectorias), function(i) {
  pasos <- trayectorias[[i]]
  do.call(rbind, lapply(1:length(pasos), function(j) {
    data.frame(
      id = i,
      paso = j - 1,
      x = pasos[[j]][1],
      y = pasos[[j]][2]
    )
  }))
}))

# Obtener puntos finales únicos
puntos_finales <- df_trayectorias %>%
  group_by(id) %>%
  slice_tail(n = 1) %>%
  ungroup() %>%
  distinct(x, y) %>%
  mutate(label = paste0("(", x, ",", y, ")"))

# Graficar
ggplot() +
  geom_path(data = df_trayectorias, aes(x = x, y = y, group = id), color = "grey30", alpha = 0.3) +
  geom_point(data = data.frame(x = 0, y = 0), aes(x = x, y = y), color = "red", size = 3) +
  geom_text(data = puntos_finales, aes(x = x, y = y, label = label), vjust = -0.8, size = 3) +
  coord_fixed() +
  theme_minimal() +
  labs(
    title = paste("Trayectorias en", n, "pasos desde el origen con coordenadas de estados finales"),
    x = "Coordenada X", y = "Coordenada Y"
  ) +
  theme(panel.grid = element_blank())



# Contar cuántas trayectorias terminan en cada estado
tabla_estados <- df_trayectorias %>%
  group_by(id) %>%
  slice_tail(n = 1) %>%
  ungroup() %>%
  count(x, y, name = "frecuencia") %>%
  mutate(probabilidad = round(frecuencia / sum(frecuencia), 3)) %>%
  arrange(desc(frecuencia))

# Mostrar tabla
print(tabla_estados)
