# Student Analysis Project

## Presentation

### Topic: Classification of NYC Public Schools 

We selected this topic because we felt it was important for the community to be able to identify how the schools are classified in relation to one another so that they can make informed personal decisions. In addition, districts would also be able to use this model to identify the characteristics which make for a high-quality school versus a low-quality school and make decisions based on the predictions. 

### Description of source data:
- This data comes from the [New York City Department of Education Website](https://infohub.nyced.org/reports/academics/graduation-results).

- The file includes all of the data for each public school in NYC from cohorts 2003 to 2017. 

- The features that will be included in the modeling of the data are Category, Cohort Year, # Total Cohort, Cohort, %Grads, %Total Regents of Cohort, %Advanced Regents of Cohort, %Regents without Advanced of Cohort, %Dropout, SWD (Students with Disabilities), Ethnicity, Gender, Poverty.

### Questions to be answered:
- In what ways can NYC Public Schools be classified? By what features are similar schools classified? 

- How will classifying NYC Public Schools help parents decide where to live or where to send their children? 

- How can classifying NYC Public Schools help districts identify which schools need more help?

### Database Management

Below you will see two images that show a skeleton of our database along with Entity Relationship Database. 

![](https://github.com/es2681/student_analysis_project/blob/main/images/School_Analysis_Database.png)
- Database: 
    - all_data: contains all the data
    - ethnicity: breaks down the data base on ethnicity
    - gender: breaks down the data base on gender
    - poverty: breaks down the data base on income disadvnatages
    - swd: breaks down the data baseds on students with disabilities or not

- ERD:
    - Has all 5 tables
    - Shows that DBN is the primary key
    - shows all the tables are connected to all_data based on DBN
    - has columns we are considering using