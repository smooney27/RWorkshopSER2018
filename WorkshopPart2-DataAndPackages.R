
# Slide 2
data(infert)

# Slide 5
dig <- read.csv("http://www.columbia.edu/~sjm2186/EPIC_R/dig.csv")


# Slide 11
head(infert)
tail(infert)
str(infert)
rownames(infert)
colnames(infert)
dimnames(infert)
dim(infert)


# Slide 12
nrow(infert)
ncol(infert)
length(infert) 
dim(infert)



# Slide 13: Challenge
# URL for a CSV file with data about survival (or not) of 
# passengers on the Titanic: 
# http://www.columbia.edu/~sjm2186/EPIC_R/titanic.csv
# Challenge: read the CSV into R and figure out how many rows of data it has.



# Slide 14
table(infert$case)
xtabs(~case, data=infert)

table(infert$case, infert$parity)
xtabs(~case+parity, data=infert)

prop.table(table(infert$case))
prop.table(table(infert$case, infert$parity))
prop.table(table(infert$case, infert$parity), 1)
prop.table(table(infert$case, infert$parity), 2)

# Slide 15
length(table(c(1,2,2,2,2,4))) 

# Slide 16
head(infert)
infert[1,]
infert[c(1,2),]
infert[1:2,]
infert[2:1,]

infert[-1,]
infert[-(1:244),]

# Slide 17
infert["1",]

infert[1,]

# Slide 18
data(USArrests)
head(USArrests)
dim(USArrests)

USArrests[1,] # works
USArrests["Alabama",] # works
USArrests["New York",] # works
USArrests["1",] # returns an error

# Slide 21
head(infert)
infert[,1]
infert[,1:2]
infert[,'age']
infert[,c(T,T,F,F,F,F,F,F)]

infert$age
infert[,2]


# Slide 20
rows_over_40 <- infert$age > 40
rows_over_40
table(rows_over_40)
infert[rows_over_40,]
infert[infert$age > 40,]

# Slide 21
infert$rows_over_40 <- infert$age > 40
table(infert$rows_over_40)
table(infert$rows_over_40, infert$age)


# Slide 22
# Challenge: There is a dataset built into R called esoph.  
# Load it and figure out how many rows it has.



# Slide 23
class(infert[,2])
class(infert[,2:3])

# Slide 24
myvec<-c(6,3,2,4,5)
sort(myvec)
order(myvec)

# Slide 25
ages<-sort(infert$age)
ages
age_order<-order(infert$age)
age_order
infert[ages,]$age # wrong
infert[age_order,]$age # correct
infert[order(infert$age),]$age # correct
age_ordered_infert <- infert[order(infert$age),]
head(age_ordered_infert)

# Slide 26
library(plyr)
infert_by_age <- arrange(infert, age)
head(infert_by_age)


# Slide 27
attach(infert) # Not recommended
order(age)

# Slide 28
# Challenge: Load the USArrests dataset (built into R) and print 
# out the list of states, sorted by murder arrest rate 

# Slide 30
str(infert) # show the structure of an object
head(infert) # print the start of a vector/data frame
table(infert$age) # print a frequency table

fivenum(infert$age) # "five number" summary 
summary(infert$age) # generic object summary
t.test(table(infert$age, infert$case)) # run a t-test
lm(case~age, data=infert) # run a linear regression


# Slide 31
mean.ignoreNA <- function(vec) {
  return(mean(vec, na.rm=TRUE))
}

# Slide 33
max(c(1, 3, 2, 1)) # 3
help(max)


# Slide 37
births <- read.dta('http://www.columbia.edu/~sjm2186/P9489/births.dta') # Wrong if package not loaded
library(foreign)
births <- read.dta('http://www.columbia.edu/~sjm2186/P9489/births.dta')


# Slide 40
# Challenge:Load the 'epitools' package, load the oswego dataset 
# that's built into epitools, and compute the odds ratio for ill,
# conditional on consuming coffee 

# Slide 41
# Challenge: Load the titanic survivor dataset from 
# http://www.columbia.edu/~sjm2186/P9489/titanic.csv
# Use epitab to compute risk ratios (with confidence intervals) 
# for death for second and third class passengers


