# COVID_Death_Analysis
An analysis of COVID-19 deaths and possible correlating factors

## Topic
Factors contributing to the death of COVID-19 patients 

## Topic Purpose
COVID-19 has affected nearly every person on this planet in at least one way since its outbreak in early 2020.  Many people have been impacted by the death of friends and/or family and are asking why this happened and if it could have been avoided. While those heavy questions may not be able to be answered fully by simple data analysis, we hope to generate conversation by using the COVID-19 Case Surveillance Public Use Data with Geography dataset to discover connections between certain demographic and geographic factors and death of COVID-19 patients.

##  Communication Protocols
A private Slack channel will be the primary means of communication along with online face-to-face meetings via Zoom in addition to alloted class time to check in and work through complex issues together. 

Meeting 1: Tuesday, October 18, 9:00-9:45 pm
Meeting 2: Wednesday, October 19, 8:00-9:00 pm
Meeting 3: Thursday, October 20, 6:30-9:15 pm
Meeting 4: Tuesday, October 25, 6:30-9:30 pm

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
### Algorithms


## Questions to Answer
- What factors contributed most heavily to the deaths of people who contracted COVID-19?  
- Can this be used to build a machine learning model to predict the likelihood of death based on demographic and geographic factors?



## Data Source
https://data.cdc.gov/Case-Surveillance/COVID-19-Case-Surveillance-Public-Use-Data-with-Ge/n8mc-b4w4

This dataset is a deidentified patient-level record of reported COVID-19 cases from January 1, 2020 to present, updated once per month.  There are currently 87.3 million rows and 19 columns.  It includes the following factors:
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



## Machine Learning Model
The machine learning model we chose for this project is a Logistic Regression Model because it will categorize the results into two parts: yes or no. This will effectively answer the question if COVID deaths can be predicted based on several factors or underlying conditions.

### Limitations and Benefits

### Preliminary Data Preporocessing

### Preliminary Feature Engineering and Selection

### Training and Testing

### Accuracy Score



## Data Exploration


## Analysis


## Project Outline


## Recommendations for Future Analysis


## Project Reflections