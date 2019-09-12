## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)
library(imgw)
library(tidyr)
library(dplyr)
options(scipen=999)

## ----abberv,echo=FALSE---------------------------------------------------
abbev = meteo_abbrev
head(abbev)

## ----station,echo=FALSE--------------------------------------------------
station = meteo_stations
head(station)

## ----data, echo = FALSE--------------------------------------------------
h = hydro_monthly(year = 2001:2010, coords = TRUE)
head(h)

## ----filtering, eval=TRUE, include=TRUE----------------------------------
h2 = h %>%
  filter(idex == 3) %>%
  select(id, station, X, Y, hyy, Q) %>%
  group_by(hyy, id, station, X, Y) %>%
  summarise(srednie_roczne_Q = round(mean(Q, na.rm = TRUE),1)) %>% 
  spread(hyy, srednie_roczne_Q)

## ----filtering2, echo=FALSE----------------------------------------------
library(knitr)
kable(head(h2), caption = "Examplary data frame of hydrological preprocesssing.")

## ---- eval=FALSE, include=TRUE-------------------------------------------
#  library(sf)
#  library(tmap)
#  library(rnaturalearth)
#  library(rnaturalearthdata)
#  world = ne_countries(scale = "medium", returnclass = "sf")
#  
#  h3 = h2 %>%
#    filter(!is.na(X)) %>%
#    st_as_sf(coords = c("X", "Y"))
#  
#  tm_shape(h3) +
#    tm_symbols(size = as.character(c(2001:2010)),
#               title.size = "Średni przepływ maksymalny") +
#    tm_facets(free.scales = FALSE, ncol = 4) +
#    tm_shape(world) +
#    tm_borders(col = "black", lwd = 2) +
#    tm_layout(legend.position = c(-1.25, 0.05),
#              outer.margins = c(0, 0.05, 0, -0.25),
#              panel.labels = as.character(c(2001:2010)))

