SELECT * FROM cdc_df_import;




-- Age Separation

SELECT * 
INTO Zero_to_17 
FROM cdc_df_import
WHERE (Age_Range = '0 - 17 years');


SELECT * 
INTO Eighteen_to_49
FROM cdc_df_import
WHERE Age_Range = '18 - 49 years';

SELECT * 
INTO Fifty_to_64
FROM cdc_df_import
WHERE Age_Range = '50 - 64 years';

SELECT * 
INTO SixtyFive_plus
FROM cdc_df_import
WHERE Age_Range = '65+ years';


-- Lab-confirmed vs. Probable Cases

SELECT * INTO lab_confirmed_cases
FROM cdc_df_import
WHERE current_status = 'Laboratory-confirmed case';

SELECT * INTO probable_cases
FROM cdc_df_import
WHERE current_status = 'Probable case';


-- Separation by Sex

SELECT * INTO cases_by_sex_female
FROM cdc_df_import
WHERE sex = 'Female';

SELECT * INTO cases_by_sex_male
FROM cdc_df_import
WHERE sex = 'Male';


-- Separation by US Census Region

SELECT * INTO cases_by_region_west
FROM cdc_df_import
WHERE state IN ('WA', 'MT', 'OR', 'ID', 'WY', 'CA', 'NV', 'UT', 'CO', 'NM', 'AZ', 'AK', 'HI');

SELECT * INTO cases_by_region_south
FROM cdc_df_import
WHERE state IN ('TX', 'OK', 'AR', 'LA', 'MS', 'AL', 'GA', 'FL', 'TN', 'KY', 'WV', 'VA', 'NC', 'SC', 'MD', 'DC', 'DE');

SELECT * INTO cases_by_region_midwest
FROM cdc_df_import
WHERE state IN ('ND', 'SD', 'NE', 'KS', 'MN', 'IA', 'MO', 'WI', 'IL', 'MI', 'IN', 'OH');

SELECT * INTO cases_by_region_northeast
FROM cdc_df_import
WHERE state IN ('ME', 'NH', 'VT', 'NY', 'PA', 'NJ', 'CT', 'RI', 'MA');


-- State/County of Residence and Code

SELECT DISTINCT state, st_code
INTO states_and_codes
FROM cdc_df_import;

SELECT DISTINCT county, fips
INTO counties_and_codes
FROM cdc_df_import;


-- Counts by county

SELECT 
	fips, 
    county,
	COUNT(hosp_yn) AS hosp_count
INTO hosp_by_county
FROM cdc_df_import
WHERE hosp_yn = 'Yes'
GROUP BY fips, county;



SELECT fips, 
    county, 
    COUNT(icu_yn) AS icu_count
INTO icu_by_county
FROM cdc_df_import
WHERE icu_yn = 'Yes'
GROUP BY fips, county;

SELECT fips, 
    county, 
    COUNT(death_yn) AS death_count
INTO total_deaths_by_county
FROM cdc_df_import
WHERE death_yn = 'Yes'
GROUP BY fips, county;

-- Join County Counts into one table

SELECT hosp_by_county.fips, 
    hosp_by_county.county, 
    hosp_by_county.hosp_count,
    icu_by_county.icu_count,
    total_deaths_by_county.death_count
INTO county_counts
FROM hosp_by_county
INNER JOIN icu_by_county ON icu_by_county.fips = hosp_by_county.fips
INNER JOIN total_deaths_by_county ON total_deaths_by_county.fips = hosp_by_county.fips
ORDER BY fips;



--- adding regions column/table for analysis

SELECT *, 
 CASE
 	WHEN state in ('WA', 'MT', 'OR', 'ID', 'WY', 'CA', 'NV', 'UT', 'CO', 'NM', 'AZ', 'AK', 'HI') then 'west'
	WHEN state in ('TX', 'OK', 'AR', 'LA', 'MS', 'AL', 'GA', 'FL', 'TN', 'KY', 'WV', 'VA', 'NC', 'SC', 'MD', 'DC', 'DE') then 'south'
	WHEN state in ('ND', 'SD', 'NE', 'KS', 'MN', 'IA', 'MO', 'WI', 'IL', 'MI', 'IN', 'OH') then 'midwest'
	ELSE 'northeast'
 END AS region
INTO cdc_df_regions
FROM cdc_df_import; 

select * from cdc_df_regions;



-- adding monthly summary table 

SELECT death_yn, date_onset_month,
COUNT(death_yn) as total_deaths
INTO monthly_death_summary
FROM cdc_df_regions
WHERE death_yn = 'true'
GROUP BY death_yn, date_onset_month
ORDER BY total_deaths DESC;

select * from monthly_death_summary;