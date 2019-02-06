# Predicting Super Bowl win using Jersey color

# Super Bowl and White Jerseys before 2018
# columns: win - loss
# rows: white - non-white
mytable <- matrix(c(33,19,19,33),ncol=2,byrow=TRUE)
joint.dist <- prop.table(mytable)
all.dist <- addmargins(joint.dist)
all.dist

# Given the team wears white jerseys, what is the chance of winning
all.dist[1,1:2]/all.dist[1,3]


# White Jersey won 12 out of 13 years before 2018
mytable <- matrix(c(12,1,1,12),ncol=2,byrow=TRUE)
prop.table(mytable)
joint.dist <- prop.table(mytable)
all.dist <- addmargins(joint.dist)
all.dist

# Given the team wears white jerseys, what is the chance of winning
all.dist[1,1:2]/all.dist[1,3]