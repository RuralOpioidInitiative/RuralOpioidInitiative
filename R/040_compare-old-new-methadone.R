# Compare access for methadone, including new clinic summer 2019

library(sf)
library(units)

source("R/00_functions-included.R")
zips_centroids <- readRDS("data-output/zips_centroids.rds")
meth_new <- st_read("data-output/01_meth-new.gpkg")
  
min_dist_meth <- data.frame(`MOUD - Methadone - Nearest Distance to Centroid (mi)` = get_min_dist(meth_new),
              stringsAsFactors = FALSE)


# Save final version -------------------------------------------------------

write_csv(min_dist_meth, "data-output/min-dists-to-zip-centroid-meth-new.csv")



# Compare meth access old w meth access new -------------------------------

zips_sf <- st_read("data-output/zips.gpkg")
dists <- read_csv("data-output/min-dists-to-zip-centroid-meth-new.csv")

meth_both_sf <- right_join(dists, zips_sf, by = c("Zip" = "ZCTA5CE10"))


st_write(meth_both_sf, "data-output/meth_both_sf.gpkg", delete_dsn = TRUE)
