/*CREATING TABLES*/
DROP TABLE IF EXISTS All_Data;
CREATE TABLE all_data (
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

SELECT * FROM all_data;

/*DROPPING columns*/
ALTER TABLE all_data
DROP COLUMN category, DROP percent_total_regents_grads, DROP percent_ad_regents_grads, 
DROP num_regents_without_ad, DROP percent_regents_without_cohort, 
DROP percent_regents_without_grads, DROP num_local, 
DROP percent_local_cohort, DROP percent_local_grads, 
DROP num_still_enrolled, DROP percent_still_enrolled;

SELECT * FROM all_data;

/*Only viewing 4 years June*/
SELECT DISTINCT * FROM all_data
WHERE cohort = '4 year June'
ORDER BY dbn, cohort_year DESC
;

SELECT * FROM all_data;

/*CREATING transformed_all_table*/
SELECT DISTINCT *
INTO transformed_all_table
FROM all_data
WHERE cohort = '4 year June'
ORDER BY dbn, cohort_year DESC
;

SELECT * FROM transformed_all_table;

/*DROPING columns*/
ALTER TABLE transformed_all_table
DROP COLUMN cohort;
SELECT * FROM transformed_all_table;
