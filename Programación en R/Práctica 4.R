#################################################### 1 ##################################################################
require(stats)
str(swiss)
head(swiss)
educacion <- swiss$Education[1:25]
educacion
sort(educacion, method="s",index.return = TRUE) #$x muestra los datos ordenados, $xi muestra la posicion donde se encuentra el valor en el vector original

random <- as.integer(rnorm(200, 5, 7))
random
sort(random, method="quick")
sort(random, partial = 1:5)

#################################################### 2 ##################################################################

x <- as.integer(rnorm(100, 42, 2.5))
x #numero de pie

y <- as.integer(rnorm(100, 177, 10))
y #estatura

datos <- data.frame(x, y)
datos

medias <- apply(datos, 2, mean) #2 significa que se aplica la funcion sobre columnas, 1 seria filas
varianza <- apply(datos, 2, var)
medias
varianza

covarianza <- cov(x, y)
covarianza

correlacion <- cor(x,y)
correlacion

titulo = sprintf('Correlación %.2f Covarianza %.2f', correlacion, covarianza)
plot(x,y, xlab = 'Talla de pie', ylab = 'Estatura', main = titulo, col = 'seagreen', type = 'p')

regresion <- lm(y~x)
regresion
abline(regresion, col = 'blue')

#################################################### 3 ##################################################################

k1 <- 3
k2 <- 5
lambda <- 5
pois <- rpois(k1 * k2, lambda) #generamos 15 aleatorios (k1*k2) de la poison con el parametro lamda

#Forma facil: matrix completa por columnas:

matriz <- matrix(pois, nrow = k1, ncol = k2) 
matriz

#Forma real:

mat2 <- matriz

#Completando por filas:

for (i in 1:k1) {
  for (j in 1:k2) {
    mat2[i,j] <- pois[k2*(i-1)+j]
  }
}

print(mat2)

mat3 <- matriz

#Completando por columnas

for (j in 1:k2) {
  for (i in 1:k1) {
    mat3[i,j] <- pois[k1*(j-1)+i]
  }
}

print(mat3)

#Calcular la matriz traspuesta:

matriz_traspuesta <- matrix(0, k2, k1)

for (i in 1:k2) {
  for (j in 1:k1) {
    matriz_traspuesta[i, j] <- mat3[j, i]
  }
}

print(matriz_traspuesta)

t(mat3)
