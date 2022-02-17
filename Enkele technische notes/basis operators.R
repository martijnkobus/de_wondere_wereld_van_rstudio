# =============================================== #
#                                                 #
#    BASIS OPERATORS                              #
#                                                 #
#    Paar technische notes over R-code            #
#    De wondere wereld van RStudio                #
#    Martijn Kobus, feb '22                       #
# =============================================== #


# Met '<-' ken je een waarde toe ------------------------------------------
a <- 5

# Wat denk je dat er nu gebeurt?
a+2

# Wat denk je dat er nu gebeurt?
a + "meloen"



# Gebruik dollarteken ('$') om kolom te selecteren ----------------------------------

# Standaard ('klassieke') datasets worden gebruikt om reproduceerbare voorbeelden uit te wisselen (Engels: repEX)
data()
?mtcars

View(mtcars)
head(mtcars)

# Wat denk je dat er nu gebeurt?
head(mtcars$mpg)



# Pipe operator ('%>%') leest als doe eerst.. en dan .. ---------------------

# install.package("leaflet")
# install.package("dplyr")

library(dplyr)
library(leaflet)

mijnKaartje <- leaflet() %>%
  addTiles(group = "OSM") %>%
  setView(lng = 4.8, lat = 52.4, zoom = 10) 

mijnKaartje


# Wat denk je dat er nu gebeurt?
mijnKaartje  %>% 
  addMarkers(lng = 5.172797,
             lat = 52.224984,
             popup = "<b>Hier ligt de mooiste stad van Nederland!</b>",
             labelOptions = labelOptions(noHide = T))



  