#Udemy - Colnames() and rownames()
#12/20/2021

#Named Vectors

Charlie <- 1:5
Charlie

#Give Names
#names() gives the names in the element
names(Charlie)

#When this is ran Charlie gets names a,b,c,d,e
names(Charlie) <- c("a","b","c","d","e")
Charlie

Charlie["d"]

names(Charlie)

#Clear names
names(Charlie) <- NULL
Charlie


#Naming Matrix Dimensions

#if you do times = 3 it will replicate in that order 3 times
#if you do each = 3 it will replicate 3 of each before the next
temp.vec <- rep(c("a","B","zZ"),each=3)
temp.vec

Bravo <- matrix(temp.vec, 3, 3)
Bravo

rownames(Bravo) <- c("How", "are", "you?")
Bravo

colnames(Bravo) <- c("X","Y","Z")
Bravo

#replaces Bravo[2,2] with 0
Bravo["are","Y"] <- 0
Bravo

rownames(Bravo) <- NULL
Bravo
