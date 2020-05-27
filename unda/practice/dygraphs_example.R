# Stock data from an API
library(quantmod)
car_stocks <- getSymbols(c("BMW.DE","AUDVF","VOW.DE"), src = "yahoo")

start <- as.Date("2016-01-01")
end <- as.Date("2017-08-01")

getSymbols(c("AAPL","MSFT", "GOOG"), src = "yahoo", from = start, to = end)
stocks <- as.xts(data.frame(MSFT = MSFT[, "MSFT.Close"], 
                            GOOG = GOOG[, "GOOG.Close"],
                            AAPL = AAPL[, "AAPL.Close"]))

library(dygraphs)
dygraph(stocks[,c(1,3)])

dygraph(stocks)
