
library(dplyr); library(tidyr); library(purrr)

agdata <- tidytuesdayR::tt_load('2020-09-01')

yields <- agdata[[4]]
colnames(yields) <- gsub(" \\(tonnes per hectare\\)", "", 
                         names(yields))

wheat <- yields %>% tidyr::pivot_wider(id_cols = Year,
                                       names_from = Entity,
                                       values_from = Wheat) %>% 
  purrr::discard(~all(is.na(.))) 

my_plot_function <- function(arg1, arg2) {
  # arg1 & arg2 = numeric vectors of identical lengths
  plot(arg1, arg2)
}

my_plot_function(1:10, 1:10 + rnorm(10))


#1 Using the function already written in the above, add an argument to the function for coloring the points.
#2 Alter the plot to produce lines instead. If you don’t know how to do this, search plot.default in the help menu.
#3 If you have time, adjust the plot in other ways to make it more interesting.

my_plot_function2 <- function(arg1, arg2, color = "blue", 
                              message = NULL) {
  # arg1 & arg2 = numeric vectors of identical lengths
  # color = any R color or hexadecimal color
  # message = any string to put for a plot title
  plot(arg1, arg2, type = "l", col = color, main = message)
}


my_plot_function2(arg1 = 1:100, 
                  arg2 = 1:100 + rnorm(100), 
                  color = "firebrick1",
                  message = "Hello!")

my_plot_function2(arg1 = 1:100, 
                  arg2 = 1:100 + rnorm(100))

my_plot_function2(arg1 = 1:100, 
                  arg2 = 1:100 + rnorm(100))



