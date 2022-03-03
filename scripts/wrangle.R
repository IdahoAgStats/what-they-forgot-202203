# input: raw data
# code: wrangle.R
# output: data/data.csv

# reference: https://www.r-bloggers.com/2017/08/simple-practice-data-wrangling-the-iris-dataset/

# load packages
library(tidyverse)
library(stringr)

# load data
data(iris)

# convert to tibble
# reference: https://tibble.tidyverse.org/
df.iris <- as_tibble(iris)

# rename variables
# reference: https://en.wikipedia.org/wiki/Snake_case
# pipe: Ctrl + shift + M on Windows; Cmd + Shift + M on Mac
colnames(df.iris) <- df.iris %>% 
  colnames() %>%
  str_to_lower() %>%
  str_replace_all("\\.","_")

# inspect data
df.iris %>% head
head(df.iris)

# export as csv
# practice using here
library(here)
# reference: http://jenrichmond.rbind.io/post/how-to-use-the-here-package/
write.csv(write.csv(df.iris,
                    here("data","data.csv"), 
                    row.names = FALSE))
