library(rgdal)
library(raster)
library(rgeos)
library(dismo)
library(sf)
library(PBSmapping)
library(maptools)
library(dplyr)
library(ggplot2)
library(viridis)

#########################################################
#Open project T-60 databases
#Modify directory accordingly
#See what layers are available
#########################################################
idnr_data<-'H:/OrcTech/Tyler_SSA/PublishData/IDNRStateData.gdb'
subset(ogrDrivers(), grepl("GDB", name))
idnr_data_list <- ogrListLayers(idnr_data)
print(idnr_data_list)

#Import all IL streams and watersheds
streams<-readOGR(dsn=idnr_data,layer="ReportStream")
subwatershed<-readOGR(dsn=idnr_data,layer='ReportSubwatershed')

#convert to sf object
stream_sf<-st_as_sf(streams)
subwatershed_sf<-st_as_sf(subwatershed)

#Write to file
setwd()#Set to directory of interest
st_write(stream_sf,dsn='All_SSA_Reaches',layer='All_SSA_Reaches',
         driver='ESRI Shapefile')
st_write(subwatershed_sf,dsn='All_SSA_Subwatershed',layer='All_SSA_Subwatershed',
         driver='ESRI Shapefile')


