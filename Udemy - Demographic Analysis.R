#Udemy - Demographic Analysis
#12/21/2021

#Importing Data

#Method 1
#Import in a file as a table and creating it as a data frame
stats <- read.csv(file.choose())
stats

#Method 2
#Set working Directory and Read Data

#Get the working directory
getwd()
#Windows
#XX is user and CC is folder
setwd("C:\\Users\\XXXXX\\Desktop\\CCCCCCC")

#-------------------------------------------------------------------------------

#Exploring the Data with general functions

stats

#Number of rows - here there is 195
nrow(stats)

#Number of columns - here there are 5
ncol(stats)

#Shows you the top 6 rows
head(stats)

#Shows you the last 6 rows
tail(stats)

#You can do head and tail and choose the number of rows you want to see
head(stats, n=10)

#Tells you about all rows and the data frame - str() stands for structure
str(stats)

#Gives you a breakdown for every column categorical variable
summary(stats)

#------------------------------------------------------------------------------

#Using $ signs

stats
head(stats)
stats[3,3]
stats[3,"Birth.rate"]

#Pulls the internet column only
stats$Internet.users

#Above is the same as 
stats[,"Internet.users"]

#levels() Gives you the values that are used in a column
levels(stats$Income.Group)

#-------------------------------------------------------------------------------

#Basic Operations with Data Frames

#First 10 rows and all the columns - a subset of the data frame
stats[1:10,]

#is.data.frame() tells you if something is a data frame
#Do not need Drop=F for the rows
is.data.frame(stats[1,])

#Do need Drop=F for the columns to make them a data frame
is.data.frame(stats[,1,drop=F])

#Doing multiplication and addition with Data Frames
stats$Birth.rate * stats$Internet.users
stats$Birth.rate + stats$Internet.users

#How to add a column
head(stats)
stats$MyCalc <- stats$Birth.rate * stats$Internet.users
head(stats)

#Remove a column
head(stats)
stats$MyCalc <- NULL
head(stats)

#-------------------------------------------------------------------------------

#Filtering a Data Frame

head(stats)

#Compares all vectors in Data Frame to the number 2
filter <- stats$Internet.users < 2

#This will only display the vectors where Internet.user < 2
stats[filter,]

#Example of filtering when calling from the data frame
stats[stats$Birth.rate > 40,]

#Filtering when calling from data frame for multiple variables
stats[stats$Birth.rate > 40 & stats$Internet.users < 2,]

#Filter for High income
stats[stats$Income.Group == "High income",]

#Filter for one Country
stats[stats$Country.Name == "Malta",]

#-------------------------------------------------------------------------------

#Using qplot()

#Installing ggplot2
install.packages("ggplot2")
library(ggplot2)

#Basic Example
#If you label data = _____ then you do not need to $ columns
#This gives you bins for internet users - Histogram/Bar
qplot(data=stats,x=Internet.users)

#Comparing Income group to Birth Rate
qplot(data=stats,x=Income.Group,y=Birth.rate)

#Changing visual effects - when changing size put an I around the number as is
#so it does not map it to the data and add a legend
qplot(data=stats,x=Income.Group,y=Birth.rate, size = I(3))

#Changing visual effects - changing color - putting I in front of it
qplot(data=stats,x=Income.Group,y=Birth.rate, size = I(3), colour=I("blue"))

#Changing visual effects - using box plots
qplot(data=stats,x=Income.Group,y=Birth.rate,geom="boxplot")

#-------------------------------------------------------------------------------

#Visualizing with qplot()

#Plotting Internet users vs. Birth rate
qplot(data=stats,x=Internet.users,y=Birth.rate)

#editing visuals - colors all red and one standard size
qplot(data=stats,x=Internet.users,y=Birth.rate,
      colour=I("red"),size=I(4))

#editing visuals - colors changing based on income group
qplot(data=stats,x=Internet.users,y=Birth.rate,
      colour=Income.Group,size=I(4))

#-------------------------------------------------------------------------------

#creating Data Frames

