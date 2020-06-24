library(readxl)
library(reshape2)
library(ggplot2)
servicios_por_hora <- read_excel("/home/israel_valencia/Escritorio/1/R/servicios por hora.xls")

head(servicios_por_hora)

# devtools::install_github("tidyverse/tidyr")
library(tidyverse)
library(here)


servicios_timeresponse = servicios_por_hora %>%
  tidyr::pivot_longer(
    cols = !starts_with("Date"),
    names_to = "Servicio",
    values_to = "Tiempo de Respuesta")

print(servicios_timeresponse)

servicios_timeresponse$`Tiempo de Respuesta` = servicios_timeresponse$`Tiempo de Respuesta`/1000000

p <- ggplot(servicios_timeresponse, aes(Date, `Tiempo de Respuesta`)) +
  geom_line(aes(color=Servicio), size=1) +
  facet_wrap(~Servicio, ncol=1, scales='free')+ theme(legend.position="bottom")
print(p)