#rnorm(n,mean=x,sd=y) generates n random numbers
# that belong to the normal distribution with mean of x
# and standard deviation of y.
RandomData <- rnorm(600, mean = 75 ,sd = 9)
RandomData # this code is used to print out the data
mean(RandomData)
sd(RandomData)
title <- "RandomData" # This variable is used in the next part of the
# example



#n is the number of data points, this is constant
n <- 600

# nonnormal distributions
# right skewed: F (df1 = 10, df2 = 10)
# left skewed: Weibull (shape = 30, scale = 10)
# short tailed: Uniform (on [20,50])
# long tailed: Cauchy (location = 50, scale = 1)

right <- rf(n,df1 = 10, df2 = 10)
left <- rweibull(n,shape = 30, scale = 10)
short <- runif(n, min = 20, max = 50)
long <- rcauchy(n, location = 50, scale = 1)

# change this part to get different distributions accordingly

RandomData <- right
title <- "Right skewed Distribution"
# the rest of the code is the same as in Part 2 and will not be
# repeated.





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

ggplot(data.frame(RandomData=RandomData), aes(x=RandomData)) +
  geom_histogram(aes(y=..density..),bins = sqrt(length(RandomData)),
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



