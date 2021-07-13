
######################START HERE####################################################
#require all packages
#make sure they are updated

library(sf)
library(svDialogs)
library(tidyverse)
library(rgeos)
library(tcltk)
library(rgdal)
library(raster)
library(sp)
library(secr)
library(maptools)
##########INPUT BOX FOR DATA########################################################
#inputs point shapefile
msgBox <- tkmessageBox(title = "Input point features to be jittered",
                       message = "*.shp format", icon = "info", type = "ok")
pointf=st_read(file.choose())
#file location: C:\Users\sshres07\Box\Work_folder\HealingCommunitiesStudy\Systematic

msgBox <- tkmessageBox(title = "Attention: Make sure the shapefile is clean",
                       message = "Remove unwanted/Unmatched rows", icon = "info", type = "ok")

# pointf = pointf[pointf$Score!=0,]
##########Input boundary shapefil###################################################
#inputs polygon shapefile
msgBox <- tkmessageBox(title = "Input file (polygon feature class, jittering limited to the polygon",
                       message = "*.shp format", icon = "info", type = "ok")
polyf<- st_read(file.choose())

#file location: C:\Users\sshres07\Box\Work_folder\HealingCommunitiesStudy\Systematic\MA_towns

##########Multi input box for r, R, and K##########################################
#input k-anonymity (min and max value), inner radius (r), and outer radius (R)
mink = as.numeric(dlgInput("K-anontymity parameter(numeric) min value",3)$res)

kvalue <- as.numeric(dlgInput("K-anonymity parameter(numeric)max value", 10)$res)
maxk = kvalue

epsg=dlgList(epsg$note)$res
rvalue <- as.numeric(dlgInput("Inner radius (r)", 25)$res)

Rvalue <- as.numeric(dlgInput("Outer radius (R)", 75)$res)


#method for hampton et al

polyf$d1 = sqrt((polyf$SUM_ACRES*4046.86/pi)*(mink/polyf$POP2010))
polyf$d2 = sqrt((polyf$SUM_ACRES*4046.86/pi)*(maxk/polyf$POP2010))



#########Projecting and Data cleanup###################################################
#checking projection system for polygon
popup=ifelse(st_crs(polyf)$yx==TRUE,1,0)
epsg <- make_EPSG()
code=st_crs(polyf)$epsg

#if polygon is not projected displays a popup and lets you choose from a list of EPSG

#NOTE: input the id number and not the EPSG number

if (popup==1){
  msgBox <- tkmessageBox(title = "File is not projected",
                         message = "Select appropriate PCS", icon = "info", type = "ok")
  view(epsg)
  msgBox <- tkmessageBox(title = "Alert",
                         message = "Input Id number (not epsg)", icon = "info", type = "ok")
  code=as.numeric(dlgList(epsg$code)$res)
}

#projecting the point data to the polygon
pointfproj=pointf
if(st_crs(pointf)$yx==TRUE | st_crs(pointf)$epsg !=code){
  pointfproj=st_transform(pointf, crs=st_crs(code))
}


#Obtain X any Y in meters

xy_val = cbind(st_coordinates(pointfproj)[,1], st_coordinates(pointfproj)[,2]  )
label_xy = c("xcoord","ycoord")
colnames(xy_val) = label_xy

pointfproj = cbind(pointfproj, xy_val)


#############################Creating Distance matrix###############################
#k-anonymity criteria, there are K-1 points within distance R from a points

#to make sure that the criteria is met we make a distance matrix of all points
#sort the distance matrix (ascending)
#identify the distance of the kth  (ie k-1 points within that distance)
#if dist(K) < 75, R=75, else R= dist(K)

dist_mat=matrix(0, nrow = nrow(pointfproj), ncol = nrow(pointfproj))

for(a in 1:nrow(pointfproj)){
  for(b in 1:nrow(pointfproj)){
    dist_mat[a,b]=sqrt((pointfproj$xcoord[a]-pointfproj$xcoord[b])^2 +(pointfproj$ycoord[a]-pointfproj$ycoord[b])^2)
  }
}

for (i in 1:nrow(pointfproj)){
  x = as.data.frame(dist_mat[,i])
  x=x[order(x),]
  pointfproj$Rvalue[i] = ifelse(x[kvalue] <= Rvalue, Rvalue, x[kvalue])
}

# for (i in 1:nrow(pointfproj)){
#   x = as.data.frame(dist_mat[,i])
#   x=x[order(x),]
#   pointfproj$Rvalue3[i] = ifelse(x[3] <= 75,  75, x[3])
# }
# 
# for (i in 1:nrow(pointfproj)){
#   x = as.data.frame(dist_mat[,i])
#   x=x[order(x),]
#   pointfproj$Rvalue5[i] = ifelse(x[5] <= 75,  75, x[5])
# }

