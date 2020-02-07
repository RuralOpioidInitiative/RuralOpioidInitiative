# Create dataset with new facilities

library(sf)
meth_old <- read_sf("data-output/01_meth.gpkg")

meth_new <- read_csv("data/methadone-new_2020-01-10.csv") %>% 
  st_as_sf(coords = c("lon", "lat")) %>% 
  st_set_crs(4326) %>% 
  st_transform(32616) %>% 
  rename(geom = geometry) %>% 
  rbind(meth_old)

st_write(meth_new, "data-output/01_meth-new.gpkg")