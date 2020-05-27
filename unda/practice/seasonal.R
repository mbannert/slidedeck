load("data/pkw_registration.RData")
library(seasonal)
library(seasonalview)

# basic overview
plot(ch.bfs.pkw)

# What can we learn?
# - pretty long series
# - likely, structural break
# - split it up

y2k <- window(ch.bfs.pkw,start = c(2000,1))
plot(y2k)

y2k_s <- seas(y2k)
view(y2k_s)

# pretty classical
fts <- window(ch.bfs.pkw,start = c(1951,1),end=c(1969,12))
fts_s <- seas(fts)
# don't forget to zoom in. 
view(fts_s)

library(stats)
plot(stl(fts,s.window = 12))






