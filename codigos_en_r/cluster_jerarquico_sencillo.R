

# #agregamos la base de datos
# datos<-read.csv("bases_de_datos/ejemplo_estudiantes.csv", 
#                 #en esta ìneale agregamos los nombres
#                 row.names = 1,
#                 # estàs lìneas no importan mucho
#                 header=TRUE, #encabezados primera fila
#                 sep=",", #separador por comas
#                 dec=".") #los decimales con un punto

miUrl<-"https://raw.githubusercontent.com/armandovl/estadistica_multivariante_r/main/bases_de_datos/ejemplo_estudiantes.csv"
datos<-read.csv(url(miUrl),
                #en esta ìneale agregamos los nombres
                row.names = 1,
                # estàs lìneas no importan mucho
                header=TRUE, #encabezados primera fila
                sep=",", #separador por comas
                dec=".") #los decimales con un punto


#creamos el modelo
modelo<-hclust(dist(datos), method = "ward.D2")

#graficamos el modelo
plot(modelo)

#dividimos de acuerdo a los grupos que decidamos (3)
rect.hclust(modelo, k=3, border="magenta")



#Guardar la base de los estudiantes con su cluster
clusters_asignados<-cutree(modelo, k=3)
base_con_cluster<-cbind(datos , clusters_asignados)
write.csv(base_con_cluster ,"bases_de_datos/base_con_cluster.csv")


