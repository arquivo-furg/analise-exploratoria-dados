# exercicio 3 da prova 06/10/2025
xi <- c(0, 1, 2, 3, 4, 5, 6, 7)
fi <- c(2, 25, 15, 10, 3, 2, 1, 2)

# media
xifi <- xi * fi
n <- sum(fi) # sum é o somatorio
soma <- sum(xifi)
media <- soma / n
media

# moda
posicao_maior <- which.max(fi) # retorna a posicao de maior valor
posicao_maior
moda <- xi[posicao_maior] # retorna o valor da posicao_maior no vetor x
moda

# mediana
fac <- cumsum(fi)
fac
pos <- n / 2
pos

posicao <- which(fac >= pos)[1]
posicao
mediana <- xi[posicao]
mediana

# criando a funcao resumode dados
resumo_de_dados <- function(x = x, f = f) {
  xifi <- x * f
  n <- sum(f) # sum é o somatorio
  soma <- sum(xifi)
  media <- round(soma / n, 2)
  posicao_maior <- which.max(f) # retorna a posicao de maior valor
  moda <- x[posicao_maior] # retorna o valor da posicao_maior no vetor x
  fac <- cumsum(f)
  pos <- n / 2
  posicao <- which(fac >= pos)[1]
  mediana <- x[posicao]
  resultado <- c(media, moda, mediana)
  names(resultado) <- c("Média", "Moda", "Mediana")
  resultado
}
resumo_de_dados(xi, fi)


# exercicio 4

lim_inf <- c(0, 4, 8, 12, 16)
lim_sup <- c(4, 8, 12, 16, 20)
fi <- c(8, 15, 24, 20, 13)
# xi=pm<-(lim_inf+lim_sup)/2
xi <- (lim_inf + lim_sup) / 2

xifi <- xi * fi
n <- sum(fi)
media <- sum(xifi) / n
media

# moda
posicao_maior <- which.max(fi)
# delta1 = freq da moda - freq anterior
delta1 <- fi[posicao_maior] - fi[posicao_maior - 1]
# delta2 = freq da moda - freq posteior
delta2 <- fi[posicao_maior] - fi[posicao_maior + 1]
# calcular a moda
li_mo <- lim_inf[posicao_maior]
h <- lim_sup[posicao_maior] - lim_inf[posicao_maior]
moda <- round(li_mo + (delta1 / (delta1 + delta2)) * h, 2)
moda

# mediana
# classe da mediana
fac <- cumsum(fi)
pos <- n / 2
posicao <- which(fac >= pos)[1]
# calcular a mediana
li_me <- lim_inf[posicao]
h <- lim_sup[posicao] - lim_inf[posicao]
soma_ant <- fac[posicao - 1]

mediana <- li_me + ((pos - soma_ant) / fi[posicao]) * h

tabela <- cbind(lim_inf, lim_sup, fi, xi, fac)
tabela
