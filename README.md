# compStatDatenanalyse

## R Befehle

Wertezuweisung:
`x<-1`

| Function| Beschreibung ||
| --------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | -------------------------------------------------------------------------------------------------------------------------- |
| c | concatiniert werte (Liste) ||
| sum |||
| length| Anzahl Daten ||
| sort| kleiner -> größer||
| IQR | inter Quartil Range (Abstand zwischen 3. und 1.) ||
| min |||
| max |||
| mean| arithmetisches Mittel||
| median| Median ||
| |||
| sumary| zeigt `min`,`1.Q`, `Median`, `Mean`, `3.Q`, `max`||
| as.vector | speichert als Vector | `as.vector(summary(X))`|
| []| Element mit index aus Liste/ Vector||
| quantile| man kann verschiedene quantille ausgeben. der Standart ist<br>min, 1.Q, 2.Q, 3.Q, max||
| table | zeigt Werte und Häufigkeit ||
| sd| standartabweichung (standart- deviation)<br>Achtung das ist die sd der Stichprobe, nicht der Gesamtheit<br>also n-1| sd(x)|
| density | empirische Dichtfunktion<br>Achtung hier wird wieder die sd der Stichprobe benutzt <br>und nicht der Grundmenge. Hier entsteht also wieder<br> eine Abweichung zu unserer Theorie, wenn man R benutzt. ||
| |||
| ceiling | aufrunden||
| floor | abrunden ||
| |||
| runif | zufallszahlen| `runif(n=5, min=1, max=20)`|
| sample| zufallszahlen| sample(min:max,n)<br>also `sample(1:20,5)`|
| rnorm | zufallszahlen| rnorm(Anzahl, Mittelwert, Standartabweichung)<br>also `rnorm(100,20,3)`<br>-> resultiert hier in Zahlen zwischen 11 und 29 |
| |||
| boxplot | erstellt ein boxplot | `boxplot(x, main="Boxplot von X", horizontal=TRUE)`|
| hist| erstellt ein hisogramm | `hist(x, ylab="Absolute Häufigkeit", col="skyblue")` |
| plot| plottet etwas| `plot(density(x))` |
| abline| fügt eine line zum letzten plot hinzu. | `abline(v=mean(werte), col="red")`<br>v steht hier für vertical|
| lines | kann plotte übereinanderlegen


## Bekannte Klausurfragen

- "Führen sie eine explorative Datenanalyse  durch
    - siehe Überschrit explorative Datenanalyse  

- Wieviele Klassen definiert die Software bei der Erstellung eines Histogramms?
	- Antwort: $\log_2 (\text{Anzahl Daten}) + 1$
	- Antwort in R : `log2(length(X)) + 1`
- Es ist eine Standartabweichung gegeben. Welche ist das. (Entscheidung zwischen sd von R und unserer Definition)
	- Hier muss man rechnen.
		- Standartabweichung in R: $\sqrt{\frac{1}{N-1}\sum_{n=1}^{N}(X_{n} - \overline{x})^{2}}$  als R Ausdruck : `sqrt(sum((X-mean(X))^2)/(length(X)-1))` oder Einfacher: `sd(X)`
		- Standartabweichung unsere Definition: $\sqrt{\frac{1}{N}\sum_{n=1}^{N}(X_{n} - \overline{x})^{2}}$ als R Ausdruck: `sqrt(sum((X-mean(X))^2)/length(X))`

## Merkmalsskalen
- nominal
- ordinal
- metrisch

## Lagemasse
- minimum 
- maximum
- median $\widetilde{x}$
- arithmetisches mittel $\overline{x}$
- modalwert
- 1 Quartil Median der 1. Hälfte
- 2 Quartil Median
- 3 Quartil Median der 2. Hälfte

spannweite: $min -max$

interquartilabstand $IQR = 3.Q - 1.Q$

Anwendung:
- $\text{obere Grenze} = 3.Q + 1.5 * IQR$
- $\text{untere Grenze} = 1.Q - 1.5 * IQR$


