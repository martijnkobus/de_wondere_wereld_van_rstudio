# =============================================== #
#                                                 #
#    LEAFLET achtergrondkaarten                   #
#                                                 #
#    De wondere wereld van RStudio                #
#    Martijn Kobus, feb '22                       #
# =============================================== #


# Stap 1: lees de data in -------------------------------------------------

# Mogelijkheid 1: download de data als Excel en lees dat lokaal in
# Klik het bestand daartoe aan in de files pane

library(readxl)
import <- read_excel("Cursus deel 2/restauranten_data_OenK.xlsx")


# Mogelijkheid 2: haal de data rechtstreeks uit Google Sheets

library(readr)
import <- read.csv('https://docs.google.com/spreadsheets/d/e/2PACX-1vQWZjhKquH99PfeHq9I2dYwRvVuIeK1igjfEXuY5F50yJiSg5IenfQAwQuFy42vaji6vc8KI0Ta6jjT/pub?gid=0&single=true&output=csv')


# Kies achtergrondkaart en maak basiskaartje ------------------------------

# Zie ook: https://leaflet-extras.github.io/leaflet-providers/preview/


#install.packages("leaflet")

library(leaflet)

names(providers)

mijnKaartje <- leaflet() %>%
#  addTiles() %>%
  addProviderTiles("OpenStreetMap", group = "OSM") %>%
  setView(lng = 4.8, lat = 52.4, zoom = 10) 

mijnKaartje



# Verrijk kaartje met andere achtergrondkaarten ---------------------------

mijnKaartje2 <- mijnKaartje %>%
  addProviderTiles("CartoDB", group = "Carto") %>%
  addProviderTiles("Esri.WorldImagery", group = "Esri") %>%
  addProviderTiles("Stamen.TonerBackground", group = "Stamen") %>%
  addLayersControl(baseGroups = c("OSM", "Carto", "Esri", "Stamen"))

mijnKaartje2


# Voorbeeld: hoe voeg ik puntelementen toe? ---------------------------------
mijnKaartje2 %>%
  addCircleMarkers(
    lat = import$lat,
    lng = import$lon,
    radius = 2)


# Subset restauranten data ------------------------------------------------
library(dplyr)

# Voor html editing zie https://www.w3schools.com/html/html_formatting.asp
import <- import %>%
  filter(lat > 0 & lon > 0) %>%
  mutate(popupLabel = paste0("<b>", Restaurant.naam,"</b>", "<br/>","</b>", "<br/>",
                             paste0("Aanbevolen door:  <u>", Naam, "</u>")))

vegetarischeRestaurants <- import %>%
  filter(Vlees.vis.vega == "Vega")

vleesRestaurants <- import %>%
  filter(Vlees.vis.vega == "Vlees")

visRestaurants <- import %>%
  filter(Vlees.vis.vega == "Vis")


# Voeg de typen restaurant apart toe --------------------------------------


mijnKaartje3 <- mijnKaartje2 %>%
  addCircleMarkers(
    lat = vegetarischeRestaurants$lat,
    lng = vegetarischeRestaurants$lon,
    popup = vegetarischeRestaurants$popupLabel,
    group = "Vegetarisch",
    color = "green",
    radius = 2,
    opacity = 1) %>%
  addCircleMarkers(
    lat = vleesRestaurants$lat,
    lng = vleesRestaurants$lon,
    popup = vleesRestaurants$popupLabel,
    group = "Vlees",
    color = "purple",
    radius = 2,
    opacity = 1) %>%
  addCircleMarkers(
    lat = visRestaurants$lat,
    lng = visRestaurants$lon,
    popup = visRestaurants$popupLabel,
    group = "Vis",
    color = "blue",
    radius = 2,
    opacity = 1) %>%
  addLayersControl(baseGroups = c("Carto","OSM", "Esri", "Stamen"),
                   overlayGroups = c("Vegetarisch", "Vlees", "Vis"))


mijnKaartje3


# Polygonen toevoegen -----------------------------------------------------

# Ik heb de Shapefile weggeschrijven uit QGIS met projectie 4326

library(sf)

stadsdelen <- st_read("Cursus deel 2/stadsdelen.shp") %>%
  st_transform(4326)

mijnKaartje3 %>%
  addPolygons(data = stadsdelen,
                            group = "stadsdelen",
                            color = "black",
                            fill = FALSE,
                            weight = 3)


#Illustreren: figuur inlezen vanuit database
