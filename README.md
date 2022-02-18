# De wondere wereld van <sub>mar</sub>R<sub>tyn</sub>

### Welkom!
Met deze repo wil ik jullie enkele van mijn favo R-pakketten laten zien.<br>
Het is natuurlijk geen uitputtende lijst, want dan zitten we hier morgen nog ;D<br>

### Pakketten installeren in R
Net als bij Python zul je pakketten moeten installeren om serieus aan de slag te kunnen. Met <i>install.packages</i>("naam_van_het_pakket") installeer je eenmalig het pakket. Met <i>library</i>(naam_van_het_pakket) laad je het in. <br>

### Het vullen van het dashboard
We vullen onze dashboards met figuren, tabellen, kaarten en andere objecten:
* <b>Leaflet</b> is een pakket om interactieve kaarten te maken, zie http://rstudio.github.io/leaflet/ 
* <b>ggplot2</b> is een pakket voor het maken van visualisaties in R, zie https://www.r-graph-gallery.com/ voor een gallery en https://github.com/tidyverse/ggplot2 voor meer gedetailleerde info<br>
* <b>DT (datatable)</b> stelt je in staat om interactieve html tabellen te maken, zie https://rstudio.github.io/DT/ <br>

Je kunt visualisaties wegschrijven als losse HTML-vriendelijke figuren of ze integreren in een dashboard. 

### Het bouwen van het dashboard
Een meer geavanceerd dashboard is makkelijker te bouwen, maar het hosten heeft iets meer voet in de aarde:
* Gebruik <b>flexdashboard</b> voor eenvoudige dashboards . Je hebt volledig controle en hosten is eenvoudig. Zie https://pkgs.rstudio.com/flexdashboard/ en https://garrettgman.github.io/rmarkdown/flexdashboard/index.html voor meer info. 
* Gebruik <b>Shiny</b> voor wat meer geavanceerde dashboards. Het bouwen van zo'n dashboard is eenvoudiger dan het in eerste instantie lijkt en het is extreem flexibel in de mogelijkheden die het biedt. Minder eenvoudig te hosten dan flexdashboard. 

### Datamanagement
Je kunt je dashboard op verschillende manieren met data vullen:
* <b>Base R</b> is de standaard manier om binnen RStudio je datamanagement te doen. Je hoeft daarvoor geen pakketten zelf te installeren. Veel nieuwe gebruikers klagen over een steile leercurve.
* <b>dplyr</b> is een elegante grammatica voor datamanipulatie in R. Als je datamangement in R wilt doen, dan is het de moeite waard om je hierin te verdiepen: https://r4ds.had.co.nz/transform.html
* <b>sqldf</b> stelt je in staat om dataframe te manipuleren met SQL: https://github.com/ggrothendieck/sqldf
* <b>reticulate</b> stelt je in staat om Python code te runnen in RStudio: zie https://github.com/rstudio/reticulate. Nuttig als je al handig met Python bent. Je kunt een nieuw Python script aanmaken onder File>>New File>>Python script. Let op: als je Python objecten naar de R-omgeving wilt trekken, dan moet je reticulate inladen in je R sessie ("library(reticulate)") en naar de objecten refereren als <i>py$tabelNaam</i>.
* Tot slot kun je met <b>read_excel</b> natuurlijk ook gewoon een door jou bewerkt Excelletje inlezen. Dit is vooral handig als je eenmalig een dashboardje wilt maken. Klik in het menu op File>>Import Dataset>>From Excel.

### Op zoek naar insipratie?
* Voor meer toffe html widgets: https://www.htmlwidgets.org/
* BBC R cookbook: https://bbc.github.io/rcookbook/
* Gemaakt door de man die mij de Shiny cursus gaf: https://buurt.eindhoven.nl/app/buurt
* https://www.twitter.com is bij uitstek een tool waarin mensen hun visualisaties en de daarbij horende code met elkaar uitwisselen. Zoek eens op #TidyTuesday, #Dataviz, #DataVisualisation, #Rstats, #ggplot2, of op een combinatie zoektermen. Door #Rstats toe te voegen krijg je overwegend visualisaties die specifiek met R gemaakt zijn.  
* Het maken van een vulkaanplot is voor ons als gemeente Amsterdam echt totaal irrelevant. Dus daar ga je niet naar kijken toch?: https://renenyffenegger.ch/notes/development/languages/R/packages/datasets/volcano/index


### Verder lezen? Alle onderstaande links zijn vrij toegankelijk:
* Visualisaties in R: 
  - https://r-graphics.org/
  - https://stulp.gmw.rug.nl/ggplotworkshop/
  - https://ggplot2-book.org/
  - https://plotly-r.com/
  - https://bookdown.org/mikemahoney218/LectureBook/introduction-to-r-and-data-visualization.html 
* Deze goed geschreven uitleg over R richt zich op journalisten: https://learn.r-journalism.com/en/
* Als je geinteresseerd bent in Shiny apps, dan kan ik aanbevelen om met dit standaard werk te beginnen: https://mastering-shiny.org/ , als als je meer van video's houdt hier: https://shiny.rstudio.com/tutorial/  
* Vergelijking tussen dplyr en Pandas, zie 
 - https://www.r-bloggers.com/2021/02/pythons-pandas-vs-rs-dplyr-which-is-the-best-data-analysis-library/
 - https://gist.github.com/conormm/fd8b1980c28dd21cfaf6975c86c74d07
* GIT integratie in RStudio: https://r-pkgs.org/git.html
 

Hierboven niet gevonden wat je zoekt? Bekijk dan ook eens deze database tegen met beschikbare resources voor het leren van R:  https://github.com/Joscelinrocha/Learning-R-Resources/wiki/a.-Learning-R
