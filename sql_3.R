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

tabla <- dbGetQuery(baseD, "SELECT * FROM locos;")#obtener la tabla
#View(tabla)#ver la tabla
write.table(tabla,"jaja.txt",row.names = FALSE)#Guarda la tabla
jaja<-read.table("jaja.txt",header = TRUE)#Lee el archivo y el primer renglon es el nombre del campo
jaja
dbDisconnect(baseD)#Desconecta la base de datos

