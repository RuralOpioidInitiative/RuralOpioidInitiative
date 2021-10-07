**Meta Data Name**: USDA Food Access 
**Last Modified**: October 5, 2021  
**Author**: Jennifer Pustz 

### Data Location: 
NationalForest at 2 spatial scales. Files can be found [here](/data_final).
* NatForest_C  
* NatForest_Z  

### Data Source(s) Description:  
The original data was obtained as a feature layer from the USDA/U.S. Forest Service Geospatial Portal (https://data-usfs.hub.arcgis.com): Forest Administrative Boundaries. This layer includes all boundaries for National Forest System lands as of the publication date of January 12, 2020.

ZIP Code Tract Area (ZCTA) and county boundary files were sourced from the [US Census Bureau, TIGER/Line Shapefiles 2018](https://www.census.gov/geographies/mapping-files/time-series/geo/carto-boundary-file.html). 

### Description of Data Processing: 
Using the Intersect tool in ArcGIS Pro (2.8), we identified ZCTAs that included area within a National Forest Boundary. We exported the table as an Excel file and used Stata 16 to add the binary variable “natforest” which defines whether the county or ZCTA includes National Forest lands. The county measure also identifies counties that border National Forest lands. 

### Key Variable and Definitions:

| Variable | Variable ID in .csv | Description |
|:---------|:--------------------|:------------|
| ZCTA5CE10 | ZCTA5CE10 | ZIP Code tabulation area number
| County FIPS | CountyFIPS | Unique 5-digit identifier for counties (state + county) |
| National Forest | natforest | Binary indicator of presence of National Forest lands in or bordering the spatial unit (yes=1)

### Data Limitations:
This dataset includes all US states, Washington D.C., and Puerto Rico. It does not include the territories Guam, Northern Mariana Islands, American Samoa, Palau. Zip code and tract centroids are not population-weighted.

### Comments/Notes:

