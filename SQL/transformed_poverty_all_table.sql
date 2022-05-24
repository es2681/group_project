CREATE TABLE poverty (
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
SELECT * FROM poverty;

/*DROPPING columns*/
ALTER TABLE poverty
DROP COLUMN percent_total_regents_grads, DROP percent_ad_regents_grads, 
DROP num_regents_without_ad, DROP percent_regents_without_cohort, 
DROP percent_regents_without_grads, DROP num_local, 
DROP percent_local_cohort, DROP percent_local_grads, 
DROP num_still_enrolled, DROP percent_still_enrolled;

SELECT * FROM poverty;

/*Only viewing 4 years June & Econ Disadv*/
SELECT DISTINCT *
FROM poverty
WHERE cohort = '4 year June'
AND category = 'Econ Disadv'
ORDER BY dbn, school_name, cohort_year DESC
;

/*Only viewing 4 years June & Econ Disadv*/
SELECT DISTINCT 
dbn,
school_name,
cohort_year,
num_total_cohort AS disadv_num_total_cohort,
num_grads AS disadv_num_grads,
percent_grads AS disadv_percent_grads,
num_total_regents AS disadv_num_total_regents,
percent_total_regents_cohort AS disadv_percent_total_regents_cohort,
num_ad_regents AS disadv_num_ad_regents,
percent_ad_regents_cohort AS disadv_percent_ad_regents_cohort,
num_dropout AS disadv_num_dropout,
percent_dropout AS disadv_percent_dropout
/*INTO transformed_poverty_disadv_table*/
FROM poverty
WHERE cohort = '4 year June'
AND category = 'Econ Disadv'
ORDER BY dbn, cohort_year DESC
;

/*Only viewing 4 years June & Not Econ Disadv*/
SELECT DISTINCT 
dbn,
school_name,
cohort_year,
num_total_cohort AS not_disadv_num_total_cohort,
num_grads AS not_disadv_num_grads,
percent_grads AS not_disadv_percent_grads,
num_total_regents AS not_disadv_num_total_regents,
percent_total_regents_cohort AS not_disadv_percent_total_regents_cohort,
num_ad_regents AS not_disadv_num_ad_regents,
percent_ad_regents_cohort AS not_disadv_percent_ad_regents_cohort,
num_dropout AS not_disadv_num_dropout,
percent_dropout AS not_disadv_percent_dropout
/*INTO transformed_poverty_not_disadv_table*/
FROM poverty
WHERE cohort = '4 year June'
AND category = 'Not Econ Disadv'
ORDER BY dbn, cohort_year DESC
;

/*Joining tables*/
SELECT DISTINCT
poverty.dbn,
poverty.school_name,
poverty.cohort_year,
transformed_poverty_disadv_table.disadv_num_total_cohort,
transformed_poverty_disadv_table.disadv_num_grads,
transformed_poverty_disadv_table.disadv_percent_grads,
transformed_poverty_disadv_table.disadv_num_total_regents,
transformed_poverty_disadv_table.disadv_percent_total_regents_cohort,
transformed_poverty_disadv_table.disadv_num_ad_regents,
transformed_poverty_disadv_table.disadv_percent_ad_regents_cohort,
transformed_poverty_disadv_table.disadv_num_dropout,
transformed_poverty_disadv_table.disadv_percent_dropout,
transformed_poverty_not_disadv_table.not_disadv_num_total_cohort,
transformed_poverty_not_disadv_table.not_disadv_num_grads,
transformed_poverty_not_disadv_table.not_disadv_percent_grads,
transformed_poverty_not_disadv_table.not_disadv_num_total_regents,
transformed_poverty_not_disadv_table.not_disadv_percent_total_regents_cohort,
transformed_poverty_not_disadv_table.not_disadv_num_ad_regents,
transformed_poverty_not_disadv_table.not_disadv_percent_ad_regents_cohort,
transformed_poverty_not_disadv_table.not_disadv_num_dropout,
transformed_poverty_not_disadv_table.not_disadv_percent_dropout
INTO transformed_poverty_all_table
FROM poverty
LEFT JOIN transformed_poverty_disadv_table ON poverty.dbn = transformed_poverty_disadv_table.dbn
LEFT JOIN transformed_poverty_not_disadv_table ON poverty.DBN = transformed_poverty_not_disadv_table.DBN
WHERE cohort = '4 year June'
ORDER BY poverty.dbn, POVERTY.SCHOOL_NAME,POVERTY.COHORT_YEAR
