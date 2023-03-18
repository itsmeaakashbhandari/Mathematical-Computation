#Group Manipulation

#1. Apply function----

#1.1 apply



#build the matrix
theMatrix <- matrix(1:9, nrow=3)
theMatrix

#sum the rows

apply(theMatrix,1,sum)

#sum the columns
apply(theMatrix,2,sum)


#using rowSums

rowSums(theMatrix)

#using colSums

colSums(theMatrix)


#how to handle missing data(na)

theMatrix[2,1] <- NA
apply(theMatrix,1,sum)

apply(theMatrix,1,sum,na.rm=TRUE)


#using rowSums and colSums

rowSums(theMatrix,na.rm=TRUE)

colSums(theMatrix,na.rm=TRUE)


#1.2 lapply and sapply

#lapply works by applying a function 
#to each element of a list and returning the 
#results as a list.

thelist <- list(A=matrix(1:9,3),B=1:5,C=matrix(1:4,2),D=2)
lapply(thelist,sum)
#its of list class

sapply(thelist,sum)
#its of numeric class


#lapply & sappy can also take vector as input
theNames <- c("Jared","Deb","Paul")
lapply(theNames, nchar)


#1.3 mapply


#which applies a
#function to each element of multiple lists


firstList <- list(A=matrix(1:16, 4), B=matrix(1:16, 2), C=1:5)
secondList <- list(A=matrix(1:16, 4), B=matrix(1:16, 8), C=15:1)
#test element-by-element if they are identical
mapply(identical, firstList, secondList)

#1.4 Other apply function

#tapply, rapply, eapply, vapply


#2 Aggregate----


data(diamonds,package='ggplot2')
head(diamonds)

#if we wan to calculate average price for each type
# of cut: fair,good,verygood, premium and ideall
#the first argument to aggregate is the formula
#specifying that price should be broken up 
#(or group by in SQL terms) by cut.
#second argument is the data to use,
#third argument is the function to apply each subset
#of the data

#calculate averae price for each type of cut

aggregate(price~cut, diamonds, mean)

aggregate(price~cut, diamonds, mean, na.rm=TRUE)

#to group the data more than one variable 
#add the additional variable to the right side
# of  the formula separating it with 
# a plus sign

aggregate(price~cut+color, diamonds, mean)

#to aggregate two variable, they must be
#combined using cbind on the left side of
#the formula

aggregate(cbind(price,carat)~cut + color,diamonds, mean)


#3. plyr ----

#It epitomizes the “split-apply-combine” method of data manipulation
#The core of plyr consists of
#functions such as ddply, llply and ldply
#All of the manipulation functions consist of five letters, with the
#last three always being ply
#The first letter indicates the type of input and the second letter indicates the
#type of output.
#For instance, ddply takes in a data.frame and outputs a data.frame, llply takes in a
#list and outputs a list and ldply takes in a list and outputs a dataframe


#3.1 ddply

#ddply takes a dataframe, splits it accordingly
#to some variable(s), perform a desired 
#action on it and returns a dataframe


library(plyr)
head(baseball)


#Before 1954 sacrifice flies were counted as part of sacrifice hits, which includes bunts, so for players
#before 1954 sacrifice flies should be assumed to be 0. That will be the first change we make to the data.
#There are many instances of hbp (hit by pitch) that are NA, so we set those to 0 as well. We also exclude
#players with less than 50 at bats in a season.

#subsetting with [ is faster than using ifelse

baseball$sf[baseball$year <1954] <-0
#check that is worked

any(is.na(baseball$sf))


#set NA hbp's to 0
baseball$hbp[is.na(baseball$hbp)]<-0

#check that it worked
any(is.na(baseball$hbp))




#only keep players with at least 50 at bats in a season
baseball <- baseball[baseball$ab >=50,]
#calculate OBP

baseball <- with(baseball,(h+bb+hbp)/(ab+bb+hbp+sf))

tail(baseball)


#Here we used a new function, with. This allows us to specify the columns of a data.frame without
#having to specify the data.frame name each time.


#To calculate the OBP for a player’s entire career we cannot just average his individual season OBPs;
#we need to calculate and sum the numerator, and then divide by the sum of the denominator. This requires
#the use of ddply.

#First we make a function to do that calculation; then we will use ddply to run that calculation for each
#player


