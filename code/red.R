
# install.packages("igraph")
# install.packages("openxlsx")


library (igraph)
library(openxlsx)


wb=loadWorkbook("A variable man.xlsx")

data=read.xlsx (wb,cols = c(1:3), rows = c (1:96), sheet = "interacciones")
atributos= (read.xlsx (wb,cols = c(1,3), rows = c (1:30),colNames = T ,sheet = "atributos"))

red=graph.data.frame(data,directed = F)

#atributos de vertices
V(red)$color=ifelse(atributos$Sexo=="F","hotpink1", "blue") 
V(red)$names=atributos$Nombre


#grafo 1 (sin nombres , color de vertice  representa sexo)


plot(red, 
     vertex.label=NA,  #no lleva etiqueta el enlace
     vertex.color= V(red)$color, #distingue color por sexo
    
     vertex.size=10, #tamaño del nodo
      layout=layout.fruchterman.reingold) #algoritmo de grafo

#grafo 2 (nombres, color de vertice  representa sexo )

plot(red, vertex.label=V(red)$names,   #nombre del nodo
     vertex.label.color=V(red)$color, #color del nombre del nodo 
     vertex.size=0, #tamño del nodo
     layout=layout.kamada.kawai)  #algoritmo de grafo
    
