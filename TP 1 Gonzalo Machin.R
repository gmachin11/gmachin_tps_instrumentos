rm(list = ls())

gc()

library(tidyverse)
library(lubridate)
library(sf)

#Informacion sobre las paradas del transporte colectivo en Montevideo, Uruguay

paradas_stm <- read_sf("data/v_uptu_paradas.shp",crs = 32721) #disponible en: https://catalogodatos.gub.uy/dataset/intendencia-montevideo-transporte-colectivo-paradas-y-puntos-de-control
recorridos_stm <- read_sf("data/v_uptu_lsv.shp",crs = 32721) #disponible en: https://catalogodatos.gub.uy/dataset/intendencia-montevideo-transporte-colectivo-paradas-y-puntos-de-control

head(paradas)
