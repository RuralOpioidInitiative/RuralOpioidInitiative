## Geographic Regions within 5 Miles of a United States Interstate

### Data Location

Within_5_miles_of_Interstate at 2 spatial scales:

•	Within_5_miles_of_Interstate_Z

•	Within_5_miles_of_Interstate_C

### Data Source(s) Description

The U.S. Interstate system was established for the movement of both military and civilian equipment, freight, and personnel over long distances between and within states (Federal Highway Administration, 2010). The idea for the U.S. interstate system was generated in the 1930’s, and eventually came to fruition with federal funding and support in 1956 through the efforts of President Eisenhower (Federal Highway Administration, 2019).The total length of U.S. interstate system is 46,876 miles.

2018 County, 2018 Zip Code Tabulation Area (ZCTA), and 2019 U.S. interstate system variables were obtained from the U.S. Census Bureau. The U.S. interstate system is geographically represented as lines in the “primary roads” shapefile. The primary roads shapefile includes divided limited-access highways within the Federal interstate highway system or under state management (United States Census Bureau, 2021).

### Description of Data Source Tables

The data source location contains geographic regions that are within 5 miles (“as the crow flies”) of any U.S. interstate.

The tables includes (if present) U.S. Interstate Systems in the U.S. territories American Samoa, Guam, Northern Mariana Islands, Puerto Rico, U.S. Virgin Islands, and Washington, DC. 

#### Description of Data Processing

We used the following methods to generate the data files:
1.	The U.S. counties, ZCTAs, and primary road shapefiles were imported into ArcGIS Pro 2.8.2.
2.	We generated a 5-mile buffer around the U.S. interstate system layer.
3.	We used the pairwise intersection tool in ArcGIS to create county and ZCTA layers that intersected with the 5-mile buffer around the U.S. interstate system.
4.	We joined the original county and ZCTA files with the layers that included geographic regions within 5 miles of the U.S. interstate system.
5.	We exported the complete county and ZCTA layers into excel files.

### Key Variable and Definitions
| Variable |	Variable ID in .xlsx |	Description|
|:-------- |:--------------------- |:----------- |
|County FIPS Code |	COUNTYFP |	U.S. County Federal Information Processing System (FIPS) Code |
|State FIPS Code |	STATEFP |	U.S. State Federal Information Processing System (FIPS) Code |
|ZCTA |	ZCTA |	Zip Code Tabulation Area |
|Geographic region is within 5 miles of U.S. Interstate (yes/no) |	INTERSTATE_5MILE	| Geographic region is within 5 miles (“as the crow flies”) of U.S. Interstate (1= “Yes,” 0= “No”)|

Data Limitations

N/A.

Comments/Notes

N/A.


## Geographic Regions that contain Walmart Retailers

# Data Location

Walmart at 3 spatial scales:

•	Walmart_Z

•	Walmart_C

•	Walmart_S

### Data Source(s) Description

Walmart is the largest retailer in the world based on a fiscal year 2021 revenue of $559 billion, employs 1.6 million people in the U.S., and has 3,570 Walmart Supercenters in the United States (Walmart, 2021a). Walmart Supercenters combine a grocery store with fresh produce, bakery, deli, and dairy products with electronics, apparel, toys, and home furnishings (Walmart, 2021b).  Several Walmart Supercenters include banks, hair and nail salons, restaurants, and vision centers. In comparison, Walmart stores only offer electronics, apparel, toys, home furnishings, health and beauty aids, and hardware.

Locations of Walmart Supercenters and Walmart stores were obtained from the Walmart Store Status Web Map. We obtained 2018 U.S. state, county, and zip code tabulation area (ZCTA) shapefiles from the U.S. Census Bureau.

Description of Data Source Tables

The data source contains geographic regions that contain locations of open Walmart Supercenters and Walmart stores in the United States as of August 23, 2021.

The tables includes (if present) Walmart stores and Supercenters in the U.S. territories American Samoa, Guam, Northern Mariana Islands, Puerto Rico, U.S. Virgin Islands, and Washington, DC. 
Description of Data Processing

We used the following methods to generate the data files:

1.	We downloaded and imported the Walmart Store Status Map into ArcGIS Pro 2.8.2.
2.	We exported the data table of the Walmart Store Status Map into an excel file.
3.	We deleted all retail locations that were not classified as a “Walmart Supercenter” or “Walmart.”
4.	We removed all locations that were listed “N”, or “no,” for “open status.” 
5.	To generate the county-level xlsx file:
o	We applied the county FIPS code to the address of each Walmart Supercenter or Walmart. 
o	We deleted all variables except for the county FIPS codes and the presence of a Walmart store in each county.
o	We aggregated Walmart locations by county FIPS codes to create a “count” variable that provided the number of Walmart stores in each county.
o	We added the remaining county FIPS codes as having “0” Walmart locations to generate a complete file that included all U.S. counties.
6.	To generate the ZCTA-level xlsx file:
o	we deleted all variables except for the zip code associated with each Walmart location, and the presence of an open Walmart store in the region (‘Y’ for “yes”). 
o	We aggregated Walmart locations by ZCTA to create a “count” variable that provided the number of Walmart stores in each ZCTA.
o	We added the remaining ZCTAs as having “0” Walmart locations to generate a complete file that included all U.S. ZCTAs.
7.	To generate the state-level .xlsx file, we included all state FIPS codes and the presence of an open Walmart store in the region. All U.S. states have at least one Walmart store. We also We aggregated Walmart locations by state to create a “count” variable that provided the number of Walmart stores in each state.

### Key Variable and Definitions 
| Variable | Variable ID in .xlsx |	Description |
|:-------- |:-------------------- |:----------- |
| Presence of Walmart in Geographic Region (Yes/No)	| WALMART_YN	| All counties, states, and zip codes that include a Walmart or Walmart Supercenter (‘1’) and do not include a Walmart (‘0’) |
| Number of Walmart stores in Geographic Region (count) |	WALMART_COUNT| 	The total number of Walmart stores and Walmart Superstores in a geographic region |
| County FIPS Code | COUNTYFP |	U.S. County Federal Information Processing System (FIPS) Code |
| State FIPS Code	| STATEFP	| U.S. State Federal Information Processing (FIPS) Code |
| ZCTA | ZCTA |	Zip Code Tabulation Area |

### Data Limitations

N/A.

### Comments/Notes:

N/A.

### References

Federal Highway Administration. (2010). Interstate System Access Informational Guide. Washington, DC Retrieved from https://www.fhwa.dot.gov/design/interstate/pubs/access/access.pdf

Federal Highway Administration. (2019). Interstate System. Retrieved from https://www.fhwa.dot.gov/programadmin/interstate.cfm

United States Census Bureau. (2021). TIGER/Line Shapefiles Technical Documentation.  Retrieved from https://www2.census.gov/geo/pdfs/maps-data/data/tiger/tgrshp2021/TGRSHP2021_TechDoc.pdf

Walmart. (2021a). About Us. Retrieved from https://corporate.walmart.com/our-story

Walmart. (2021b). Our Business. Retrieved from https://corporate.walmart.com/our-story/our-business

