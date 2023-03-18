#Control Statements


#1. if and else----


as.numeric(TRUE)
as.numeric(FALSE)


check.bool <- function(x)
{
  if(x==1)
  {
    print("hello")
  }else
  {
    print("goodbye")
  }
}

check.bool(1)
check.bool(2)
check.bool("k")
check.bool(TRUE)

# elseif

check.bool <- function(x)
{
  if(x==1)
  {
    print("hello")
  }else if(x==0)
  {
    print("goodbye")
  }else
  {
    print("confused")
  }
}

check.bool(0)

check.bool(2)

# Swtich 


# when multiple cases to check, writing if else
# repeadly can be cumbersome and inefficient
# this is where switch is most useful

use.switch <- function(x)
{
  switch(x,
         "a"="first",
         "b"="second",
         "z"="last",
         "c"="third",
         "other")
  
}  

use.switch("a")
use.switch("z")
use.switch("b")
use.switch("x")


#if the first argument is numeric, it is matched positionally
#to the following arguments, regardless of the names
# of subsequent arguments.
# if the numeric argument is greate than the number
# of subsequent arguments, NULL is returned.


use.switch(1)
use.switch(2)
use.switch(3)
use.switch(4)
use.switch(5)
use.switch(6)
is.null(use.switch(6))


# ifelse---- 

#ifelse is more like the if function in excel.


#see if 1==1

ifelse(1==1, "Yes","No")

ifelse(1==0,"Yes","No")


#another example


totest <- c(1,1,0,1,0,1)
ifelse(totest==1, "Yes", "No")


ifelse(totest==1,totest*3,totest)

totest[2]<-NA
ifelse(totest==1, "Yes", "No")



#4 Compound Tests ----

a <- c(1,1,0,1)
b <- c(2,1,0,1)



#this check each element of a and b
ifelse(a==1 & b==1, "Yes","No")


ifelse(a==1 && b==1, "Yes","No")








































