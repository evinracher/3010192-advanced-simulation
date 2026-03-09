#2- Instalación de paquetes_______________________####
# Los 4 númerales son para un bloque de código

# Instalación de paquete

install.packages(c("e1071", "moments"))
# Cargar paquetes
library(e1071)
library(moments)
#3- Ingreso de datos______________________________####
datos <- c(23.39, 6.12, 16.35, 20.41, 9.67, 22.57, 5.37, 18.58,
           18.24, 15.05, 7.62, 65.06, 33.48, 16.38, 18.23, 14.43,
           4.03, 23.61, 22.69, 5.73, 17.61, 40.39, 21.55, 26.42,
           11.7, 18.83, 13.86, 28.83, 21.8, 34.58, 20.33, 18.25,
           23.7, 45.54, 28.22, 10.71, 18.6, 19.51, 13.01, 34.86,
           18.37, 24.45, 15.67, 17.12, 65.23, 20.3, 5.64, 15.07,
           15.46, 16.05, 16.41, 6.49, 16.93, 17.88, 18.55,
           15.3, 14.73, 11.04, 10.78, 5.44)

# Histograma con 10 intervalos
hist(datos, breaks = 10, col = "gray",
     main = "Histograma del tiempo de producción",
     xlab = "Tiempo en horas", ylab = "Frecuencia",
     border = "black", las=1)

# Diagrama de cajas
boxplot(datos,
        main = "Diagrama de cajas y bigotes",
        col = "grey",
        horizontal = FALSE,
        ylab="Tiempo en horas",
        las = 1)

# Estadística descriptiva
minimo <- min(datos)
maximo <- max(datos)
rango <- maximo - minimo
cuartiles <- quantile(datos, probs = c(0.25, 0.5, 0.75))
deciles <- quantile(datos, probs = seq(0.1, 0.9, by = 0.1))
media <- mean(datos)
mediana <- median(datos)
varianza <- var(datos)
desviacion <- sd(datos)
coef_var <- (desviacion / media) * 100
sesgo <- skewness(datos)
curtosis <- kurtosis(datos)

# Crear tabla resumen
resumen <- data.frame(
  Estadístico = c("Mínimo", "Máximo", "Rango", "Q1", "Q2 (Mediana)", "Q3",
                  paste0("D", 1:9), "Media", "Varianza", "Desviación Estándar",
                  "Coef. de Variación (%)", "Sesgo", "Curtosis"),
  Valor = round(c(minimo, maximo, rango,
                  cuartiles[1], cuartiles[2], cuartiles[3],
                  deciles,
                  media, varianza, desviacion, coef_var, sesgo, curtosis), 2)
)
print(resumen, row.names = FALSE)

print("1. Tiempo de producción:")
print(media)

print("2. Desviación estándar:")
print(desviacion)

print("3. Rango de entrega")
minTiempo <- media - desviacion
maxTiempo <- media + desviacion
print(sprintf("[%.2f, %.2f]", minTiempo, maxTiempo))
