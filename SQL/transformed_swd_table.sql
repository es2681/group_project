CREATE TABLE swd (
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

SELECT * FROM swd;

/*DROPPING columns*/
ALTER TABLE swd
DROP COLUMN percent_total_regents_grads, DROP percent_ad_regents_grads, 
DROP num_regents_without_ad, DROP percent_regents_without_cohort, 
DROP percent_regents_without_grads, DROP num_local, 
DROP percent_local_cohort, DROP percent_local_grads, 
DROP num_still_enrolled, DROP percent_still_enrolled;

SELECT * FROM swd;

/*Only viewing 4 years June & swd*/
SELECT DISTINCT *
FROM swd
INTOtransformed_swd_table
WHERE cohort = '4 year June'
AND category = 'SWD'
ORDER BY dbn, school_name, cohort_year DESC
;

/*Only viewing 4 years June & swd*/
SELECT DISTINCT 
dbn,
school_name,
cohort_year,
transformed_poverty_disadv.econ_disadv_num_total_cohort,
transformed_poverty_disadv.econ_disadv_num_grads,
transformed_poverty_disadv.econ_disadv_percent_grads,
transformed_poverty_disadv.econ_disadv_num_total_regents,
transformed_poverty_disadv.econ_disadv_percent_total_regents_cohort,
transformed_poverty_disadv.econ_disadv_num_ad_regents,
transformed_poverty_disadv.econ_disadv_num_percent_ad_regents_cohort,
transformed_poverty_disadv.econ_disadv_num_dropout,
transformed_poverty_disadv.econ_disadv_percent_dropout
INTO transformed_poverty_disadv
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
transformed_poverty_not_disadv.not_econ_disadv_num_total_cohort,
transformed_poverty_not_disadv.not_econ_disadv_num_grads,
transformed_poverty_not_disadv.not_econ_disadv_percent_grads,
transformed_poverty_not_disadv.not_econ_disadv_num_total_regents,
transformed_poverty_not_disadv.not_econ_disadv_percent_total_regents_cohort,
transformed_poverty_not_disadv.not_econ_disadv_num_ad_regents,
transformed_poverty_not_disadv.not_econ_disadv_num_percent_ad_regents_cohort,
transformed_poverty_not_disadv.not_econ_disadv_num_dropout,
transformed_poverty_not_disadv.not_econ_disadv_percent_dropout
INTO transformed_poverty_not_disadv
FROM poverty
WHERE cohort = '4 year June'
AND category = 'Not Econ Disadv'
ORDER BY dbn, cohort_year DESC
;

/**/
SELECT DISTINCT 
poverty.dbn,
poverty.school_name,
poverty.cohort_year,
transformed_poverty_disadv.econ_disadv_num_total_cohort,
transformed_poverty_disadv.econ_disadv_num_grads,
transformed_poverty_disadv.econ_disadv_percent_grads,
transformed_poverty_disadv.econ_disadv_num_total_regents,
transformed_poverty_disadv.econ_disadv_percent_total_regents_cohort,
transformed_poverty_disadv.econ_disadv_num_ad_regents,
transformed_poverty_disadv.econ_disadv_num_percent_ad_regents_cohort,
transformed_poverty_disadv.econ_disadv_num_dropout,
transformed_poverty_disadv.econ_disadv_percent_dropout,
transformed_poverty_not_disadv.not_econ_disadv_num_total_cohort,
transformed_poverty_not_disadv.not_econ_disadv_num_grads,
transformed_poverty_not_disadv.not_econ_disadv_percent_grads,
transformed_poverty_not_disadv.not_econ_disadv_num_total_regents,
transformed_poverty_not_disadv.not_econ_disadv_percent_total_regents_cohort,
transformed_poverty_not_disadv.not_econ_disadv_num_ad_regents,
transformed_poverty_not_disadv.not_econ_disadv_num_percent_ad_regents_cohort,
transformed_poverty_not_disadv.not_econ_disadv_num_dropout,
transformed_poverty_not_disadv.not_econ_disadv_percent_dropout

FROM poverty
INNER JOIN transformed_poverty_disadv ON poverty.dbn = transformed_poverty_disadv.dbn
INNER JOIN transformed_poverty_not_disadv ON poverty.dbn = transformed_poverty_not_disadv.dbn
WHERE cohort = '4 year June'
ORDER BY dbn, cohort_year DESC