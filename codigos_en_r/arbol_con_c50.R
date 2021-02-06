
#..................Traer e inspeccionar los datos...................
Datos1<-read.csv("bases_de_datos/atitanic.csv") #traemos el dataframe
head(Datos1,10) #primeros 10 registros
str(Datos1) #estructura de los datos

#................. Tratamiento de los datos........................
Datos1$Pclass=as.factor(Datos1$Pclass) #Transformar caracter a factor
Datos1$Survived=as.factor(Datos1$Survived) #Transformar caracter a factor
Datos1$Sex=as.factor(Datos1$Sex) #Transformar caracter a factor
Datos1$Embarked=as.factor(Datos1$Embarked) #Transformar caracter a factor 

#... Eliminando columnas
Datos1$PassengerId<-NULL #eliminar Id
Datos1$Name<-NULL #eliminar nombre
str(Datos1) #estructura de los datos

#................. Primer Arbol biblioteca C50..................

# .....Trabajando con biblioteca c50
#install.packages("C50")
library(C50)
modelo_c50<-C5.0(Datos1[,c(1:5)],Datos1$Survived)

plot(modelo_c50) #igual no funciona el cex=1
summary(modelo_c50)

#importancia del modelo
#install.packages("caret")
library(caret)
dt_importance <- varImp(modelo_c50)
print(dt_importance)


#................. Segundo Arbol biblioteca party..................

# .....Trabajando con biblioteca party
#install.packages("party")
library(party)
modelo_party<-ctree(Survived~.,Datos1)
plot(modelo_party) #se adapta sola la gráfica


