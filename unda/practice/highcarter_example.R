#https://api.highcharts.com/highcharts/
library(highcharter)


data(economics, package = "ggplot2")




highchart() %>% 
  hc_add_series_times_values(economics$date,
                             economics$psavert, 
                             name = "Personal Savings Rate")


highchart(type = "stock") %>% 
  hc_title(text = "US economic time series") %>% 
  hc_subtitle(text = "This dataset was produced from US economic time series data available") %>% 
  hc_tooltip(valueDecimals = 2) %>% 
  hc_add_series_times_values(economics$date,
                             economics$psavert,
                             name = "Personal savings rate") %>% 
  hc_add_series_times_values(economics$date,
                             economics$uempmed,
                             name = "Median duration of unemployment") %>% 
  hc_add_theme(hc_theme_sandsignika()) # see more about themes below.



data(worldgeojson)
data(GNI2014, package = "treemap")

highchart() %>% 
  hc_add_series_map(worldgeojson, GNI2014,
                    value = "GNI", joinBy = "iso3")


# gimme some mo highcharter examples:
# http://jkunst.com/highcharter/oldindex.html
