k <- kmeans(mtcars[,c(3,4,5,6,7)],3)

head(mtcars[,c(3,4,5,6,7)])

# let's build a shiny app around this for day 2.


# a 2-dimensional example
plot(mtcars$disp,mtcars$qsec,
     col = c("black","blue","green")[k$cluster])
points(k$centers[,"disp"],
       k$centers[,"qsec"],
       col = c("black","blue","red"),
       pch = 10, cex = 2)
