
x <- 1:10
ifelse(x <= 3, NA, x)

data(storms, package = "dplyr")
storms$cat_simple <- ifelse(storms$wind <=50, "small", 
                            ifelse(storms$wind > 100, "giant", "big"))

storm_num <- select_if(storms, is.numeric)

apply(storm_num, 1, median, na.rm = TRUE)
apply(storm_num, 2, median, na.rm = TRUE)

apply(storm_num, 2, function(x) sum(is.na(x)))

test_file <- read.csv("myfile.csv", 
                      na.strings = c("NA", "", "na", "Na", "."))

### lapply
# example 1
integers <- sample(1:100, 200, replace = TRUE)
thrice_int <- lapply(integers, function(s) s*c(1,2,3))

# loop across categories
storms$year_categ <- cut(storms$year, 
                         breaks = c(1974, 1985, 1995, 2005, 2015),
                         include.lowest = TRUE)
table(storms$year_categ)
brk <- hist(storms$wind, plot=FALSE)$breaks

winds <- lapply(as.list(unique(storms$year_categ)), function(x){
  year = filter(storms, year_categ == x)
  histo <- hist(year$wind, breaks = brk, plot = FALSE)
  hist_counts <- histo$counts
  names(hist_counts) <- histo$mids
  hist_counts$year_categ = x
  return(hist_counts)
})

winds_df <- bind_rows(winds)

# example 3

library(agridat); library(dplyr)

data(nass.barley); data(nass.wheat); data(nass.hay); data(nass.corn)

(nass_ds <- ls(pattern = "^nass."))

crop_acreage <- lapply(nass_ds, function(x) {
  dat = mget(x, envir = .GlobalEnv)[[1]] %>%
    mutate(state = as.character(state)) %>% 
    dplyr::filter(state == "Idaho") %>% 
    select(year, acres) 
  colnames(dat)[2] = x
  return(dat)
} )

crop_acre_id <- full_join(crop_acreage[[1]], crop_acreage[[2]], by = "year") %>% 
  full_join(crop_acreage[[3]], by = "year") %>% 
  full_join(crop_acreage[[4]], by = "year")


x <- LETTERS[1:10]
for (i in x) print(i)

f <- c(0, 1, rep(NA, 98))

for (i in 3:100){
  f[i] = f[i-1] + f[i-2]
}
f[1:20]
