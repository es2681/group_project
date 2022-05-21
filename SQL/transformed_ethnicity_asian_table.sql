/*CREATING TABLES*/
DROP TABLE IF EXISTS ethnicity;
CREATE TABLE ethnicity (
     DBN VARCHAR(10) NOT NULL,
     School_Name VARCHAR(100),
	 Category VARCHAR (100),
	Cohort_Year INT,
	Cohort VARCHAR(100),
	Num_Total_Cohort INT,
	Num_Grads INT,
	Percent_Grads FLOAT,
	Num_Total_Regents INT,
	Percent_Total_Regents_Cohort FLOAT,
	Percent_Total_Regents_Grads FLOAT,
	Num_Ad_Regents INT,
	Percent_Ad_Regents_Cohort FLOAT,
	Percent_Ad_Regents_Grads FLOAT,
	Num_Regents_Without_Ad INT,
	Percent_Regents_Without_Cohort FLOAT,
	Percent_Regents_Without_Grads FLOAT,
	Num_Local INT,
	Percent_Local_Cohort FLOAT,
	Percent_Local_Grads FLOAT,
	Num_Still_Enrolled INT,
	Percent_Still_Enrolled FLOAT,
	Num_Dropout INT,
	Percent_Dropout FLOAT
);

SELECT * FROM ethnicity;

/*DROPPING columns*/
ALTER TABLE ethnicity
DROP COLUMN percent_total_regents_grads, DROP percent_ad_regents_grads, 
DROP num_regents_without_ad, DROP percent_regents_without_cohort, 
DROP percent_regents_without_grads, DROP num_local, 
DROP percent_local_cohort, DROP percent_local_grads, 
DROP num_still_enrolled, DROP percent_still_enrolled;

SELECT * FROM ethnicity;

/*Only viewing 4 years June & Asians*/
SELECT DISTINCT 
dbn,
school_name,
cohort_year,
num_total_cohort AS asian_num_total_cohort,
num_grads AS asian_num_grads,
percent_grads AS asian_percent_grads,
num_total_regents AS asian_num_total_regents,
percent_total_regents_cohort AS asian_percent_total_regents_cohort,
num_ad_regents AS asian_num_ad_regents,
percent_ad_regents_cohort AS asian_percent_ad_regents_cohort,
num_dropout AS asian_num_dropout,
percent_dropout AS asian_percent_dropout
FROM ethnicity
WHERE cohort = '4 year June'
AND category = 'Asian'
ORDER BY dbn, cohort_year DESC
;


/*CREATING transformed_all_table*/
SELECT DISTINCT 
dbn,
school_name,
cohort_year,
num_total_cohort AS asian_num_total_cohort,
num_grads AS asian_num_grads,
percent_grads AS asian_percent_grads,
num_total_regents AS asian_num_total_regents,
percent_total_regents_cohort AS asian_percent_total_regents_cohort,
num_ad_regents AS asian_num_ad_regents,
percent_ad_regents_cohort AS asian_percent_ad_regents_cohort,
num_dropout AS asian_num_dropout,
percent_dropout AS asian_percent_dropout
INTO transformed_ethnicity_asian_table
FROM ethnicity
WHERE cohort = '4 year June'
AND category = 'Asian'
ORDER BY dbn, cohort_year DESC
;

SELECT * FROM transformed_ethnicity_asian_table;

/*Only viewing 4 years June & Black*/
SELECT DISTINCT 
dbn,
school_name,
cohort_year,
num_total_cohort AS black_num_total_cohort,
num_grads AS black_num_grads,
percent_grads AS black_percent_grads,
num_total_regents AS black_num_total_regents,
percent_total_regents_cohort AS black_percent_total_regents_cohort,
num_ad_regents AS black_num_ad_regents,
percent_ad_regents_cohort AS black_percent_ad_regents_cohort,
num_dropout AS black_num_dropout,
percent_dropout AS black_percent_dropout
FROM ethnicity
WHERE cohort = '4 year June'
AND category = 'Black'
ORDER BY dbn, cohort_year DESC
;

