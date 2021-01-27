**Meta Data Name**: Foreclosure Rates, part of the Economic Factors dataset  
**Last Modified**: January 27, 2021  
**Author**: Susan Paykin  

### Data Location: 
EC04 - Policy Scan Environment Report at 3 spatial scales. Final data can be found [here](https://github.com/GeoDaCenter/opioid-policy-scan/tree/master/Policy_Scan/data_final).  
* EC04_T
* EC04_C
* EC04_S

### Data Source(s) Description:  

#### Tract
**Source:** [Neighborhood Stabilization Program (NSP2)](https://www.huduser.gov/portal/NSP2datadesc.html), U.S. Department of Housing and Urban Development, Office of Policy Development and Research, 2009. 

The Neighborhood Stabilization Program (NSP) was established for the purpose of providing emergency assistance to stabilize communities with high rates of abandoned and foreclosed homes, and to assist households whose annual incomes are up to 120 percent of the area median income (AMI). NSP2 was authorized under the American Recovery and Reinvestment Act of 2009. Data reflects 2007-2008 estimates. 

#### County and State
**Source:** [Mortgage Performance Trends](https://www.consumerfinance.gov/data-research/mortgage-performance-trends/), from the [National Mortgage Database](https://www.consumerfinance.gov/data-research/mortgage-performance-trends/about-the-data/), Consumer Financial Protection Bureau (CFPB). Data reflects 2014-2018 estimates.    

The Mortgage Performance Trends data come from the NMDB, a joint project we’ve undertaken with the Federal Housing Finance Agency (FHFA). Mortgage delinquency rates reflect the health of the mortgage market, and the health of the overall economy. The **90–day delinquency rate** is a measure of serious delinquencies. It captures borrowers that have missed three or more payments and measures severe economic distress.  

### Description of Data Source Tables:

[HUD NSP2](https://www.huduser.gov/portal/NSP2datadesc.html): This file included variables used to estimate census tract -level risk scores, including estimated number of foreclosures, rate of foreclosures, vacancy rates, number of mortgages, type of mortgages, price changes, average unemployment, and change in unemployment.  

[CFPB Mortgage Performance Trends](https://www.consumerfinance.gov/data-research/mortgage-performance-trends/):  These files included monthly 90+ day delinquency rate data aggregated by state and county, January 2008 - December 2018. 

### Description of Data Processing: 

Foreclosure and delinquency data were wrangled and cleaned, and appropriate variables selected for inclusion in final datasets. See code comments for detailed notes. For county and state datasets, the mean rate over 2014-2018 period was calculated from monthly rates.

### Key Variable and Definitions:

| Variable | Variable ID in .csv | Description |
|:---------|:--------------------|:------------|
| GEOID | GEOID | Unique identifier for census tracts (11 digits), counties (5 digits), and states (3 digits)  |
| Foreclosure rate | fordq_rate | Estimated percent of mortgages to start foreclosure process or be seriously delinquent, 2007-2008 |
| Delinquency rate | delinqR | Rate of mortgages 90+ days delinquent |

### Data Limitations:
While the NSP2 foreclosure data is from 2007-2008, the data is correlated with 2018 health and economic outcomes. 

### Comments/Notes:
