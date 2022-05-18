# Student Analysis Project

## Presentation

### Topic: Classification of NYC Public Schools 
Can a machine learning model adequately categorize whether an NYC public school is considered "good" with publicly available data? For this project, we are looking to answer this question. We selected this topic because we felt it was important for the community to be able to identify how the schools are classified in relation to one another so that they can make informed personal decisions for their children. In addition, districts would also be able to use this model to identify the characteristics which make for a high-quality school versus a low-quality school and make decisions based on the predictions. 

We will use publicly available NYC schools data, including the percentages of students with disabilities, students living in poverty, and students who pass the regents exams, as well as the distribution of various ethnicities and gender at each school, to categorize schools by their 4-year high school graduation rates as a "good" school or not. 

### Description of source data:
- This data comes from the [New York City Department of Education Website](https://infohub.nyced.org/reports/academics/graduation-results).

- The file includes all of the data for each public school in NYC from cohorts 2003 to 2017. 

- In addition to categorizing students by graduation year, the data also includes information for students who graduated within the standard 4 years as well as statistics for students who needed more than 4 years to graduate. 

- The features that will be included in the modeling of the data are Category, Cohort Year, # Total Cohort, Cohort, %Grads, %Total Regents of Cohort, %Advanced Regents of Cohort, %Regents without Advanced of Cohort, %Dropout, SWD (Students with Disabilities), Ethnicity, Gender, Poverty.

### Questions to be answered:
- In what ways can NYC Public Schools be classified? By what features are similar schools classified? 

- How will classifying NYC Public Schools help parents decide where to live or where to send their children? 

- How can classifying NYC Public Schools help districts identify which schools need more help?

### Database Management

Below you will see two images that show a skeleton of our database along with Entity Relationship Database. 


- Database: 

![](https://github.com/es2681/student_analysis_project/blob/main/images/School_Analysis_Database.png)

    - all_data: contains all the data
    - ethnicity: breaks down the data base on ethnicity
    - gender: breaks down the data base on gender
    - poverty: breaks down the data base on income disadvantages
    - swd: breaks down the data baseds on students with disabilities or not


- ERD:

![](https://github.com/es2681/student_analysis_project/blob/main/images/School_Analysis_ERD.png)

    - Has all 5 tables
    - Shows that DBN is the primary key
    - shows all the tables are connected to all_data based on DBN
    - has columns we are considering using

## Machine Learning Model
- We are going to use K-Means unsupervised learning model to find similarities between schools.
- Before we train our model, we will apply PCA to reduce dataset.
- To estimate the K value, we are going to use "Elbow Curve"
- Finally we will train our model using the sklearn library (KMeans).
The initial input features are:
- % Grads
- % Total Regents of Cohort
- % Advanced Regents of Cohort
- % Dropout
Expected Output features:
- Ranking (performance) of schools


## Technology
1. PostgreSQL to store the data.
2. Python-JupyterNotebook-Pandas to clean the data.
3. Git to manage all our code.
4. Tableau for initial data exploration.
5. Github Pages to store our Website.
6. JavaScript (Plotly) and HTML to display the charts.
7. Sklearn (KMeans) library for the Machine Learning part.

## Dashboard Blueprint

- Tools 
    - HTML, CSS, and JavaScript for the whole dashboard 
    - GeoJSON, D3, MapBox, and Leaflet for the mapping elements 
    - D3 for 2 different dropdown menus 
    - Plotly for the charts 

- Interactive Elements 
    - 2 dropdown menus using D3 will be included in order to choose the school and the year. A series of charts will appear according the user's choice. 