## explorative Datenanalyse

bei jeder Angabe sollen wir beschreiben was es bedeutet. bsp. das arithmetische Mittel ist der umgangsschprachliche Durchschnitt

Falls wir werte generieren sollen, müssen wir aufschreiben womit wir das gemacht haben.
(ich würde die Werte herauskopieren und dann dem X "fest" zuweisen, sodas des im weiteren verlauf immer die selben Werte sind)

`summary(X)`

- minimum 
- maximum
- arithmetisches mittel
- median
- erstes Quartil
- zweites Quartil
- Berechnnen:
    - Spannweite
    - $IQR$: 
    - untere Grenze
    - obere Grenze  

`table(X)`
- Modalwert siehe Modalwert

`boxplot(X)`
- visuell abschätzen:
    - Median ungefähr
    - erstes Quartil ungefähr
    - zweites Quartil ungefähr
    - wieviele Ausreßer es gibt (wieviele sind drüber, wieviele sind drunter)

`hist(X)`
- visuell abschätzen:
    - wieviele Klassen hat die Software definiert 
    - wir schätzen die Häufigkeiten für jede Klasse und deren Breite
    - in Welcher Klasse liegen die meißten Werte 

`plot(density(X))`

`abline(v=mean(X), col="red")` # hab ich gemacht um das besser einzuordnen, empfehle ich auch
- visuell abschätzen:
    - symetrisch oder nicht symetrisch?
    - höchste Dichte in der Nähe vom arithmetischen mittel?(rote Linie) drüber /drunter?

- Standartabweichung berechnen mit:
    - R: `sd(X)` 
    - unsere Definition: `sqrt(sum((X-mean(X))^2)/length(X))`

- Schiefe berechnen 3 mal? mit: 
<!-- TODO -->
    - `


<!-- TODO -->

Ich glaube das war es. Ich kann mir vorstelllen das wir aber auch Standartabweichung, Kurtosis und alles sowas hier auch machem müssen 
aber dazu hat er halt nichts mehr gesagt.


## Modalwert
Wert der am häufigsten vorkommt.
- Wenn alle Werte verschieden sind, dann ist der Modalwert nicht definiert. 
- Wenn der Modalwert eindeutig ist, sprechen wir von einer unimodalen Statistik, 
- Wenn zwei verschiedene Werte Modalwert sind, sprechen wir von einer bimodalen Statistik, 
- Wenn mehr als zwei verschiedene Werte Modalwert sind, sprechen wir von einer multimodalen Statistik.

In R ablesbar mithilfe von `table(X)`

## Streuungsmasse
### Zentrales empirisches Moment r-ter Ordnung
Formel:
$M_{r}=\sum_{n=1}^{N}(x_{n}-\overline{x})^r$

in R:
```
sum((X - mean(X))^r)
```
 
### Varinaz
Formel:
$Var(x)=\frac{M_{2}}{N}$

in R:
```
Var <- sum((X - mean(X))^2) / length(X)
```

### Sigma/ standart deviation / Standartabweichung
$\sigma= \sqrt{Var(X)}$

in R:
```
sigma <- sd(X)
```

## Sigma intervalle

Es gibt definierte Intervalle:
- $I_{1} = ]\overline{x}- 3\sigma; \overline{x}- 2\sigma]$
- $I_{2} = ]\overline{x}- 2\sigma; \overline{x}-\sigma]$
- $I_{3} = ]\overline{x}-\sigma; \overline{x}]$
- $I_{4} = ]\overline{x}; \overline{x}+\sigma]$
- $I_{5} = ]\overline{x}+ \sigma; \overline{x}+2\sigma]$
- $I_{6} = ]\overline{x}+ 2\sigma; \overline{x}+3\sigma]$
<!-- TODO -->


## Schiefemass / Symmetriemass

### Quartilskoeffizient der Schiefe 

Formel:
$S_Q = \frac{(3.Q. - \widetilde{x})-(\widetilde{x}-1.Q)}{IQR}$
oder auch
$S_Q = \frac{(3.Q. - 2.Q.)-(2.Q.-1.Q)}{IQR}$

in R: 
``` R
q <- as.vector(quantile(X))
sq <- ((q[4] - median(X)) - (median(X) - q[2])) / IQR(X)
```

Deutung:
- $s_Q > 0$ Der Graph ist linkssteil und rechtsschief
- $s_Q = 0$ Der Graph ist nahezu symmetrisch
- $s_Q < 0$ Der Graph ist rechtssteil und linkssschief

### relative Schiefemass
Formel:
$S=\frac{NM_{3}}{(N-1)(N-2)\sigma^{3}}$

in R:
```
M3 <- sum((X - mean(X))^3)
N <- length(X)
S <- (N * M3) / ((N - 1) * (N - 2) * sd(X)^3)
```

Deutung:
- $S > 0$ Der Graph ist linkssteil und rechtsschief
- $S= 0$ Der Graph ist nahezu symmetrisch
- $S< 0$ Der Graph ist rechtssteil und linkssschief 

### Pearsons 1. Schiefekoeffizient
Formel:
$S_1\frac{3*(\overline{x} - modalwert)}{\sigma}$


in R :
```
S1 <- (mean(X)-modalwert)/sd(X)>
```

Deutung: wie immer

### Persons 2. Schiefekoeffizient
Formel:
$S_2\frac{\overline{x} - \widetilde{x}}{\sigma}$


in R :
```
S2 <- (mean(X)-median(X))/sd(X)
```

Deutung: wie immer

## Wobungsmaß Kurtosis
Formel:
$k = \frac{N(N+1)M_4 - 3(N-1)M_2^2 }{(N-1)(N-2)(N-3)\sigma^4}$

in R
```
M2 <- sum((X - mean(X))^2)
M4 <- sum((X - mean(X))^4)
N <- length(X)
  
