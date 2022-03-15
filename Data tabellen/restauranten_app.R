
# Laad pakketten ----------------------------------------------------------
library(readr)
library(dplyr)
library(DT)
library(leaflet)
library(shiny)


ui <- fluidPage(

  sidebarLayout(
    sidebarPanel(
      tags$h4("Ruwe output DT"),
      verbatimTextOutput("txt_out")
      ),
    
    mainPanel(
      column(8,
          tags$h4("Kaartje favo restaurants O&K"),
          leafletOutput("restaurantsKaartje",height = 500, width = "120%"),
          tags$br(),
          tags$h4("Brondata"),
          DT::dataTableOutput("dt_restaurants")
          )
      )
  )
)


server <- function(input, output, session) {
  import <- read.csv('https://docs.google.com/spreadsheets/d/e/2PACX-1vQWZjhKquH99PfeHq9I2dYwRvVuIeK1igjfEXuY5F50yJiSg5IenfQAwQuFy42vaji6vc8KI0Ta6jjT/pub?gid=0&single=true&output=csv')
  
  import <- import %>%
    filter(lat > 0 & lon > 0) %>%
    mutate(popupLabel = paste0("<b>", Restaurant.naam,"</b>", "<br/>","</b>", "<br/>",
           paste0("Aanbevolen door:  <u>", Naam, "</u>")))

  restaurantsDataTabel <- import[,1:5]
  names(restaurantsDataTabel) <- c("collega naam", "restaurant naam", "lat", "lon", "vlees/vis/vega")
  
  output$dt_restaurants <- DT::renderDataTable({
    datatable(restaurantsDataTabel,
              selection = "multiple",
              class = 'cell-border stripe',
              filter = 'top',
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

  dt_rows_selected <- reactive({
    input$dt_restaurants_rows_selected
  })

  
  output$restaurantsKaartje <- renderLeaflet({
    i_rows <- dt_rows_selected()
    
    restaurantsKaartje <- leaflet() %>%
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
  
    if(!is.null(i_rows)){

      restaurantsKaartje <- restaurantsKaartje %>%
        addCircleMarkers(
          lat = restaurantsDataTabel$lat[i_rows],
          lng = restaurantsDataTabel$lon[i_rows],
          popup = restaurantsDataTabel$popupLabel[i_rows],
          color = "orange",
          radius = 2,
          opacity = 1)

    }

    restaurantsKaartje
  
  })
}

shinyApp(ui, server)