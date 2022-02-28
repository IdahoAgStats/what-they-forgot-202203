# pre-work

packages <- c("here", "renv", "reprex", "devtools")
install.packages(packages)
all(lapply(packages, library, character.only = TRUE))

# install `lookup`

devtools::install_github("jimhester/lookup")
