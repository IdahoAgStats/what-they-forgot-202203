# input: raw data
# code smell-test.R
# output: wisdom

# reference: https://medium.com/@data_datum/r-for-newbies-explore-the-iris-dataset-with-r-16d1987f9edd

# load data
data(iris)

# look at first 4 lines of rows
head(iris,4)

# check out the dimensions
dim(iris)

# what are the column names?
names(iris)

# attributes
attributes(iris)

# get some summary stats
summary(iris)

# exploratory plot
plot(iris)
