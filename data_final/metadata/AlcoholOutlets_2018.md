**Meta Data Name**: Alcohol Outlet Density  
**Last Modified**: January 12, 2021   
**Author**: Susan Paykin    

### Data Location: 
BE03 at 4 spatial scales. Files can be found [here](/data_final).
* BE03_S 
* BE03_C
* BE03_T  
* BE03_Z 

### Data Source(s) Description:  
Alcohol outlet locations are from Infogroup's 2018 Business and Consumer Historical Datafile. State, county, census tract, and ZIP Code Tract Area (ZCTA) geometry files are from the U.S. Census TIGER/Line Shapefiles 2018. 

### Description of Data Source Tables: 

From Infgroup, key variables include point location data and *Primary.NAICS.Code*, which was filtered for the the following NAICS codes for BEER, WINE, & LIQUOR STORES:
* 44531001
* 44531002 
* 44531004 
* 44531005 
* 44531006 
* 44531007

From U.S. Census/TIGER files, key variables include: 
* ALAND - Land area, or an area measurement providing the size, in square meters, of the land portions of geographic entities for which the Census Bureau tabulates and disseminates data.

### Description of Data Processing: 

Alcohol outlet locations were sourced from the Infogroup Historical Datafile, which was filtered by NAICS code 445310 (*BEER, WINE, & LIQUOR STORES*). Location data was then cleaned and converted to spatial data. Total outlet counts were calculated via point-in-polygon procedure where outlets points were merged with geometries, then counted & summed by state, county, tract, and zip codes.

Land area in sq meters was sourced from geometry files and converted to sq miles (1 sq mi = 2,590,000 sq m).

Alcohol outlet density was then calculated as: 
  * Geographic density: Total outlets / Land area in sq mi
  * Per capita density: Total outlets / Total population

### Key Variable and Definitions:

| Variable | Variable ID in .csv | Description |
|:---------|:--------------------|:------------|
| Alcohol outlet density per land area | alcDens | Number of alcohol outlets per square mile |
| Alcohol outlet density per capita | alcPerCap | Number of alcohol outlets per capita |
| Total alcohol outlets | alcTotal | Total number of alcohol outlets |
| Total area | areaSqMi | Land area of geography in sq miles |
| Total population | totPopE | Total population estimate |

### Data Limitations: 
Alcohol outlet density is one approximation for accessibility or demand, though a limited one for describing or understanding the complex relationship between alcohol consumption and the surrounding area or communithy. 

The category of 'alcohol outlets' included in this dataset does not include supermarkets and/or drug stores that may carry beer, wine, or liquor. The laws governing these sales varies from state to state, permitting alcohol sales in different kind of sales outlets. Outlets that are permitted to make these sales may not always fall under the same NAICS code for *Beer, Wine, and Liquor Stores*. 

### Comments/Notes:

This dataset includes U.S. states and Washington, D.C. It does not include U.S. territories FM, GU, MP, PR, or VI.