kurtosis <- (N * (N + 1) * M4 - 3 * (N - 1) * M2^2) / ((N - 1) * (N - 2) * (N - 3) * sd(X)^4)
```

Deutung:
- $k > 0$ Der Graph ist leptokurtisch, stark gewölbt oder hochgipfelig
- $k = 0$ Der Hraph ist mesokurtisch, nahezu "normal" gewölbt
- $k < 0$ Der Graph ist platykurtisch, flachgewölbt oder flachgipfelig


wie legt man die Normalverteilung mit der empirischen Dichtefunktion übereinander?
-> 
``` 
plot(density(X))
my <- mean(X)
N <- length(X)
s <- sd(X) * sqrt((N-1)/N) #stdabweichung von der Grundgesamtheit#´
x <- seq(my-3*s, my+3*s, by=s/8)
y <- dnorm(x, my, s)
lines(x,y,col="purple")
```

### Perzentilkoeffizient der Kurtosis
formel:
$c = \frac{IQR}{Q_{90\%}-Q_{10\%}}$

in R:
```

c <- IQR(X)/ (quantile(X,0.9) - quantile(X,0.1))
```

## lineares Modell
siehe 30.10.großeDatenalayse.R
<!-- TODO -->
**Streuungdiagramm**
```
X <- EuStockMarkets[, 1] # unabhängige variable
Y <- EuStockMarkets[, 3] # abhängige variable
length(X) == length(Y) # Bedingung
# plot(unabhängige variable, abhängige variable)
plot(X, Y)
grid()
abline(v=mean(X))
abline(h=mean(Y))
```

**Lineares Modell erstellen**
```
# lm(abhängige variable, unabhängige variable)
lmXY <- lm(Y ~ X)
# Zeigt daten des lm an -> u.a R-Squared, Residualstandardabweichung...
sum<-as.vector(summary(lmXY))
```

**Korrelationsgerade**
```
abline(coef(lmXY), col="blue")
```

**Korrelationskoeffizient**
```
# Wurzel aus R-Squared
r <- sqrt(sum[9])
```
**Zusammenfassung**
```
X <- c(...) # unabhängige variable
Y <- c(...) # abhängige variable
length(X) == length(Y)
plot(X, Y)
grid()
abline(v=mean(X))
abline(h=mean(X))
lmXY <- lm(Y ~ X)
sum<-as.vector(summary(lmXY))
abline(coef(lmXY), col="blue")
sqrt(sum[9])
```

### Persons Korellationskoeffizient

Kovarianz

$cov(X, Y) = \frac{\sum((X - \overline{X}) (Y - \overline{Y}))}{N - 1}$
 
X und Y müssen gleich lange sein -> length von X oder Y als N

Korrelationskoeffizient 

$r = \frac{cov(X, Y)}{sd(X) sd(Y)}$

in R:
```
X <- c(...) # unabhängige Var.
Y <- c(...) # abhängige Var.
length(X) == length(Y)