mean(pointfproj$Rvalue)
# mean(pointfproj$Rvalue3)
# mean(pointfproj$Rvalue5)



#Clear here before running bimodal gaussian

###########################Jitter Bimodal Gaussian################################

#create a new base dataframe with 3 columns
#input x y coords and R value (determined from prev step)
base = data.frame(matrix(ncol=3,nrow=nrow(pointfproj)))
x = c("h","k","Rvalue")
colnames(base) = x

base$h=pointfproj$xcoord
base$k=pointfproj$ycoord
base$Rvalue= pointfproj$Rvalue

#creating a base dataframe with 4 column for input data
#input x y coords 




#jitter function
#inputs x y R-value and rvalue

#first, we use equation of a circle to jitter xy to a random point in the circle
#since we need to solve for jittered x and y, we need two equation
#first equation is that of a circle: (x-h)^2 + (y-k)^2 = a^2
  #here a = (Rvalue-rvalue)/2
#second equation is that of tan(theta)= perpendicular/base
#once we jitter x and y , we will additional noise to it
  #the noise is normally distributed with mean = jittered(x), and SD=(Rvalue-rvalue)/3 
  #assuming that the SD will encompass most of the jittered values within the donut but will probably center towards the mean

#Everything else in the jitterfunction is basic trig




jitterfunction = function(h, k, Rvalue, rvalue){
  
  rad= (Rvalue-rvalue)/2
  
  theta =runif(1, min=0, max=2*pi)
  
  b1 = (-2*h)
  
  c1 = h^2 - (rad^2)/(1+tan(theta)^2)
  
  s1 = sqrt(b1^2 - 4*c1)
  
  random = runif(1, min=0, max=1)
  
  X = ifelse(random<0.5, (-b1+s1)/2 , (-b1-s1)/2)
  
  
  b2 = (-2*k)
  
  c2 = k^2 - ((rad*tan(theta))^2/(1+tan(theta)^2))
  
  s2 = sqrt(b2^2 - 4*c2)
  
  random = runif(1, min=0, max=1)
  
  Y = ifelse(random<0.5, (-b2+s2)/2 , (-b2-s2)/2)
  
  randomY = runif(1, min=0, max=1)
  bgY = rnorm(1, mean = Y , sd=(Rvalue-rvalue)/6)
  
  randomX = runif(1, min=0, max=1)
  bgX = rnorm(1, mean= X, sd=(Rvalue-rvalue)/6)
  
  output = cbind(bgX, bgY)
  return(output)
}

#converting to spatial point dataframe
polyf_spatial = as_Spatial(polyf)

#In the following section we run the jitterfunction through out input point feature class 
#It also makes sure that the jittered points fall within our base polygon
#If a jittered point is not within the base polygon, the jitter fuction is repeated unit it is within the base polygon 
for (i in 1:nrow(base)){

a = jitterfunction(h=base$h[i], k=base$k[i] , Rvalue = base$Rvalue[i], rvalue=rvalue)
base$bgX[i] = a[1]
base$bgY[i] = a[2]

base.sub = base[i,]

#converting to spatial point dataframe
coordinates(base.sub) = cbind(base.sub$bgX, base.sub$bgY)

proj4string(base.sub) = CRS(st_crs(polyf)$wkt)

#basically withinmass is our checker, maybe is should rename it to within poly
withinmass = is.na(over(base.sub[1, ], polyf_spatial))[1]


while(withinmass==TRUE){
    print(1)
    a = jitterfunction(h=base$h[i], k=base$k[i] , Rvalue = base$Rvalue[i], rvalue=rvalue)
    base$bgX[i] = a[1]
    base$bgY[i] = a[2]
    base.sub = base[i,]
    coordinates(base.sub) = cbind(base.sub$bgX,base.sub$bgY)
    proj4string(base.sub) = CRS(st_crs(polyf)$wkt)
    withinmass = is.na(over(base.sub[1, ], polyf_spatial))[1]
    print(2)
  }
print(i)
}

#the output is base (as a dataframe)
#We assign it to a new data frame (jitter.base) and then change it to a spatial point data frame
jitter.base = base
coordinates(jitter.base) = cbind(jitter.base$bgX, jitter.base$bgY)
proj4string(jitter.base) = CRS(st_crs(polyf_spatial)$wkt)
jitter.base.nad83 =spTransform(jitter.base, CRS("+init=epsg:4326"))

org.base = base
coordinates(org.base) = cbind(org.base$h, org.base$k)
proj4string(org.base) = CRS(st_crs(polyf_spatial)$wkt)
org.base.nad83 =spTransform(org.base, CRS("+init=epsg:4326"))


####################################################################################
#Setting up the min and max R value for Hampton et al method


base2 = data.frame(matrix(ncol=4,nrow=nrow(pointfproj)))
x = c("h","k","d1", "d2")