SELECT DISTINCT 
dbn,
school_name,
cohort_year,
num_total_cohort AS black_num_total_cohort,
num_grads AS black_num_grads,
percent_grads AS black_percent_grads,
num_total_regents AS black_num_total_regents,
percent_total_regents_cohort AS black_percent_total_regents_cohort,
num_ad_regents AS black_num_ad_regents,
percent_ad_regents_cohort AS black_percent_ad_regents_cohort,
num_dropout AS black_num_dropout,
percent_dropout AS black_percent_dropout
INTO transformed_ethnicity_black_table
FROM ethnicity
WHERE cohort = '4 year June'
AND category = 'Black'
ORDER BY dbn, cohort_year DESC
;

SELECT * FROM transformed_ethnicity_black_table;

/*Only viewing 4 years June & HISPANIC*/
SELECT DISTINCT 
dbn,
school_name,
cohort_year,
num_total_cohort AS hispanic_num_total_cohort,
num_grads AS hispanic_num_grads,
percent_grads AS hispanic_percent_grads,
num_total_regents AS hispanic_num_total_regents,
percent_total_regents_cohort AS hispanic_percent_total_regents_cohort,
num_ad_regents AS hispanic_num_ad_regents,
percent_ad_regents_cohort AS hispanic_percent_ad_regents_cohort,
num_dropout AS hispanic_num_dropout,
percent_dropout AS hispanic_percent_dropout
FROM ethnicity
WHERE cohort = '4 year June'
AND category = 'Hispanic'
ORDER BY dbn, cohort_year DESC
;

SELECT DISTINCT 
dbn,
school_name,
cohort_year,
num_total_cohort AS hispanic_num_total_cohort,
num_grads AS hispanic_num_grads,
percent_grads AS hispanic_percent_grads,
num_total_regents AS hispanic_num_total_regents,
percent_total_regents_cohort AS hispanic_percent_total_regents_cohort,
num_ad_regents AS hispanic_num_ad_regents,
percent_ad_regents_cohort AS hispanic_percent_ad_regents_cohort,
num_dropout AS hispanic_num_dropout,
percent_dropout AS hispanic_percent_dropout
INTO transformed_ethnicity_hispanic_table
FROM ethnicity
WHERE cohort = '4 year June'
AND category = 'Hispanic'
ORDER BY dbn, cohort_year DESC
;
SELECT * FROM transformed_ethnicity_hispanic_table;

/*Only viewing 4 years June & white*/
SELECT DISTINCT 
dbn,
school_name,
cohort_year,
num_total_cohort AS white_num_total_cohort,
num_grads AS white_num_grads,
percent_grads AS white_percent_grads,
num_total_regents AS white_num_total_regents,
percent_total_regents_cohort AS white_percent_total_regents_cohort,
num_ad_regents AS white_num_ad_regents,
percent_ad_regents_cohort AS white_percent_ad_regents_cohort,
num_dropout AS white_num_dropout,
percent_dropout AS white_percent_dropout
FROM ethnicity
WHERE cohort = '4 year June'
AND category = 'White'
ORDER BY dbn, cohort_year DESC
;

SELECT DISTINCT 
dbn,
school_name,
cohort_year,
num_total_cohort AS white_num_total_cohort,
num_grads AS white_num_grads,
percent_grads AS white_percent_grads,
num_total_regents AS white_num_total_regents,
percent_total_regents_cohort AS white_percent_total_regents_cohort,
num_ad_regents AS white_num_ad_regents,
percent_ad_regents_cohort AS white_percent_ad_regents_cohort,
num_dropout AS white_num_dropout,
percent_dropout AS white_percent_dropout
INTO transformed_ethnicity_white_table
FROM ethnicity
WHERE cohort = '4 year June'
AND category = 'White'
ORDER BY dbn, cohort_year DESC
;
SELECT * FROM transformed_ethnicity_white_table

