faithful$eruptions[13]

0.2 * 60

floor(faithful$eruptions[17])

faithful$minutes <- floor(faithful$eruption)
head(faithful, 3)

faithful$seconds <- (faithful$eruption - faithful$minutes)*60
head(faithful, 3)

rm(faithful)

head(faithful,3)

library('dplyr')

faithful <- mutate(faithful, minutes = floor(eruptions))
head(faithful,3)

faithful <- mutate(faithful, seconds = (eruptions - minutes)*60)
head(faithful,3)

arrange(faithful, desc(eruptions))[1,]

arrange(faithful, minutes, seconds)[1,]

# manually create the data frame
my_data <- data.frame('Runner' = c('Alice', 'Bob', 'Carol'),
                      'Minutes' = c(5,4,4),
                      'Seconds' = c(6,10,30)
                     )
my_data

# add the Total column to the data frame
my_data$Total <- my_data$Minutes + my_data$Seconds/60
my_data

library('dplyr')

my_data <- mutate(my_data, Total = Minutes + Seconds/60)
my_data

# only output sorted data; don't save it
arrange(my_data, Total)

# dataframe is unchaged
my_data

# sort multiple columns
arrange(my_data, desc(Minutes), desc(Seconds))


