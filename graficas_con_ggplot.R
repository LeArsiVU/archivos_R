library(readxl)
library(reshape2)
library(ggplot2)
library(tidyverse)
library(here)
library(lubridate)


tabla <- read_excel("/home/israel_valencia/Escritorio/1/HotSale/DatosHotsale.xlsx",3) #Lee la hoja 3 del archivo

#fecha=as.Date("2020.05.22 00:00:00","%Y.%m.%d %H:%M:%S") #Mayor al 22 de mayo de 2020
fecha=strptime('22/May/2020:00:00:00',format='%d/%b/%Y:%H:%M:%S')
fecha
Inicio=(day(fecha)-22)*24+2
Inicio

fecha_final=Sys.Date()-days(1); #as.Date("2020.05.23","%Y.%m.%d") #la feha del dia anterior
fecha_final
Fin=(day(fecha_final)-22)*24+25
Fin

tabla[Inicio:Fin,2]

HorasCCT<-tabla[Inicio:Fin,2]
UsuariosCCT<-tabla[Inicio:Fin,3]
TiempoCCT<-tabla[Inicio:Fin,4]

DATE<-c(fecha)

for(i in 1:(Fin-1)){
  DATE[i]<- fecha+hours(i-1)
}

DATE
length(DATE)


COPPELCOMTIENDA<-data.frame(DATE, UsuariosCCT,TiempoCCT)
names(COPPELCOMTIENDA) <- c("FECHA", "UsuariosCCT","TiempoCCT")

COPPELCOMTIENDA$UsuariosCCT <- as.numeric(COPPELCOMTIENDA$UsuariosCCT)
COPPELCOMTIENDA$TiempoCCT <- as.numeric(COPPELCOMTIENDA$TiempoCCT)

COPPELCOMTIENDA
  class(COPPELCOMTIENDA)

a=range(COPPELCOMTIENDA$UsuariosCCT)
b=range(COPPELCOMTIENDA$TiempoCCT)
m=diff(a)/diff(b)
m
y2<-((COPPELCOMTIENDA$TiempoCCT-b[1])*m+a[1])

p <- ggplot(COPPELCOMTIENDA, aes(x = FECHA)) 
 p<-p+ geom_line(aes(y =UsuariosCCT ,color="colorusers"),size=1.25)
 p <- p + scale_y_continuous(name ="Usuarios", 
                             breaks=seq(0,max(COPPELCOMTIENDA$UsuariosCCT),as.integer(max(COPPELCOMTIENDA$UsuariosCCT)/10)), labels = seq(0,max(COPPELCOMTIENDA$UsuariosCCT),as.integer(max(COPPELCOMTIENDA$UsuariosCCT)/10)),sec.axis = sec_axis(~(./m -a[1]/m)+b[1], name = "Segundos",
                             breaks=seq(0,as.integer(max(COPPELCOMTIENDA$TiempoCCT))+1,(as.integer(max(COPPELCOMTIENDA$TiempoCCT) +1)/10)), labels = seq(0,as.integer(max(COPPELCOMTIENDA$TiempoCCT))+1,(as.integer(max(COPPELCOMTIENDA$TiempoCCT)+1)/10))),
                             ) + 
   theme_minimal()+ggtitle("Coppel.com Tienda")+ theme(  plot.title = element_text(color="blue", size=14, face="italic"),
     axis.title.x = element_text(color="#000000", size=14),
     axis.title.y = element_text(color="#000000", size=14))+xlab(" ")
 p<-p+ geom_line(aes(y =y2,color="colorseg"),size=1.25)+scale_color_manual(name=" ",
                                                                          values=c("colorseg"="orange","colorusers"="#0096f2"),
                                                                          labels=c("Segundos","Usuarios"))+theme(legend.position="bottom")

print(p)


HorasCC<-tabla[Inicio:Fin,2]
UsuariosCC<-tabla[Inicio:Fin,8]
TiempoCC<-tabla[Inicio:Fin,9]


COPPELCOM<-data.frame(DATE, UsuariosCC,TiempoCC)
names(COPPELCOM) <- c("FECHA", "UsuariosCC","TiempoCC")

COPPELCOM$UsuariosCC <- as.numeric(COPPELCOM$UsuariosCC)
COPPELCOM$TiempoCC <- as.numeric(COPPELCOM$TiempoCC)


COPPELCOM

a=range(COPPELCOM$UsuariosCC)
b=range(COPPELCOM$TiempoCC)
m=diff(a)/diff(b)
m
y2<-((COPPELCOM$TiempoCC-b[1])*m+a[1])


q <- ggplot(COPPELCOM, aes(x = FECHA)) 
q<-q+ geom_line(aes(y =UsuariosCC, colour="colorusers"),size=1.25)
q <- q + scale_y_continuous(name ="Usuarios", 
                           breaks=seq(0,max(COPPELCOM$UsuariosCC),as.integer(max(COPPELCOM$UsuariosCC)/10)), labels = seq(0,max(COPPELCOM$UsuariosCC),as.integer(max(COPPELCOM$UsuariosCC)/10)),
                           sec.axis = sec_axis(~(./m -a[1]/m)+b[1], name = "Segundos",
                           breaks=seq(0,as.integer(max(COPPELCOM$TiempoCC))+1,(as.integer(max(COPPELCOM$TiempoCC) +1)/10)), labels = seq(0,as.integer(max(COPPELCOM$TiempoCC))+1,(as.integer(max(COPPELCOM$TiempoCC)+1)/10))), 
                           limits = c(0,max(COPPELCOM$UsuariosCC))) + 
  theme_minimal()+ggtitle("Coppel.com")+ theme(  plot.title = element_text(color="blue", size=14, face="italic"),
                                                 axis.title.x = element_text(color="#000000", size=14),
                                                 axis.title.y = element_text(color="#000000", size=14))+xlab(" ")
q<-q+ geom_line(aes(y =y2,color="colorseg"),size=1.25)+scale_color_manual(name=" ",
                                                                          values=c("colorseg"="orange","colorusers"="#0096f2"),
                                                                          labels=c("Segundos","Usuarios"))+theme(legend.position="bottom")
print(q)
