# Losjes gebaseerd op: 

# https://www.datanovia.com/en/blog/gganimate-how-to-create-plots-with-beautiful-animation-in-r/

library(gifski)
library(ggplot2)
library(gganimate)
library(plotly)



# Statisch figuur ---------------------------------------------------------

library(gapminder)

p <- ggplot(
  gapminder, 
  aes(x = gdpPercap, y=lifeExp, size = pop, colour = country)
) +
  geom_point(show.legend = FALSE, alpha = 0.7) +
  scale_color_viridis_d() +
  scale_size(range = c(2, 12)) +
  scale_x_log10() +
  labs(x = "GDP per capita", y = "Life expectancy")+
  theme_bw()

p


# plotly  ---------------------------------------------------------

library(dplyr)

dat2007 <- gapminder %>%
  filter(year == 2007)


p2007 <- ggplot(
  dat2007, 
  aes(x = gdpPercap, y=lifeExp, size = pop, colour = continent, text = country)
) +
  geom_point(show.legend = FALSE, alpha = 0.7) +
  scale_color_viridis_d() +
  scale_size(range = c(2, 12)) +
  scale_x_log10() +
  labs(x = "GDP per capita", y = "Life expectancy")+
  theme_bw()

ggplotly(p2007, tooltip = "text")




# Animatie ----------------------------------------------------------------
a <- p + facet_wrap(~continent) +
  transition_time(year) +
  labs(title = "Year: {frame_time}")

anim <- animate(a)

animate(a , renderer = gifski_renderer())
