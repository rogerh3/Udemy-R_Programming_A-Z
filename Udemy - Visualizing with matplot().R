#Udemy - Visualizing with matplot()
#12/20/2021

#matplot() is used to graph columns of matrices

#type = Chart type
#pch = picture/image
#col = Colors
matplot(t(FieldGoals), type="b",, pch=15:18,col=c(1:4,6))
#legend(placement, how far in or out, what legend will show,colors,horizontal)
legend("bottomleft", inset=0.01,legend=Players, col=c(1:4,6),horiz=F)

FieldGoals

#t() transposes a table or matrix
t(FieldGoals)

matplot(t(FieldGoals/Games), type="b",, pch=15:18,col=c(1:4,6))
legend("bottomleft", inset=0.01,legend=Players, col=c(1:4,6),horiz=F)