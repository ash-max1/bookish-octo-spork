#Ash Maxwell
#aemaxwell@arizona.edu
#created: 5/24/2023
#purpose: intro ggplot2


# Libraries ---------------------------------------------------------------

library(ggplot2)
library(dplyr)
library(tidyr)
library(gapminder)
library(emoGG)


# Section Shortcut --------------------------------------------------------

# Ctrl + Shift + R


#Making a visualization
# makes a graph
ggplot(data = gapminder)

head(gapminder)
# makes points on plot
ggplot(data = gapminder, 
       mapping = aes(x = gdpPercap, y = lifeExp)) +
  geom_point()

ggplot(data = gapminder, 
       mapping = aes(x = year, y = lifeExp )) +
  geom_point()

#modify the color of points 
# continuous(GDP)
ggplot(data = gapminder, 
       mapping = aes(x = gdpPercap, y = lifeExp, color = continent)) +
  geom_point(alpha = 0.5, color = "maroon") +
  scale_x_log10() + 
  geom_smooth(method = "lm", linewidth = 3, color = "pink")


#Adding emojis (emojis : emoGG package)
  # ggplot(data = gapminder, 
  #        mapping = aes(x = gdpPercap, y = lifeExp)) +
  #   geom_emoji(emoji = "flower") +
  #   scale_x_log10() + 
  #   geom_smooth(method = "lm", linewidth = 3)
#comment every line Ctrl + Shift + C

#categorical(year)
ggplot(gapminder, 
       aes(x = year, y = lifeExp, color = continent, group = country)) + 
  geom_point() +
  geom_line(aes(color = continent))


# Visualize Americas only 
#pipe Ctrl + Shift + M (  %>% ) 
gapminder %>%
  filter(continent == "Americas") 

americas <- gapminder %>% 
  filter(continent == "Americas")

# Plot Americas   
americas %>% 
ggplot(americas, 
       aes(x = year, y = lifeExp, group = country)) + 
  geom_line() +
  facet_wrap(~country) +
  labs(x = "Year", 
       y = "Life expectancy",
       title = "Title")


