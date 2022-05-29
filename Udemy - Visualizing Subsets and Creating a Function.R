#Udemy - Visualizing Subsets and creating functions
#12/21/2021

#visualizing only those 3 rows - in this case 3 players

Data <- MinutesPlayed[1:3,]
Data

matplot(t(Data), type="b", pch=15:18,col=c(1:4,6))
legend("bottomleft", inset=0.01,legend=Players[1:3], col=c(1:4,6),horiz=F)

#Just Kobe
Data <- MinutesPlayed[1,,drop=F]
Data

matplot(t(Data), type="b", pch=15:18,col=c(1:4,6))
legend("bottomleft", inset=0.01,legend=Players[1], col=c(1:4,6),horiz=F)

#crate a function to incapacitate code and just call it

myplot <- function(rows){
  Data <- MinutesPlayed[2:3,,drop=F]
  matplot(t(Data), type="b", pch=15:18,col=c(1:4,6))
  legend("bottomleft", inset=0.01,legend=Players[2:3], col=c(1:4,6),horiz=F)
}

#the 1:5 will change what rows are used in the function since rows
#is within function

myplot(1:5)
