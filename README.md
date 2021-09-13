
# [Rural Opioid Initiative](http://ruralopioidinitiative.org/)
To address the opioid and injection drug use crisis in rural America, the National Institute on Drug Abuse (NIDA), in partnership with the Appalachian Regional Commission (ARC), the Centers for Disease Control and Prevention (CDC) and the Substance Abuse and Mental Health Services Administration (SAMHSA), funded what is collectively known as the Rural Opioid Initiative (ROI) Research Consortium RFA. ROI consists of eight research teams centrally located in rural areas whose overarching aim is to help communities develop comprehensive approaches to prevent and treat outcomes related to substance use. NIDA additionally funded two consortium centers, the Next-Generation Sequencing Center for GHOSTing Hepatitis C Virus and the Rural Comorbidity and HIV consequences of Opioid use Research and Treatment Initiative Data Coordinating Center (DCC), to aid in this effort.

Driven by a common goal to help support rural people who use drugs (PWUD) and their communities, ROI brings together expert physicians, epidemiologists, and behavioral health professionals from the substance use and infectious disease fields to:

1. Build collaborations state and local communities and conduct research to assemble locally available data and conduct research to fill local data gaps (UG3 phase);
2. Use findings from the rapid assessment phase to propose locally relevant intervention projects; and
3. Implement the interventions over a period of three years (starting in 2020 - UH3 phase).

