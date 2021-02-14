2:11

2:11*5

ice_cream_prices <- c(1.25, 3, 5.99, 1.75, 6.75, 4.99, 7.09, 3.55, 2)
discounts <- c(0.25, 1, 0.50, 0.5, 1, 0, 1, 0.25, 0)

my_vect # undefined variable

# Recall that the pound sign is used for comments

sale_prices <- ice_cream_prices - discounts # This line creates the list and stores it.
sale_prices # This line is what causes R to output the list.



length(sale_prices)

max(sale_prices)

min(sale_prices)

mean(sale_prices) # average price

round(mean(sale_prices),2) # two decimal places



?faithful # question mark for documentation

faithful # display the whole data frame and scoll to the bottom

dim(faithful)

faithful[272,1] # row, column



faithful[13,1] # 13th row first column

# We see that the duration is 4.2 minutes. We need to convert 0.2 minutes into seconds
0.2*60

berkeley <- read.csv('~/shared/data/berkeley73.csv')

berkeley <- read.csv('~/shared/data/berkeley73.csv')
berkeley

# Strategy 1
berkeley

# Strategy 2
head(berkeley,2)

# percent admitted = total admiteed/ total applied * 100
berkeley$Per_Men_Admitted <- berkeley$Men_Admitted/berkeley$Men_Applicants*100
berkeley$Per_Women_Admitted <- berkeley$Women_Admitted/berkeley$Women_Applicants*100
berkeley

mean(3:10)

numbers <- c(5.8, 3.52, 7.81, 0.4, 4.79, 3.04, 4.89, 5.23, 2.37, 4.32) # generated using a random number generator
mean(numbers)

max(numbers)

library(help = "datasets")

?airquality # gives the documentation for this BUILT-IN dataset

head(airquality,3)

str(airquality) # structure function

mean(airquality$temp) # Note that R is sensitice to campialization

mean(airquality$Temp)

max(airquality$Temp)

f <- 97
(f-32)*5/9

airquality$Celcius <- (airquality$Temp - 32)*5/9
head(airquality)


