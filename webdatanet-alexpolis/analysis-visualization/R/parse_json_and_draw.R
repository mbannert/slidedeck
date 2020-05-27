library(rjson)
json_list <- rjson::fromJSON(file = "application/coords.json")
coord_df <- data.frame(X = unlist(lapply(json_list,"[[","X")),
                       Y = unlist(lapply(json_list,"[[","Y"))
)

head(coord_df)


# load libraries for raster Images
library(png)
library(ggplot2)
library(EBImage) # from bioconductor for readImage 
library(gridExtra)

# choose background picture
img.path <- "application/blue.png" # from CRAN
img <- readImage(img.path) # needs library(EBImage)
grid.newpage()
gob <- ebimageGrob(img, raster=TRUE) # needs library(gridExtra)



json_list <- rjson::fromJSON(file = "application/coords.json")

coord_df <- data.frame(X = unlist(lapply(json_list,"[[","X")),
                       Y = unlist(lapply(json_list,"[[","Y"))
                       )



png("test.png",height=300,width=300)
# 
# coord_df <- coord_df / 2

#annotation_custom(gob, xmin=-Inf, xmax=Inf, ymin=-Inf, ymax=Inf)
#


p <- ggplot(coord_df) +
  annotation_custom(gob, xmin=530, xmax=730,ymin=-220,ymax=-420) +
  geom_point(aes(X,Y))  + 
  coord_fixed(ratio = 1) +
  scale_y_reverse()
  # don't use geom_line here, because it has another order!!!
  geom_path(aes(X,Y))
p

coord_df
