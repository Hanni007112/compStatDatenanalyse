Strompreise <- c(36.63, 45.43, 46.48, 36.48, 39.55, 50.44, 54.09, 61.54, 75.48, 68.62)
Inflationsrate <- c(1.6, 1.4, 1.6, 1.6, 2.2, 2.1, 2.0, 2.0, 2.3, 2.5)

#################
#####  1  #######
#################

# Streudiagramm
plot(Strompreise, Inflationsrate)
grid()
# Approximationsgerade
linreg <- (lm(Inflationsrate ~ Strompreise))
abline(coef(linreg), col="red")
residuals(linreg) # residuen werden angezeigt
summary(linreg)
# prognose für nov(November): wert der inflationsrate
b<-as.vector(coef(linreg))
Infnov <- b[1] + b[2] * 59.19 # strompreis nov mit 59.19 ist bekannt asu tablelle der Aufgabenstellung
print(Infnov) # 2.1
# Residualstandardabweichung
N <- length(Inflationsrate) 
resdf <- sqrt((N-1)/(N-2))  * sd(residuals(linreg))
# Korrelationskoeffizient
# multiple R squared (streuungsmass für die residuen) steht auch weider in summary
#R ^ 2     R squared
# ist ein maß für die Güte der Annäherung
R2 <- 1 - sum(residuals(linreg)^2) / sum((Inflationsrate-mean(Inflationsrate))^2)
sqrt(R2) # persons korrelationskoef
#normalerweise: -1<=r<=1
#nahe bei 0->schwacher Zusammenhang, nahe bei 1-> starker Zusammenhang