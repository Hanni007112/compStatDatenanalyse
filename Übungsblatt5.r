#################
#####  1  #######
#################
konfint <- function(p, xbar, s, n) {
  p <- 0.5 + p / 2
#   q <- qnorm(p, xbar, s)
  q <- qnorm(p)
  og <- xbar + q * s / sqrt(n) # obere grenze
  ug <- xbar - q * s / sqrt(n) # untere grenze
  print("Die Grenzen von Konfidenzintervall sind: ", quote = FALSE)
  kon <- c(ug, og)
  kon
}
konfint(0.95, 1000, 5, 50)
# Wie ändert sich der Umfang, wenn die Werte von s und n verändert werden?
# Wenn n (Stichprobenumfang) größer wird, wird der Umfang kleiner, weil die Standardabweichung kleiner wird.
# Wenn s (Standardabweichung) größer wird, wird der Umfang größer, weil die Standardabweichung größer wird.
# Wenn p (Konfidenzniveau) größer wird, wird der Umfang größer, weil die Quantile größer werden.