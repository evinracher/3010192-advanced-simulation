# Explicación teórica paso a paso: generación de observaciones de una variable aleatoria

## 1. Idea general del problema

El objetivo del problema es generar valores aleatorios de una variable aleatoria continua $X$, cuya función de densidad de probabilidad está definida por tramos:

$$
f(x)=
\begin{cases}
\frac{1}{6}, & 0 \le x < 2 \\
\frac{1}{3}, & 2 \le x < 3 \\
\frac{1}{12}, & 3 \le x < 7
\end{cases}
$$

Como el enunciado solo asigna densidad en el intervalo $[0,7)$, se interpreta que el soporte de la variable aleatoria es:

$$
[0,7)
$$

Por lo tanto, fuera de ese intervalo la densidad se toma como cero:

$$
f(x)=0, \quad x<0 \ \mathrm{o}\ x \ge 7
$$

Esto no es una suposición arbitraria, sino una forma estándar de completar la definición de una función de densidad. Una variable aleatoria continua debe tener una densidad definida sobre la recta real, aunque esa densidad sea distinta de cero solo en una parte específica llamada soporte.

El objetivo práctico es construir un procedimiento que produzca números aleatorios con esa distribución. Es decir, queremos que los valores generados se comporten como observaciones de $X$.

## 2. Conceptos básicos necesarios

### 2.1 Variable aleatoria

Una variable aleatoria es una función que asigna un valor numérico a cada resultado posible de un experimento aleatorio.

Por ejemplo:

- Si se lanza un dado, la variable aleatoria puede ser el número que sale.
- Si se mide el tiempo de espera en una fila, la variable aleatoria puede ser el tiempo en minutos.
- En este problema, $X$ es una variable aleatoria continua que puede tomar valores entre 0 y 7.

Cuando la variable aleatoria es continua, no se asignan probabilidades a puntos exactos, sino a intervalos. Por ejemplo, tiene sentido preguntar:

$$
P(0 \le X < 2)
$$

pero para una variable continua normalmente:

$$
P(X=2)=0
$$

Esto no significa que el valor 2 sea imposible en sentido práctico, sino que la probabilidad acumulada en un solo punto es cero.

### 2.2 Función de densidad de probabilidad

Una función de densidad de probabilidad, usualmente denotada por $f(x)$, describe cómo se distribuye la probabilidad de una variable aleatoria continua.

La densidad no es una probabilidad directa. La probabilidad se obtiene calculando el área bajo la curva de densidad en un intervalo.

Por ejemplo:

$$
P(a \le X < b)=\int_a^b f(x)\, dx
$$

Para que una función sea una densidad válida debe cumplir dos condiciones:

1. No puede ser negativa:

$$
f(x)\ge 0, \quad \forall x
$$

2. El área total bajo la curva debe ser 1:

$$
\int_{-\infty}^{\infty} f(x)\, dx=1
$$

La segunda condición representa que la probabilidad total de todos los posibles valores de la variable aleatoria debe ser 1.

### 2.3 Función de distribución acumulada

La función de distribución acumulada se denota por $F(x)$ y se define como:

$$
F(x)=P(X\le x)
$$

Para variables continuas, se obtiene integrando la densidad desde $-\infty$ hasta $x$:

$$
F(x)=\int_{-\infty}^{x} f(t)\, dt
$$

La función $F(x)$ indica la probabilidad acumulada hasta el valor $x$.

Por ejemplo:

- $F(2)$ representa la probabilidad de que $X$ tome un valor menor o igual que 2.
- $F(5)$ representa la probabilidad de que $X$ tome un valor menor o igual que 5.

Toda función de distribución acumulada cumple:

- Es creciente o no decreciente.
- Sus valores están entre 0 y 1.
- Cuando $x$ tiende a $-\infty$, $F(x)$ tiende a 0.
- Cuando $x$ tiende a $\infty$, $F(x)$ tiende a 1.

## 3. Verificación de que la función dada es una densidad válida

La función dada es:

$$
f(x)=
\begin{cases}
\frac{1}{6}, & 0 \le x < 2 \\
\frac{1}{3}, & 2 \le x < 3 \\
\frac{1}{12}, & 3 \le x < 7
\end{cases}
$$

Primero se verifica que $f(x)\ge 0$. En los tres tramos, los valores son:

$$
\frac{1}{6}, \quad \frac{1}{3}, \quad \frac{1}{12}
$$

