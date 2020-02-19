library(sf)
library(tidyverse)
library(tmap)
library(tmaptools)

result <- st_read("data-shared/min_dist_real_reshuffled.shp") %>% 
  st_set_crs(32616)

tm_shape(result) +
  tm_polygons("real_bup")

tm_shape(result) +
  tm_polygons("s1_bup")

tm_shape(result) +
  tm_polygons("s2_bup")

tmap_mode(mode = "view")
# tmap mode set to interactive viewing 
tm_shape(zips_IL) + tm_polygons("ratio")

result$zipcode <- as.character(result$zip)
result <- right_join(atrisk_IL, result, by = c("GEOID" = "zipcode")) %>% 
  st_as_sf() %>%
  st_set_crs(32616)

result$X <- NULL

tmap_mode("view")
tm_shape(result) +
  tm_polygons(c("real_bup","s1_bup","s2_bup", "ratio"), style = "quantile") +
  tm_facets(sync = TRUE, ncol = 2)

tmap_mode("plot")
tm_shape(result) +
  tm_polygons(c("real_meth","s1_meth","s2_meth"), 
              title = c("Real","Scenario 1","Scenario 2"),
              style = "fixed", breaks = c(0, 2, 10, 100), palette = "Set1") +
  tm_facets(sync = TRUE, ncol = 3) + 
  tm_layout(legend.position = c("RIGHT", "BOTTOM"), 
            main.title = "Minimum Distance (miles) to MOUD - Methadone")

tm_shape(result) +
  tm_polygons(c("real_bup","s1_bup","s2_bup"),
              title = c("Real","Scenario 1","Scenario 2"),
              style = "fixed", breaks = c(0, 5, 20, 100), palette = "Set1") +
  tm_facets(sync = TRUE, ncol = 3) + 
  tm_layout(legend.position = c("RIGHT", "BOTTOM"), 
            main.title = "Minimum Distance (miles) to MOUD - Buprenorphine")

tm_shape(result) +
  tm_polygons(c("real_nal","s1_nal","s2_nal"),
              title = c("Real","Scenario 1","Scenario 2"),
              style = "fixed", breaks = c(0, 5, 20, 100), palette = "Set1") +
  tm_facets(sync = TRUE, ncol = 3) + 
  tm_layout(legend.position = c("RIGHT", "BOTTOM"), 
            main.title = "Minimum Distance (miles) to MOUD - Naltrexone")

tm_shape(result) + tm_polygons("ratio", style = "quantile")

