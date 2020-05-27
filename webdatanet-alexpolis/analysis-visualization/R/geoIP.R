getGeoIPfromTelize <- function(ip, format = ifelse(length(ip)==1,'list','dataframe'))
{
  if (1 == length(ip))
  {
    # a single IP address
    require(rjson)
    url <- paste(c("http://www.telize.com/geoip", ip), collapse='')
    ret <- rjson::fromJSON(readLines(url, warn=FALSE))
    if (format == 'dataframe')
      ret <- data.frame(t(unlist(ret)))
    return(ret)
  } else {
    ret <- data.frame()
    for (i in 1:length(ip))
    {
      r <- freegeoip(ip[i], format="dataframe")
      ret <- rbind(ret, r)
    }
    return(ret)
  }
}   

getMyIp <- function(){
  library(rjson)
  unlist(rjson::fromJSON(readLines("http://www.telize.com/jsonip",
                                   warn=FALSE)
                         )
         )
  
  
}

# IP in Athens
# getMyIp() "185.16.164.123"


# newmap <- getMap(resolution = "high")
# plot(newmap, xlim = c(-20, 59), ylim = c(35, 71), asp = 1)
# 
# points(whereami$longitude, whereami$latitude, col = "blue", cex = .6,bg="blue",pch = 21)

