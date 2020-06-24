library(DBI)
library(RMySQL)
library(dplyr)
library(dbplyr)

baseD <- dbConnect(drv =MySQL(), 
                   dbname = "clubibarra", 
                   host = "127.0.0.1", username = "root", 
                   password = "I$raMySQL0506",
                   port = 3306, 
                   unix.sock = "/var/run/mysqld/mysqld.sock") #conectarse a la tabla

#tabla <- dbGetQuery(baseD, "SELECT * FROM locos;")#obtener la tabla

my_data <- read.delim("/home/arsi/Escritorio/cosas/SQL/municipios_sinaloa.txt", header = FALSE, sep = ",", dec = ".")

municipios=data.frame(id_municipio=my_data[1],nombre_municipio=my_data[2])#guarda la informacion de vectores del mismo tamaño

colnames(municipios)<-c("ID_MUNICIPIO","NOMBRE_MUNICIPIO") #nombre de los campos
municipios

copy_to(baseD,municipios,temporary = FALSE)#Crea una tabla en la base de datos sin poner la columna de now_names, desde mysql se puede agregar constricciones como qué columa es PRIMARY KEY

dbDisconnect(baseD)#Desconecta la base de datos
