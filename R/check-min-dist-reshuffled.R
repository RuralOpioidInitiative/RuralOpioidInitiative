library(sf)
library(tidyverse)
library(tmap)
library(tmaptools)
library(dplyr)
library(readr)
library(tigris)


# Illinois boundary
illinois <- tigris::states(cb = TRUE) %>%
  st_as_sf() %>% 
  filter(NAME == "Illinois") %>%
  st_transform(32616)

# minimum distance for real, reshuffle 1 and reshuffle 2
result <- st_read("data-shared/min_dist_real_reshuffled.shp") %>% 
  st_set_crs(32616)

tmap_mode(mode = "view")
# tmap mode set to interactive viewing 

result$zipcode <- as.character(result$zip)
result <- right_join(atrisk_IL, result, by = c("GEOID" = "zipcode")) %>% 
  st_as_sf() %>%
  st_set_crs(32616)

result$X <- NULL

tmap_mode("plot")
tm_shape(illinois) +
tm_borders() + 
tm_shape(result) +
  tm_polygons(c("real_meth","s1_meth","s2_meth"), 
              title = "Distance (miles)",
              style = "fixed", breaks = c(0, 2, 10, 100), palette = "Set1") +
  tm_facets(sync = TRUE, ncol = 3) + 
  tm_layout(panel.show = T,
            panel.labels = c("Real","Counterfactual 1","Counterfactual 2"),
            legend.outside = T,
            main.title = "Minimum Distance (miles) to MOUD - Methadone")

tm_shape(illinois) +
  tm_borders() + 
  tm_shape(result) +
  tm_polygons(c("real_bup","s1_bup","s2_bup"), 
              title = "Distance (miles)",
              style = "fixed", breaks = c(0, 5, 20, 100), palette = "Set1") +
  tm_facets(sync = TRUE, ncol = 3) + 
  tm_layout(panel.show = T,
            panel.labels = c("Real","Counterfactual 1","Counterfactual 2"),
            legend.outside = T,
            main.title = "Minimum Distance (miles) to MOUD - Buprenorphine")

tm_shape(illinois) +
  tm_borders() + 
  tm_shape(result) +
  tm_polygons(c("real_nal","s1_nal","s2_nal"), 
              title = "Distance (miles)",
              style = "fixed", breaks = c(0, 5, 20, 100), palette = "Set1") +
  tm_facets(sync = TRUE, ncol = 3) + 
  tm_layout(panel.show = T,
            panel.labels = c("Real","Counterfactual 1","Counterfactual 2"),
            legend.outside = T,
            main.title = "Minimum Distance (miles) to MOUD - Naltrexone") +
  tm_basemap(server = "OpenStreetMap")

# plot for population at risk 
tm_shape(zips_IL) + tm_polygons("ratio", style = "quantile")

