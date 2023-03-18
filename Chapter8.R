#Writing R function


#1. Hello world ----


say.hello <- function()
{
  print("Hello, World!")
}

say.hello()


#2. Function arguments----
#sprintf -its first argument is a string with special
#input characters and subsequent arguments that will be
#substituted into the special input characters.


#one substitution

sprintf("hello %s", "Aakash")



#two substitution

sprintf(" Hello %s, today is %s", "Aakash","Exam")


#using sprintf to build a string to print based 
# function's arguments.

hello.person <- function(name)
{
  print(sprintf("Hello %s",name))
}

hello.person("Aakash")
hello.person("Rakesh")
hello.person("Madhav")


#we can add one more arguments for last name

hello.person <- function(first, last)
{
print(sprintf("Hello %s %s", first, last))
}


hello.person("Aakash","Bhandari")





#extra Arguments
# this argument do not need to be specified in the function
#definition, this is dot-dot-dot argument(...)


hello.person <- function(first, last="Doe", ...)
{
print(sprintf("Hello %s %s", first, last))
}

hello.person ("Jared", extra="Goodbye")



#3. Return Values----

#function are generally used for computing some value,
# so need a mechanism to supply that value back to
# caller. This is called returning and is done
#quite easily.

#without usinf return
double.num <- function(x)
{
  x*2
}

double.num(5)

#using return

double.num <- function(x)
{
  return(x*2)
}

double.num(5)

#built it again , with another argument 

double.num <- function(x)
{
  return(x*2)
  print("hello")
  return(17)
}

double.num(5)


#4. do.call----

#this allowss the user to specify an action.
#This function allows you to call any R function,
#but instead of writing out the arguments one by one, 
#you can use a list to hold the arguments of the function

#very useful approach in managing functions

do.call("hello.person",arg=list(first="Jared",last="lander"))





#new function using do.call

run.this <- function(x,func=mean)
{
  do.call(func, args=list(x))
}

run.this(1:10)  

run.this(1:10,mean)

run.this(1:10,sum)

run.this(1:10,sd)
