#using d1 and d2 (inner and outer just to make sure that i know i am using a different method)
colnames(base) = x

base2$h=pointfproj$xcoord
base2$k=pointfproj$ycoord


#creating a base dataframe with 4 column for input data
#input x y coords 
base2.proj = base2

coordinates(base2.proj) = cbind(base2$h, base2$k)

proj4string(base2.proj) = CRS(st_crs(polyf)$wkt)
base2.proj@data$d1=NA
base2.proj@data$d2=NA


#takes a while but it will work

for (i in 1:nrow(polyf_spatial)){
  for (j in 1:nrow(base2.proj)){
    if(is.na(base2.proj@data$d1[j])==FALSE){
      next()
    }
    jWithini = is.na(over(base2.proj[j, ], polyf_spatial[i,]))[1]
    if (jWithini==FALSE){
      base2.proj@data$d1[j]=polyf_spatial@data$d1[i]
      base2.proj@data$d2[j]=polyf_spatial@data$d2[i]
    }
  }
}


base = data.frame(matrix(ncol=4,nrow=nrow(pointfproj)))
x = c("h","k","rvalue","Rvalue")
colnames(base) = x

base$h=base2.proj@data$h
base$k=base2.proj@data$k

base$Rvalue = base2.proj@data$d2
base$rvalue = base2.proj@data$d1


base$Rvalue= ifelse(is.na(base2.proj@data$d2)==TRUE , mean(base2.proj@data$d2, na.rm=TRUE), base2.proj@data$d2)
base$rvalue= ifelse(is.na(base2.proj@data$d1)==TRUE , mean(base2.proj@data$d1, na.rm=TRUE), base2.proj@data$d1)




for (i in 1:nrow(base)){
  
  a = jitterfunction(h=base$h[i], k=base$k[i] , Rvalue = base$Rvalue[i], rvalue=base$rvalue[i])
  base$bgX[i] = a[1]
  base$bgY[i] = a[2]
  
  base.sub = base[i,]
  
  #converting to spatial point dataframe
  coordinates(base.sub) = cbind(base.sub$bgX, base.sub$bgY)
  
  proj4string(base.sub) = CRS(st_crs(polyf)$wkt)
  
  #basically withinmass is our checker, maybe is should rename it to within poly
  withinmass = is.na(over(base.sub[1, ], polyf_spatial))[1]
  
  j=0
  print(j)
  while(withinmass==TRUE){
    print(1)
    a = jitterfunction(h=base$h[i], k=base$k[i] , Rvalue = base$Rvalue[i], rvalue=base$rvalue[i])
    base$bgX[i] = a[1]
    base$bgY[i] = a[2]
    base.sub = base[i,]
    coordinates(base.sub) = cbind(base.sub$bgX,base.sub$bgY)
    proj4string(base.sub) = CRS(st_crs(polyf)$wkt)
    withinmass = is.na(over(base.sub[1, ], polyf_spatial))[1]
    print(2)
    j=j+1
    print(j)
    if(j==10){
      base$bgX[i] = base$h[i]
      base$bgY[i] = base$k[i]
      break
    }
  }
  print(i)
}


jitter.base2 = base
coordinates(jitter.base2) = cbind(jitter.base2$bgX, jitter.base2$bgY)
proj4string(jitter.base2) = CRS(st_crs(polyf_spatial)$wkt)
jitter.base.nad83 =spTransform(jitter.base2, CRS("+init=epsg:4326"))




#plotting the points
plot(polyf_spatial)
points(jitter.base2$bgX, jitter.base2$bgY, col="red")
points(jitter.base2$h, jitter.base2$k, col="blue")

plot(polyf_spatial)
points(jitter.base$bgX, jitter.base$bgY, col="red")
points(jitter.base$h, jitter.base$k, col="blue")


setwd("C:/Users/sshres07/Box/HCS_Maps/HCSMapping_Data/JitterApp")


writeSpatialShape(jitter.base, paste0("jittered_ODRVRS_base",Sys.Date()))

writeSpatialShape(org.base, paste0("ODRVRS_base",Sys.Date()))

writeSpatialShape(jitter.base2, paste0("jittered_ODRVRS_base2",Sys.Date()))

# map <- leaflet::leaflet() %>%
#   leaflet::addProviderTiles(providers$OpenStreetMap)
# map_points = map %>% 
#   leaflet::addAwesomeMarkers(data = jitter.base.nad83,
#                              icon = awesomeIcons(
#                                library = "ion",
#                                iconColor ="white"
#                              )
#   ) %>%
#   leaflet::addAwesomeMarkers(data = org.base.nad83,
#                              icon = awesomeIcons(
#                                library = "ion",
#                                iconColor ="white",
#                                markerColor = "red"
#                              )
#   )



map_points