![ROI Map_FinalwoLogos_wWV_20210325](https://user-images.githubusercontent.com/87339076/130512661-8065da9b-4e4b-4887-bb66-fdc1c268e772.png)

## Acknowledgement
The original dataset was compiled by: 
GeoDaCenter Opioid Environment Policy Scan (OEPS)
Please ue the following link to access the original database: [OPES](https://github.com/GeoDaCenter/opioid-policy-scan)

## About 

## Documentation
Please refer to the [Data Documentation](https://docs.google.com/document/d/18NPWpuUfFTrKll9_ERHzVDmpNCETTzwjJt_FsIvmSrc/edit?usp=sharing). 
Make changes here



## Citation

Add citation for the DISCERNNE TEAM here

## Team
Information on DISCERNNE team here


## Data Overview

Variable constructs have been grouped thematically to highlight the multi-dimensional risk environment of opioid use in justice populations.  The variable themes are: **Geographic Boundaries, Policy, Health, Demographic, Economic, Physical Environment,** and **COVID-19**.

For more information about the individual variables, please refer to the data dictionary in the complete [Documentation](https://docs.google.com/document/d/18NPWpuUfFTrKll9_ERHzVDmpNCETTzwjJt_FsIvmSrc/edit?usp=sharing).

### Geographic Boundaries
| Variable Construct | Variable Proxy | Source | Metadata | Spatial Scale | 
|:------------------ | :------------- | :----- | :------- | :------------ | 
| Geographic Boundaries | State, County, Census Tract, Zip Code Tract Area (ZCTA) | US Census, 2018 | [Geographic Boundaries](data_final/metadata/GeographicBoundaries_2018.md) | State, County, Tract, Zip |
| Crosswalk files | County, Census Tract, Zip Code Tract Area (ZCTA) | HUD’s Office of Policy Development and Research (PD&R) | [Crosswalk Files](data_final/metadata/crosswalk.md) | County, Tract, Zip |


<br>

### Health Variables
| Variable Construct | Variable Proxy | Source | Metadata | Spatial Scale |
|:------------------ | :------------- | :----- | :------- | :------------ |
| Drug-related death rate | Death rate from drug-related causes | CDC WONDER, 2019 10-year ave. | Health01 / [Drug-Related Death Rate](data_final/metadata/Health_DrugDeaths.md) | State, County | 
| Hepatitis C infection rate | Hepatitis C infection rate | CDC NNDSS, 2018 5-year ave. | Health02 / [Hepatitis C Rate](data_final/metadata/HepC_rate.md) | State | 
| Physicians | Number of Primary Care and Specialist Physicians | Dartmouth Atlas, 2010 | Health03 / [Physicians](data_final/metadata/Health_PCPs.md) | Tract, County, State | 
| Access to MOUDs | Distance to nearest MOUD | US Census, SAMHSA, Vivitrol, 2020 | [Access01](https://github.com/DISCERNNE/RuralOpioidInitiative/blob/ROI_base/data_final/Access01_C.csv)  / [Access: MOUDs](/data_final/metadata/Access_MOUDs.md) | County, Tract, Zip | 
| Access to Health Centers | Distance to nearest FQHC | US Census, US COVID Atlas, HRSA, 2020  | Access02 / [Access: FQHCs](/data_final/metadata/Access_FQHCs_MinDistance.md) | Tract, Zip | 
| Access to Hospitals | Distance to nearest hospital | US Census, CovidCareMap, 2020 |  Access03 / [Access: Hospitals](/data_final/metadata/Acesss_Hospitals_MinDistance.md) | Tract, Zip |
| Access to Mental Health Providers |  Distance to nearest mental health provider | US Census, SAMSHA 2020 |  Access04 / [Access: Mental Health Providers](data_final/metadata/Access_MentalHealth_MinDistance.md) | Tract, Zip |
| Access to Pharmacies | Distance to nearest pharmacy | US Census, InfoGroup 2018 | Access05 / [Access: Pharmacies](/data_final/metadata/Access_Pharmacies_MinDistance.md) | Tract, Zip |

<br>

### Demographic Variables
| Variable Construct | Variable Proxy | Source | Metadata | Spatial Scale | 
|:------------------ | -------------- | ------ | -------- | ------------- | 
| Race & Ethnicity | Percentages of population defined by categories of race and ethnicity | ACS, 2018 5-year | DS01/ [Race & Ethnicity Variables](/data_final/metadata/Race_Ethnicity_2018.md) | State, County, Tract, Zip |
| Age | Age group estimates and percentages of population | ACS, 2018 5-year | DS01 / [Age Variables](/data_final/metadata/Age_2018.md) | State, County, Tract, Zip | 
| Population with a Disability | Percentage of population with a disability | ACS, 2018 5-year | DS01 / [Other Demographic Variables](/data_final/metadata/Other_Demographic_2018.md) | State, County, Tract, Zip | 
| Educational Attainment | Population without a high school degree | ACS, 2018 5-year | DS01 / [Other Demographic Variables](/data_final/metadata/Other_Demographic_2018.md) | State, County, Tract, Zip | 
| Social Determinants of Health (SDOH) | SDOH Neighborhood Typologies | Kolak et al, 2020 | DS02 / [SDOH Typology](data_final/metadata/SDOH_2014.md) | Tract | 
| Social Vulnerability Index (SVI) | SVI Rankings | CDC, 2018 | DS03 / [SVI](data_final/metadata/SVI_2018.md) | County, Tract | 


<br>

### Economic Variables
| Variable Construct | Variable Proxy | Source | Metadata | Spatial Scale | 
|:------------------ | -------------- | ------ | -------- | ------------- | 
| Employment Trends | Percentages of population employed in High Risk of Injury Jobs, Educational Services, Health Care, Retail industries | ACS, 2018 5-year | EC01/ [Jobs by Industry](/data_final/metadata/Job_Categories_byIndustry_2018.md) | State, County, Tract, Zip | 
| Unemployment Rate | Unemployment rate | ACS, 2014-2018 | EC03/ [Economic Variables](/data_final/metadata/Economic_2018.md)| State, County, Tract, Zip | 
| Poverty Rate | Percent classified as below poverty level, based on income | ACS, 2018 5-year | EC03/ [Economic Variables](/data_final/metadata/Economic_2018.md) | State, County, Tract, Zip | 
| Per Capita Income | Per capita income in the past 12 months | ACS, 2018 5-year |  EC03/ [Economic Variables](/data_final/metadata/Economic_2018.md) | State, County, Tract, Zip | 
| Foreclosure Rate | Mortgage foreclosure and severe delinquency rate | HUD, 2009 | EC04 / [Foreclosure Rate](/data_final/metadata/ForeclosureRate.md) | State, County, Tract | 

<br>

### Built Environment Variables
| Variable Construct | Variable Proxy | Source | Metadata | Spatial Scale | 
|:------------------ | -------------- | ------ | -------- | ------------- | 
| Housing Occupancy Rate | Percent occupied units | ACS, 2018 5-year | BE01 / [Housing](/data_final/metadata/Housing_2018.md) | State, County, Tract, Zip | 
| Housing Vacancy Rate | Percent vacant units | ACS, 2018 5-year | BE01 / [Housing](/data_final/metadata/Housing_2018.md) | State, County, Tract, Zip | 
| Long Term Occupancy | Percentage of population living in current housing for 20+ years | ACS, 2018 5-year | BE01 / [Housing](/data_final/metadata/Housing_2018.md) | State, County, Tract, Zip |
| Mobile Homes | Percent of housing units classified as mobile homes | ACS, 2018 5-year | BE01 / [Housing](/data_final/metadata/Housing_2018.md) | State, County, Tract, Zip | 
| Rental Rates | Percent of housing units occupied by renters  | ACS, 2018 5-year | BE01 / [Housing](/data_final/metadata/Housing_2018.md) | State, County, Tract, Zip | 
| Housing Unit Density | Housing units per square mile | ACS, 2018 5-year | BE01 / [Housing](/data_final/metadata/Housing_2018.md) | State, County, Tract, Zip |
| Urban/Suburban/Rural Classification | Classification of areas as rural, urban or suburban using percent rurality (County) or RUCA Codes (Tract, Zip) | USDA & ACS, 2014-2018 | BE02 / [Rural-Urban Classifications](/data_final/metadata/rural_urban_classifications) | County, Tract, Zip | 
| Alcohol Outlet Density | Alcohol outlets per square mile, alcohol outlets per capita | InfoGroup, 2018 | BE03 / [Alcohol Outlets](/data_final/metadata/AlcoholOutlets_2018.md)  | State, County, Tract, Zip | 
| Hypersegregated Cities | US metropolitan areas where black residents experience hypersegregation | Massey et al, 2015 | BE04 / [Community Overlays](/data_final/metadata/Overlay.md) | County | 
| Southern Black Belt | US counties where 30% of the population identified as Black or African American | US Census, 2000 | BE04 / [Community Overlays](/data_final/metadata/Overlay.md) | County | 
| Native American Reservations | Percent area of total land in Native American Reservations | US Census, TIGER, 2018 | BE04 / [Community Overlays](/data_final/metadata/Overlay.md) | County | 
| Residential Segregation Indices | Three index measures of segregation: dissimilarity, interaction, isolation | ACS, 2018 5-year | BE05 / [Residential Segregation](/data_final/metadata/Residential_Seg_Indices.md) | County |

<br>

