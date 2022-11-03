# COVID_Death_Analysis
An analysis of COVID-19 deaths and possible correlating factors

## Topic
Factors contributing to the death of COVID-19 patients 

## Topic Purpose
COVID-19 has affected nearly every person on this planet in at least one way since its outbreak in early 2020.  Many people have been impacted by the death of friends and/or family and are asking why this happened and if it could have been avoided. While those heavy questions may not be able to be answered fully by simple data analysis, we hope to generate conversation by using the COVID-19 Case Surveillance Public Use Data with Geography dataset to discover connections between certain demographic and geographic factors and death of COVID-19 patients.

##  Communication Protocols
A private Slack channel will be the primary means of communication along with online face-to-face meetings via Zoom in addition to alloted class time to check in and work through complex issues together. 

- Meeting 1: Tuesday, October 18, 9:00-9:45 pm 
- Meeting 2: Wednesday, October 19, 8:00-9:00 pm 
- Meeting 3: Thursday, October 20, 6:30-9:15 pm 
- Meeting 4: Tuesday, October 25, 7:00-9:00 pm
- Meeting 5: Thursday, October 27, 7:00-9:00 pm
- Meeting 6: Tuesday, November 1, 1:00-2:30 pm
- Meeting 7: Tuesday, November 1, 7:00-9:30 pm
- Meeting 8: Wednesday, November 2, 2:15-5:00 pm

## Technologies
### Tools
- Github
- pgAdmin
- Jupyter Notebook
- Tableau
### Languages
- Python
- postgreSQL
### Libraries
- Pandas
- Numpy
- Pathlib
- sklearn
- sqlalchemy
- psycopg2
### Algorithms
- Logistic Regression
- SMOTEENN

## PRESENTATION LINK
https://docs.google.com/presentation/d/1mb-FrvVJSPmFRAVFaV_9wm2A9y0N-OhCBasbagVjU_E/edit?usp=sharing

## Questions to Answer
- What factors contributed most heavily to the deaths of people who contracted COVID-19?  
- Can this be used to build a machine learning model to predict the likelihood of death based on demographic and geographic factors?



## EXTRACT-TRANSFORM-LOAD

### Data Source -EXTRACT
https://data.cdc.gov/Case-Surveillance/COVID-19-Case-Surveillance-Public-Use-Data-with-Ge/n8mc-b4w4

This dataset is a deidentified patient-level record of reported COVID-19 cases from January 1, 2020 to present, updated once per month.  There are currently 87.3 million rows and 19 columns.  It was selected because of its large record quantity, presumption of quality, and our belief that it should have good predictive qualities and plenty to explore. We liked this dataset in particular because it includes geographic data.  The dataset includes the following factors:
- case month
- state of residence
- state FIPS code
- county of residence
- county FIPS code
- age group
- sex
- race
- ethnicity
- weeks between earliest date and date of first positive specimen collection
- weeks between earliest date and date of symptom onset
- process used to identify case
- exposure
- lab-confirmed vs. proable case
- symptomatic vs. asymptomatic
- hospitalization status
- ICU status
- death
- indication of underlying conditions (diabetes mellitus, hypertension, severe obesity (BMI>40), cardiovascular disease, chronic renal disease, chronic liver disease, chronic lung disease, other chronic diseases, immunosuppressive condition, autoimmune condition, current smoker, former smoker, substance abuse or misuse, disability, psychological/psychiatric, pregnancy, other)

An API call was placed to https://data.cdc.gov/resource/n8mc-b4w4.json to extract the data from the link above and exported to a csv file (cdc_api_df_all.csv). This code is found in the file named ETL_E_API_Export.ipynb.  

We chose to collect a large sample of records from the CDC and then drop any with NANs or values of "Unknown", "Missing", or "NA". Subsequent investigation with different samples of 1000 records showed anywhere from 1.5% - 3.3% of the records in a given dataset could remain post-cull. The code was adjusted to pull a total of 250,000 records from the API call as a precaution.