obp <- function(data)
{
  c(OBP=with(data,sum(h+bb+hbp)/sum(ab+bb+hbp+sf)))
  
}

#use ddply to calculate career OBP for each player


careerOBP <- ddply(baseball, .variables="id", .fun=obp1)

#sort the result by OBP

careerOBP <- careerOBP[order(careerOBP$OBP, decreasing=TRUE),]

head(careerOBP,10)


#3.2 llply

theList <- list(A=matrix(1:9,3),B=1:5,C=matrix(1:4,2),D=2)


lapply(theList,sum)


llply(theList,sum)


identical(lapply(theList,sum),llply(theList,sum))


#to get the result as a vector, 
#laply can be used similarly to sapply

sapply(theList,sum)

laply(theList, sum)

#3.3 plyr helper functions

#  plyr has some useful helper function such 
#  as each, which let us supply multiple function
#  to a function like aggregate

aggregate(price~cut, diamonds, each(mean,median))

# another function is data.frame, which creates a reference
# to dataframe so that subsetting is much faster
# and more memory efficient

system.time(dlply(basement,"id",nrow))


ibaseball <- idata.frame(baseball)
system.time(dlply(ibaseball,"id",nrow))

#4. data.table

#Creating data.tables is just like creating data.frames, 
#and the two are very similar

library(data.table)
#creating a regular data.frame

theDF <- data.frame(A=1:10,
                    B=letters[1:10],
                    C=LETTERS[11:20],
                    D=rep(c("One","Two","Three"),length.out=10))

#creating a data.table
theDT <- data.table(A=1:10,
                    B=letters[1:10],
                    C=LETTERS[11:20],
                    D=rep(c("One","Two","Three"),length.out=10))

theDF
theDT

#here by default data.frame turns character data into 
#factors while data.table does not

class(theDF)
class(theDT)

class(theDF$B)
class(theDT$B)

# the data is identical- except that data.frame
#turned B into factor while data.table didnot
#and only the way it was printed looks different

diamondsDT <- data.table(diamonds)
diamondsDT



#Accessing rows can be done similarly
#to accessing rows in a dataframe
theDT[1:2,]

theDT[theDT$A >=7,]


theDT[A>=7,]

theDT[,list(A,C)]

#just one column

theDT[,list(B)]

#If we must specify the column names as characters (perhaps because they were passed as
#arguments to a function), the with argument should be set to FALSE.

theDT[,"B", with=FALSE]

theDT[, c("A", "C"), with=FALSE]


theCols <- c("A", "C")
theDT[, theCols, with=FALSE]



#4.1 KEYS

#show table
tables()
#This shows, for each data.table in memory, the name, the number of rows, the size in megabytes,
#the column names and the key

#We start by adding a key to theDT. We will use the D column to index the data.table. This is done
#using setkey, which takes the name of the data.table as its first argument and the name of the desired
#column (without quotes, as is consistent with column selection) as the second argument.


#set key
setkey(theDT,D)
#show the data.table again
theDT


#The data have been reordered according to column D, which is sorted alphabetically. We can confirm
#the key was set with key.

key(theDT)



tables()


theDT[c("One","Two")]

#more than one column can be set as the key

#set the key
setkey(diamondsDT, cut, color)

#accessing some rows
diamondsDT[J("Ideal","E"),]


diamondsDT[J("Ideal", c("E", "D")), ]






#4.2 data.table aggregation

#The primary benefit of indexing is faster aggregation. While aggregate and the various d*ply functions
#will work because data.tables are just enhanced data.frames, they will be slower than using the
#built-in aggregation functionality of data.table.

aggregate(price ~ cut, diamonds, mean)

#to get same result using data.table

diamondsDT[,mean(price),by=cut]

#with column name

diamondsDT[,list(price=mean(price)),by=cut]


#To aggregate on multiple columns, specify them as a list ().

diamondsDT[, mean(price), by=list(cut, color)]




#To aggregate multiple arguments, pass them as a list. Unlike with aggregate, a different metric can
#be measured for each column.


diamondsDT[, list(price=mean(price), carat=mean(carat)), by=cut]



diamondsDT[, list(price=mean(price), carat=mean(carat),
                   caratSum=sum(carat)), by=cut]



#Finally, both multiple metrics can be calculated and multiple grouping variables can be specified at the
#same time.

diamondsDT[, list(price=mean(price), carat=mean(carat)),
           by=list(cut, color)]