#Execute below code to generate three new vectors
Countries_2012_Dataset <- c("Aruba","Afghanistan","Angola","Albania","United Arab Emirates","Argentina","Armenia","Antigua and Barbuda","Australia","Austria","Azerbaijan","Burundi","Belgium","Benin","Burkina Faso","Bangladesh","Bulgaria","Bahrain","Bahamas, The","Bosnia and Herzegovina","Belarus","Belize","Bermuda","Bolivia","Brazil","Barbados","Brunei Darussalam","Bhutan","Botswana","Central African Republic","Canada","Switzerland","Chile","China","Cote d'Ivoire","Cameroon","Congo, Rep.","Colombia","Comoros","Cabo Verde","Costa Rica","Cuba","Cayman Islands","Cyprus","Czech Republic","Germany","Djibouti","Denmark","Dominican Republic","Algeria","Ecuador","Egypt, Arab Rep.","Eritrea","Spain","Estonia","Ethiopia","Finland","Fiji","France","Micronesia, Fed. Sts.","Gabon","United Kingdom","Georgia","Ghana","Guinea","Gambia, The","Guinea-Bissau","Equatorial Guinea","Greece","Grenada","Greenland","Guatemala","Guam","Guyana","Hong Kong SAR, China","Honduras","Croatia","Haiti","Hungary","Indonesia","India","Ireland","Iran, Islamic Rep.","Iraq","Iceland","Israel","Italy","Jamaica","Jordan","Japan","Kazakhstan","Kenya","Kyrgyz Republic","Cambodia","Kiribati","Korea, Rep.","Kuwait","Lao PDR","Lebanon","Liberia","Libya","St. Lucia","Liechtenstein","Sri Lanka","Lesotho","Lithuania","Luxembourg","Latvia","Macao SAR, China","Morocco","Moldova","Madagascar","Maldives","Mexico","Macedonia, FYR","Mali","Malta","Myanmar","Montenegro","Mongolia","Mozambique","Mauritania","Mauritius","Malawi","Malaysia","Namibia","New Caledonia","Niger","Nigeria","Nicaragua","Netherlands","Norway","Nepal","New Zealand","Oman","Pakistan","Panama","Peru","Philippines","Papua New Guinea","Poland","Puerto Rico","Portugal","Paraguay","French Polynesia","Qatar","Romania","Russian Federation","Rwanda","Saudi Arabia","Sudan","Senegal","Singapore","Solomon Islands","Sierra Leone","El Salvador","Somalia","Serbia","South Sudan","Sao Tome and Principe","Suriname","Slovak Republic","Slovenia","Sweden","Swaziland","Seychelles","Syrian Arab Republic","Chad","Togo","Thailand","Tajikistan","Turkmenistan","Timor-Leste","Tonga","Trinidad and Tobago","Tunisia","Turkey","Tanzania","Uganda","Ukraine","Uruguay","United States","Uzbekistan","St. Vincent and the Grenadines","Venezuela, RB","Virgin Islands (U.S.)","Vietnam","Vanuatu","West Bank and Gaza","Samoa","Yemen, Rep.","South Africa","Congo, Dem. Rep.","Zambia","Zimbabwe")
Codes_2012_Dataset <- c("ABW","AFG","AGO","ALB","ARE","ARG","ARM","ATG","AUS","AUT","AZE","BDI","BEL","BEN","BFA","BGD","BGR","BHR","BHS","BIH","BLR","BLZ","BMU","BOL","BRA","BRB","BRN","BTN","BWA","CAF","CAN","CHE","CHL","CHN","CIV","CMR","COG","COL","COM","CPV","CRI","CUB","CYM","CYP","CZE","DEU","DJI","DNK","DOM","DZA","ECU","EGY","ERI","ESP","EST","ETH","FIN","FJI","FRA","FSM","GAB","GBR","GEO","GHA","GIN","GMB","GNB","GNQ","GRC","GRD","GRL","GTM","GUM","GUY","HKG","HND","HRV","HTI","HUN","IDN","IND","IRL","IRN","IRQ","ISL","ISR","ITA","JAM","JOR","JPN","KAZ","KEN","KGZ","KHM","KIR","KOR","KWT","LAO","LBN","LBR","LBY","LCA","LIE","LKA","LSO","LTU","LUX","LVA","MAC","MAR","MDA","MDG","MDV","MEX","MKD","MLI","MLT","MMR","MNE","MNG","MOZ","MRT","MUS","MWI","MYS","NAM","NCL","NER","NGA","NIC","NLD","NOR","NPL","NZL","OMN","PAK","PAN","PER","PHL","PNG","POL","PRI","PRT","PRY","PYF","QAT","ROU","RUS","RWA","SAU","SDN","SEN","SGP","SLB","SLE","SLV","SOM","SRB","SSD","STP","SUR","SVK","SVN","SWE","SWZ","SYC","SYR","TCD","TGO","THA","TJK","TKM","TLS","TON","TTO","TUN","TUR","TZA","UGA","UKR","URY","USA","UZB","VCT","VEN","VIR","VNM","VUT","PSE","WSM","YEM","ZAF","COD","ZMB","ZWE")
Regions_2012_Dataset <- c("The Americas","Asia","Africa","Europe","Middle East","The Americas","Asia","The Americas","Oceania","Europe","Asia","Africa","Europe","Africa","Africa","Asia","Europe","Middle East","The Americas","Europe","Europe","The Americas","The Americas","The Americas","The Americas","The Americas","Asia","Asia","Africa","Africa","The Americas","Europe","The Americas","Asia","Africa","Africa","Africa","The Americas","Africa","Africa","The Americas","The Americas","The Americas","Europe","Europe","Europe","Africa","Europe","The Americas","Africa","The Americas","Africa","Africa","Europe","Europe","Africa","Europe","Oceania","Europe","Oceania","Africa","Europe","Asia","Africa","Africa","Africa","Africa","Africa","Europe","The Americas","The Americas","The Americas","Oceania","The Americas","Asia","The Americas","Europe","The Americas","Europe","Asia","Asia","Europe","Middle East","Middle East","Europe","Middle East","Europe","The Americas","Middle East","Asia","Asia","Africa","Asia","Asia","Oceania","Asia","Middle East","Asia","Middle East","Africa","Africa","The Americas","Europe","Asia","Africa","Europe","Europe","Europe","Asia","Africa","Europe","Africa","Asia","The Americas","Europe","Africa","Europe","Asia","Europe","Asia","Africa","Africa","Africa","Africa","Asia","Africa","Oceania","Africa","Africa","The Americas","Europe","Europe","Asia","Oceania","Middle East","Asia","The Americas","The Americas","Asia","Oceania","Europe","The Americas","Europe","The Americas","Oceania","Middle East","Europe","Europe","Africa","Middle East","Africa","Africa","Asia","Oceania","Africa","The Americas","Africa","Europe","Africa","Africa","The Americas","Europe","Europe","Europe","Africa","Africa","Middle East","Africa","Africa","Asia","Asia","Asia","Asia","Oceania","The Americas","Africa","Europe","Africa","Africa","Europe","The Americas","The Americas","Asia","The Americas","The Americas","The Americas","Asia","Oceania","Middle East","Oceania","Middle East","Africa","Africa","Africa","Africa")
#(c) Kirill Eremenko, www.superdatascience.com

