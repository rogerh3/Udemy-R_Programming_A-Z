#Udemy - If Statements
#12/17/21

#rnorm falls somewhere between -3 to 3 usually but in a normal distribution way
#with the middle numbers having the higher probabilities
rm(answer)
x <- rnorm(1)
if(x > 1){
  answer <- "Greater than 1"
} else {
    if( x >= 1){
      answer <- "Less than 1"
  } else {
      answer <- "Less than -1"
    }
}

#Better way to do this - Chaining Statements
if(x > 1){
  answer <- "Greater than 1"
} else if(x >= 1) {
  answer <- "Less than 1"
} else {
  answer <- "Less than -1"
  }



