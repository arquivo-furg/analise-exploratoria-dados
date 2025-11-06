# install.packages("remotes")
# install.packages("read.dbc", repos = "https://packagemanager.posit.co/cran/2024-07-05")
# remotes::install_github("rfsaldanha/microdatasus")

library(read.dbc)
# library(microdatasus)

# dados <- read.dbc::read.dbc("data/VARCBR19.dbc")
# View(dados)

LeptBr22 <- read.dbc::read.dbc("data/LEPTBR22.dbc")
LeptBr23 <- read.dbc::read.dbc("data/LEPTBR23.dbc")
LeptBr24 <- read.dbc::read.dbc("data/LEPTBR24.dbc")

Lepto_PA_22 <- subset(LeptBr22, (SG_UF == 15))
Lepto_PA_23 <- subset(LeptBr23, (SG_UF == 15))
Lepto_PA_24 <- subset(LeptBr24, (SG_UF == 15))

rm(LeptBr22, LeptBr23, LeptBr24)

Lepto_PA_22$ID_MUNICIP <- as.numeric(paste(Lepto_PA_22$ID_MUNICIP))
Lepto_PA_23$ID_MUNICIP <- as.numeric(paste(Lepto_PA_23$ID_MUNICIP))
Lepto_PA_24$ID_MUNICIP <- as.numeric(paste(Lepto_PA_24$ID_MUNICIP))

summary(Lepto_PA_22$ID_MUNICIP)
summary(Lepto_PA_23$ID_MUNICIP)
summary(Lepto_PA_24$ID_MUNICIP)

library(dplyr)

Lepto_PA_22 <- filter(Lepto_PA_22, ID_MUNICIP >= 150000 & ID_MUNICIP < 160000)
summary(Lepto_PA_22$ID_MUNICIP)

Lepto_PA_23 <- filter(Lepto_PA_23, ID_MUNICIP >= 150000 & ID_MUNICIP < 160000)
summary(Lepto_PA_23$ID_MUNICIP)

Lepto_PA_24 <- filter(Lepto_PA_24, ID_MUNICIP >= 150000 & ID_MUNICIP < 160000)
summary(Lepto_PA_24$ID_MUNICIP)

Lepto_PA_24_filtro <- select(Lepto_PA_24, DT_NOTIFIC, SG_UF, NU_ANO, ID_MUNICIP, ANO_NASC, ANT_CB_LAM, EVOLUCAO)
summary(Lepto_PA_24_filtro)

str(Lepto_PA_24_filtro)

Lepto_PA_24_filtro$Dia <- as.numeric(format(Lepto_PA_24_filtro$DT_NOTIFIC, format = "%d"))
Lepto_PA_24_filtro$Mes <- as.numeric(format(Lepto_PA_24_filtro$DT_NOTIFIC, format = "%m"))
Lepto_PA_24_filtro$Ano <- as.numeric(format(Lepto_PA_24_filtro$DT_NOTIFIC, format = "%Y"))

str(Lepto_PA_24_filtro)
