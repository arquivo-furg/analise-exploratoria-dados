library(fdth) # install.packages("fdth")
library(dplyr)

dados <- c(
  151, 152, 154, 155, 158, 159, 159, 160, 161, 161,
  161, 162, 163, 163, 163, 164, 165, 165, 165, 166,
  166, 166, 166, 167, 167, 167, 167, 167, 168, 168,
  168, 168, 168, 168, 168, 168, 168, 168, 169, 169,
  169, 169, 169, 169, 169, 169, 170, 170, 170, 170,
  173, 173, 174, 174, 174, 175, 175, 175, 175, 176,
  176, 176, 176, 177, 177, 177, 177, 178, 178, 178,
  179, 179, 180, 180, 180, 180, 181, 181, 181, 182,
  182, 182, 183, 184, 185, 186, 187, 188, 190, 190
)

dados <- dados / 100
table(dados)

distribuicao <- fdt(dados)
print(distribuicao)

n <- length(dados)
AT <- max(dados) - min(dados)
k <- 1 + 3.33 * log10(n)
k <- ceiling(k)
h <- round(AT / k, 2)

start <- 1.5 # round(min(dados), 2)
end <- k * h + start

d <- fdt(dados, start = start, end = end, h = h)
print(d)
