-- sql from test database work while API chugs along

-- There is a lot of SQL built-in already that I could copy for the production DB once its live.


-- This code is draft tinkering...


-- create PK
ALTER TABLE pretend_cleaned_cdc_data
   ADD CONSTRAINT Master_Case_ID
      PRIMARY KEY (index);  
	  
SELECT * FROM pretend_cleaned_cdc_data;



-- Creating Table of Deaths per Month
-- No FK yet
SELECT cdc.death_yn_b, cdc.case_onset_month,
COUNT(cdc.death_yn_b = 'True') as total_deaths
INTO monthly_death_summary
FROM pretend_cleaned_cdc_data as cdc
GROUP BY cdc.death_yn_b, cdc.case_onset_month
ORDER BY total_deaths DESC;
-- I'm thinking FK here would just be month? seems stupid but... then each case record is tied to the total deaths per month
-- could also do it per year
-- hell, could also do it for survivors
-- can you do it in a single table of monthly summaries
-- single table of annual summaries



SELECT * FROM monthly_death_summary;
