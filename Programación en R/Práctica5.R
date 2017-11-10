setwd("~/Documents/CUNEF - Data Science/1º Semestre/Programación en R/Bloque 3/Práctica 5")
getwd()

########################## EJERCICIO 1 #####################################

#data frame llamado estudiantes mediante la función read.csv
estudiantes <- read.csv('student_census.csv', header = TRUE, sep = ',')

estudiantes_baloncesto <- data.frame(estudiantes$Physical)
#estudiantes$Physical = 'Basketball'

estudiantes_baloncesto == 'Basketball'
sum(estudiantes_baloncesto == 'Basketball') #hay 18 poisbles jugadores
 
posibles_jugadores <- c()

for (i in 1:nrow(estudiantes_baloncesto)){
  if(estudiantes_baloncesto[i,]=='Basketball'){
    posibles_jugadores <- c(posibles_jugadores,i)
  }
}

length(posibles_jugadores) #hay 18 posibles jugadores

equipo_basket <- posibles_jugadores[sample(1:length(posibles_jugadores), 5, replace = FALSE)]
#la longitud sabemos que es 18, se generan 5 numeros aleatorios del 1 al 18, sin que se repitan numeros

equipo_basket #los estudiantes identificados con esos numeros forman el equipo de baloncesto

########################## EJERCICIO 2 #####################################

medidas <- data.frame(estudiantes$Height, estudiantes$Arm.Span, estudiantes$Foot.Size)
colnames(medidas) <- c('Altura', 'Brazo', 'Pie')
medidas

cor(medidas) #correlaciones entre las variables

altura_estudiantes <- data.frame(medidas$Altura)

estudiantes_y_provincias <- data.frame(altura_estudiantes, estudiantes$Province)
colnames(estudiantes_y_provincias) <- c('Altura', 'Provincia')

orden<- order(estudiantes_y_provincias$Altura) #se establece el orden por identificador del estudiante

barplot(sort(estudiantes_y_provincias$Altura),
        names.arg = estudiantes_y_provincias$Provincia[orden], 
        main = 'Diagrama de Barras', xlab = 'Provincias', ylab = 'Centímetros',
        col = 'blue')

estudiantes_y_provincias[orden[1],] #El estudiante de menor estatura es de Alta, mide 126cm, ID = 113
estudiantes_y_provincias[orden[200],] #El estudiante de mayor estatura es de Man, mide 211cm, ID = 24

########################## EJERCICIO 3 #####################################

#Particionar el dataset en 20 subconjuntos

particion <- split(estudiantes, sample(rep(1:20, 10, replace = FALSE)))

#Ahora se pasa a ordenar cada uno de los data frames mediante el metodo 'quick sort'

for (i in 1:20) {
  particion[[i]] <- particion[[i]] [with(particion[[i]], 
                                         sort(particion[[i]]$Height,
                                              method = "quick",
                                              index.return = TRUE)$ix), ]
  print(i)
  print(particion[[i]]$Height)
}

#Funcion que mezcle ordenadamente dos subconjuntos previamente ordenados

ordenacion <- function(x, y) {
  A <- rbind(x, y)
  A <- A[with(A, sort(A$Height, 
                      method="quick",
                      index.return=T)$ix), ]
  return(A)
}

#Para ordenar de 2 en 2 se dan nombre a las variables y se realizan las combinaciones posibles

for (i in 1:10){
  nombre_variable <- paste("var_", i, sep = "")
  alfa <- i * 2 - 1
  beta <- i * 2
  assign(nombre_variable,ordenacion(particion[[alfa]], 
                                 particion[[beta]]))
}

var_1_1 <- ordenacion(var_1, var_2)
var_2_2 <- ordenacion(var_3, var_4)
var_3_3 <- ordenacion(var_5, var_6)
var_4_4 <- ordenacion(var_7, var_8)
var_5_5 <- ordenacion(var_9, var_10)

var_1_1_1 <- ordenacion(var_1_1, var_2_2)
var_2_2_2 <- ordenacion(var_3_3, var_4_4)
var_3_3_3 <- ordenacion(var_1_1_1, var_5_5)

var_1_1_1_1 <- ordenacion(var_2_2_2, var_3_3_3)

var_1_1_1_1$Height #las variables están ordenadas como en el ejercicio 2 de esta práctica
altura_estudiantes_ordenada <- sort(altura_estudiantes[,])
altura_estudiantes_ordenada

########################## EJERCICIO 4 #####################################

########################## EJERCICIO 5 #####################################

x <- c(1:80, 78:34, 1,2,3,4,5,6,7,5,4,3,2)
n <- 5
divideenBloques <- function( x, n ){
  tam <- length(x) %/% n
  list <- NULL
  
  for (i in 0:(n-2)) {
    list <- c(list, c(i*tam + 1, 
                      (i + 1)*tam))
    
  }
  list <- c(list, 
            c(((i + 1)*tam) + 1, 
              length(x)))
  return(list)
}
lista <- divideenBloques(x,n)
lista

########

i <- 1
pares_sumas <- function (lista, x, n){
  sumas <- NULL
  tams <- NULL
  for (i in 0:(n - 1)){
    ini <- lista[i * 2 + 1]
    fin <- lista[i * 2 + 2]
    sumas <- c(sumas, sum(x[ini:fin]))
    tams <- c(tams,fin - ini + 1)
  }
  return(data.frame(sumas, tams))
}
ps<-pares_sumas(lista, x, n)

reduce<-function(ps){
  resultado <- as.double(sum(ps$sumas)/sum(ps$tams))
  return(resultado)
}

resultado_media <- reduce(ps)
resultado_media

########################## EJERCICIO 6 #####################################

busca <- function (l, h, st){
  if (l<=st) {if (sum(l:h) ==st) {print(c(l, h))
                          return(busca(l+1,l+1,st))}
    else {if (sum(l:h)<st) return(busca(l, h+1, st))
      else return(busca(l+1, l+1, st))}
    }
}

busca(0,100, 100)

sum(9:16)
sum(18:22)

#Arroja el valor inicial y final de las series aritmeticas de constante 1 que sumadas tienen como resultado 100
#Es decir desde 9 hasta 16, la suma de 1 en 1 de los valores es 100
#El mismo caso para la serie de 18 a 22
#Los inputs son l y h como principio y fin de la serie donde inicializar el testeo
#lh es el valor que se desea como resultado, como suma total

#Empieza de 0:100 pero como la suma es superior a 100 no tiene de 0:101 por lo tanto
#comienza la simulacion desde 1:1, 1:2, 1:3, 1:4, hasta que se pasa de 100 y no consigue nada
#La siguiente simulación compienza por 2:2, 2:3, 2:4, hasta que se pasa de 100 y no consigue nada
#Finalmente, cuando empieza por 9:9, al llegar a 9:16 da con el resultado 100 y lo muestra 
#Continuará por 10:10 hasta ir fallando y llegar al 18:22, donde tambien imprime los valores l y h
#Cuando llega a 100:100 imprime el valor y al pasar a 101:101 se pone fin a la recurrencia
#El final de las condicionalidades se produce al incumplir que l <= h, la primera condicion de la funcion
#Estas 3 combinaciones son las unicas que hacen en el rango 0:100 series aritméticas de suma 100 

