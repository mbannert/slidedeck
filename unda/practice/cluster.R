hc <- hclust(dist(USArrests), "ave")
plot(hc)
plot(hc, hang = -1)
