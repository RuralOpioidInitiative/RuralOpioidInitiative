**Meta Data Name**: All Places of Worship 
**Last Modified**: October 5, 2021  
**Author**: Jennifer Pustz 

### Data Location: 
Houses_Worship at 2 spatial scales. Files can be found [here](/data_final).
* HousesWorship_C  
* HousesWorship_Z  

### Data Source(s) Description:  
The original data was obtained as a feature layer from the Homeland Infrastructure Foundation-Level Data geospatial data portal: [https://hifld-geoplatform.opendata.arcgis.com/datasets/geoplatform::all-places-of-worship/explore]. The original layer includes point-level data for houses of worship as of July 1, 2020.

The All Places of Worship shapefile is based on the IRS masterfiles that contain public record of all 501(c)(3) non-profit organizations (found at https://www.irs.gov/charities-non-profits/exempt-organizations-business-master-file-extract-eo-bmf). The IRS dataset was queried to include only places of worship; addresses were geocoded to create a geospatially enabled datafile.

ZIP Code Tract Area (ZCTA) and county boundary files were sourced from the [US Census Bureau, TIGER/Line Shapefiles 2018](https://www.census.gov/geographies/mapping-files/time-series/geo/carto-boundary-file.html). 

### Description of Data Processing: 
Using the Spatial Join tool in ArcGIS Pro (2.8), we aggregated points by county and ZCTA, and exported the tables as Excel files. We retained the ZCTA5CE10 and geoid variables for joining to geographic boundary files and renamed the aggregation frequency variables created by ArcGIS as "house_worship_freq."

### Key Variable and Definitions:

| Variable | Variable ID in .csv | Description |
|:---------|:--------------------|:------------|
| ZCTA5CE10 | ZCTA5CE10 | ZIP Code tabulation area number
| County FIPS | CountyFIPS | Unique 5-digit identifier for counties (state + county) |
| House of Worship Frequency | house_worship_freq | Number of houses of worship in present in the spatial unit |

### Data Limitations:
This dataset includes all US states, Washington D.C., and Puerto Rico. It does not include the territories Guam, Northern Mariana Islands, American Samoa, Palau. Zip code and tract centroids are not population-weighted.

### Comments/Notes:
