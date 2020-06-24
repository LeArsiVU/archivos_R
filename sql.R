library(pool)
library(DBI)
baseD <- dbPool(drv = RMySQL::MySQL(), 
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
t=data.frame(I,L)#guarda la informacion de vectores del mismo tamaño

conn <- poolCheckout(baseD);
dbSendQuery(conn, "SET GLOBAL local_infile = true;") # <--- Added this

dbWriteTable(baseD,
             "Lenguajes",
             t,field.types = list(id ="int",language="varchar(20)"), row.names=FALSE,temporary= FALSE)#crea una tabla


dbListTables(baseD)#ver la tabla en consola
