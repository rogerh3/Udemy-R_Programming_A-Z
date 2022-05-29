#Udemy - Matrices
#12/20/2021

#matrix()
#matrix() takes a vector and bends it into a matrix

#rbind()
#rbind() binds vectors as rows

#cbind()
#cbind() binds vectors as columns

my.data <- 1:30
my.data

#Matrix()

#counts by columns
A <- matrix(my.data,4,5)
A
A[2,3]

#counts by rows
B <- matrix(my.data,4,5,byrow=T)
B

#rbind()

r1 <- c("I","am","happy")
r2 <- c("What","a","day")
r3 <- c(1,2,3)

C <- rbind(r1,r2,r3)
C

#cbind()

c1 <- 1:5
c2 <- -1:-5

D<- cbind(c1,c2)
D