Todos son positivos. Fuera del soporte se toma $f(x)=0$, que también es no negativo.

Ahora se verifica que el área total sea 1.

La función es constante por tramos, por lo que el área en cada tramo se puede calcular como:

$$
\mathrm{area} = \mathrm{base} \times \mathrm{altura}
$$

### 3.1 Área en el intervalo de 0 a 2

En este intervalo:

$$
f(x)=\frac{1}{6}
$$

La longitud del intervalo es:

$$
2-0=2
$$

Entonces:

$$
\int_0^2 \frac{1}{6}\, dx = \frac{1}{6}(2)=\frac{2}{6}=\frac{1}{3}
$$

### 3.2 Área en el intervalo de 2 a 3

En este intervalo:

$$
f(x)=\frac{1}{3}
$$

La longitud del intervalo es:

$$
3-2=1
$$

Entonces:

$$
\int_2^3 \frac{1}{3}\, dx = \frac{1}{3}(1)=\frac{1}{3}
$$

### 3.3 Área en el intervalo de 3 a 7

En este intervalo:

$$
f(x)=\frac{1}{12}
$$

La longitud del intervalo es:

$$
7-3=4
$$

Entonces:

$$
\int_3^7 \frac{1}{12}\, dx = \frac{1}{12}(4)=\frac{4}{12}=\frac{1}{3}
$$

### 3.4 Área total

Sumando las tres áreas:

$$
\int_0^2 \frac{1}{6}\, dx + \int_2^3 \frac{1}{3}\, dx + \int_3^7 \frac{1}{12}\, dx
= \frac{1}{3}+\frac{1}{3}+\frac{1}{3}=1
$$

Por lo tanto, la función sí es una densidad de probabilidad válida.

Un punto importante es que cada intervalo tiene la misma probabilidad total:

$$
P(0\le X<2)=\frac{1}{3}
$$

$$
P(2\le X<3)=\frac{1}{3}
$$

$$
P(3\le X<7)=\frac{1}{3}
$$

Sin embargo, las densidades no son iguales, porque los intervalos tienen longitudes diferentes. El tramo $[2,3)$ es más corto, por eso necesita una densidad más alta para acumular la misma probabilidad total.

## 4. Construcción de la función de distribución acumulada

La función de distribución acumulada se construye integrando la densidad desde la izquierda hasta el punto $x$. Como la densidad está definida por tramos, la acumulada también se obtiene por tramos.

### 4.1 Para valores de x menores que 0

Antes de 0 no hay densidad. Por tanto:

$$
F(x)=0, \quad x<0
$$

### 4.2 Para valores de x entre 0 y 2

En este tramo solo se acumula el área desde 0 hasta $x$:

$$
F(x)=\int_0^x \frac{1}{6}\, dt
$$

Como $\frac{1}{6}$ es constante:

$$
F(x)=\frac{x}{6}
$$

Entonces:

$$
F(x)=\frac{x}{6}, \quad 0\le x<2
$$

Al final del tramo, cuando $x=2$, se acumula:

$$
F(2)=\frac{2}{6}=\frac{1}{3}
$$

### 4.3 Para valores de x entre 2 y 3

En este tramo ya se acumuló toda la probabilidad del intervalo anterior, que es $\frac{1}{3}$. Luego se suma el área desde 2 hasta $x$:

$$
F(x)=\frac{1}{3}+\int_2^x \frac{1}{3}\, dt
$$

La integral es:

$$
\int_2^x \frac{1}{3}\, dt=\frac{x-2}{3}
$$

Entonces:

$$
F(x)=\frac{1}{3}+\frac{x-2}{3}
$$

Simplificando:

$$
F(x)=\frac{x}{3}-\frac{1}{3}
$$

Así:

$$
F(x)=\frac{x}{3}-\frac{1}{3}, \quad 2\le x<3
$$

Al final del tramo, cuando $x=3$:

$$
F(3)=\frac{3}{3}-\frac{1}{3}=\frac{2}{3}
$$

### 4.4 Para valores de x entre 3 y 7

En este tramo ya se acumuló la probabilidad de los dos primeros intervalos:

$$
\frac{1}{3}+\frac{1}{3}=\frac{2}{3}
$$

Luego se suma el área desde 3 hasta $x$:

$$
F(x)=\frac{2}{3}+\int_3^x \frac{1}{12}\, dt
$$

