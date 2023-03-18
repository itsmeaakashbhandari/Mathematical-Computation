#Chapter 5 : Advanced Data Structures

#sometimes data require to more complex storage vectors.
#ex- data.frame, matrix and list

#1. Data.frames----
#its just like excel spreadsheet in that it has col and rows.
#each col is variable and row is observation.

#to create a dataframe- using data.frame()

x <- 10:1
y <- -4:5
q <- c("Hockey", "Football", "Baseball", "Curling", "Rugby",
         "Lacrosse", "Basketball", "Tennis", "Cricket", "Soccer")

theDF<- data.frame(x,y,q)
theDF

#assigning name during creation

theDF<- data.frame(First=x,Second=y,Sport=q)
theDF

#df are complex objects with many attributes.
# nrow()- to count no of rows.

# rcol()- to count no of colms.

# dim()- to print both no of rows and col.

nrow(theDF)

ncol(theDF)

dim(theDF)


# to print column names

names(theDF)
names(theDF[3])
names(theDF)[3]

#to check row name and assign the row name of df

rownames(theDF)

rownames(theDF) <-c("One", "Two", "Three", "Four", "Five", "Six",
 "Seven", "Eight", "Nine", "Ten")
rownames(theDF)

#set back to generic index

rownames(theDF)<-NULL

rownames(theDF)

#To print first few rows

head(theDF)

head(theDF,n=7)

#to print few last rows


tail(theDF)

#to check the class of a data. using class().

class(theDF)

#to access an individual column, there are 2 methods $ and [ ]

theDF$Sport

#Accessing 3rd row form 2nd column.
theDF[3,2]      

#Accessing 3rd row with 2-3 column

theDF[3,2:3]


##Accessing 3rd and 5th , column 2

theDF[c(3,5),2]

##Accessing 3rd and 5th , column 2 through 3

theDF[c(3,5),2:3]

#all of column 3
theDF[,3]

#all column 2 through 3

theDF[,2:3]

#all of row 2
theDF[2,]

#all of row 2 through 4
theDF[2:4,]


#accessing multiple column by name

theDF[,c("First","Sport")]


#another way to access column by name 
theDF[,"Sport"]

class(theDF[,"Sport"])


#jsut the sport column
#this return a one column data frame

theDF["Sport"]


class(theDF["Sport"])

#to ensure a single column data, frame while using single square 
#bracket,there is a third argument: drop=FALSE, this is also works 
#when specifying a single column by number.


class(theDF[["Sport"]])

#drop FALSE

theDF[,"Sport",drop=FALSE]

theDF[,3,drop=FALSE]

class(theDF[,3,drop=FALSE])


#use model.matrix to create a set of indicator (or dummy) variables.
#that is one column for each level of a factor, with 1 row rcontain 
#that level or 0 othervise

newFactor <- factor(c("Pennsylvania", "New York", "New Jersey",
                        "New York", "Tennessee", "Massachusetts",
                        "Pennsylvania", "New York"))
newFactor

model.matrix(~newFactor-1)



#2. Lists----

#they store any number of item of any type. A list can contain all
#numeric or characters or mix of two or dataframe or recursively other lists
#it created using list()

#creates a three element list
list(1,2,3)


#creates a single element list
#the only element is a vector that has three elements
list(c(1,2,3))


#creates a two element list
#the first is a three element vector
#the second element is a five element vector
(list3<- list(c(1,2,3),3:7))
list3


#two element list
#first is a data.frame
#second is 10 element vector 

list(theDF,1:10)


#three element list
#first is data.farme
#second is a vector
#third is list3 which holds 2 vector

list5<- list(theDF,1:10, list3)
list5


#like dataframe, lists can have their names

names(list5)

names(list5) <- c("data.frame","vector","list")
names(list5)



list5

#can also assign names during creation using name-value pairs


list6<-list(TheDataFrame=theDF, TheVector=1:10,TheList=list3)
names(list6)

list6


#creating a empty list using vector

(emptyList<- vector(mode="list",length=4))


#to access an individual element of list, use double square brackets,
#specifying either the element number or name.
#NOTE - this allows access to only one element at a time.

#using element number
list5[[1]]


#using element name
list5[["data.frame"]]

#nested indexing of elements

list5[[1]]$Sport


list5[[1]][,"Second"]

list5[[1]][,"Second", drop=FALSE]


#Append elements to a list using index that does not exist

#check the length
length(list5)

#add fourth element, unnamed
list5[[4]] <-2
length(list5)

#add a fifth element, name

list5[["NewElement"]]<-3:6
length(list5)

names(list5)

list5

#3. Matrices----

#similar to df, rectangular with rows and columns except that every single
#element, regardless of column, must be the same type, most 
#commonly all numerics. 
#They also act like vectors with element by element addition, 
#multiplication, substraction, division, and equiality.
#nrow,ncol,dim () also works for matrices


#create a 5x2 matrix
A<- matrix(1:10,nrow=5)

#create another 5x2 matrix

B<- matrix(21:30,nrow=5)

#create another 5x2 matrix


C<- matrix(21:40,nrow=2)



A
B
C

nrow(A)
ncol(A)
dim(A)


#Addition
A+B


#multiply
A*B


#see if both matrix equal or not
A==B

# for  atrix multiplication no of column of first matrix is equal to the 
# no of row of second element
# here, for A and B, this condition is not satisfying ,
#so, we here transpose matrix B


A %*% t(B)


#Matrix also have names

colnames(A)

rownames(A)

#updating matrix name
colnames(A)<-c("lest","right")
rownames(A)<-c("1st","2nd","3rd","4th","5th")

colnames(A)
rownames(A)

colnames(B)<-c("First","Second")
rownames(B)<-c("one","two","three","four","five")

colnames(B)
rownames(B)

colnames(C)<-LETTERS[1:10]
rownames(C)<-c("Top","Bottom")

colnames(C)
rownames(C)

#Transpose matrix

t(A)


A%*%C



#4. Array----
# multideminsional vector.
# must be of same type, individual elements are accessed in 
#similar fashion using square brackets.
#the first element is the row index, the second is column,
#remaining are for outer dimensions

theArray <- array(1:12, dim=c(2,3,2))

theArray

theArray[1,,]
theArray[1,,1]
theArray[,,1]


# The main DIFFERENCE between array and matrices are resitricted
#to two dimensions, while array can have an arbitrary number.


num_vec <- c(1:10)
sum <- sum(num_vec)
sum

library(magrittr)
num_vec %>% sum

f<-list(2,cr=3)
f[['cr']]


library(MASS)
data("Cars93")
view.data(Cars93)

ncol(Cars93)


diag(4)
matrix(1:12,3,4)

runif(5,1,10)


plot(Cars93,x=Cars93$Model,y=Cars93$Type)

hist(Cars93$Price)

ggplot(data=Cars93)+ geom_density(aes(x=Cars93$Price))+ facet_wrap(~Type)


library(ggplot2)

ggplot(Cars93, aes(x=Cars93$Price))+geom_density(~Cars93$Type)


library(ggthemes)
sp <- c("Human","Droid","Wookie","Yoda's species")

library(dplyr)
data("starwars")

ggplot(subset(starwars,starwars$species %in% sp), 
       aes(x=species,y=height))+geom_boxplot()

plot()






































