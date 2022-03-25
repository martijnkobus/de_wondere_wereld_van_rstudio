# =============================================== #
#                                                 #
#    LEAFLET achtergrondkaarten                   #
#                                                 #
#    Paar technische notes over R-code            #
#    De wondere wereld van RStudio                #
#    Martijn Kobus, feb '22                       #
# =============================================== #

# Opdracht: maak een Leaflet met de lelijkste achtergrondkaart die je mar kunt vinden

# Zie ook: https://leaflet-extras.github.io/leaflet-providers/preview/


#install.packages("leaflet")

library(leaflet)

names(providers)

leaflet() %>%
  addProviderTiles("vul_hier_de_naam_van_een_pakket_in") %>%
  setView(lng = 4.8, lat = 52.4, zoom = 10) 
