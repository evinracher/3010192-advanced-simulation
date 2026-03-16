#1___Enunciado del ejercicio__________####
'Un ebrio est? parado en una esquina cuando 
decide caminar para que le pase el efecto.  

Existe una probabilidad igual de que se
dirija a cualquiera de los puntos cardinales
(Este, oeste, norte, sur).

¿Donde podría terminar parado el borracho si 
camina diez cuadras?'

'Simulación: Caminata aleatoria del embriagado 
en dos dimensiones (CA_ebrio)'

#2___Programando la función___________####
CA_ebrio<-function(N)
    {
        i<-0
        x<-0
        y<-0
        xpos<-vector()
        xpos[1]<-x
        ypos<-vector()
        ypos[1]<-y
        for (i in 2:N-1)
            {
                r<-runif(1, min = 0, max = 1)
                if(r<=0.25) {x<-x+1}
                if(r>0.25 && r<=0.5) {x<-x-1}
                if(r>0.5 && r<=0.75) {y<-y + 1}
                if(r>0.75) {y<- y- 1}
                xpos[i+1]<-x
                ypos[i+1]<-y
              }
        return(cbind(xpos,ypos))
}

#3___Probando la función______________####
CA_ebrio(11)
#4___Simulando con número de cuadras__####
#utilicemos más cuadras
cuadras <-5001
simulacion_CA<-CA_ebrio(cuadras)

xmin<-min(simulacion_CA[,1])
xmax<-max(simulacion_CA[,1])
ymin<-min(simulacion_CA[,2])
ymax<-max(simulacion_CA[,2])

plot(simulacion_CA[,1],simulacion_CA[,2],type="l",xlab="x",ylab="y",
     main="Caminata aleatoria del embriagado",
     col="darkblue",xlim=range(xmin:xmax),
     ylim=range(ymin:ymax), las=1)

end<-cbind(simulacion_CA[cuadras,1],simulacion_CA[cuadras,2])
start<-cbind(0,0)

points(start,pch=4,col="darkgreen", lwd=6)
points(end,pch=4,col="darkgreen",lwd=6)








