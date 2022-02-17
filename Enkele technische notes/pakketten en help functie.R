# =============================================== #
#                                                 #
#    PAKKETTEN EN HELP                            #
#                                                 #
#    Paar technische notes over R-code            #
#    De wondere wereld van RStudio                #
#    Martijn Kobus, feb '22                       #
# =============================================== #


# Er zijn 3 manieren om pakketten te installeren:
#   - Menu: Tools >> Install packages
#   - Console: Type 'install.packages("pakketnaam")'
#   - Op aanbeveling: vaak detecteert RStudio zelf al dat je een pakket nodig hebt,
#     er verschijnt dan een balk bovenin met de aanbeveling dit te installeren.



# Helpfunctie van writexl -------------------------------------------------

# Opdracht: raadpleeg de documentatie van writexl.
# Krijg jij ook zo'n nostalgie naar de jaren 90? Waarom?

#install.packages("writexl")
library(writexl)
?write_xlsx


# Helpfunctie van Leaflet -------------------------------------------------

# Opdracht: lukt het je om o.b.v. de leaflet help al je eerste kaartje te maken en te exporteren?
# Hint: gebruik de voorbeeld-code die te vinden is onder examples..

#install.packages("leaflet")
library(leaflet)
?leaflet



