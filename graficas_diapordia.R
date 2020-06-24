        library(readr)
        library(lubridate) 
        library(latticeExtra)
        library(extrafont)
        font_import()
        
        fec_fecha=as.Date("2020.05.23","%Y.%m.%d") #Mayor al 22 de mayo de 2020
        fec_fecha
        Inicio=(day(fec_fecha)-22)*24+3
        Inicio
        Fin=(day(fec_fecha)-22)*24+26
        Fin
        
        tabla<-read_csv("/home/israel_valencia/Escritorio/1/HotSale/DatosHotsale_2.csv",col_names = FALSE)
        
        HorasCCT<-tabla[Inicio:Fin,2]
        UsuariosCCT<-tabla[Inicio:Fin,3]
        TiempoCCT<-tabla[Inicio:Fin,4]
        
        #Coppel.com Tienda 
        jpeg(filename=paste0("/home/israel_valencia/Escritorio/1/HotSale/Coppel.com_Tienda-",fec_fecha,".jpeg",sep=""),   # Nombre del archivo y extension
             width = 33,    # Anchura
             height = 19,   # Altura
             res= 600,       # Resolucion 72ppi es un estandar
             units = "cm",
             family="Lato")
        
        COPPELCOMTIENDA<-data.frame(HorasCCT, UsuariosCCT,TiempoCCT)
        names(COPPELCOMTIENDA) <- c("HorasCCT", "UsuariosCCT","TiempoCCT")
        
        COPPELCOMTIENDA$UsuariosCCT <- as.numeric(COPPELCOMTIENDA$UsuariosCCT)
        COPPELCOMTIENDA$TiempoCCT <- as.numeric(COPPELCOMTIENDA$"TiempoCCT")
        
        par(mar = c(7, 7, 5, 5))
        plot(COPPELCOMTIENDA$HorasCCT,COPPELCOMTIENDA$UsuariosCCT, type ="o",pch = 19,  cex = 1.5, lwd=5, yaxt = "n", ylab = " ", main = " ", xlab = " ",
             col = "#0096f2",xlim=c(0,23),
             ylim=c(0,as.integer(max(COPPELCOMTIENDA$UsuariosCCT)+max(COPPELCOMTIENDA$UsuariosCCT)/20)),
             xaxs="i",
             yaxs="i", frame=FALSE)
        grid(NA,10, lwd = 1,lty =1)
        axis(1, at = seq(0, 23, by = 1), las=1,axis=FALSE)
        axis(2, at = seq(0, as.integer(max(COPPELCOMTIENDA$UsuariosCCT)+max(COPPELCOMTIENDA$UsuariosCCT)/20), by = as.integer( (max(COPPELCOMTIENDA$UsuariosCCT)+max(COPPELCOMTIENDA$UsuariosCCT)/20)/10)), las=2, cex = 1.5, lty=3, tck=0, col.axis="#0096f2",col = "#0096f2")
        
        mtext("Usuarios", side = 2, line = 5, cex = 1.5, col="#0096f2")
        mtext(paste0(day(fec_fecha),"/",month(fec_fecha),"/",year(fec_fecha)), side = 1, line = 3, cex = 1.5)
        mtext("Coppel.com Tienda", side = 3, line = 2, cex = 3)
        
        par(new = TRUE)
        plot(COPPELCOMTIENDA$HorasCCT,COPPELCOMTIENDA$TiempoCCT, type = "o",pch = 19, cex=1.5, lwd=5, xaxt = "n", yaxt = "n",  ann=FALSE,
             ylab = "", xlab = "", col = "#f28c00",xlim=c(0,23),
             ylim=c(0,as.integer(max(COPPELCOMTIENDA$TiempoCCT))+1),
             xaxs="i",
             yaxs="i",bty="n")
        axis(4, at = seq(0, as.integer(max(COPPELCOMTIENDA$TiempoCCT))+1, by = (as.integer(max(COPPELCOMTIENDA$TiempoCCT))+1)/10), las=2, lty=3, tck=0, cex = 1.5, col.axis="#f28c00",col = "#f28c00")
        mtext("Segundos", side = 4, line = 3 , cex = 1.5,col="#f28c00")
        
        legend("topleft", c("Usuarios", "Segundos"),lwd=5, cex=1.5,
               col = c("#0096f2", "#f28c00"), lty = c(1, 1),pch = c(19, 19), inset=c(0,1.15), xpd=TRUE, horiz=TRUE, bty="n")
        dev.off()
        COPPELCOMTIENDA
        
        #Coppel.com
        jpeg(filename=paste0("/home/israel_valencia/Escritorio/1/HotSale/Coppel.com-",fec_fecha,".jpeg",sep=""),   # Nombre del archivo y extension
             width = 33,    # Anchura
             height = 19,   # Altura
             res= 600,       # Resolucion 72ppi es un estandar
             units = "cm",
             family="Lato")
        HorasCC<-tabla[Inicio:Fin,2]
        UsuariosCC<-tabla[Inicio:Fin,8]
        TiempoCC<-tabla[Inicio:Fin,9]
        
        COPPELCOM<-data.frame(HorasCC, UsuariosCC,TiempoCC)
        names(COPPELCOM) <- c("HorasCC", "UsuariosCC","TiempoCC")
        
        COPPELCOM$UsuariosCC <- as.numeric(COPPELCOM$UsuariosCC)
        COPPELCOM$TiempoCC <- as.numeric(COPPELCOM$TiempoCC)
        
        par(mar = c(7, 7, 5, 5))
        plot(COPPELCOM$HorasCC,COPPELCOM$UsuariosCC, type ="o",pch = 19, cex = 1.5, lwd=5, yaxt = "n", ylab = " ", main = " ", xlab = " ",
             col = "#0096f2",xlim=c(0,23),
             ylim=c(0,as.integer(max(COPPELCOM$UsuariosCC)+max(COPPELCOM$UsuariosCC)/20)),
             xaxs="i",
             yaxs="i",bty="n")
        grid(NA,10, lwd = 1,lty =1)
        axis(1, at = seq(0, 23, by = 1), las=1)
        axis(2, at = seq(0,as.integer(max(COPPELCOM$UsuariosCC)+max(COPPELCOM$UsuariosCC)/20), by = as.integer( (max(COPPELCOM$UsuariosCC)+max(COPPELCOM$UsuariosCC)/20)/10)), las=2, lty=3, tck=0, cex = 1.5, col.axis="#0096f2",col = "#0096f2")
        mtext("Usuarios", side = 2, line = 5,  cex = 1.5,col="#0096f2")
        mtext(paste0(day(fec_fecha),"/",month(fec_fecha),"/",year(fec_fecha)), side = 1, line = 3,cex = 1.5)
        mtext("Coppel.com", side = 3, line = 2, cex = 3)
        
        par(new = TRUE)
        plot(COPPELCOM$HorasCC,COPPELCOM$TiempoCC, type = "o",pch = 19, cex=1.5, lwd=5, xaxt = "n", yaxt = "n", ann=FALSE,
             ylab = "", xlab = "", col = "#f28c00",
             xlim = c(0,23),
             ylim=c(0,as.integer(max(COPPELCOM$TiempoCC))+1),
             xaxs="i",
             yaxs="i",bty="n")
        axis(4, at = seq(0, as.integer(max(COPPELCOM$TiempoCC))+1, by = (as.integer((max(COPPELCOM$TiempoCC))+1)/10)), las=2, lty=3, tck=0, cex = 1.5, col.axis="#f28c00",col = "#f28c00")
        mtext("Segundos", side = 4, line = 3, cex = 1.5,col="#f28c00")
        
        legend("topleft", c("Usuarios", "Segundos"),lwd=5, cex=1.5,
               col = c("#0096f2", "#f28c00"), lty = c(1, 1),pch = c(19, 19), inset=c(0,1.15), xpd=TRUE, horiz=TRUE, bty="n")
        dev.off()
        
        COPPELCOM
        
