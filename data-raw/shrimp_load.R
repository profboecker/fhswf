# shrimp_load.R

library(tidyverse)

library(readr)
shrimp_raw <- read_delim("data-raw/shrimp.csv", 
                     delim = ";", escape_double = FALSE, trim_ws = TRUE)

# Add any tidying steps to this script if necessary
shrimp <- shrimp_raw[-c(1:2),]
colnames(shrimp) <- c("Year", "Month", shrimp_raw[1,3:10])
shrimp <- readr::type_convert(shrimp)

# shrimp_load.R

usethis::use_data(shrimp, overwrite = TRUE)                              
