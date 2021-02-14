# Import the dog licence data
nyc_trees <- read.csv( '~/shared/data/NYC_Tree_Census_small.csv' ) # import the data

# load the dplyr package.
# The warn.conflicts=FALSE option supressess the warning about objects are masked from other libraries.
library(dplyr, warn.conflicts=FALSE) 

# 
nyc_trees <- group_by(nyc_trees, health)
summarize(nyc_trees, Count = n()) 

library(ggplot2)

?ggplot # view documentation

?aes

ggplot(DATAFRAMENAME, aes(x = COLUMNNAME)) + geom_bar()

ggplot(nyc_trees, aes(x = health)) + geom_bar()

str(nyc_trees)

ggplot(nyc_trees, aes(x = boroname)) + geom_bar()

ggplot(nyc_trees, aes(x = boroname, fill=status)) + geom_bar(position = "dodge2")

ggplot(DATAFRAMENAME, aes(x = COLUMNNAME)) + geom_histogram(bins= NUMBEROFBINS)

ggplot(nyc_trees, aes(x = tree_dbh)) + geom_histogram(bins= 4)

ggplot(nyc_trees, aes(x = tree_dbh)) + geom_histogram(bins= 20)

ggplot(DATASET,aes(x=COLUMNNAME, y=COLUMNNAME)) + geom_point()

ggplot(nyc_trees, aes( x = longitude, y = Latitude) ) + geom_point()

ggplot(nyc_trees,aes(x=longitude, y=Latitude, color=status)) + geom_point() + scale_color_manual(values=c("darkgreen", "black", "brown"))

nyc_dogs <- read.csv('~/shared/data/NYC_Dog_Licensing.csv') 
nyc_dogs <- filter(nyc_dogs, AnimalBirthYear>1900)
nyc_dogs <- mutate(nyc_dogs, Age = 2020-AnimalBirthYear)
head(nyc_dogs)

names(nyc_dogs)

ggplot(nyc_dogs, aes(x=AnimalGender)) + geom_bar()

ggplot(nyc_dogs, aes(x=Age)) + geom_histogram(bins=10)

names(faithful)

ggplot(faithful, aes(x=eruptions, y=waiting))+ geom_point()