La integral es:

$$
\int_3^x \frac{1}{12}\, dt=\frac{x-3}{12}
$$

Entonces:

$$
F(x)=\frac{2}{3}+\frac{x-3}{12}
$$

Simplificando:

$$
F(x)=\frac{x}{12}+\frac{5}{12}
$$

Así:

$$
F(x)=\frac{x}{12}+\frac{5}{12}, \quad 3\le x<7
$$

Al final del tramo, cuando $x=7$:

$$
F(7)=\frac{7}{12}+\frac{5}{12}=1
$$

### 4.5 Para valores de x mayores o iguales a 7

Después de 7 ya se acumuló toda la probabilidad:

$$
F(x)=1, \quad x\ge 7
$$

### 4.6 Función acumulada completa

La función de distribución acumulada queda:

$$
F(x)=
\begin{cases}
0, & x < 0 \\
\frac{x}{6}, & 0 \le x < 2 \\
\frac{x}{3}-\frac{1}{3}, & 2 \le x < 3 \\
\frac{x}{12}+\frac{5}{12}, & 3 \le x < 7 \\
1, & x \ge 7
\end{cases}
$$

## 5. Generación de números aleatorios uniformes

La mayoría de lenguajes de programación no generan directamente números aleatorios con cualquier distribución. Lo que normalmente generan son números pseudoaleatorios uniformes entre 0 y 1.

Un número pseudoaleatorio uniforme $U$ en $(0,1)$ significa que:

$$
U \sim \mathrm{Uniforme}(0,1)
$$

Esto quiere decir que todos los valores entre 0 y 1 son igualmente probables.

Por ejemplo, valores como:

$$
0.12,\quad 0.48,\quad 0.91
$$

son posibles valores de una variable uniforme.

La función acumulada de una uniforme $(0,1)$ es:

$$
P(U\le u)=u, \quad 0<u<1
$$

Esto significa que si $u=0.25$, entonces:

$$
P(U\le 0.25)=0.25
$$

Si $u=0.80$, entonces:

$$
P(U\le 0.80)=0.80
$$

La distribución uniforme es fundamental porque sirve como punto de partida para generar variables aleatorias con otras distribuciones.

## 6. Método de la transformada inversa

### 6.1 Idea principal

El método de la transformada inversa permite convertir un número uniforme $U$ en una variable aleatoria $X$ con una distribución deseada. En este contexto, $U$ tiene distribución uniforme en el intervalo $(0,1)$:

$$
U \sim \mathrm{Uniforme}(0,1)
$$

La idea es:

1. Generar un número uniforme $U$ entre 0 y 1.
2. Interpretar ese número como una probabilidad acumulada.
3. Buscar el valor de $x$ que produce esa probabilidad acumulada.
4. Ese valor se obtiene usando la inversa de la función acumulada:

$$
X=F^{-1}(U)
$$

En palabras simples: si $U$ representa una probabilidad acumulada, $F^{-1}(U)$ devuelve el valor de la variable aleatoria que corresponde a esa probabilidad.

### 6.2 Intuición gráfica

La función acumulada $F(x)$ toma valores de $x$ y devuelve probabilidades acumuladas entre 0 y 1.

El método inverso hace lo contrario:

- Se parte de una probabilidad acumulada $u$.
- Se busca el valor $x$ tal que $F(x)=u$.

Es decir:

$$
u=F(x)
$$

y despejando:

$$
x=F^{-1}(u)
$$

Por ejemplo, si se genera $U=0.40$, ese número significa que buscamos el valor $x$ cuya probabilidad acumulada sea 0.40.

### 6.3 ¿Por qué funciona?

El método funciona por una propiedad conocida como transformación integral de probabilidad.

Si $X$ tiene función de distribución acumulada $F$, entonces la variable:

$$
U=F(X)
$$

tiene distribución uniforme en $(0,1)$, bajo condiciones usuales de continuidad.

La idea inversa también es válida:

Si $U$ tiene distribución uniforme en el intervalo $(0,1)$, entonces:

$$
X=F^{-1}(U)
$$

tiene función de distribución acumulada $F$.

Una demostración breve es la siguiente. Definimos:

$$
X=F^{-1}(U)
$$

Queremos encontrar la distribución de $X$. Para un valor cualquiera $x$:

$$
P(X\le x)=P(F^{-1}(U)\le x)
$$

