
#################
#####  1  #######
#################

X<-c(-4.47,126.70,175.36,64.93,79.28,102.93,57.9,27.24,91.05,93.57,70.09,103.05)
# strom 2023


#######a#########

# Quartilskoeffizient der Schiefe
print("Quartilskoeffizient der Schiefe")
q <- as.vector(quantile(X))
sq <- ((q[4] - median(X)) - (median(X) - q[2])) / IQR(X)
print(sq)

#relative Schiefemass
print("elative Schiefemass")
M3 <- sum((X - mean(X))^3)
N <- length(X)
S <- (N * M3) / ((N - 1) * (N - 2) * sd(X)^3)
print(S)

#######b#########

# Pearsons 1. Schiefekoeffizient
print("Pearsons 1. Schiefekoeffizient")
print("nicht definitert")

# Pearsons 2. Schiefekoeffizient
print("Pearsons 1. Schiefekoeffizient")
S2 <- (mean(X)-median(X))/sd(X)
print(S2)

#######c#########
M2 <- sum((X - mean(X))^2)
M4 <- sum((X - mean(X))^4)
N <- length(X)
  
kurtosis <- (N * (N + 1) * M4 - 3 * (N - 1) * M2^2) / ((N - 1) * (N - 2) * (N - 3) * sd(X)^4)

print("Kurtosis")
print(kurtosis)

#######d#########
c  <- IQR(X) / (quantile(X, 0.9) - quantile(X, 0.1))
print("Perzentilkoeffizient der Kurtosis")
print(c)

#######e#########
plot(density(X))

#######f#########

# ich leg das hier gleich schon übereinander
plot(density(X))
my <- mean(X)
N <- length(X)
s <- sd(X) * sqrt((N-1)/N) #stdabweichung von der Grundgesamtheit#´
x <- seq(my-3*s, my+3*s, by=s/8)
y <- dnorm(x, my, s)
lines(x,y,col="purple")