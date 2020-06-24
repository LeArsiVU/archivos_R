library(lubridate)

fec_fechafinal=as.Date("2020.04.30","%Y.%m.%d") #Fecha corte - cierre de mes
fec_fechafinal

fec_fechainicial<- fec_fechafinal-(day(fec_fechafinal)-1)
fec_fechainicial

fec_fechafacturaInicial<- fec_fechafinal+1
fec_fechafacturaInicial

fec_fechafacturafinal<- fec_fechafinal+10
fec_fechafacturafinal


