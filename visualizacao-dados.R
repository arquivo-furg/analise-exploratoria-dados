library(MASS)
View(Cars93)

hist(Cars93$Price)

hist(Cars93$Price,
  xlab = "Preço (x $1.000)",
  xlim = c(0, 70),
  main = "Preço de 93 modelos de carros em 1993",
  ylab = "Frequência"
)

hist(Cars93$Price,
  xlab = "Preço (x $1.000)",
  xlim = c(0, 70),
  main = "Preço de 93 modelos de carros em 1993",
  ylab = "Densidade",
  probability = TRUE,
  ylim = c(0, 0.07)
)

lines(density(Cars93$Price))

tipo <- table(Cars93$Type)

barplot(tipo)

barplot(tipo,
  xlab = "Tipo",
  ylab = "Frequência",
  ylim = c(0, 25),
  axis.lty = "solid",
  density = c(5, 10, 20, 30, 7, 50),
  angle = c(0, 45, 90, 11, 36, 30),
  col = "brown"
)

pie(tipo)

library(RColorBrewer)
minhapaleta <- brewer.pal(6, "Accent")
pie(tipo, col = minhapaleta)

plot(Cars93$Horsepower,
  Cars93$MPG.city,
  xlab = "Cavalos de potência",
  ylab = "MPG (km/L)",
  main = "Potência x MPG cidade",
  pch = as.character(Cars93$DriveTrain)
)

boxplot(Cars93$Horsepower ~ Cars93$Cylinders,
  xlab = "Cilindros",
  ylab = "Potência",
  col = minhapaleta
)

boxplot(Cars93$Price)

summary(Cars93$Price)
