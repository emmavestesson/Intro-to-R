library(tidyverse)
library(gapminder)
library(patchwork)
library(ggthemes)


# dataframes

gapminder_data <- gapminder

# explore the data

# select one variable (eg country)



# apply function to one variable



# First ggplot (Create a scatter plot of life expectancy and GDP per capita )

# test different geoms eg  geom_bar

# Exercise 1
# play around with themes_()
# click on ggplot or ggthemes packages and scroll down to T for the theme_ functions

### filter
# filter data based on year


# filter data based on country

# plot life expectancy over time for the country selected


# plot lifeEXP vs income for the first year

#### mutate
# add a variable with the row number and call it id


# add a variable that combines the continent and country - call it label # tip: use paste() 


# add a variable that is 1 if continent is asia and 0 otherwise. call it flag

#### select

# select the variables country and continent

# drop the pop variable



#### summarise
# summarise the total mean population

# summarise population by year


# plot the summarised pop data



# change the colour of the points

# summarise population by year and continent


# change the colour of the points based on the data



#### facet_wrap -creates multiple plots


# make the ugliest/most extreme plot possible
?theme # options to change eg background colour, thickness of lines etc
colours # gives you a list of available colours

# theme to get you started
theme(
  plot.background = element_rect(fill = 'white'),
  panel.background = element_rect(fill = 'white'),
  panel.grid.major = element_line(colour = NULL),
  axis.line = element_line(size = 1, colour = NULL, linetype =1),
  axis.title.y = element_text(size = rel(1.5), angle = 90),
  axis.text = element_text(colour = "black"),
  axis.text.x = element_text(colour = "black", size = 11),
  axis.ticks = element_line(size = 1)
)


# save your plots (play around with options such as dpi and width - keep an eye on the file size)
?ggsave
# combine plots using patchwork




