nyc_dogs <- read.csv('~/shared/data/NYC_Dog_Licensing.csv')  # add the final name and path in quotes
library('dplyr') # load the dplyr package

nyc_dogs <- mutate(nyc_dogs, Age = 2021 - AnimalBirthYear) # age is approximately current_year - birth_year
head(nyc_dogs) # view the results

nyc_dogs <- arrange(nyc_dogs, AnimalName)
head(nyc_dogs)

# i) Sort Animal Name from A to Z
head(arrange(nyc_dogs, AnimalName))

# ii) Sort Animal Name from Z to A
head(arrange(nyc_dogs, desc(AnimalName)))

# iii) Sort Animal Name from A to Z, then short by Animal Birth Year in decending order
# Strategy 1
# display without storing the information
arrange(nyc_dogs, AnimalName, desc(AnimalBirthYear))

# iii) Sort Animal Name from A to Z, then short by Animal Birth Year in decending order
# Strategy 2
# store in variable and then display
nyc_dogs <- arrange(nyc_dogs, desc(AnimalBirthYear))
head(arrange(nyc_dogs, AnimalName))

# Strategy 1
old_chihuahuas <- filter(nyc_dogs, Age >=10 & BreedName == 'Chihuahua')

# Strategy 2
old_chihuahuas <- filter(nyc_dogs, BreedName == 'Chihuahua')
old_chihuahuas <- filter(old_chihuahuas, Age >=10)
head(old_chihuahuas,2)

# ii) How many chihuahuas are there in the data set that are at least 10 years old?
# Strategy 1
str(old_chihuahuas)

# Strategy 2 
dim(old_chihuahuas)[1] # [1] after dim() pulls out the first entry in the result, the number of rows.

# Strategy 3
length(old_chihuahuas$Age)

# Strategy 4
nrow(old_chihuahuas) # nrow give the number of rows in the dataframe

### Dogs per zipcode
nyc_dogs <- ungroup(nyc_dogs) # Execute this command to remove any grouping that was applied in previous exercises.
nyc_dogs <- group_by(nyc_dogs, ZipCode)
head(summarize(nyc_dogs, Count=n())) # n() says count

nyc_dogs <- ungroup(nyc_dogs) # Execute this command to remove any grouping that was applied in previous exercises.

nyc_dogs <- group_by(nyc_dogs, AnimalGender)
summarize(nyc_dogs, AvgAge = mean(Age))

nyc_dogs <- ungroup(nyc_dogs) # Execute this command to remove any grouping that was applied in previous exercises.
nyc_dogs <- group_by(nyc_dogs, AnimalName, AnimalGender)
name_counts <- summarize(nyc_dogs, Count = n())
name_counts <- arrange(name_counts, desc(Count))
head(name_counts)

berkeley <- read.csv('~/shared/data/berkeley73.csv')
arrange(berkeley, desc(Women_Admitted))
rm(berkeley) # remove the variable so that it does just sit in memory.

NYCaugust <- read.csv('~/shared/data/NYC_Weather_August_2020.csv')
NYCaugust <- arrange(NYCaugust, desc(Temp_Max),Humidity_.Max)
head(NYCaugust)
rm(NYCaugust)  # remove the variable so that it does just sit in memory.

library('dplyr')
NYCaugust <- read.csv('~/shared/data/NYC_Weather_August_2020.csv')
NYCaugust <- group_by(NYCaugust, Wind_Min)
head(summarize(NYCaugust, Avg_Wind_Max = mean(Wind_Max)))
#rm(NYCaugust)  # remove the variable so that it does just sit in memory.

head(arrange(nyc_dogs, desc(Age))) # Look at the data so that we know what to expect

nyc_dogs <- ungroup(nyc_dogs) # Execute this command to remove any grouping that was applied in previous exercises.

# Strategy 1: summarize and sort
nyc_dogs <- group_by(nyc_dogs, BreedName)
breed_age <- summarize(nyc_dogs, Max_Age = max(Age))
breed_age <- arrange(breed_age, desc(Max_Age))
head(breed_age)

# Strategy 2: Find max age then filster, summarize and sort
max_age <- max(nyc_dogs$Age)
max_age

old_dogs <- filter(nyc_dogs, Age == max_age)
old_dogs <- group_by(old_dogs, BreedName)
old_breeds <- summarize(old_dogs, Count = n())
old_breeds <- arrange(old_breeds, desc(Count))
old_breeds

nyc_dogs <- ungroup(nyc_dogs) # Execute this command to remove any grouping that was applied in previous exercises.

# Strategy 3 Highest percentage of old dogs, in knowns breeds with at least 100 representatives
nyc_dogs <- mutate(nyc_dogs, is_old = Age >=10)
nyc_dogs <- group_by(nyc_dogs, BreedName)
breed_counts <- summarize(nyc_dogs, Num_Old = sum(is_old), Total = n())
breed_counts <- mutate(breed_counts, Perc_Old = Num_Old / Total * 100)
breed_counts <- arrange(breed_counts,desc(Total), desc(Perc_Old))
head(breed_counts,12)
