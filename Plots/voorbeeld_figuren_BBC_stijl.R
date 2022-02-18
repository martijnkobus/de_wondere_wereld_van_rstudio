# =============================================== #
#                                                 #
#    Plots in BBC stijl                           #
#                                                 #
#    Plots                                        #
#    De wondere wereld van RStudio                #
#    Martijn Kobus, feb '22                       #
# =============================================== #

# Zie https://bbc.github.io/rcookbook/#make_a_grouped_bar_chart 


library(devtools)

#devtools::install_github('bbc/bbplot')

library(dplyr)
library(tidyr)
library(gapminder)
library(ggplot2)
library(ggalt)
library(forcats)
library(R.utils)
library(png)
library(grid)
library(ggpubr)
library(scales)
library(bbplot)



# Asia's rapid growth -----------------------------------------------------
facet <- gapminder %>%
  filter(continent != "Americas") %>%
  group_by(continent, year) %>%
  summarise(pop = sum(as.numeric(pop)))

#Make plot
ggplot() +
  geom_area(data = facet, aes(x = year, y = pop, fill = continent)) +
  scale_fill_manual(values = c("#FAAB18", "#1380A1","#990000", "#588300")) + 
  facet_wrap( ~ continent, ncol = 5) + 
  scale_y_continuous(breaks = c(0, 2000000000, 4000000000),
                     labels = c(0, "2bn", "4bn")) +
  bbc_style() +
  geom_hline(yintercept = 0, size = 1, colour = "#333333") +
  theme(legend.position = "none",
        axis.text.x = element_blank()) +
  labs(title = "Asia's rapid growth",
       subtitle = "Population growth by continent, 1952-2007")



# Increase in life expectancy ---------------------------------------------
dumbbell_df <- gapminder %>%
  filter(year == 1967 | year == 2007) %>%
  select(country, year, lifeExp) %>%
  spread(year, lifeExp) %>%
  mutate(gap = `2007` - `1967`) %>%
  arrange(desc(gap)) %>%
  head(10)

#Make plot
ggplot(dumbbell_df, aes(x = `1967`, xend = `2007`, y = reorder(country, gap), group = country)) + 
  geom_dumbbell(colour = "#dddddd",
                size = 3,
                colour_x = "#FAAB18",
                colour_xend = "#1380A1") +
  bbc_style() + 
  labs(title="We're living longer",
       subtitle="Biggest life expectancy rise, 1967-2007")