#data.frame() puts all of these into a data frame, similar to cbind()
mydf <- data.frame(Countries_2012_Dataset,Codes_2012_Dataset,
                   Regions_2012_Dataset)
head(mydf)

#Reassigning Column names
colnames(mydf) <- c("Country","Code","Region")
head(mydf)

#Removing the data frame a created and combining the last 2 steps in 1
rm(mydf)

#Combining last 2 steps into 1
mydf <- data.frame(Country=Countries_2012_Dataset,Code=Codes_2012_Dataset,
                   Region=Regions_2012_Dataset)
head(mydf)
summary(mydf)

#-------------------------------------------------------------------------------

#Merging Data Frames

head(stats)
head(mydf)

#Merging - by.x chooses the column from the first DF and by.y chooses the column
#from the second DF
merged <- merge(stats, mydf, by.x="Country.Code",by.y="Code")
merged

#Removing duplicate columns
merged$Country <- NULL
str(merged)

#-------------------------------------------------------------------------------

#Using qplot() to Visualize Merged Data Frame

qplot(data=merged,x=Internet.users,y=Birth.rate)

qplot(data=merged,x=Internet.users,y=Birth.rate,
      Colour=Region)

qplot(data=merged,x=Internet.users,y=Birth.rate,
      Colour=Region,size=I(5),shape=I(17))

#Alpha changes transparency
qplot(data=merged,x=Internet.users,y=Birth.rate,
      Colour=Region,size=I(5),shape=I(17),
      alpha=I(0.6))

#Main adds a title
qplot(data=merged,x=Internet.users,y=Birth.rate,
      Colour=Region,size=I(5),shape=I(17),
      alpha=I,main="Birth Rate vs. Internet Users")