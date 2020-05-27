library(timeseriesdb)

# start the server locally (OSX homebrew install)
# pg_ctl -D /usr/local/var/postgres start
con <- createConObj(dbhost = "localhost",
                    dbuser = "mbannert",
                    dbname = "sandbox",
                    passwd = "")




sql <- "SELECT ts_key FROM timeseries.timeseries_main"
keys <- dbGetQuery(con,sql)$ts_key

# sql_w <- "SELECT ts_key FROM timeseries.timeseries_main
#           WHERE ts_key ~ 'ch.bfs'"
# kof <- dbGetQuery(con,sql_w)$ts_key

rmAllBut("con")
result <- readTimeSeries("ts3",con)

library(dygraphs)
dygraph(result$ts3)

dbDisconnect(con)

# more sophisticated use see timeseriesdb
# kvp 
# round robbin... 
# https://www.timescale.com/
# on-the-fly-computation / OLAP 