As a group we all thought this topic of missing data, removing records, etc. was a fascinating topic and one we wanted more time to investigate, but felt it was probably outside the project's scope. We are interested in if/how our data collection method could skew our data. Are we doing everything properly with this approach, or is this level of record removal too much? This is the first "real world" scenario we've encountered, but we didn't imagine so much missing information!



### Data Munging -TRANSFORM

The initial data cleanup effort (found in ETL_T&L.ipynb) occured while the API call of 250k records was still running.  Small sample datasets of 1000 records each from the CDC dataset were pulled into data frames and explored using functions and methods such as .head(), .describe(),.value_counts(), and .dtypes. This process guided several small pieces of draft cleanup code with the intention to repurpose them in the production code.

After the initial exploration, several other methods of data wrangling were used in preparation for data analysis: dropping a column/s, manipulating datetime into new columns, changing dtypes, and removing records based on a value.  The team collaborated to suggest better code to use, suggest different approaches, finalize the dataset, and narrow down which questions to explore. 


#### Observations and Limitations of the Data
- Geographical distriibution is uneven.  The original API call that pulled approximately 112,000 records only pulled one record each from several states.  After data cleanup, many of these states were eliminated due to missing values to the point we were only left with representation from about 20 states.  When broken into regions, this evened out more, however, the dataset as a whole is not representational of each state.

-- SCREENSHOT OF STATE DISTRIBUTION COUNTS AFTER CLEANUP

### Database -LOAD
-- DATABASE SCREENSHOTS of main and tables


## Data Exploration Phase
Initial data exploration was conducted in pgAdmin in the creation of the county_counts table and the total_deaths table.  The county_counts table counted the number of hospitalizations, ICU admissions, and deaths and compiled them into one table, grouped by county.  This exploration made it apparent that we lost much of the data that would have made the sample truly representative, as there were many fewer counties than the population represented.  

-- SCREENSHOT OF county_counts TABLE

The total_deaths table represents the number of deaths by month (all years combined) to get a picture of the "deadliest months."  

-- SCREENSHOT OF total_deaths TABLE

Also created using SQL was an additional table called cdc_df_regions that added another column and used conditionals to populate the US Census region for each case.  We discovered this was needed when thinking about the visualizations and the desire to break data up into the regions of the United States to compare them all together instead of using separate region tables as created initially.  Once the database and its tables were created, we were able to export cdc_df_regions into a csv file and perform data exploration and visualization in Tableau.

## Analysis Phase
Most of the analysis was conducted using Tableau, a visual analytics platform built to take in multiple data sets and allows for nearly code-free visualizations of that data.  Age Range, Hospitalization Status, ICU Admission Status, Race, US Census Region, Sex, and Symptom Status were taken into consideration and compared with the total death count to visualize any correlation.  These tables are detailed below in the Dashboards section.

## Machine Learning Model
Logistic Regression was chosen because there was a specific target that was being predicted, and the actual outcomes were known. Therefore, Supervised machine learning is the best option. Since death has a binary outcome, either the person died or they did not, Logistic regression made sense with its ability to predict binary outcomes. 


### Preliminary Data Preprocessing
After loading in the data from the SQL database, the new dataframe was printed to inspect the columns and data types. Pandas get dummies method was used to change all categorical columns so that it would be able to be analyzed by the machine learning model. Label encoder was used from the SKLearn Library one other columns that used string types such as True and False to switch it to numerical data types. Columns that were not useful for the machine learning model were dropped from the dataframe. 

### Preliminary Feature Engineering and Selection
Since the main question for the project was to use data from the CDC to predict death based off factors such as hospitalization, sex, ethnicity, and symptom status, the target selection was clearly the Death column. The remaining features were used as features for the machine learning model, except for the duplicate index columns and the state code, which was already represented from the state column.  Leaving county and state as features will allow for future analysis on whether geographic location had an impact on Covid deaths. 

