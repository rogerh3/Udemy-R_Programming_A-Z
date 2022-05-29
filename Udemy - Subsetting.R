#Udemy - Subsetting
#12/21/2021

x <- c("a","b","c","d","e")
x

#Pulls 1st and 5th index
x[c(1,5)]

#Pulls 1st index
x[1]

Games

#Pulls rows 1-3 and columns 6-10
Games[1:3,6:10]

#Pulls row index 1 and 10 with all columns
Games[c(1,10),]

#Pulls 1 row and all columns but this is a vector not a matrix
Games[1,]
is.vector(Games[1,])

#drop removes unnecessary dimensions - Also keeps everything as a matrix
Games[1,,drop=F]
is.matrix(Games[1,,drop=F])

#you can use this manipulation in matrix visualizations