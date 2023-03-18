#CHAPTER 4
#Basic Math----
1+1

3*7

4/3

#Variable----

#variable assignment

# assignment operators are <- and =  (first is preferred)

#example

x<-2
x

y=5
5

#also

3->z
z

#value to multiple variable

a<-b<-7
a
b

#another way to assign

assign("j",4)
j

#removing variable

j

rm(j)
j

#Data Types----
#Type of data checked with class() function
  
x<-3  
class(x)

#1.Numeric data
is.numeric(x)

i<-5L
i

is.integer(i)

is.numeric(i)

class(4L)
class(5.3)
class(4L*2.8)
class(2L)
class(4L/2L)

#2. Character Data
# R has two ways of handling character data: 
# character and factor

x<- "data"
x

y<- factor("data")
y

#length of a character datatype using nchar() function

nchar(x)
nchar("hello")
nchar(3)
nchar(452)

#this will not works for factor



#3. Dates - mostle use functions are as.Date() and as.POSIXct()
# as.Date() stores just a date and POSIXct stores date and time


#as.Date()
date1<- as.Date("2012-06-28")
date1
class(date1)

as.numeric(date1)

#as.POSIXct()

date2 <-as.POSIXct("2012-06-28 17:42")


date2
class(date2)
as.numeric(date2)



#4. Logical

# way of representing data that can be either TRUE or FALSE.
#TRUE=1, FALSE=0 (Numerically)
TRUE*4

FALSE*4

k<- TRUE
k
class(k)

#logical function()
is.logical(k)

TRUE
T
class(T)


#logical can result from comparing 2 numbers or  characters
2==3
2!=3

2<3
"data"<"stats"
"data"=="stats"


# Vectors ----
#collection of elements, all of the same type

#common way to create a vector
x <- c(1,2,3,4,5,6,7,8,9,10)
x

#1. Vector operations

x*3

x+2

x-3

x/4

sqrt(x)

#another way to create a vector (shortcut)

1:10

10:1

-2:3

5:-7

#operations

x<- 1:10
y<- -5:4
x+y
x-y
x*y
x/y
x^y




#to check length

length(x)
length(y)
length(x+y)

x + c(1,2)
x + c(1,2,3)

#comparison on vector
x <= 5
x<y
y>x

#to test whether all resulting elements are true. - all()
#to check whether any elemennt is true - any()

x<- 10:1
y<- -4:5

any(x<y)

all(x<y)

all(y>x)


# to calculate no of char variable in a vector

q<- c("aakash","dev","swagnik","shadab","rahil")
nchar(q)

nchar(y)

#Accessing vector's value

x[1]      #one element
x[1:2]    #consecutive elements
x[c(1,4)] #non consectuive elements

#giving name to vector.

w<-c(1:3)
names(w) <- c("a","b","c")
w


#2. Factor Vectors

#factors are used when buildings models

q2<- c("aakash","dev","swagnik","shadab","rahil")
#converting this to factor using as.factor()

q2Factor <- as.factor(q2)
q2Factor

#converting q2factor to numeric using as.numeric()

as.numeric(q2Factor)

#In ordinary factor the order of levels does not matter 
#and one level is no different from another.
#somehow it is important to understand the order of a 
#factor,such as when coding education levels. 
#Setting the ordered argument to TRUE creates an ordered factor
#with the order given in the levels arguments
#example:

x<-factor(c("High school","college","masters","doctorate"),
        levels=c("High school","college","masters","doctorate"),
        ordered=TRUE)


x

#Calling a Function----

mean(x)

#to find out documentation


apropos("mea") #it ill show all predefined function 
               #will have "mea" in their name.

#Missing Data----
#two types- NA and NULL.

#1. NA
#R use NA for indicating missing values
#is.na() - to tests each element of a vector for missingness.

z<-c(1,2,NA,8,3,NA,3)
z
is.na(z)

#in character vector

zchar<- c("hockey",NA,"cricket")
is.na(zchar)

#calculate mean of a vector having NA value

mean(z)

#calculate mean of same vector excluding NA value

mean(z, na.rm=TRUE)

#similar function - sum,min,max,var,sd
#2 NULL

#absence of anything, its not exactly missingness,
#it is nothingness
#difference btw NA and NULL is that NULL is atomic
#and cannot exist within a vector.
#if used in a vector, it simply disappears.

z<-c(1,NULL,3)
z
#is.null()- to test a NULL value

d<-NULL
is.null(d)

#Pipe----
#its from magrittr package
#taking the value or object on the left hand side of the 
#pipe and inserting it into the first argument of function
# i.e right hand side of the pipe.
#example:

library(magrittr)
x<--1:10
mean(x)


x %>% mean

#it give the same result but they written differently.
#mostly useful when used in a pipeline to chain together
#a series of function calls.
#ex- z contains numbers and NA value, we want to find
#out how many na present.

z<-c(1,2,NA,8,3,NA,3)
sum(is.na(z))

#using pipe


z %>% is.na %>% sum


#ex2

z %>% mean(na.rm=TRUE)




























































































