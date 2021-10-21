library(gtsummary)
library(broom)
library(tidyverse)
library(officer)
library(gapminder)

# crosstable
ct <- gapminder_data %>% 
  tbl_cross(continent, year) %>% 
  as_flex_table()

# tbl_summary - by continent and only include life expectancy, pop and GDP

table1 <- gapminder_data %>% 
  select(-country, - year) %>% 
  tbl_summary(by =continent) %>% 
  as_flex_table()
# tbl_regression
lm <- lm(lifeExp ~ gdpPercap + pop + year, data = gapminder_data)
tbl_regression(lm)
# broom 
tidy(lm)

# saving tables in a word document - they need to be flextables
doc <- read_docx()
doc <- doc %>%
  # Add title
  body_add_par("Table 1. Cross table", style = "table title") %>% 
  # Add table to doc
  flextable::body_add_flextable(value = ct) 


doc %>%
  # Add title
  body_add_par("Table 2. At least one test during stay", style = "table title") %>% 
  # Add table to doc
  flextable::body_add_flextable(value = table1) %>%
  # Save to location inside computer
  print(doc, target = here::here("Tables.docx"))