Si $F$ es creciente, la condición $F^{-1}(U)\le x$ equivale a:

$$
U\le F(x)
$$

Por tanto:

$$
P(X\le x)=P(U\le F(x))
$$

Como $U$ es uniforme en $(0,1)$:

$$
P(U\le a)=a, \quad 0\le a\le 1
$$

Entonces:

$$
P(U\le F(x))=F(x)
$$

Por lo tanto:

$$
P(X\le x)=F(x)
$$

Esto demuestra que $X=F^{-1}(U)$ tiene la distribución acumulada deseada.

## 7. Aplicación del método al problema

Ya se obtuvo la función acumulada:

$$
F(x)=
\begin{cases}
0, & x < 0 \\
\frac{x}{6}, & 0 \le x < 2 \\
\frac{x}{3}-\frac{1}{3}, & 2 \le x < 3 \\
\frac{x}{12}+\frac{5}{12}, & 3 \le x < 7 \\
1, & x \ge 7
\end{cases}
$$

Ahora se necesita encontrar la inversa por tramos. Para eso se toma:

$$
u=F(x)
$$

y se despeja $x$ en cada tramo.

### 7.1 Primer tramo

Para $0\le x<2$:

$$
F(x)=\frac{x}{6}
$$

Entonces:

$$
u=\frac{x}{6}
$$

Despejando $x$:

$$
x=6u
$$

Este tramo de $x$ corresponde a los valores de $u$ entre:

$$
F(0)=0
$$

y:

$$
F(2)=\frac{1}{3}
$$

Por lo tanto:

$$
x=6u, \quad 0\le u<\frac{1}{3}
$$

### 7.2 Segundo tramo

Para $2\le x<3$:

$$
F(x)=\frac{x}{3}-\frac{1}{3}
$$

Entonces:

$$
u=\frac{x}{3}-\frac{1}{3}
$$

Sumando $\frac{1}{3}$ a ambos lados:

$$
u+\frac{1}{3}=\frac{x}{3}
$$

Multiplicando por 3:

$$
3u+1=x
$$

Por lo tanto:

$$
x=3u+1
$$

Este tramo corresponde a los valores de $u$ entre:

$$
F(2)=\frac{1}{3}
$$

y:

$$
F(3)=\frac{2}{3}
$$

Entonces:

$$
x=3u+1, \quad \frac{1}{3}\le u<\frac{2}{3}
$$

### 7.3 Tercer tramo

Para $3\le x<7$:

$$
F(x)=\frac{x}{12}+\frac{5}{12}
$$

Entonces:

$$
u=\frac{x}{12}+\frac{5}{12}
$$

Restando $\frac{5}{12}$ a ambos lados:

$$
u-\frac{5}{12}=\frac{x}{12}
$$

Multiplicando por 12:

$$
12u-5=x
$$

Por lo tanto:

$$
x=12u-5
$$

Este tramo corresponde a los valores de $u$ entre:

$$
F(3)=\frac{2}{3}
$$

y:

$$
F(7)=1
$$

Entonces:

$$
x=12u-5, \quad \frac{2}{3}\le u\le 1
$$

### 7.4 Inversa completa

La inversa de la función acumulada es:

$$
F^{-1}(u)=
\begin{cases}
6u, & 0 \le u < \frac{1}{3} \\
3u+1, & \frac{1}{3} \le u < \frac{2}{3} \\
12u-5, & \frac{2}{3} \le u \le 1
\end{cases}
$$

Esta es la fórmula central del generador.

## 8. Algoritmo para generar observaciones

El procedimiento para generar una observación de $X$ es:

1. Generar un número $u$ uniforme entre 0 y 1.
2. Revisar en qué intervalo cae $u$:

   - Si $0\le u<\frac{1}{3}$, usar:

     $$
     x=6u
     $$

   - Si $\frac{1}{3}\le u<\frac{2}{3}$, usar:

     $$
     x=3u+1
     $$

   - Si $\frac{2}{3}\le u\le 1$, usar:

     $$
     x=12u-5
     $$

3. El valor obtenido es una observación simulada de $X$.

Para generar 100 observaciones, se repite este procedimiento 100 veces.

## 9. Ejemplos numéricos

### 9.1 Ejemplo con u igual a 0.10

Como:

$$
0.10<\frac{1}{3}
$$

se usa el primer tramo:

$$
x=6u
$$