### Training and Testing
Data was split into training and testing with the Train_test_split function from the SKLearn library with the default options. After noticing the balance of the target outcomes, the data was also resampled using the SMOTEEN sampling algorithm from the IMBLearn library. 

### Limitations and Benefits
The limitations include the possibility of overfitting the data, and new data would not be as predictable. Another limitation is that the logistic regression model is not as complex or robust as neural networks or deep learning models. 

### Accuracy Score



## Dashboards
The dashboards will be created using Tableau.  It will include the following dashboards organized into perspectives.  This will allow for more visualizations without crowding them onto one viewing space.

The link to the Tableau Worksheets and Dashboards is https://public.tableau.com/app/profile/mandy.glynn/viz/COVIDAnalysis_16675052127620/Reg_Hosp?publish=yes

### Distribution Dashboard
- Distribution of Cases by Region and Year
    - Packed Bubbles
    - Shows a comparison of bubble size of total cases for each region and each year
    - Filterable by Death Y/N to see the same comparison of those who died
- Distribution by Sex
    - Pie Graph
    - Shows total cases broken up by Male and Female (the "other" category was eliminated for null or missing values during data cleanup)
    - Filterable by Death Y/N to see the same comparison of those who died
- Distribution by Race
    - Horizontal Bar Graph
    - Shows total cases broken up by race
    - Filterable by Death Y/N to see the same comparison of those who died
- Distribution of Cases by Symptomatic vs. Asymptomatic
    - Chart
    - Shows total cases broken up by Asymptomatic and Symptomatic status
    - Filterable by Death Y/N to see the same comparison of those who died
- Distribution by Age Range
    - Treemap
    - Shows comparison of number of cases broken into age ranges
    - Filterable by Death Y/N to see the same comparison of those who died
### Age and Race Dashboard
- Hospitalized by Age and Race
    - Bar Graph
    - Shows a breakdown of total cases where the patient was hospitalized by age range and race
    - Filterable by Death Y/N to see how many in each category died while hospitalized
- ICU Admissions by Age and Race
    - Bar Graph
    - Shows a breakdown of total cases where the patient was admitted to the ICU by age range and race
    - Filterable by Death Y/N to see how many in each category died while in the ICU
- Deaths by Age and Race
    - Bar Graph
    - Shows a breakdown of total deaths by age range and race
    - Filter is set to Death Yn: True
### Date dashboard
- Factors by month
    - Bar Graph -stacking
    - Filterable by year and factor
- Counts over time
    - Line Graph
    - Filterable by factor to show one or more factors at a time
### Geographical dashboard
- Hospitalization, ICU, and Death by Census Region
    - 3 Bar Graphs
    - Each graph is filterable by death status to compare how many hospitalization and icu cases in each region resulted in death 
- Death Count by Location
    - Geographical map showing which states had the highest deaths by circle size




## Recommendations for Future Analysis
Considering we were only able to retain a very small percentage of the original data once null/missing/NA values were removed, an interesting exploration would be WHY those values are missing.  Did providers from a certain region/state/county routinely underreport their patient information?  Did patients from one ethnicity or race have more or less information included about their case?  What does that say about the healthcare system or providers in the United States?

## Project Reflections
### Teamwork
"We're all working really well together both in coming up with ideas and in grounding back to focus on the tasks at hand and next steps to take."

### We wish we could have...
In hindsight we would have liked a more representative sampling of the data as the large number of null and values marked as "missing" culled the majority of the rows.  This was difficult given the limitations of personal computers with limited processing power.  It took two full days of running the API call to pull 250,000 records, of which 2,800 were filled out enough to keep for analysis.  Had this been completed with more powerful machines, such as might be found in the corporate setting, we feel we would be able to pull a larger dataset in a shorter time and been able to retain more records.
