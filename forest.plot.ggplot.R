# ejemplo basico y rapido de forest plot en GGPLOT

# paquetes
library(ggplot2)
library(forcats)

# dataset ejemplo
datos=structure(list(predictor = c("variable.A", "variable.B", "variable.C", "variable.D"), 
                     HR = c(2.1, 2.9, 1.8, 2.2), 
                     LI = c(1.5, 2.2, 1.1, 1.5), 
                     LS = c(4.2, 3.8, 2.9, 3.1), 
                     pval = c(1e-04, 5e-09, 0.005, 5e-06)), 
                class = "data.frame", row.names = c(NA, -4L))


# ordenar los datos
datos$predictor=factor(datos$predictor) #aca se determina el orden en que van a aparecer

# graficr
ggplot(datos, aes(x=fct_rev(predictor), y=HR, color=predictor))+
  geom_point()+ # esto grafica el punto del HR
  geom_linerange(inherit.aes = F, aes(x=predictor, ymin=LI, ymax=LS, color=predictor))+ # esto los intervalos de confianza
  coord_flip()+ # para cambiar los ejes
  ylim(0,5)+ # limites del grafico, son los limites de y porque estan los ejes cambiados
  geom_hline(yintercept = 1, linetype='dashed')+ # linea punteada en 1
  ylab("HR (CI95%)")+  # ajustar etiqueta
  xlab("") # borrar etiqueta