Entonces:

$$
x=6(0.10)=0.60
$$

La observación generada es:

$$
x=0.60
$$

### 9.2 Ejemplo con u igual a 0.40

Como:

$$
\frac{1}{3}\le 0.40<\frac{2}{3}
$$

se usa el segundo tramo:

$$
x=3u+1
$$

Entonces:

$$
x=3(0.40)+1=2.20
$$

La observación generada es:

$$
x=2.20
$$

### 9.3 Ejemplo con u igual a 0.80

Como:

$$
0.80\ge \frac{2}{3}
$$

se usa el tercer tramo:

$$
x=12u-5
$$

Entonces:

$$
x=12(0.80)-5=9.60-5=4.60
$$

La observación generada es:

$$
x=4.60
$$

## 10. Interpretación de las probabilidades por intervalo

La densidad fue construida de forma que cada intervalo tenga probabilidad total $\frac{1}{3}$:

$$
P(0\le X<2)=\frac{1}{3}
$$

$$
P(2\le X<3)=\frac{1}{3}
$$

$$
P(3\le X<7)=\frac{1}{3}
$$

Esto significa que si se genera una muestra suficientemente grande, aproximadamente una tercera parte de los valores debería caer en cada intervalo.

Por ejemplo, si se generan 100 observaciones, se espera aproximadamente:

- 33 valores en $[0,2)$
- 33 valores en $[2,3)$
- 33 valores en $[3,7)$

No necesariamente serán exactamente 33 en cada uno, porque el proceso es aleatorio.

Si se generan 10 000 observaciones, las proporciones deberían acercarse más a:

$$
\frac{1}{3}, \quad \frac{1}{3}, \quad \frac{1}{3}
$$

Esto se relaciona con la ley de los grandes números: a medida que aumenta el tamaño de la muestra, los promedios y proporciones simuladas tienden a acercarse a sus valores teóricos.

## 11. Comparación entre resultados teóricos y simulados

Una vez generada la muestra, se puede comparar la simulación con la teoría de varias formas.

### 11.1 Comparación visual

Se puede graficar:

- La densidad teórica $f(x)$.
- El histograma de la muestra simulada.

Si el generador funciona correctamente, el histograma debería parecerse a la forma de la densidad teórica.

En este problema se espera observar:

- Un tramo bajo entre 0 y 2, con densidad $\frac{1}{6}$.
- Un tramo más alto entre 2 y 3, con densidad $\frac{1}{3}$.
- Un tramo más bajo y más largo entre 3 y 7, con densidad $\frac{1}{12}$.

El histograma no será idéntico a la densidad, especialmente con solo 100 observaciones, pero debería mostrar una tendencia compatible.

### 11.2 Comparación por frecuencias relativas

También se puede contar cuántas observaciones caen en cada intervalo:

$$
[0,2), \quad [2,3), \quad [3,7)
$$

Luego se calculan las frecuencias relativas:

$$
\mathrm{frecuencia\ relativa}
=
\frac{\mathrm{numero\ de\ observaciones\ en\ el\ intervalo}}{\mathrm{numero\ total\ de\ observaciones}}
$$

Estas frecuencias relativas se comparan con las probabilidades teóricas:

$$
\frac{1}{3}, \quad \frac{1}{3}, \quad \frac{1}{3}
$$

Con 100 observaciones, es normal que una frecuencia relativa sea, por ejemplo, 0.29, otra 0.36 y otra 0.35. Lo importante es que estén razonablemente cerca de los valores esperados.

### 11.3 Comparación de medias

También se puede comparar la media teórica con la media simulada.

La media teórica de una variable continua se calcula como:

$$
E(X)=\int_{-\infty}^{\infty} x f(x)\, dx
$$

En este caso:

$$
E(X)=\int_0^2 x\frac{1}{6}\, dx+\int_2^3 x\frac{1}{3}\, dx+\int_3^7 x\frac{1}{12}\, dx
$$

Primer tramo:

$$
\int_0^2 \frac{x}{6}\, dx
=\frac{1}{6}\int_0^2 x\, dx
=\frac{1}{6}\left[\frac{x^2}{2}\right]_0^2
=\frac{1}{6}\cdot 2
=\frac{1}{3}
$$

Segundo tramo:

$$
\int_2^3 \frac{x}{3}\, dx
=\frac{1}{3}\int_2^3 x\, dx
=\frac{1}{3}\left[\frac{x^2}{2}\right]_2^3
=\frac{1}{3}\cdot \frac{9-4}{2}
=\frac{5}{6}
$$

Tercer tramo:

$$
\int_3^7 \frac{x}{12}\, dx
=\frac{1}{12}\int_3^7 x\, dx
=\frac{1}{12}\left[\frac{x^2}{2}\right]_3^7
=\frac{1}{12}\cdot \frac{49-9}{2}
=\frac{1}{12}\cdot 20
=\frac{5}{3}
$$

Sumando:

$$
E(X)=\frac{1}{3}+\frac{5}{6}+\frac{5}{3}
$$

Con denominador común 6:

$$
E(X)=\frac{2}{6}+\frac{5}{6}+\frac{10}{6}
=\frac{17}{6}
$$

Por tanto:

$$
E(X)=\frac{17}{6}\approx 2.8333
$$

La media simulada se obtiene promediando las observaciones generadas:

$$
\bar{x}=\frac{x_1+x_2+\cdots+x_n}{n}
$$

Con $n=100$, la media simulada puede diferir de 2.8333. Si se aumenta el tamaño de la muestra, la media simulada debería acercarse más a la media teórica.

## 12. Por qué hay diferencias entre teoría y simulación

La teoría describe el comportamiento ideal de la variable aleatoria. La simulación produce una muestra finita.

Con una muestra finita, siempre existe variabilidad aleatoria. Por eso:

- Las frecuencias relativas no tienen que ser exactamente iguales a las probabilidades teóricas.
- El histograma no tiene que coincidir perfectamente con la densidad.
- La media simulada no tiene que ser exactamente igual a la media teórica.

Con 100 observaciones, las diferencias pueden ser visibles. Esto no significa que el generador esté mal.

Si se aumentara el tamaño de muestra a 1 000, 10 000 o más observaciones:

- Las frecuencias relativas tenderían a acercarse a las probabilidades teóricas.
- El histograma se parecería más a la densidad.
- La media simulada se acercaría más a $E(X)=17/6$.

Este comportamiento se explica por la ley de los grandes números.

## 13. Resumen para exposición

El problema consiste en generar observaciones de una variable aleatoria continua con una densidad definida por tramos.

Primero se verifica que la función sea una densidad válida. Para esto se comprueba que no sea negativa y que el área total bajo la curva sea igual a 1.

Después se construye la función de distribución acumulada $F(x)$, integrando la densidad por tramos. Esta función representa la probabilidad acumulada hasta cada valor de $x$.

Luego se aplica el método de la transformada inversa. Este método parte de números pseudoaleatorios uniformes $U$ en el intervalo $(0,1)$, que se interpretan como probabilidades acumuladas. Para convertirlos en observaciones de $X$, se calcula:

$$
X=F^{-1}(U)
$$

Como $F(x)$ está definida por tramos, su inversa también queda definida por tramos:

$$
F^{-1}(u)=
\begin{cases}
6u, & 0 \le u < \frac{1}{3} \\
3u+1, & \frac{1}{3} \le u < \frac{2}{3} \\
12u-5, & \frac{2}{3} \le u \le 1
\end{cases}
$$

Finalmente, se generan varios valores uniformes y se transforma cada uno usando la fórmula anterior. La muestra obtenida se compara con la distribución teórica mediante histogramas, frecuencias relativas y la media.

Las diferencias entre teoría y simulación son normales cuando se trabaja con muestras pequeñas. Con solo 100 observaciones, el histograma y las proporciones pueden alejarse un poco de lo esperado. Si se aumenta el tamaño de la muestra, los resultados simulados tienden a parecerse más a los valores teóricos.

## 14. Ideas clave

- Una densidad no da probabilidades directas en puntos, sino áreas bajo la curva.
- La función acumulada $F(x)$ representa $P(X\le x)$.
- Los números uniformes en $(0,1)$ pueden interpretarse como probabilidades acumuladas.
- El método de la transformada inversa convierte probabilidades acumuladas en valores de la variable aleatoria.
- La fórmula central es $X=F^{-1}(U)$.
- Si la acumulada es por tramos, la inversa también se calcula por tramos.
- La simulación no coincide exactamente con la teoría cuando la muestra es pequeña.
- Al aumentar el tamaño de la muestra, las frecuencias y la media simuladas se acercan a los valores teóricos.
