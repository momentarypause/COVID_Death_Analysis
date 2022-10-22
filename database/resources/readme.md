# Description

Readme contributions for arutledge Segment 1 Database work (Circle Role)

## Summary



## Narrative

We chose a COVID-19 dataset from the CDC. We selected because of its of large record quantity and our presumption of quality, and our belief that it 
should have good predictive qualities and plenty to explore. We liked this dataset in particular because it includes geographic data, and while we're not sure if that data will be included
within our scope at this point, it's very good to have it should we need it. 
https://data.cdc.gov/Case-Surveillance/COVID-19-Case-Surveillance-Public-Use-Data-with-Ge/n8mc-b4w4


In looking at the API documentation, I initially thought I needed to sign up for a SODA account (Socrata Open Data API) as well as obtain their app token. While going down that rabbit hole was fun, 
it turns out all I've needed (so far) to make the API call from the CDC site is the json endpoint itself (https://data.cdc.gov/resource/n8mc-b4w4.json) with no authenticating API key etc. 

In examining the data (ETL.ipynb contains my beginning data exploration code, as well as drafts for my 'production' files) I noticed that nearly all records in the data contained some form
of missing information. When Mandy, Brett, and I met outside of class hours to discuss the project, we took up this topic under the database as a whole. We chose to collect 
a large sample of records from the CDC and then drop any with NANs or values of "Unknown", "Missing", or "NA". Subsequent investigation with different samples of 1000 
records showed anywhere from 1.5% - 3.3% of the records in a given dataset could remain post-cull. I adjusted code to pull a total of 250,000 records from the API call as a precaution and buckled in 
for a fun night with my trusty computer :)

As a group we all thought this topic of missing data, removing records, etc. was a fascinating topic and one we wanted more time to investigate, but felt it was probably outside the project's scope. I know we are
interested, however, in if/how our data collection method could skew our data - are we doing everything properly with this approach, or is this level of record removal too much? This is the first "real world" scenario 
I've encountered, but I didn't imagine so much missing information!

        ~We subsequently had a discussion with Dimas, Farukh, and Alex regarding this topic and all of our null data



While my API call of 250k records was still running, I examined small sample datasets of 1000 records each from the CDC dataset using functions and methods such as .head(), .describe(), .value_counts(), and .dtypes. This process guided me to 
write several small pieces of draft cleanup code on the small datasets that will then be repurposed in the production code to clean up the large dataset from the finished API call. 
                    Explored dropping a column/s, manipulating datetime into new columns, changing dtypes, removing records based on a value, describe
Feedback from Mandy and Brett was essential during this time to help suggest better code to use, suggest approaches, discuss which dataset(s?) to use and which question to answer. I feel we're all working really well together
both in coming up with ideas and in grounding back to focus on the tasks at hand and next steps to take. 


-saved as CSV as soon as api complete




