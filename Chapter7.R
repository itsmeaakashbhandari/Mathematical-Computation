# Statistical Graphics
#1. Base Graphics----

library(ggplot2)
data(diamonds)
head(diamonds)


#1.1 Base histograms

#most common graph of data in a single variable is a histogram

hist(diamonds$carat, main="Carat histogram", xlab="carat")


#1.2 Base Scatterplot

#frequently good to see two variable in comparison
#every point represents an observation in two 
#variables where the x axis represents one variable
#and the y axis another.


plot(price~carat, data=diamonds)


#1.3 Boxplots

boxplot(diamonds$carat)



#2ggplot2----

ggplot(data=diamonds) + geom_histogram(aes(x=carat))

ggplot(data=diamonds) + geom_density(aes(x=carat),fill=
                                       'grey50')



#ggplot2 Scatterplots

ggplot(diamonds, aes(x=carat, y=price)) + geom_point()


#here we will be using ggplot(diamons,aes(x=carat,y=price))
# which ordinally would require a lot of redundant typing
# fortunately we can save ggplot objects to variables and add later
#we will save it to g

g <- ggplot(diamonds, aes(x=carat,y=price))
g+geom_point()


g+geom_point(aes(color=color))

#here color=color inside aes. this is becuase
#the designated color will be determined by the
#data. also here legend was automatically genarated.

# we can also make faceted plot

g + geom_point(aes(color=color)) + facet_wrap(~color)



g + geom_point(aes(color=color)) + facet_grid(cut~clarity)


ggplot(diamonds, aes(x=carat)) + geom_histogram() + facet_wrap(~color)



#ggplot2 Boxplots and violins plots
 
ggplot(diamonds, aes(y=carat, x=1)) + geom_boxplot()

ggplot(diamonds, aes(y=carat, x=cut)) + geom_boxplot()


ggplot(diamonds, aes(y=carat, x=cut)) + geom_violin()




#we can use multiple layer (geoms)

ggplot(diamonds, aes(y=carat, x=cut)) + geom_point() + geom_violin()


ggplot(diamonds, aes(y=carat, x=cut)) + geom_violin() + geom_point() 


#ggplot2 line graphs


ggplot(economics, aes(x=date,y=pop)) +geom_line()



#to compare data with date _ there is a lubridate package which is
#use to manipulating dates

library(lubridate)

economics$year <- year(economics$date)

economics$month <- month(economics$date , label=TRUE)

econ2000 <- economics[which(economics$year >=2000),]

library(scales)

g <- ggplot(econ2000, aes(x=month,y=pop))

g <- g + geom_line(aes(color=factor(year),group=year)) 

g <- g + scale_color_discrete(name="Year")

g <- g + scale_y_continuous(labels=comma)

g <- g + labs(title="population growth",x="month",y="population")

g


#Themes

# package of theme to re create commonly used style of graphs.

library(ggthemes)
g2<-ggplot(diamonds,aes(x=carat,y=price)) + geom_point(aes(color=color))


g2 + theme_economist() + scale_colour_economist()

g2 + theme_excel() + scale_color_excel()

g2 + theme_tufte()

g2 + theme_wsj()
















