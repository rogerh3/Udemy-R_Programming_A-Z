#Udemy - Law of Large Numbers
#12/17/21

N <- 10000000 #sample size
counter <- 0 #set counter
for(i in rnorm(N)){
  if(i > -1 & i < 1){
    counter <- counter + 1
  }
}

answer <- counter/N #calculate hit-ratio
answer