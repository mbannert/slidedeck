


Date <- as.Date("01-01-2014","%d-%m-%Y") + seq_along(1:300)
returned <- sample(1:20,300,replace = T)

df1 <- data.frame(as.numeric(as.POSIXct(Date)),returned)
# summer vacay effect
df1$returned[212:242] <- sample(1:2,30,replace=T)



li <- as.list(df1$returned)
names(li) <- df1$as.numeric.as.POSIXct.Date..

library(jsonlite)

json <- jsonlite::toJSON(li,pretty = T)
json <- gsub("\\[|\\]","",json)
cat(json,file="application/dates.json")
