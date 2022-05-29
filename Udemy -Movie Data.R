#Udemy - Factors, Aesthetics, Layers, Mapping, Setting, Histograms,
#Density Charts, Statistical Transformations, Facets, Coordinates, Themes
#1/9/2022

movies <- read.csv(file.choose())
head(movies)

colnames(movies) <- c("Film", "Genre","CriticRating", "AudienceRating",
                      "BudgetMillions","Year")
head(movies)
tail(movies)
str(movies)
summary(movies)

#Converting years into factors

factor(movies$Year)

movies$Year <- factor(movies$Year)
#Now Year has levels
#when you look at the summary it does a count of years rather then using them
#as a regular number

summary(movies)

#------------------------------------------------------------------------------

#Aesthetics

library(ggplot2)

#aes() is aesthetics - how your data maps
#Here there are no plots becuase we didnt add a graph/plot type
ggplot(data=movies, aes(x=CriticRating, y=AudienceRating))

#Adding geometry - adding Plot type
ggplot(data=movies, aes(x=CriticRating, y=AudienceRating)) + geom_point()

#Adding color - it auto adds a legend for the color
ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, colour=Genre)) + 
  geom_point()

#Add size - size based off of budget amount
ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, colour=Genre,
                        size = BudgetMillions)) + geom_point()

#-------------------------------------------------------------------------------

#Plotting with Layers

#you can assign the ggplot() to a variable then call it and add a geometry
p <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, 
                             colour=Genre, size = BudgetMillions))

#Scatter
p + geom_point()

#Line
p + geom_line()

#Multiple Layers
p + geom_line() + geom_point()

#-------------------------------------------------------------------------------

#Overriding Aesthetics

q <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, 
                             colour=Genre, size = BudgetMillions))

#Add geom layer
q + geom_point()

#Override Aesthetics 
q + geom_point(aes(size=CriticRating))

q + geom_point(aes(colour=BudgetMillions))

#xlab will fix the x - axis name
q + geom_point(aes(x=BudgetMillions)) + xlab("Budget Millions $")

#-------------------------------------------------------------------------------

#Mapping vs. Setting

r <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating))
r + geom_point()

#Add color - 2 ways
#1. Mapping
r + geom_point(aes(colour=Genre))

#2. Setting
r + geom_point(colour="DarkGreen")

#Mapping
r + geom_point(aes(size=BudgetMillions))

#Setting
r + geom_point(size=10)

#-------------------------------------------------------------------------------

#Histograms and Density Charts

s <- ggplot(data=movies, aes(x=BudgetMillions))

#Histogram - binwidth sets bin size
s + geom_histogram(binwidth=10)

#Add Color
s + geom_histogram(binwidth=10, aes(fill=Genre))

#Add border - The black boarder is set and the inside color is mapped
s + geom_histogram(binwidth=10, aes(fill=Genre), colour="Black")

#Density Chart - gives you the PDF
s + geom_density(aes(fill=Genre))
s + geom_density(aes(fil=Genre),position="stack")

#-------------------------------------------------------------------------------

#Starting Layer Tips

t <- ggplot(data=movies, aes(x=AudienceRating))
t + geom_histogram(binwidth=10, fill="White", colour="Blue")

#Another way to do the same thing

t <- ggplot(data=movies)
t + geom_histogram(binwidth=10, aes(x=AudienceRating), fill="White", 
                   colour="Blue")

t + geom_histogram(binwidth=10, aes(x=CriticRating), fill="White", 
                   colour="Blue")

#This would give you a skeleton plot and you can add whatever you want
t <- ggplot()

#-------------------------------------------------------------------------------

#Statistical Transformations

#Using geom_smooth()
u <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating,
                             Colour=Genre))
u + geom_point() + geom_smooth(fill=NA)

#Box plots
u <- ggplot(data=movies, aes(x=Genre, y=AudienceRating,
                             Colour=Genre))
u + geom_boxplot()
u + geom_boxplot(size=1.2)
u + geom_boxplot(size=1.2) + geom_point()
u + geom_boxplot(size=1.2) + geom_jitter()

u + geom_jitter() +  geom_boxplot(size=1.2, alpha=0.5)

#-------------------------------------------------------------------------------

#Using Facets

v <- ggplot(data=movies, aes(x=BudgetMillions))
v + geom_histogram(binwidth=10, aes(fill=Genre),
                   colour="Black")

#Facets - Breaking one graph into multiple based off a variable
#facet_grid(______~.)
v + geom_histogram(binwidth=10, aes(fill=Genre),
                   colour="Black") +
  facet_grid(Genre~., scales="free")

#Scatter plots

w <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating,
                             colour=Genre))
w + geom_point(size=3)

#Facets
w + geom_point(size=3) + facet_grid(Genre~.)
w + geom_point(size=3) + facet_grid(.~Year)
w + geom_point(size=3) + facet_grid(Genre~Year)
w + geom_point(size=3) + geom_smooth() + facet_grid(Genre~Year)
w + geom_point(aes(size=BudgetMillions)) + geom_smooth() +
  facet_grid(Genre~Year)

#-------------------------------------------------------------------------------

#Coordinates

m <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating,
                             size=BudgetMillions, colour=Genre))
m + geom_point()

#Choosing just the ranges between 50 - 100
#But this wont always work well
m + geom_point() + xlim(50,100) + ylim(50,100)

#This cuts off data that it should not
n <- ggplot(data=movies, aes(x=BudgetMillions))
n + geom_histogram(binwidth=10, aes(fill=Genre),
                   colour="Black") + ylim(0,50)
#Better method - Zoom
n + geom_histogram(binwidth=10, aes(fill=Genre),
                   colour="Black") + 
  coord_cartesian(ylim=c(0,50))

#Improving Facet
w + geom_point(aes(size=BudgetMillions)) + geom_smooth() +
  facet_grid(Genre~Year)

w + geom_point(aes(size=BudgetMillions)) + geom_smooth() +
  facet_grid(Genre~Year) + coord_cartesian(ylim=c(0,100))

#-------------------------------------------------------------------------------

#Adding Themes

o <- ggplot(data=movies, aes(x=BudgetMillions))
h <- o + geom_histogram(binwidth=10, aes(fill=Genre), colour="Black")
h

#Axis and Labels
h + xlab("Money Axis") + ylab("Number of Movies") + 
  ggtitle("Movie Budget Distribution") +
  theme(axis.title.x=element_text(colour="DarkGreen", size=30),
        axis.title.y=element_text(colour="Red", size=30),
        axis.text.x=element_text(size=20),
        axis.text.y=element_text(size=20),
        
        legend.title=element_text(size=30),
        legend.text=element_test(size=20),
        legend.position=c(1,1),
        legend.justification=c(1,1),
        
        plot.title=element_text(colour="DarkBlue",
                                size=40,
                                family="Courier"))

#Information on how to add themes
?theme
