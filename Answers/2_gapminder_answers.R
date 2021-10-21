library(tidyverse)
library(gapminder)
library(patchwork)
library(ggthemes)


# dataframes

gapminder_data <- gapminder

# explore the data
names(gapminder_data)

head(gapminder_data)
View(gapminder_data)
# select one variable (eg country)

gapminder_data$continent


# apply function to one variable
max(gapminder_data$year)

mean(gapminder_data$pop)
median(gapminder_data$pop)

max(gapminder_data$year)
min(gapminder_data$year)
unique(gapminder_data$year)


# First ggplot (Create a scatter plot of life expectancy and GDP per capita )
names(gapminder_data)
ggplot(gapminder_data, aes(x = gdpPercap , y = lifeExp)) + geom_point()


# test different geoms eg  geom_bar
ggplot(gapminder, aes(x = continent)) + geom_bar() + theme_few()

# Exercise 1
# play around with themes_()
# click on ggplot or ggthemes packages and scroll down to T for the theme_ functions
ggplot(gapminder, aes(x = continent)) + geom_bar() + theme_fivethirtyeight()
### filter
# filter data based on year

gapminder_data %>% 
  filter(year == 2007)

gapminder_data %>% 
  filter(year == 1988)

gapminder_2007 <- gapminder_data %>% 
  filter(year == 2007)
# filter data based on country
gapminder_data %>% 
  filter(country == 'Angola')
# plot life expectancy over time for the country selected
gapminder_data %>% 
  filter(country == 'Angola') %>% 
  ggplot(data =., aes(x =year, y = lifeExp )) + geom_line()

# plot lifeEXP vs income for the first year
gapminder_data %>% 
  filter(year == min(year)) %>% 
  ggplot(data= ., aes( x= lifeExp, y = gdpPercap)) + geom_point()

gapminder_data %>% 
  filter(year == min(year) & gdpPercap>90000) 


gapminder_data %>% 
  filter( gdpPercap>90000) 
#### mutate
# add a variable with the row number and call it id
gapminder_data %>% 
  mutate(id = row_number())

# add a variable that combines the continent and country - call it label # tip: use paste() 
gapminder_data %>% 
  mutate(label = paste(country, 'is in', continent ))

# add a variable that is 1 if continent is asia and 0 otherwise. call it flag
gapminder_data %>% 
  mutate(flag = if_else(continent == 'Asia', 1,0))

#### select

# select the variables country and continent
gapminder_data %>% 
  select(country, continent)
# drop the pop variable

gapminder_data %>% 
  select(-pop)

#### summarise
# summarise the total mean population
gapminder_data %>% 
  summarise(mean_pop= mean(pop))
# summarise population by year
gapminder_data %>% 
  group_by(year) %>% 
  summarise(mean_pop= mean(pop))


# plot the summarised pop data



# change the colour of the points

# summarise population by year and continent
gapminder_year_cont <- gapminder_data %>% 
  group_by(year, continent) %>% 
  summarise(mean_pop= mean(pop)) %>% 
  ungroup()

ggplot(gapminder_year_cont, aes(x = year, y = mean_pop)) + geom_point()

# change the colour of the points based on the data

ggplot(gapminder_year_cont, aes(x = year, y = mean_pop, colour = continent)) + geom_point() + geom_line()

#### facet_wrap -creates multiple plots
gapminder_data %>% 
  group_by(year, continent, country) %>% 
  summarise(mean_pop= mean(pop)) %>% 
  ungroup() %>% 
  ggplot(., aes(x = year, y = mean_pop, group = country)) + geom_point() + geom_line() + facet_wrap(~continent)

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

plot_point <- ggplot(gapminder_year_cont, aes(x = year, y = mean_pop)) + geom_point()

plot_line <- ggplot(gapminder_year_cont, aes(x = year, y = mean_pop)) + geom_line()

plot_point + plot_line + plot_annotation(tag_levels = 'A')


