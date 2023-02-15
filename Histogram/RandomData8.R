#rnorm(n,mean=x,sd=y) generates n random numbers
# that belong to the normal distribution with mean of x
# and standard deviation of y.
RandomData <- rnorm(8, mean = 75 ,sd = 9)
RandomData # prints out the data
mean(RandomData)
sd(RandomData)
title <- "RandomData" # This variable is used in the next part of the
# example


library(ggplot2)

# First, we need the sample mean and standard deviation to help plot
# the theoretical normal
xbar <- mean(RandomData)
s <- sd(RandomData)

# Histogram
# We have to use length() instead of nrow() because RandomData
# is a vector.
# If the data set is part of a data.frame (table) already, you
# should use nrow().
# This is now a 'small' data set so the appropriate length uses sqrt()

ggplot(data.frame(RandomData=RandomData), aes(x=RandomData)) +
  geom_histogram(aes(y=..density..),bins = sqrt(length(RandomData))+2,
                 fill = "grey",col = "black") +
  geom_density(col = "red", lwd = 1) +
  stat_function(fun=dnorm, args=list(mean=xbar, sd=s), col="blue",
                lwd = 1) +
  ggtitle(title) +
  xlab("Data") +
  ylab("Proportion") # Need to use proportion with density curves
  
  
# Normal Probability Plot 
ggplot(data.frame(RandomData=RandomData), aes(sample=RandomData)) +
  stat_qq() +
  geom_abline(slope = s, intercept = xbar) +
  ggtitle(title)
