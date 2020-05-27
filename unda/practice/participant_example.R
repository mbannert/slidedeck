library(jsonlite)
m <- fromJSON()

""
head(m$data[!is.na(m$data$lat),])

m$data

library(XML)


x <- xmlParse("data/2017_01_09_05_50_11_2KPURGE_PRG_0.xml")
xl <- xmlToList(x)

xl$MesswertArray$CURRBOOSTER
