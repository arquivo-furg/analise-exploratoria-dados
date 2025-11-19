# install.packages("remotes")
# install.packages("read.dbc", repos = "https://packagemanager.posit.co/cran/2024-07-05")
library(read.dbc)
library(dplyr)
# remotes::install_github("rfsaldanha/microdatasus")
library(microdatasus)

# Baixando os dados
df_dengue_2020 <- fetch_datasus(year_start = 2020, year_end = 2020, information_system = "SINAN-DENGUE")

# Processando os dados
df_dengue_2020 <- process_sinan_dengue(df_dengue_2020)

# Salvando os dados baixados
data.table::fwrite(df_dengue_2020, "data/df_dengue.csv", row.names = FALSE)

library(readr)
df_dengue_2020 <- read_csv("data/df_dengue.csv")

# Baixando dados do SIM - Baixar e processar dados do Sistema de Informação sobre Mortalidade (SIM)
dados_SIM_SP <- fetch_datasus(year_start = 2020, year_end = 2024, uf = "SP", information_system = "SIM-DO")
dados_SIM_SP <- process_sim(dados_SIM_SP)
str(dados_SIM_SP)
dados_selecionados <- dados_SIM_SP %>% select(IDADE, SEXO, CAUSABAS_O, RACACOR, DTOBITO, CODMUNRES)

sinan_dengue_SP <- df_dengue_2020 %>% filter(SG_UF_NOT == "São Paulo")

sinan_dengue_SP_2020 <- sinan_dengue_SP %>% select(DT_OBITO, ID_MUNICIP, IDADEanos, CS_SEXO, CS_RACA, CS_ESCOL_N, CS_GESTANT, EVOLUCAO, SG_UF_NOT)

rm(df_dengue_2020, sinan_dengue_SP)
gc()

data.table::fwrite(sinan_dengue_SP_2020, "data/sinan_dengue_SP_2020.csv", row.names = FALSE)
sinan_dengue_SP_2020 <- read_csv("data/sinan_dengue_SP_2020.csv")

summary(sinan_dengue_SP_2020)
boxplot(sinan_dengue_SP_2020$IDADEanos)
summary(sinan_dengue_SP_2020$IDADEanos)
table(sinan_dengue_SP_2020$IDADEanos)

table(sinan_dengue_SP_2020$CS_SEXO)

max(table(sinan_dengue_SP_2020$ID_MUNICIP))
