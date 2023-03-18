# READING DATA INTO R

#1. Reading CSV----

#using read.table

theurl<- "http://www.jaredlander.com/data/TomatoFirst.csv"
tomato <- read.table(file=theurl, header=TRUE, sep=",")
head(tomato)

#file- location, header- first row of data holds the col name.
#sep- seprated by ","

x <- 10:1
y <- -4:5
q <-c("Hockey", "Football", "Baseball", "Curling", "Rugby",
         "Lacrosse", "Basketball", "Tennis", "Cricket", "Soccer")
theDF <-data.frame(First=x, Second=y, Sport=q, 
                   stringsAsFactors=FALSE)

theDF$Sport

#using read.csv

theurl<- "http://www.jaredlander.com/data/TomatoFirst.csv"
tomatocsv <- read.csv(file=theurl, header=TRUE, sep=",")
head(tomatocsv)

#1.1 using read_delim

#should install readr library

library(readr)
theurl<- "http://www.jaredlander.com/data/TomatoFirst.csv"
tomato02 <- read.delim(file=theurl, header=TRUE, sep=",")
head(tomato02)


tomato02


#1.2 using fread

#anotheer option to read large data quickly is fread from data.table
#package
#its also faster than read.table and result data.table object
#this is another special object the improves upon dataframe





library(data.table)
theurl <- "http://www.jaredlander.com/data/TomatoFirst.csv"
tomato3 <- fread(input=theurl, sep=",", header=TRUE)
head(tomato3)



#Both read_delim and fread are fast, capable, so the decision of
#which to use depends upon whether dyplyr or data.table is 
#preferred for data manipulation.




#2. Excel data----

library(readxl)
excel_sheets('C:/Users/Asus/OneDrive/Desktop/ExcelExample.xlsx')


#by default read_excel reads the first sheet , in this case the 
#one holding the tomato data. the result is a tibble rather than a
#traditional data.frame

tomatoXL <- read_excel('C:/Users/Asus/OneDrive/Desktop/ExcelExample.xlsx')
tomatoXL

# since tomatoXL is a tibble  only the columns that fit on
#on the screen are printed, this is vary depending
#on how wide the terminal is set

wineXL <- read_excel('C:/Users/Asus/OneDrive/Desktop/ExcelExample.xlsx', sheet=2)
head(wineXL)

wineXL2 <- read_excel('C:/Users/Asus/OneDrive/Desktop/ExcelExample.xlsx', sheet='Wine')
head(wineXL2)


#Reading from Databases----

#SQLite has its own R package, RSQLite , we use that to connect to our database, otherwise are would use RODBC

















