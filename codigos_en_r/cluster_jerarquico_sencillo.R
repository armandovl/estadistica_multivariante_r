
datos<-read.csv("bases_de_datos/ejemplo_estudiantes.csv", 
                row.names = 1, 
                header=TRUE,
                sep=",",
                dec=".")

modelo<-hclust(dist(datos), method = "ward.D2")

plot(modelo)

rect.hclust(modelo, k=3, border="magenta")