/*Only viewing 4 years June & NATIVE AMERICAN*/
SELECT DISTINCT 
dbn,
school_name,
cohort_year,
num_total_cohort AS native_american_num_total_cohort,
num_grads AS native_american_num_grads,
percent_grads AS native_american_percent_grads,
num_total_regents AS native_american_num_total_regents,
percent_total_regents_cohort AS native_american_percent_total_regents_cohort,
num_ad_regents AS native_american_num_ad_regents,
percent_ad_regents_cohort AS native_american_percent_ad_regents_cohort,
num_dropout AS native_american_num_dropout,
percent_dropout AS native_american_percent_dropout
FROM ethnicity
WHERE cohort = '4 year June'
AND category = 'Native American'
ORDER BY dbn, cohort_year DESC
;

SELECT DISTINCT 
dbn,
school_name,
cohort_year,
num_total_cohort AS native_american_num_total_cohort,
num_grads AS native_american_num_grads,
percent_grads AS native_american_percent_grads,
num_total_regents AS native_american_num_total_regents,
percent_total_regents_cohort AS native_american_percent_total_regents_cohort,
num_ad_regents AS native_american_num_ad_regents,
percent_ad_regents_cohort AS native_american_percent_ad_regents_cohort,
num_dropout AS native_american_num_dropout,
percent_dropout AS native_american_percent_dropout
INTO transformed_ethnicity_native_american_table
FROM ethnicity
WHERE cohort = '4 year June'
AND category = 'Native American'
ORDER BY dbn, cohort_year DESC
;
SELECT * FROM transformed_ethnicity_native_american_table

/*Only viewing 4 years June & Multi-Racial*/
SELECT DISTINCT 
dbn,
school_name,
cohort_year,
num_total_cohort AS multi_racial_num_total_cohort,
num_grads AS multi_racial_num_grads,
percent_grads AS multi_racial_percent_grads,
num_total_regents AS multi_racial_num_total_regents,
percent_total_regents_cohort AS multi_racial_percent_total_regents_cohort,
num_ad_regents AS multi_racial_num_ad_regents,
percent_ad_regents_cohort AS multi_racial_percent_ad_regents_cohort,
num_dropout AS multi_racial_num_dropout,
percent_dropout AS multi_racial_percent_dropout
FROM ethnicity
WHERE cohort = '4 year June'
AND category = 'Multi-Racial'
ORDER BY dbn, cohort_year DESC
;

SELECT DISTINCT 
dbn,
school_name,
cohort_year,
num_total_cohort AS multi_racial_num_total_cohort,
num_grads AS multi_racial_num_grads,
percent_grads AS multi_racial_percent_grads,
num_total_regents AS multi_racial_num_total_regents,
percent_total_regents_cohort AS multi_racial_percent_total_regents_cohort,
num_ad_regents AS multi_racial_num_ad_regents,
percent_ad_regents_cohort AS multi_racial_percent_ad_regents_cohort,
num_dropout AS multi_racial_num_dropout,
percent_dropout AS multi_racial_percent_dropout
INTO transformed_ethnicity_multi_racial_table
FROM ethnicity
WHERE cohort = '4 year June'
AND category = 'Multi-Racial'
ORDER BY dbn, cohort_year DESC
;

SELECT * FROM transformed_ethnicity_multi_racial_table

