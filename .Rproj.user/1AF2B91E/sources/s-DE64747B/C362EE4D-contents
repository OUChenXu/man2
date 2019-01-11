# This program illustrates tests of independence
library(MASS)

# Example 1: Smoking habit and Exercise Levels
mytable <- table(survey$Smoke, survey$Exer)
mytable

# Warning:
chisq.test(mytable)

# One solution
mytable<-cbind(mytable[,"Freq"],mytable[,"None"]+ mytable[,"Some"])
mytable

chisq.test(mytable)



# Example 2: Super Bowl and White Jerseys
mytable <- matrix(c(33,19,19,33),ncol=2,byrow=TRUE)
mytable<-as.table(mytable)
mytable

chisq.test(mytable)