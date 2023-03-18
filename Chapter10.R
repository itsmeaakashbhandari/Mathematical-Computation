#  Loops, the Un-R way to iterate


#1. for loop----

# It iterates over an index—provided as a vector—and
#performs some operations.

#orint first 10 number

for(i in 1:10)
{
  print(i)
}


#build a vector holding fruit names

fruit <- c("apple","banana","pomegranate")
#make a variable to hold their length, with
#all NA to start

fruitLength <- rep(NA, length(fruit))
#show it, all NAs

fruitLength
fruit

#give it a names
names(fruitLength) <- fruit
#show it again, still NAs
fruitLength

# loop through the fruit assigning their
#lengths to the result vector

for(a in fruit)
{
  fruitLength[a] <- nchar(a)
}

fruitLength


#using R built in vectorization

fruitlength2 <- nchar(fruit)

names(fruitlength2) <- fruit
fruitlength2


#2. While Loop ----

#It simply runs the code inside the braces 
#repeatedly as long as the tested condition 
#proves true


#wap print value of x until it reaches 5

x<-1
while(x<=5)
{
  print(x)
  x<-x+1
}


#3.Controlling Loops----


#Sometimes we have to skip to the next iteration of the loop or completely break out of it. This is
#accomplished with next and break. We use a for loop to demonstrate.


#using next

for(i in 1:10)
{
  
  if(i == 3)
  {
    
    next
  }
  print(i)
}

#using break

for(i in 1:10)
{
  if(i==4)
  {
    break
  }
  print(i)
}





































































































