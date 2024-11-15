eigennutzung<-c(62,50,38,70,76,54,80,67,67,47,66,66,41,72,43)
sozialmiete<-c(6,18,26,0,2,17,11,6,2,36,4,24,23,143,22)
privatmiete<-c(30,24,36,26,16,21,9,8,31,17,28,10,22,11,18)

print(length(eigennutzung) == length(sozialmiete) && length(sozialmiete) == length(privatmiete))

#################
#####  1  #######
#################


#######a#########

print("metrisch skaliert")

#######b########

print("arithmetischer Mittelwert eigennutzung: ")
print(mean(eigennutzung))
print("arithmetischer Mittelwert sozialmiete: ")
print(mean(sozialmiete))
print("arithmetischer Mittelwert privatmiete: ")
print(mean(privatmiete))

print("Median eigennutzung: ")
print(median(eigennutzung))
print("Median sozialmiete: ")
print(median(sozialmiete))
print("Median privatmiete: ")
print(median(privatmiete))



print(table(eigennutzung))
print(table(sozialmiete))
print(table(privatmiete))
print("Median eigennutzung: bimodale Statistik mit 66 und 67")
print("Median sozialmiete: bimodale Statistik mit 2 und 6")
print("Median privatmiete: Modalwert ist nicht definiert")


#######c########
eigen <- as.vector(summary(eigennutzung))
sozial <- as.vector(summary(sozialmiete))
privat <- as.vector(summary(privatmiete))

print("Maximum, minimum, Spannweite, 1.Q., 3.Q., IQR von Eigennutzung")
print(c(eigen[6], eigen[1], eigen[6] - eigen[1], eigen[2], eigen[5], eigen[5] - eigen[2]))

print("Maximum, minimum, Spannweite, 1.Q., 3.Q., IQR von Sozialmiete")
print(c(sozial[6], sozial[1], sozial[6] - sozial[1], sozial[2], sozial[5], sozial[5] - sozial[2]))

print("Maximum, minimum, Spannweite, 1.Q., 3.Q., IQR von Privatmiete")
print(c(privat[6], privat[1], privat[6] - privat[1], privat[2], privat[5], privat[5] - privat[2]))


#######d########
print("obere Schranken, untere Schranke von Eigennutzung")
print(c(eigen[5] + 1.5 * (eigen[5] - eigen[2]), eigen[2] -  1.5 * (eigen[5] - eigen[2])  ))
print("obere Schranken, untere Schranke von Sozialmiete")
print(c(sozial[5] + 1.5 * (sozial[5] - sozial[2]), sozial[2] -  1.5 * (sozial[5] - sozial[2])))
print("obere Schranken, untere Schranke von Privatmiete")
print(c(privat[5] + 1.5 * (privat[5] - privat[2]), privat[2] -  1.5 * (privat[5] - privat[2])))

#######e########
boxplot(eigennutzung, main="Eigennutzung")
grid()
boxplot(sozialmiete, main="Sozialmiete")
grid()
boxplot(privatmiete, main="Privatmiete")
grid()


#################
#####  2  #######
#################

# ich mach das ab jetzt nur noch für eigen nutzug

#######a#########
print(sort(eigennutzung))



#######b#########

i <- ceiling(0.25 * length(eigennutzung))
j <- floor(0.75 * length(eigennutzung))

#######c#########
q1 <- 0.25 * eigennutzung[i] + 0.75 * eigennutzung[i+1]
q3 <- 0.75 * eigennutzung[j] + 0.25 * eigennutzung[j+1]

#######d#########

q1 <- 0.75 * eigennutzung[i] + 0.25 * eigennutzung[i+1]
q3 <- 0.25 * eigennutzung[j] + 0.75 * eigennutzung[j+1]

#######e#########

#ja es sind alles valide quartile

#################
#####  3 #######
#################

#so könnte man Zufalszahlen generieren:
x1 <- sample(40, 80, 15)

# explorative Datenanalye machen wir mal nicht
