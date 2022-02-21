
# Laad pakketten ----------------------------------------------------------
library(readr)
library(dplyr)
library(DT)
library(leaflet)
library(shiny)


ui <- fluidPage(
  
  titlePanel("Restaurants aanbevolen door O&K"),
  
  fluidRow(
    column(6, 
           DT::dataTableOutput("dt_restaurants")  
    ),
    column(6,
           leafletOutput("restaurantsKaartje")       
    )
  ),
  fluidRow(
    column(12,
           verbatimTextOutput("txt_out")       
    )
  )
)


server <- function(input, output, session) {

  import <- read.csv('https://docs.google.com/spreadsheets/d/e/2PACX-1vQWZjhKquH99PfeHq9I2dYwRvVuIeK1igjfEXuY5F50yJiSg5IenfQAwQuFy42vaji6vc8KI0Ta6jjT/pub?gid=0&single=true&output=csv')
  
  import <- import %>%
    filter(lat > 0 & lon > 0) %>%
    mutate(popupLabel = paste0("<b>", Restaurant.naam,"</b>", "<br/>","</b>", "<br/>",
                               paste0("Aanbevolen door:  <u>", Naam, "</u>")))


  voorDataTabel <- import[,1:4]
  names(voorDataTabel) <- c("collega naam", "restaurant naam", "lat", "lon")
  
  output$dt_restaurants <- DT::renderDataTable({
    
    datatable(voorDataTabel,
              selection = "multiple"
    )
  })
  
  output$txt_out <- renderPrint({
    reactiveValuesToList(input)
  })
  

  vegetarischeRestaurants <- import %>%
    filter(Vlees.vis.vega == "Vega")
  
  vleesRestaurants <- import %>%
    filter(Vlees.vis.vega == "Vlees")
  
  visRestaurants <- import %>%
    filter(Vlees.vis.vega == "Vis")

    
  output$restaurantsKaartje <- renderLeaflet({
  leaflet() %>%
      addTiles(group = "OSM") %>%
      addProviderTiles("CartoDB", group = "Carto") %>%
      addProviderTiles("Esri.WorldImagery", group = "Esri") %>%
      addProviderTiles("Stamen.TonerBackground", group = "Stamen") %>%
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
  })
  
  
    
}

shinyApp(ui, server)





