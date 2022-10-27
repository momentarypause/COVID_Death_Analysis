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
### Algorithms
- Logistic Regression


## Questions to Answer
- What factors contributed most heavily to the deaths of people who contracted COVID-19?  
- Can this be used to build a machine learning model to predict the likelihood of death based on demographic and geographic factors?



## Data Source
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



## Database
The preliminary database is a small sample of 300 records from the main dataset, saved into a csv file. This was read into the machine learning model as a test after using label encoder to numerize the categorical data. 


## Machine Learning Model
The machine learning model we chose for this project is a Logistic Regression Model because it will categorize the results into two parts: death-yes or death-no. This will effectively answer the question if COVID deaths can be predicted based on several factors or underlying conditions.

### Limitations and Benefits

### Preliminary Data Preporocessing
In examining the data (ETL.ipynb contains beginning data exploration code, as well as drafts for 'production' files) I noticed that nearly all records in the data contained some form of missing information. When Mandy, Brett, and I met outside of class hours to discuss the project, we took up this topic under the database as a whole. We chose to collect a large sample of records from the CDC and then drop any with NANs or values of "Unknown", "Missing", or "NA". Subsequent investigation with different samples of 1000 records showed anywhere from 1.5% - 3.3% of the records in a given dataset could remain post-cull. I adjusted code to pull a total of 250,000 records from the API call as a precaution and buckled in for a fun night with my trusty computer.

As a group we all thought this topic of missing data, removing records, etc. was a fascinating topic and one we wanted more time to investigate, but felt it was probably outside the project's scope. I know we are interested, however, in if/how our data collection method could skew our data. Are we doing everything properly with this approach, or is this level of record removal too much? This is the first "real world" scenario we've encountered, but we didn't imagine so much missing information!

While the API call of 250k records was still running, I examined small sample datasets of 1000 records each from the CDC dataset using functions and methods such as .head(), .describe(), .value_counts(), and .dtypes. This process guided me to write several small pieces of draft cleanup code on the small datasets that will then be repurposed in the production code to clean up the large dataset from the finished API call. I explored dropping a column/s, manipulating datetime into new columns, changing dtypes, removing records based on a value.  Feedback from Mandy and Brett was essential during this time to help suggest better code to use, suggest approaches, discuss which dataset(s?) to use and which question to answer. I feel we're all working really well together both in coming up with ideas and in grounding back to focus on the tasks at hand and next steps to take.


1. ETL_E_API_Export.ipynb 
- API call to https://data.cdc.gov/resource/n8mc-b4w4.json
(from https://data.cdc.gov/Case-Surveillance/COVID-19-
Case-Surveillance-Public-Use-Data-with-Ge/n8mc-b4w4)
- Exported ‘cdc_api_df_all.csv’
2. ETL_T&L.ipynb
- Loads ‘cdc_api_df_all.csv’
- Cleans data, first pass
- Exports ‘provisionaldb.csv’
- Creates pgAdmin db ‘COVID_MSU

### Preliminary Feature Engineering and Selection

### Training and Testing

### Accuracy Score



## Data Exploration


## Analysis



## Recommendations for Future Analysis
Considering we were only able to retain a very small percentage of the original data once null/missing/NA values were removed, an interesting exploration would be WHY those values are missing.  Did providers from a certain region/state/county routinely underreport their patient information?  Did patients from one ethnicity or race have more or less information included about their case?  What does that say about the healthcare system or providers in the United States?

## Project Reflections
