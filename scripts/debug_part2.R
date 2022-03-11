
f <- function(x) x + 1
g <- function(x) f(x)^3
g("a")


trace(print, quote(if (is.numeric(x) && x >= 3) 
  cat("We have a problem: \n")), print = TRUE)

untrace(print)


log_hist <- function(var, color = "darkcyan", do_log=TRUE) {
  if(do_log == TRUE) {
    print("doing the log var")
    logvar = log(var)
    str(logvar)
    hist(logvar, col = color); abline(v = mean(logvar), lwd = 2, col = "red3")
  }
  else {hist(var, col = color); abline(v = mean(var), lwd = 2, col = "red3")}
}

log_hist()

################

# agdata <- tidytuesdayR::tt_load('2020-09-01')
# saveRDS(agdata, file = "data/agdata.rds")


library(dplyr); library(tidyr); library(purrr)
agdata <- readRDS(here::here("static", "slides", "data", "agdata.rds"))
yields <- agdata[[4]]
colnames(yields) <- gsub("\\(tonnes per hectare\\)", "", names(yields))


fertil <- agdata[[2]]
colnames(fertil) <- c("country", "code", "year", 
                      "cereal_yield", "N_appl")

my_lm_fun <- function(df, y, cty) {
  #browser()
  form <- formula(paste(y, "~ year", sep = ""))
  m1 = lm(form, data = df, 
          subset = df$country == cty)
  a1 = anova(m1)
  r2 = summary(m1)$r.squared
  return(list(coefficients = coef(m1), 
              anova = a1, rsq = r2))
}

test <- my_lm_fun(df = fertil, y = "N_appl", cty = "Canada")

#### exercise


debug(stats::lm)
test <- lm(cereal_yield ~ "N_appl", data = fertil)
undebug(stats::lm)



