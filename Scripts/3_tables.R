library(gtsummary)
library(broom)
library(tidyverse)
library(officer)

# crosstable
ct 
# tbl_summary

table1
# tbl_regression


# broom 


# saving tables
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