# Korellationskoeffizient mit R-Funktion
cor(X, Y)

summary(lm(Y~X))

cov <- sum((X- mean(X)) * (Y - mean(Y))) / (length(X) - 1)

sdX <- sd(X)
sdY <- sd(Y)
myr <- cov / (sdX * sdY)
myr
```

Für r gilt immer $-1 \le r \le 1$:

1. Im Falle $|r| > 0,5$ sagen wir, dass eine relativ starke Korrelation besteht
2. Im Falle $|r| > 0,8$ sagen wir, dass eine starke Korrelation besteht
3. Im Falle $0,3 < |r| \le 0,5$ sagen wir, dass eine relativ schwache Korrelation besteht
4. Im Falle $0 < |r| \le 0, 3$ sagen wir, dass eine schwache Korrelation besteht
5. Im Falle $|r| \simeq 0$ sagen wir, dass keine Korrelation besteht
6. Wenn das Vorzeichen positiv ist, dann sagen wir: Es besteht ein direktes
Verhältnis zwischen den Zufallsvariablen (die Werte sind proportional).
Wenn das Vorzeichen negativ ist, dann sagen, dass wir: Es besteht ein indirektes Verhältnis zwischen den Zufallsvariablen (die Werte sind umgekehrt proportional)

### Lineare Regression
Ziel der einfachen linearen Regression ist es, den Wert einer abhängigen Variable aufgrund einer unabhängigen Variable vorherzusagen.a
**Lineares Modell erstellen**
```
X <- c(...) unabhängige Var.
Y <- c(...) abhängige Var.
linreg <- lm(Y~X)
abline
```
**Residuen**
Differenz zwischen den tatsächlichen beobachteten Werten und den vorhergesagten Werten einer statistischen Analyse. Differenz zwischen Punkt und Regressionsgerade. 
```
residuals(linreg)
```
- y* = b1x + b2 ist die regressionsgerade x ist die unabhängige
- y* werden häufig als schätzwerte bezeichnet
- die differenz y - y* ist ein residuum (rest)

explorative datenanalyse auf basis der regression
```
summary(linreg)
```

**Prognose erstellen**
```
b<-as.vector(coef(linreg))
Infnov <- b[1] + b[2] * x_i
```

**Residualer Standartfehler**
```
N <- length(Y)
resdf <- sqrt((N - 1)/(N - 2)) * sd(residuals(linreg))
```

**R-Squared berechen**
```
R2 <- 1 - sum(residuals(linreg)^2) / sum((Y - mean(Y))^2)
# Perasons Korrelationskoeffizient
```

## induktive Statistik 
hier hab ich nicht aufgepasst 
keine Ahnung
<!-- TODO -->
### Konfidenzintervall
```
konfint <- function(p, xbar, s, n){
    p <- 0.5 + p/2
    q <- qnorm(p, xbar, s)
    og <- xbar + q*s /sqrt(n)   # obere Grenze
    ug <- xbar - q*s /sqrt(n)   # obere Grenze
    print("Die Grenzen vom Konfidenzintervall sind:")
    kon<- c(ug,og)
    print(kon)
}
```

- 

### Normalverteilung
siehe kurtosis, mehr haben wir nicht dazu