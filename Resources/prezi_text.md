<!-- 
✓ Selected topic
✓ Reason why they selected their topic
✓ Description of their source of data
✓ Questions they hope to answer with the data
✓ Description of the data exploration phase of the project
✓ Description of the analysis phase of the project
✓ Technologies, languages, tools, and algorithms used throughout the project
( segment 4 ) Result of analysis
( segment 4 ) Recommendation for future analysis
( segment 4 ) Anything the team would have done differently
 -->


.
Reason Why (section v. slide?)
    - topic engaged us all equally
    - all felt we would have abundance of data to explore


Data Source Slide

    - A public use dataset of 90M+ records from CDC
    - Jan 1, 2020 - present
    - Patient records de-identified
    - Includes demographics, geography, COVID severity/outcomes
    - Data mostly boolean or categorical (age values as ranges)

prezi data source count image
prezi data source detail image

Data Exploration Slide

    - Got to know data/distributions with .head(), .describe(), .isnull().sum(), .value_counts(), .dtypes
    - Incomplete v. bad
    - Drop nulls, handling 'missing' values: 1) columns, 2) rows
    - Change/proof data types
    - to SQL/db

Data Analysis Slide  (my pieces from database, if you'd like to use)
    - pgAdmin tables