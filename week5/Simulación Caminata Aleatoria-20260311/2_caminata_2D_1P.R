#1-Número de simulaciones
n_sim <- 1000

#2-Movimientos posibles (Norte, Oeste, Sur, Este)
movimientos <- list(
  N = c(0, 1),
  O = c(-1, 0),
  S = c(0, -1),
  E = c(1, 0)
)

#3-Simulación de los movimientos
direcciones <- sample(names(movimientos), 
                      n_sim, replace = TRUE)

#4-Inicializar matrices para almacenar coordenadas
origen <- matrix(rep(c(0, 0), n_sim), ncol = 2, byrow = TRUE)
destino <- t(sapply(direcciones, function(d) movimientos[[d]]))

#5-Conteo de las frecuencias de llegada
conteo <- table(direcciones)
probabilidades <- prop.table(conteo)

#6-Probabilidades empíricas
print(probabilidades)

#7-Trazar las trayectorias
library(ggplot2)

# Creando data frame para graficar
datos <- data.frame(
  x0 = origen[,1],
  y0 = origen[,2],
  x1 = destino[,1],
  y1 = destino[,2],
  direccion = direcciones
)

# Graficar flechas desde el origen hacia cada dirección
ggplot(datos, aes(x = x0, y = y0, xend = x1, 
                  yend = y1, color = direccion)) +
  geom_segment(arrow = arrow(length = unit(0.15, "inches")), 
               alpha = 0.3) +
  geom_point(aes(x = x1, y = y1), size = 3, 
             alpha = 0.5) +
  theme_minimal() +
  coord_fixed() +
  labs(title = "Caminata aleatoria en 2D desde 
       el origen en un paso",
       x = "Eje X", y = "Eje Y")


#8-Convertir probabilidades a data frame para graficar
df_prob <- as.data.frame(probabilidades)
colnames(df_prob) <- c("Direccion", "Probabilidad")

# Crear gráfico
ggplot(df_prob, aes(x = Direccion, y = Probabilidad)) +
  geom_bar(stat = "identity", fill = "grey50", color = "black") +
  geom_text(aes(label = sprintf("%.3f", Probabilidad)), 
            vjust = -0.5, size = 5) +
  theme_minimal() +
  labs(
    title = "Probabilidad estimada de cada dirección en un paso",
    x = "Dirección cardinal",
    y = "Probabilidad estimada"
  ) +
  ylim(0, max(df_prob$Probabilidad) + 0.05)











