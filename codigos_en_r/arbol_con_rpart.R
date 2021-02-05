
#......... Se cargan las bibliotecas...........#

#biblioteca para leer archivos de excel
library(readxl)

#bibliotecas para hacer el módelo
library(rpart)

#bibliotecas para graficar el módelo
library(rpart.plot)

#biblioteca para ver la importancia
library(caret)

#......... Instalar bibliotecas si faltan...........#
# install.packages("readxl")
# install.packages("caret")
# install.packages("rpart.plot")
# install.packages("caret")


#......... Cargar, inspeccionar y depurar datos...........#

# cargamos el data set
Datos1<-read_excel("bases_de_datos/datos_covid_30_mayo_2020.xlsx")

# cargamos desde github (solo csv)
miURL<-"https://raw.githubusercontent.com/armandovl/estadistica_multivariante_r/main/bases_de_datos/datos_covid_30_mayo_2020.csv"
Datos1<-read.csv(url(miURL))


str(Datos1) #estructura de los datos

View(head(Datos1,10)) #ver primeros registros

#eliminar columnas
Datos1$MUNICIPIO<-NULL
Datos1$INTUBADO<-NULL
Datos1$CUIDADOS_INTENSIVOS<-NULL


#......... Se crea el modelo...........#

#generando el modelo
modelo1<-rpart(ESTIMADOS_SINTOMAS~.,
               method="class",
               data=Datos1)


#ver importancia de las variables
importanciaV<-varImp(modelo1)
print(importanciaV)

#vemos el resultado
rpart.plot(modelo1,type=4)







