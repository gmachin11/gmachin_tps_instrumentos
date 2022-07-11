rm(list = ls())

gc()

library(tidyverse)
library(lubridate)
library(sf)

#Informacion sobre las paradas del transporte colectivo en Montevideo, Uruguay

paradas_stm <- read_sf("data/v_uptu_paradas.shp",crs = 32721, options = "ENCODING=UTF-8") #disponible en: https://catalogodatos.gub.uy/dataset/intendencia-montevideo-transporte-colectivo-paradas-y-puntos-de-control
recorridos_stm <- read_sf("data/v_uptu_lsv.shp",crs = 32721, options = "ENCODING=UTF-8") #disponible en: https://catalogodatos.gub.uy/dataset/intendencia-montevideo-transporte-colectivo-paradas-y-puntos-de-control

paradas_stm <- paradas_stm %>%
  st_transform(4326)

recorridos_stm <- recorridos_stm %>%
  st_transform(4326)

paradas_stm <- paradas_stm %>%
  #utilizamos Filter para seleccionar unicamente los datos de la linea 103
  filter(DESC_LINEA == "103") %>%
  #utilizamos select para seleccionar unicamente las columnas de nuestro interes
  select(COD_UBIC_P,
         DESC_LINEA,
         COD_VARIAN,
         ORDINAL,
         CALLE,
         ESQUINA,
         geometry) %>%
  #utilizamos mutate para crear una variable que se llame ubicacion y sea la calle / esquina
  mutate(INTERSECCION = paste(CALLE,"/",ESQUINA))

#repetimos el proceso para el data frame con los recorridos
recorridos_stm <- recorridos_stm %>%
  filter(DESC_LINEA == "103") %>%
  select(-GID,
         -COD_LINEA)

#De momento no es necesario aplicar ningun pivot_longer o pivot_wider queda pendiente para futuros TPs
