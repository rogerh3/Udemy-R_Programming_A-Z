#Udemy - Vectors
#12/17/2021

#c stands for columns
vector1 <- c(3,45,56,732)
vector1

#is.numeric() tells you if a vector is all numeric
is.numeric(vector1)

#is.integer() tells you if a vector is all integers
#it is not here because R stores everything as a double
is.integer(vector1)

#is.double() tells you if a vector is all doubles
is.double(vector1)

vector2 <- c(3L,12L,243L,0L)

#7 in this case will be converted to a character and not a number
vector3 <- c("a","B23","Hello", 7)

is.character(vector3)
is.numeric(vector3)

#Seq() is like :
seq(1,15)
1:15

#1 to 15 by steps of 2
seq(1,15,2)

z <- seq(1,15,4)
z

#replicate
#replicates 3, 50 times
rep(3,50)
d <- rep(3,50)

rep("a", 5)

x <- c(80,20)
y <- rep(x,10)
y
