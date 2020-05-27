# time series

# nested data

# JavaScript Object Notation (JSON)
# 'light weight XML'
library(jsonlite)

# Stringify some data
jsoncars <- toJSON(mtcars, pretty = TRUE)
cat(jsoncars)

# data.frames in data.frames
# view this in a browser... 
data2 <- fromJSON("https://api.github.com/users/hadley/repos")
names(data2)
names(data2$owner)
data2$owner$login
str(data2)
