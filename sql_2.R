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

tabla
I=c(1,2,3)
L=c("C","C++","FORTRAN")
t=data.frame(id=I,language=L)#guarda la informacion de vectores del mismo tamaño
t

dbWriteTable(baseD,
             "Lenguajes",
             t)#crea una tabla y le agrega lo que está en el data frame

dbListTables(baseD)#ver la tabla en consola
src_dbi(baseD)#dice la informacion de la base de datos
Y<-tbl(baseD, sql("SELECT language FROM Lenguajes"))#Selecciona una columna de la tabla
Y

Z<-tbl(baseD, sql("SELECT * FROM Lenguajes"))#Selecciona la tabla
Z
newI=c(4,5,6)
newL=c("java","xml","COBOL")
NuevaTabla=data.frame(id=newI,language=newL)
copy_to(baseD,NuevaTabla,temporary = FALSE)#Crea una tabla en la base de datos sin poner la columna de now_names

query <- paste("INSERT INTO Lenguajes VALUES(4,4,'JAVA')") #Agregar un registro
dbGetQuery(baseD, query)#para hacer una 

query <- paste("DELETE FROM Lenguajes WHERE id=1") #Agregar un registro
dbGetQuery(baseD, query)

query <- paste("INSERT INTO NuevaTabla VALUES(7,'html')") #Agregar un registro
dbGetQuery(baseD, query)#para hacer una 

dbDisconnect(baseD)#Desconecta la base de datos

