library(readxl)

tabla <-read_excel("/home/israel_valencia/Escritorio/1/Dynatrace/CSV/1/Response time (May 29 2020, 20_36 - 22_36).xls",
                    skip=1,
                    col_types = c("text", "numeric", "numeric", "numeric","numeric", "numeric", "numeric")) #Lee el excel

DATE<-c(" ")
TIME<-c(0.0)
SERVICE<-" "

services<-names(tabla) #nombre de los servicios

L=nrow(tabla[,1])

tabla[1,1]
for(j in 1:(ncol(tabla)-1)){
  for(i in 1:L){
    DATE[i+L*(j-1)]<-tabla[i,1]
    TIME[i+L*(j-1)]<-tabla[i,j+1]
    SERVICE[i+L*(j-1)]<-paste('"',services[j+1],'"',sep = "")
  }
}

DATOS<-data.frame(FECHA=cbind(DATE),SERVICIO= cbind(SERVICE),TIEMPO=cbind(TIME))

DATOS2 = data.frame(lapply(DATOS, as.character), stringsAsFactors=FALSE)

write.csv(DATOS2,"/home/israel_valencia/Escritorio/1/Dynatrace/CSV/1/datos.csv",
          row.names = FALSE, quote = FALSE)
