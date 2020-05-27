# time series (regular data)

# monthly
ts1 <- ts(rnorm(300),
          start = c(1995,1),
          frequency = 12)

# quarterly
ts2 <- ts(rnorm(100),
          start = c(1995,1),
          frequency = 4)






ls()
plot(BMW.DE[,"BMW.DE.Close"])
plot(AUDVF[,"AUDVF.Close"])

comp <- as.zoo(cbind(BMW.DE[,"BMW.DE.Close"],
              AUDVF[,"AUDVF.Close"],
              VOW.DE[,"VOW.DE.Close"]))
z <- as.zoo(comp)

plot(scale(z))

# further stock market tricks: 
# https://ntguardian.wordpress.com/2017/03/27/introduction-stock-market-data-r-1/


start <- as.Date("2016-01-01")
end <- as.Date("2017-08-01")

getSymbols(c("AAPL","MSFT", "GOOG"), src = "yahoo", from = start, to = end)
stocks <- as.xts(data.frame(MSFT = MSFT[, "MSFT.Close"], 
                            GOOG = GOOG[, "GOOG.Close"],
                            AAPL = AAPL[, "AAPL.Close"]))
head(stocks)

plot(as.zoo(stocks), screens = 2, lty = 1:3, xlab = "Date", ylab = "Price")
legend("right", c("AAPL", "MSFT", "GOOG"), lty = 1:3, cex = 0.5)

plot(as.zoo(stocks[, c("AAPL.Close", "MSFT.Close")]), screens = 1, lty = 1:2, 
     xlab = "Date", ylab = "Price")
par(new = TRUE)
plot(as.zoo(stocks[, "GOOG.Close"]), screens = 1, lty = 3, xaxt = "n", yaxt = "n", 
     xlab = "", ylab = "")
axis(4)
mtext("Price", side = 4, line = 3)
legend("topleft", c("AAPL (left)", "MSFT (left)", "GOOG"), lty = 1:3, cex = 0.5)

candleChart(AAPL, up.col = "black", dn.col = "red", theme = "white")
addSMA(n = 20)

dygraphs::dygraph(stocks)



data(cars)
data(mtcars)

require(stats); require(graphics)
plot(cars, xlab = "Speed (mph)", ylab = "Stopping distance (ft)",
     las = 1)
lines(lowess(cars$speed, cars$dist, f = 2/3, iter = 3), col = "red")
title(main = "cars data")
plot(cars, xlab = "Speed (mph)", ylab = "Stopping distance (ft)",
     las = 1, log = "xy")
title(main = "cars data (logarithmic scales)")
lines(lowess(cars$speed, cars$dist, f = 2/3, iter = 3), col = "red")
summary(fm1 <- lm(log(dist) ~ log(speed), data = cars))
opar <- par(mfrow = c(2, 2), oma = c(0, 0, 1.1, 0),
            mar = c(4.1, 4.1, 2.1, 1.1))
plot(fm1)
par(opar)


# ggplotting the mtcars dataset
# https://cran.r-project.org/web/packages/knitrBootstrap/vignettes/cars.html


## deployin' models elsewhere
# https://www.r-bloggers.com/deploying-a-car-price-model-using-r-and-azureml/


## car valuation modeling
# http://blog.revolutionanalytics.com/2016/10/car-valuation.html


## car recognition 
# https://github.com/kafka399/carCount/


## citi bikers faster than taxis
# https://www.r-bloggers.com/when-are-citi-bikes-faster-than-taxis-in-new-york-city/