/*Joining all ethnicities into one table*/
SELECT DISTINCT 
ethnicity.dbn,
ethnicity.school_name,
ethnicity.cohort_year,
transformed_ethnicity_asian_table.asian_num_total_cohort,
transformed_ethnicity_asian_table.asian_num_grads,
transformed_ethnicity_asian_table.asian_percent_grads,
transformed_ethnicity_asian_table.asian_num_total_regents,
transformed_ethnicity_asian_table.asian_percent_total_regents_cohort,
transformed_ethnicity_asian_table.asian_num_ad_regents,
transformed_ethnicity_asian_table.asian_percent_ad_regents_cohort,
transformed_ethnicity_asian_table.asian_num_dropout,
transformed_ethnicity_asian_table.asian_percent_dropout,
transformed_ethnicity_black_table.black_num_total_cohort,
transformed_ethnicity_black_table.black_num_grads,
transformed_ethnicity_black_table.black_percent_grads,
transformed_ethnicity_black_table.black_num_total_regents,
transformed_ethnicity_black_table.black_percent_total_regents_cohort,
transformed_ethnicity_black_table.black_num_ad_regents,
transformed_ethnicity_black_table.black_percent_ad_regents_cohort,
transformed_ethnicity_black_table.black_num_dropout,
transformed_ethnicity_black_table.black_percent_dropout,
transformed_ethnicity_hispanic_table.hispanic_num_total_cohort,
transformed_ethnicity_hispanic_table.hispanic_num_grads,
transformed_ethnicity_hispanic_table.hispanic_percent_grads,
transformed_ethnicity_hispanic_table.hispanic_num_total_regents,
transformed_ethnicity_hispanic_table.hispanic_percent_total_regents_cohort,
transformed_ethnicity_hispanic_table.hispanic_num_ad_regents,
transformed_ethnicity_hispanic_table.hispanic_percent_ad_regents_cohort,
transformed_ethnicity_hispanic_table.hispanic_num_dropout,
transformed_ethnicity_hispanic_table.hispanic_percent_dropout,
transformed_ethnicity_white_table.white_num_total_cohort,
transformed_ethnicity_white_table.white_num_grads,
transformed_ethnicity_white_table.white_percent_grads,
transformed_ethnicity_white_table.white_num_total_regents,
transformed_ethnicity_white_table.white_percent_total_regents_cohort,
transformed_ethnicity_white_table.white_num_ad_regents,
transformed_ethnicity_white_table.white_percent_ad_regents_cohort,
transformed_ethnicity_white_table.white_num_dropout,
transformed_ethnicity_white_table.white_percent_dropout,
transformed_ethnicity_native_american_table.native_american_num_total_cohort,
transformed_ethnicity_native_american_table.native_american_num_grads,
transformed_ethnicity_native_american_table.native_american_percent_grads,
transformed_ethnicity_native_american_table.native_american_num_total_regents,
transformed_ethnicity_native_american_table.native_american_percent_total_regents_cohort,
transformed_ethnicity_native_american_table.native_american_num_ad_regents,
transformed_ethnicity_native_american_table.native_american_percent_ad_regents_cohort,
transformed_ethnicity_native_american_table.native_american_num_dropout,
transformed_ethnicity_native_american_table.native_american_percent_dropout,
transformed_ethnicity_multi_racial_table.multi_racial_num_total_cohort,
transformed_ethnicity_multi_racial_table.multi_racial_num_grads,
transformed_ethnicity_multi_racial_table.multi_racial_percent_grads,
transformed_ethnicity_multi_racial_table.multi_racial_num_total_regents,
transformed_ethnicity_multi_racial_table.multi_racial_percent_total_regents_cohort,
transformed_ethnicity_multi_racial_table.multi_racial_num_ad_regents,
transformed_ethnicity_multi_racial_table.multi_racial_percent_ad_regents_cohort,
transformed_ethnicity_multi_racial_table.multi_racial_num_dropout,
transformed_ethnicity_multi_racial_table.multi_racial_percent_dropout
INTO transformed_ethnicity_all_table
FROM ethnicity
INNER JOIN transformed_ethnicity_asian_table ON ethnicity.dbn = transformed_ethnicity_asian_table.dbn
INNER JOIN transformed_ethnicity_black_table ON ethnicity.dbn = transformed_ethnicity_black_table.dbn
INNER JOIN transformed_ethnicity_hispanic_table ON ethnicity.dbn = transformed_ethnicity_hispanic_table.dbn
INNER JOIN transformed_ethnicity_white_table ON ethnicity.dbn = transformed_ethnicity_white_table.dbn
INNER JOIN transformed_ethnicity_native_american_table ON ethnicity.dbn = transformed_ethnicity_native_american_table.dbn
INNER JOIN transformed_ethnicity_multi_racial_table ON ethnicity.dbn = transformed_ethnicity_native_american_table.dbn

ORDER BY DBN, COHORT_YEAR DESC;


