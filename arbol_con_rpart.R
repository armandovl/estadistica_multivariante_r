install.packages("rpart.plot")
install.packages("caret")

# biblioteca para leer archivos de excel
library(readxl)

Datos1<-read_excel("datos_covid_30_mayo_2020.xlsx")

str(Datos1)

View(head(Datos1,10))

Datos1$MUNICIPIO<-NULL
Datos1$INTUBADO<-NULL
Datos1$CUIDADOS_INTENSIVOS<-NULL

library(rpart)
library(rpart.plot)

modelo1<-rpart(ESTIMADOS_SINTOMAS~.,
               method="class",
               data=Datos1)


library(caret)
importanciaV<-varImp(modelo1)
print(importanciaV)


rpart.plot(modelo1,type=4)