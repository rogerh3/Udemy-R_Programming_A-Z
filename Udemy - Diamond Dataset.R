# Udemy - Diamond Dataset
# 12/14/21

mydata <- read.csv(file.choose())

install.packages("ggplot2")
library(ggplot2)

ggplot(data=mydata, aes(x=carat, y=price, colour=clarity)) + geom_point()

ggplot(data=mydata,
       aes(x=carat, y=price, colour=clarity)) + 
       geom_point(aplha=0.1) +
       geom_smooth()

#geom_smooth() - Smooth out the data into lines
#geom_point() - plots the data as points
#colour=clarity adds a rainbow effect to the colors
#install.packages() - lets you install new packages
#library() - adds packages to the library
#<- read.csv(file.choose()) - lets you choose a file on the computer


