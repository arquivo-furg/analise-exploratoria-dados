install.packages("remotes")
install.packages("read.dbc", repos = "https://packagemanager.posit.co/cran/2024-07-05")
remotes::install_github("rfsaldanha/microdatasus")

library(read.dbc)
library(microdatasus)

dados <- read.dbc::read.dbc("data/VARCBR19.dbc")
View(dados)
