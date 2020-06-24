        library(readr)
        library(lubridate) 
        library(latticeExtra)
        library(extrafont)
        font_import()
        
        fecha=as.Date("2020.05.22","%Y.%m.%d") #Mayor al 22 de mayo de 2020
        fecha
        Inicio=(day(fecha)-22)*24+3
        Inicio
        fecha_final=fecha+1; #as.Date("2020.05.23","%Y.%m.%d") #Mayor al 22 de mayo de 2020
        fecha_final
        Fin=(day(fecha_final)-22)*24+26
        Fin
        
        tabla<-read_csv("/home/israel_valencia/Escritorio/1/HotSale/DatosHotsale_2.csv",col_names = FALSE)
        
        HorasCCT<-tabla[Inicio:Fin,2]
        UsuariosCCT<-tabla[Inicio:Fin,3]
        TiempoCCT<-tabla[Inicio:Fin,4]
        
        
        
        COPPELCOMTIENDA<-data.frame(HorasCCT, UsuariosCCT,TiempoCCT)
        names(COPPELCOMTIENDA) <- c("HorasCCT", "UsuariosCCT","TiempoCCT")
        
        COPPELCOMTIENDA$UsuariosCCT <- as.numeric(COPPELCOMTIENDA$UsuariosCCT)
        COPPELCOMTIENDA$TiempoCCT <- as.numeric(COPPELCOMTIENDA$"TiempoCCT")
        COPPELCOMTIENDA[25:48,1]

        #Coppel.com Tienda 
        jpeg(filename="/home/israel_valencia/Escritorio/1/HotSale/Coppel.com_Tienda.jpeg",   # Nombre del archivo y extension
             width = 69 ,    # Anchura
             height = 18,   # Altura
             res= 600,       # Resolucion 72ppi es un estandar
             units = "cm",
             family="Lato")
        
        par(mfrow=c(1,3))
        
        #1
        par(mar = c(7, 8, 5, 0))
        plot(COPPELCOMTIENDA[1:24,1],COPPELCOMTIENDA[(24*(day(fecha)-22)+1):(24*(day(fecha)-22)+24),2], type ="o",pch = 19,  cex = 1.5, lwd=5, yaxt = "n", ylab = " ", main = " ", xlab = " ",
             col = "#0096f2",xlim=c(0,23),
             ylim=c(0,as.integer(max(COPPELCOMTIENDA$UsuariosCCT)+max(COPPELCOMTIENDA$UsuariosCCT)/20)),
             xaxs="i",
             yaxs="i", frame=FALSE)
        grid(NA,10, lwd = 1,lty =1)
        axis(1, at = seq(0, 23, by = 1), las=1)
        axis(2, at = seq(0, as.integer(max(COPPELCOMTIENDA$UsuariosCCT)+max(COPPELCOMTIENDA$UsuariosCCT)/20), by = as.integer( (max(COPPELCOMTIENDA$UsuariosCCT)+max(COPPELCOMTIENDA$UsuariosCCT)/20)/10)), las=2, cex = 1.5, lty=3, tck=0, col.axis="#0096f2",col = "#0096f2")
        
        mtext("Usuarios", side = 2, line = 5, cex = 1.5, col="#0096f2")
        mtext(paste0(day(fecha),"/",month(fecha),"/",year(fecha)), side = 1, line = 3, cex = 1.5)
        #mtext("Coppel.com Tienda", side = 3, line = 2, cex = 3)
        
        par(new = TRUE)
        plot(COPPELCOMTIENDA[1:24,1],COPPELCOMTIENDA[(24*(day(fecha)-22)+1):(24*(day(fecha)-22)+24),3], type = "o",pch = 19, cex=1.5, lwd=5, xaxt = "n", yaxt = "n",  ann=FALSE,
             ylab = "", xlab = "", col = "#f28c00",xlim=c(0,23),
             ylim=c(0,as.integer(max(COPPELCOMTIENDA$TiempoCCT))+1),
             xaxs="i",
             yaxs="i",bty="n")
        ##axis(4, at = seq(0, as.integer(max(COPPELCOMTIENDA$TiempoCCT))+1, by = (as.integer(max(COPPELCOMTIENDA$TiempoCCT))+1)/10), las=2, lty=3, tck=0, cex = 1.5, col.axis="#f28c00",col = "#f28c00")
        ##mtext("Segundos", side = 4, line = 3 , cex = 1.5,col="#f28c00")
        
        legend("topleft", c("Usuarios", "Segundos"),lwd=5, cex=1.5,
               col = c("#0096f2", "#f28c00"), lty = c(1, 1),pch = c(19, 19), inset=c(0,1.05), xpd=TRUE, horiz=TRUE, bty="n")
       
        #2
        par(mar = c(7, 1, 5, 0))
        plot(COPPELCOMTIENDA[1:24,1],COPPELCOMTIENDA[(24*(day(fecha)-21)+1):(24*(day(fecha)-21)+24),2], type ="o",pch = 19,  cex = 1.5, lwd=5, yaxt = "n", ylab = " ", main = " ", xlab = " ",
             col = "#0096f2",xlim=c(0,23),
             ylim=c(0,as.integer(max(COPPELCOMTIENDA$UsuariosCCT)+max(COPPELCOMTIENDA$UsuariosCCT)/20)),
             xaxs="i",
             yaxs="i", frame=FALSE)
        grid(NA,10, lwd = 1,lty =1)
        axis(1, at = seq(0, 23, by = 1), las=1)
        #axis(2, at = seq(0, as.integer(max(COPPELCOMTIENDA$UsuariosCCT)+max(COPPELCOMTIENDA$UsuariosCCT)/20), by = as.integer( (max(COPPELCOMTIENDA$UsuariosCCT)+max(COPPELCOMTIENDA$UsuariosCCT)/20)/10)), las=2, cex = 1.5, lty=3, tck=0, col.axis="#0096f2",col = "#0096f2")
        
        #mtext("Usuarios", side = 2, line = 5, cex = 1.5, col="#0096f2")
        mtext(paste0(day(fecha)+1,"/",month(fecha),"/",year(fecha)), side = 1, line = 3, cex = 1.5)
        mtext("Coppel.com Tienda", side = 3, line = 2, cex = 3)
        
        par(new = TRUE)
        plot(COPPELCOMTIENDA[1:24,1],COPPELCOMTIENDA[(24*(day(fecha)-21)+1):(24*(day(fecha)-21)+24),3], type = "o",pch = 19, cex=1.5, lwd=5, xaxt = "n", yaxt = "n",  ann=FALSE,
             ylab = "", xlab = "", col = "#f28c00",xlim=c(0,23),
             ylim=c(0,as.integer(max(COPPELCOMTIENDA$TiempoCCT))+1),
             xaxs="i",
             yaxs="i",bty="n")
        ##axis(4, at = seq(0, as.integer(max(COPPELCOMTIENDA$TiempoCCT))+1, by = (as.integer(max(COPPELCOMTIENDA$TiempoCCT))+1)/10), las=2, lty=3, tck=0, cex = 1.5, col.axis="#f28c00",col = "#f28c00")
        ##mtext("Segundos", side = 4, line = 3 , cex = 1.5,col="#f28c00")
        
        #legend("topleft", c("Usuarios", "Segundos"),lwd=5, cex=1.5,  col = c("#0096f2", "#f28c00"), lty = c(1, 1),pch = c(19, 19), inset=c(0,1.15), xpd=TRUE, horiz=TRUE, bty="n")
        

        #3
        par(mar = c(7, 1, 5, 6))
        plot(COPPELCOMTIENDA[1:24,1],COPPELCOMTIENDA[25:48,2], type ="o",pch = 19,  cex = 1.5, lwd=5, yaxt = "n", ylab = " ", main = " ", xlab = " ",
             col = "#0096f2",xlim=c(0,23),
             ylim=c(0,as.integer(max(COPPELCOMTIENDA$UsuariosCCT)+max(COPPELCOMTIENDA$UsuariosCCT)/20)),
             xaxs="i",
             yaxs="i", frame=FALSE)
        grid(NA,10, lwd = 1,lty =1)
        axis(1, at = seq(0, 23, by = 1), las=1)
       ## axis(2, at = seq(0, as.integer(max(COPPELCOMTIENDA$UsuariosCCT)+max(COPPELCOMTIENDA$UsuariosCCT)/20), by = as.integer( (max(COPPELCOMTIENDA$UsuariosCCT)+max(COPPELCOMTIENDA$UsuariosCCT)/20)/10)), las=2, cex = 1.5, lty=3, tck=0, col.axis="#0096f2",col = "#0096f2")
        
        ##mtext("Usuarios", side = 2, line = 5, cex = 1.5, col="#0096f2")
        mtext(paste0(day(fecha)+2,"/",month(fecha),"/",year(fecha)), side = 1, line = 3, cex = 1.5)
        #mtext("Coppel.com Tienda", side = 3, line = 2, cex = 3)
        
        par(new = TRUE)
        plot(COPPELCOMTIENDA[1:24,1],COPPELCOMTIENDA[25:48,3], type = "o",pch = 19, cex=1.5, lwd=5, xaxt = "n", yaxt = "n",  ann=FALSE,
             ylab = "", xlab = "", col = "#f28c00",xlim=c(0,23),
             ylim=c(0,as.integer(max(COPPELCOMTIENDA$TiempoCCT))+1),
             xaxs="i",
             yaxs="i",bty="n")
        axis(4, at = seq(0, as.integer(max(COPPELCOMTIENDA$TiempoCCT))+1, by = (as.integer(max(COPPELCOMTIENDA$TiempoCCT))+1)/10), las=2, lty=3, tck=0, cex = 1.5, col.axis="#f28c00",col = "#f28c00")
        mtext("Segundos", side = 4, line = 4 , cex = 1.5,col="#f28c00")
        
        #####
        dev.off()
        COPPELCOMTIENDA
        
        #Coppel.com
        HorasCC<-tabla[Inicio:Fin,2]
        UsuariosCC<-tabla[Inicio:Fin,8]
        TiempoCC<-tabla[Inicio:Fin,9]
        
        COPPELCOM<-data.frame(HorasCC, UsuariosCC,TiempoCC)
        names(COPPELCOM) <- c("HorasCC", "UsuariosCC","TiempoCC")
        
        COPPELCOM$UsuariosCC <- as.numeric(COPPELCOM$UsuariosCC)
        COPPELCOM$TiempoCC <- as.numeric(COPPELCOM$TiempoCC)
        
        jpeg(filename="/home/israel_valencia/Escritorio/1/HotSale/Coppel.com.jpeg",   # Nombre del archivo y extension
             width = 69,    # Anchura
             height = 18,   # Altura
             res= 600,       # Resolucion 72ppi es un estandar
             units = "cm",
             family="Lato")
        
        par(mfrow=c(1,3))
        
        #1
        par(mar = c(7, 8, 5, 0))
        plot(COPPELCOM[1:24,1],COPPELCOM[(24*(day(fecha)-22)+1):(24*(day(fecha)-22)+24),2], type ="o",pch = 19,  cex = 1.5, lwd=5, yaxt = "n", ylab = " ", main = " ", xlab = " ",
             col = "#0096f2",xlim=c(0,23),
             ylim=c(0,as.integer(max(COPPELCOM$UsuariosCC)+max(COPPELCOM$UsuariosCC)/20)),
             xaxs="i",
             yaxs="i", frame=FALSE)
        grid(NA,10, lwd = 1,lty =1)
        axis(1, at = seq(0, 23, by = 1), las=1)
        axis(2, at = seq(0, as.integer(max(COPPELCOM$UsuariosCC)+max(COPPELCOM$UsuariosCC)/20), by = as.integer( (max(COPPELCOM$UsuariosCC)+max(COPPELCOM$UsuariosCC)/20)/10)), las=2, cex = 1.5, lty=3, tck=0, col.axis="#0096f2",col = "#0096f2")
        
        mtext("Usuarios", side = 2, line = 5, cex = 1.5, col="#0096f2")
        mtext(paste0(day(fecha),"/",month(fecha),"/",year(fecha)), side = 1, line = 3, cex = 1.5)
        #mtext("Coppel.com", side = 3, line = 2, cex = 3)
        
        par(new = TRUE)
        plot(COPPELCOM[1:24,1],COPPELCOM[(24*(day(fecha)-22)+1):(24*(day(fecha)-22)+24),3], type = "o",pch = 19, cex=1.5, lwd=5, xaxt = "n", yaxt = "n",  ann=FALSE,
             ylab = "", xlab = "", col = "#f28c00",xlim=c(0,23),
             ylim=c(0,as.integer(max(COPPELCOM$TiempoCC))+1),
             xaxs="i",
             yaxs="i",bty="n")
        ##axis(4, at = seq(0, as.integer(max(COPPELCOM$TiempoCC))+1, by = (as.integer(max(COPPELCOM$TiempoCC))+1)/10), las=2, lty=3, tck=0, cex = 1.5, col.axis="#f28c00",col = "#f28c00")
        ##mtext("Segundos", side = 4, line = 3 , cex = 1.5,col="#f28c00")
        
        legend("topleft", c("Usuarios", "Segundos"),lwd=5, cex=1.5,
               col = c("#0096f2", "#f28c00"), lty = c(1, 1),pch = c(19, 19), inset=c(0,1.05), xpd=TRUE, horiz=TRUE, bty="n")
        
        #2
        par(mar = c(7, 1, 5, 0))
        plot(COPPELCOM[1:24,1],COPPELCOM[(24*(day(fecha)-21)+1):(24*(day(fecha)-21)+24),2], type ="o",pch = 19,  cex = 1.5, lwd=5, yaxt = "n", ylab = " ", main = " ", xlab = " ",
             col = "#0096f2",xlim=c(0,23),
             ylim=c(0,as.integer(max(COPPELCOM$UsuariosCC)+max(COPPELCOM$UsuariosCC)/20)),
             xaxs="i",
             yaxs="i", frame=FALSE)
        grid(NA,10, lwd = 1,lty =1)
        axis(1, at = seq(0, 23, by = 1), las=1)
        #axis(2, at = seq(0, as.integer(max(COPPELCOM$UsuariosCC)+max(COPPELCOM$UsuariosCC)/20), by = as.integer( (max(COPPELCOM$UsuariosCC)+max(COPPELCOM$UsuariosCC)/20)/10)), las=2, cex = 1.5, lty=3, tck=0, col.axis="#0096f2",col = "#0096f2")
        
        #mtext("Usuarios", side = 2, line = 5, cex = 1.5, col="#0096f2")
        mtext(paste0(day(fecha)+1,"/",month(fecha),"/",year(fecha)), side = 1, line = 3, cex = 1.5)
        mtext("Coppel.com", side = 3, line = 2, cex = 3)
        
        par(new = TRUE)
        plot(COPPELCOM[1:24,1],COPPELCOM[(24*(day(fecha)-21)+1):(24*(day(fecha)-21)+24),3], type = "o",pch = 19, cex=1.5, lwd=5, xaxt = "n", yaxt = "n",  ann=FALSE,
             ylab = "", xlab = "", col = "#f28c00",xlim=c(0,23),
             ylim=c(0,as.integer(max(COPPELCOM$TiempoCC))+1),
             xaxs="i",
             yaxs="i",bty="n")
        ##axis(4, at = seq(0, as.integer(max(COPPELCOM$TiempoCC))+1, by = (as.integer(max(COPPELCOM$TiempoCC))+1)/10), las=2, lty=3, tck=0, cex = 1.5, col.axis="#f28c00",col = "#f28c00")
        ##mtext("Segundos", side = 4, line = 3 , cex = 1.5,col="#f28c00")
        
        legend("topleft", c("Usuarios", "Segundos"),lwd=5, cex=1.5,
               col = c("#0096f2", "#f28c00"), lty = c(1, 1),pch = c(19, 19), inset=c(0,1.15), xpd=TRUE, horiz=TRUE, bty="n")
        
        #3
        par(mar = c(7, 1, 5, 5))
        plot(COPPELCOM[1:24,1],COPPELCOM[25:48,2], type ="o",pch = 19,  cex = 1.5, lwd=5, yaxt = "n", ylab = " ", main = " ", xlab = " ",
             col = "#0096f2",xlim=c(0,23),
             ylim=c(0,as.integer(max(COPPELCOM$UsuariosCC)+max(COPPELCOM$UsuariosCC)/20)),
             xaxs="i",
             yaxs="i", frame=FALSE)
        grid(NA,10, lwd = 1,lty =1)
        axis(1, at = seq(0, 23, by = 1), las=1)
        ## axis(2, at = seq(0, as.integer(max(COPPELCOM$UsuariosCC)+max(COPPELCOM$UsuariosCC)/20), by = as.integer( (max(COPPELCOM$UsuariosCC)+max(COPPELCOM$UsuariosCC)/20)/10)), las=2, cex = 1.5, lty=3, tck=0, col.axis="#0096f2",col = "#0096f2")
        
        ##mtext("Usuarios", side = 2, line = 5, cex = 1.5, col="#0096f2")
        mtext(paste0(day(fecha)+2,"/",month(fecha_final),"/",year(fecha_final)), side = 1, line = 3, cex = 1.5)
        #mtext("Coppel.com Tienda", side = 3, line = 2, cex = 3)
        
        par(new = TRUE)
        plot(COPPELCOM[1:24,1],COPPELCOM[25:48,3], type = "o",pch = 19, cex=1.5, lwd=5, xaxt = "n", yaxt = "n",  ann=FALSE,
             ylab = "", xlab = "", col = "#f28c00",xlim=c(0,23),
             ylim=c(0,as.integer(max(COPPELCOM$TiempoCC))+1),
             xaxs="i",
             yaxs="i",bty="n")
        axis(4, at = seq(0, as.integer(max(COPPELCOM$TiempoCC))+1, by = (as.integer(max(COPPELCOM$TiempoCC))+1)/10), las=2, lty=3, tck=0, cex = 1.5, col.axis="#f28c00",col = "#f28c00")
        mtext("Segundos", side = 4, line = 3 , cex = 1.5,col="#f28c00")
        
        #####
        dev.off()
        COPPELCOM
        
