#Udemy - Using []
#12/19/2021

x <- c(1,123,534,13,4) #combine
y <- seq(201,250,11)   #sequence
z <- rep("Hi!",3)      #Replicate

w <- c("a","b","c","d","e")
w

#Index 1
w[1]

#Index 2
w[2]

#everything but a
w[-1]

#creating a new vector by taking away a,b,c
v <- w[-3]

#returning first 3 index
w[1:3]

#returning index 3-5
w[3:5]

#takes the 1,3,5 index
w[c(1,3,5)]

#everything but 2,4 index
w[c(-2,-4)]

#gives you -3 to -5
-3:-5
