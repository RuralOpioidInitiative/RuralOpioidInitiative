
# [Rural Opioid Initiative](http://ruralopioidinitiative.org/)
In healthcare, geography is destiny. Increasingly assessments of health and disease outcomes report differences between populations who live in rural areas compared to those in urban areas. In doing so, they recognize that the social determinants of health, the environments in which people live, learn, work, and play, may differ greatly based factors like geography and population density. These factors have profound impact on resource allocation, access to critical healthcare services, health policy, and health outcomes. Interventions that are focused on rural communities often rely on urban-rural classification. However, a singular definition for what is “rural” has not been agreed upon.<sup>[1](https://www.researchgate.net/profile/Michael-Ratcliffe-2/publication/311533270_Defining_Rural_at_the_US_Census_Bureau/links/584aad3708aeb19dcb758910/Defining-Rural-at-the-US-Census-Bureau.pdf),[2](https://sites.nationalacademies.org/cs/groups/dbassesite/documents/webpage/dbasse_167036.pdf)</sup> Furthermore, existing designations often fail to account for the heterogeneity within rural communities. Therefore, any study built around the concept of rurality needs to define what this term means in the context of their work. 

Many assessments of health and disease outcomes report differences between populations who live in rural areas compared to those in urban areas. In doing so, they recognize that the social determinants of health, the environments in which people live, learn, work, and play, may differ greatly based factors like geography and population density. However, a singular definition for what is “rural” has not been agreed upon.1 Therefore, any study built around the concept of rurality needs to define what this term means in the context of their work. 

This website and the resources presented within are products of the Rurality Measures Work Group, which worked under broader Rural Opioid Initiative to bring together a variety of measures to describe what rurality means in the context of the opioid crisis. The work group researched and compiled a wide range of measures, traditional (Rural-Urban Continuum Codes) and non-traditional (number of Walmart stores per county or ZCTA), that reflect differences between rural and urban areas. Although some measures relate directly to the opioid crisis, such as number of syringe services programs per spatial unit, most can be applied to any research focused on rural/urban issues. These measures can be downloaded individually or as a group to be used for geospatial analysis or as covariates in regression models. While the work group worked toward a comprehensive collection, we recognize that this is an ongoing conversation and put this compilation forward as a living document to define rurality.

Driven by a common goal to help support rural people who use drugs (PWUD) and their communities, ROI brings together expert physicians, epidemiologists, and behavioral health professionals from the substance use and infectious disease fields to:

1. Build collaborations state and local communities and conduct research to assemble locally available data and conduct research to fill local data gaps (UG3 phase);
2. Use findings from the rapid assessment phase to propose locally relevant intervention projects; and
3. Implement the interventions over a period of three years (starting in 2020 - UH3 phase).

The resources presented here are the product of the Rurality Measures Work Group, which falls under the umbrella of the Rural Opioid Initiative and bring together a variety of measures to describe what rurality means in the context of the opioid crisis. The work group compiled a wide range of measures, traditional (Rural-Urban Continuum Codes) and non-traditional (number of Walmart stores per county or ZIP Code Tabulation Area (ZCTA), that reflect differences between rural and urban areas. Although some measures relate directly to the opioid crisis, such as number of syringe services programs per county or ZCTA, most can be applied to any research focused on rural/urban issues. These measures can be downloaded individually or as a group to be used for geospatial analysis or as covariates in statistical models. While the work group worked toward a comprehensive collection, we recognize that this is an ongoing conversation and put this compilation forward as a living document to define rurality. [What is Rurality?]

![ROI Map_FinalwoLogos_wWV_20210325](https://user-images.githubusercontent.com/87339076/130512661-8065da9b-4e4b-4887-bb66-fdc1c268e772.png)

## Authors
Shikhar Shrestha , Marynia Kolak, Jennifer Pustz, Susan Paykin, Angela Hetrick, Canyon Foot, Richard Jenkins, Bridget Whitney, and Thomas J. Stopka

## Acknowledgement
The original dataset was compiled by: 
GeoDaCenter Opioid Environment Policy Scan (OEPS)
Please ue the following link to access the original database: [OEPS](https://github.com/GeoDaCenter/opioid-policy-scan)


## Documentation
Please refer to the [Data Documentation](https://docs.google.com/document/d/18NPWpuUfFTrKll9_ERHzVDmpNCETTzwjJt_FsIvmSrc/edit?usp=sharing). 


## Data Overview

We have compiled a list of variables 

For more information about the individual variables, please refer to the data dictionary in the complete [Documentation](https://docs.google.com/document/d/18NPWpuUfFTrKll9_ERHzVDmpNCETTzwjJt_FsIvmSrc/edit?usp=sharing).

### Geographic Boundaries
| Variable Construct | Variable Proxy | Source | Metadata | Spatial Scale | 
|:------------------ | :------------- | :----- | :------- | :------------ | 
| Geographic Boundaries | State, County, Census Tract, Zip Code Tract Area (ZCTA) | US Census, 2018 | [Geographic Boundaries](data_final/metadata/GeographicBoundaries_2018.md) | State, County, Tract, Zip |
| Crosswalk files | County, Census Tract, Zip Code Tract Area (ZCTA) | HUD’s Office of Policy Development and Research (PD&R) | [Crosswalk Files](data_final/metadata/crosswalk.md) | County, Tract, Zip |


<br>

### Datasets
| Datasets | Spatial Scale | Metadata |
|:-------- | :------------ | :--------|
| Combined set 1 | [County](https://drive.google.com/file/d/1rLTCdZM8BHqlMyDYOMqgSKRWrQcXOFSW/view?usp=sharing) | [County level metadata](data_final/data_subset/metadata_subset_C) |
| Combined set 2 | [Census Tract](https://drive.google.com/file/d/1qhjC_4khde-yZU6Zy5LmJdrT1neWO79S/view?usp=sharing) | [Census tract level metadata](data_final/data_subset/metadata_subset_T) |
| Combined set 3 | [ZIP code tabulation area](https://drive.google.com/file/d/1-AJ6Uo7fmlpeQMU-RDenmtbGX9hZOj4A/view?usp=sharing) | [ZCTA level metadata](data_final/data_subset/metadata_subset_Z) |

### Data extraction codes
| Platform |
| :------- |
| [Python codes](https://github.com/SShresthaTufts/GithubRstudio.io/blob/main/GITHUB_ROI_data.ipynb)  |
| R codes |
<br>

