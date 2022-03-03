# input: data/data.csv
# code: make-figs.R
# output: outputs/*

# objective: let's build boxplots to further explore data
# reference: https://medium.com/@data_datum/r-for-newbies-explore-the-iris-dataset-with-r-16d1987f9edd

# clear R
# keyboard shortcut Ctrl+Shift+F10 | cmd+shift+f10 (cmd+shift+fn+f10 if touchbar)
# press and hold Fn key on keyboard
# load packages
library(here)
library(ggplot2)

# load data
iris.df <- read.csv(here("data","data.csv"))

# subset data
irisVer <- subset(iris.df, species == "versicolor")
irisSet <- subset(iris.df, species == "setosa")
irisVir <- subset(iris.df, species == "virginica")

# plot data using base R
png(here("outputs","all_bySpecies.png"))
par(mfrow=c(1,3),mar=c(6,3,2,1))
boxplot(irisVer[,1:4], 
        main="versicolor",
        ylim = c(0,8),
        las=2, col=rainbow(4))
boxplot(irisSet[,1:4], 
        main="setosa",
        ylim = c(0,8),las=2,
        col=rainbow(4))
boxplot(irisVir[,1:4], 
        main="virginica",
        ylim = c(0,8),
        las=2, 
        col=topo.colors(4))
dev.off()

# let's make a pretty density plot of sepal width
# reference: https://www.publichealth.columbia.edu/sites/default/files/media/fdawg_ggplot2.html
density <- ggplot(data=iris.df, 
                  aes(x=sepal_width, fill=species))
density + geom_density(stat="density", 
                       alpha=I(0.2)) +
  xlab("Sepal Width") +  
  ylab("Density") + 
  ggtitle("Density Curve of Sepal Width by Species")

# save the pretty plot
ggsave(here("outputs","sepal-widith_bySpecies.png"))
