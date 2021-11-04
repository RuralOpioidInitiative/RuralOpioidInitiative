Author: Shikhar Shrestha
Date: 11/4/2021
Tufts University School of Medicine

# Metadata for dataset consisting of a list of subset of the variables needed for rurality assessment

C_href_subset = [i for i in C_href if any(b in i for b in subset_list_counties)]

subset_list_counties = ["Health01_C", "Health03_C", "Access01_C", "DS01_2018_C", "DS03_2018_C", "EC03_2018_C", "BE02_RUCA_C", "BE04_C"]            
