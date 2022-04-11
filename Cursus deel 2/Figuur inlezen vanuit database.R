

# Polylijnen toevoegen ----------------------------------------------------

# Ik heb in mijn persoonlijke schema een tabel 'Nassaukade' staan met projectie 4326

library(sf)
require("RPostgreSQL")
library(leaflet)

drv <- dbDriver("PostgreSQL")

con <- dbConnect(drv, dbname = Sys.getenv("dbNaam"),
                 host = Sys.getenv("ok_hoast"), 
                 port = 8080,
                 user = Sys.getenv("ok_user"), 
                 password = Sys.getenv("pw"))

nassaukade <- st_read(con, query = "select * from xxx.sb_nassaukade")


dbDisconnect(con)
on.exit(dbUnloadDriver(drv), add = TRUE)

leaflet() %>%
  addTiles() %>%
  addPolygons(data = nassaukade)



