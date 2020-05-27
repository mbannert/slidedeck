# Linear regression
data(mtcars)
nrow(mtcars)


fit1 <- lm(mpg ~ disp, data = mtcars)

# expected value of residuals is zero
fitted.values <- fit1$coefficients[1] +
  fit1$coefficients[2] * mtcars$disp 
mtcars$mpg - fitted.values 
fit1$residuals
hist(fit1$residuals)

# the utopia case
# variables


library(MASS)
set.seed(123)
m <- mvrnorm(10000, mu = c(20,2.6),
             Sigma = matrix(c(8,0.85,0.85,.57),ncol = 2),
             empirical = TRUE)
disp <- m[,1]
wt <- m[,2]
am <- rbinom(10000,1,.4)
cyl <- sample(c(4,6,8),
              10000,
              replace = T,
              prob = c(.2,.4,.4))
e <- rnorm(10000)

# true model
mpg <- 32 - 0.131 * disp - 1.9 * wt +
  1.8*am - 1.13*cyl + e

utopia <- data.frame(mpg,disp,wt,am,cyl)

fit_true <- lm(mpg ~ disp + wt + am +
                 cyl, data = utopia)
summary(fit_true)

# omitted variable bias
# note that OTHER variables change 
# their coefficients
fit_omitted_1 <- lm(mpg ~ disp + wt + 
                      cyl, data = utopia)
summary(fit_omitted_1)


fit_omitted_2 <- lm(mpg ~ wt + am +
                      cyl, data = utopia)
summary(fit_omitted_2)


