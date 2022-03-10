
# find all data sets available in your current session
data()
# find data sets particular to a package
data(package = "dplyr")

library(datapasta); library(dplyr)

# pipe: CTRL + shift + M

# put the content on the clipboard
iris %>% head() %>% df_format()
iris %>% head() %>% tribble_format()
# then paste the results (CTRL + V)

test_df <- data.frame(
  Sepal.Length = c(5.1, 4.9, 4.7, 4.6, 5, 5.4),
  Sepal.Width = c(3.5, 3, 3.2, 3.1, 3.6, 3.9),
  Petal.Length = c(1.4, 1.4, 1.3, 1.5, 1.4, 1.7),
  Petal.Width = c(0.2, 0.2, 0.2, 0.2, 0.2, 0.4),
  Species = as.factor(c("setosa","setosa",
                        "setosa","setosa","setosa","setosa")))
# copy next 2 lines
x <- 1:10
plot(x)
# then run:
reprex::reprex()

#### 

# `"'{[(Make reproducible example)]}'"`
# 9 row of data per categorical var = 9 x 3 = 27
# 3 variables

dates <- as.Date(c("2022-11-15", "2022-11-22", "2022-11-29", 
                   "2022-12-01", "2022-12-13", "2022-12-20", 
                   "2022-12-27", "2023-01-01", "2023-01-10", "2023-01-17"))

library(dplyr); library(ggplot2)
test_df <- data.frame(
  category = rep(c("BA.1", "BA.1.1", "BA.2"), each = 10),
  percent = c(0, 1, 5, 11, 40, 60, 62, 60, 55, 54, 
              0, 1, 6, 15, 45, 65, 70, 68, 60, 61,
              0, 10, 16, 25, 55, 75, 80, 78, 70, 71),
  julian_days = rep(dates, 3)
)


# test_df %>% [try to replicate the ggplot error]





