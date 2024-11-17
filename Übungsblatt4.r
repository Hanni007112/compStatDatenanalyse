daxdaten <- EuStockMarkets[, 1]
smidaten <- EuStockMarkets[, 2]
length(daxdaten) == length(smidaten)

#################
#####  1  #######
#################

# a)  Grafische Darstellung
plot(daxdaten, smidaten)
# b) Standardabweichung
sd(daxdaten)
sd(smidaten)
# c) Kovarianz
cov <- sum((daxdaten- mean(daxdaten)) * (smidaten - mean(smidaten))) / (length(smidaten) - 1)
# d) Korrelationskoeffizient nach Pearson
cor <- cov / (sd(daxdaten) * sd(smidaten))
# e) ????