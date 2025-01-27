# Student Analysis Project

## Presentation

### Topic: Classification of NYC Public Schools 
Can a machine learning model adequately categorize whether a NYC public school is considered "good" with publicly available data? For this project, we are looking to answer this question. The group selected this topic because we felt it was important for the community to be able to identify how schools are classified in relation to one another so that they can make informed personal decisions for their children. In addition, districts would also be able to use this model to identify the characteristics which make for a high-quality school versus a low-quality school and make decisions based on the predictions. 

We will use publicly available NYC schools data, including the percentages of students with disabilities, students living in poverty, and students who pass the regents exams, as well as the distribution of various ethnicities and gender at each school, to categorize schools by their 4-year high school graduation rates as a "good" school or not. 

A copy of the presentation can be found [here](https://docs.google.com/presentation/d/1Hy0tTfnzQk7wBHQD7KSvTr1mUrC9FzMkwlysQilIZLQ/edit?usp=sharing).

### Description of source data:
- This data comes from the [New York City Department of Education Website](https://infohub.nyced.org/reports/academics/graduation-results).

- The file includes all of the data for each public school in NYC from cohorts 2003 to 2017. 

- In addition to categorizing students by graduation year, the data also includes information for students who graduated within the standard 4 years as well as statistics for students who needed more than 4 years to graduate. 

- The features that will be included in the modeling of the data are Category, Cohort Year, # Total Cohort, Cohort, %Grads, %Total Regents of Cohort, %Advanced Regents of Cohort, %Regents without Advanced of Cohort, %Dropout, SWD (Students with Disabilities), Ethnicity, Gender, Poverty.

### Questions to be answered:
- In what ways can NYC Public Schools be classified? By what features are similar schools classified? 

- How will classifying NYC Public Schools help parents decide where to live or where to send their children? 

- How can classifying NYC Public Schools help districts identify which schools need more help?

### Data Exploration
- We used Excel, Python-JupyterNotebook-Pandas, to explore and clean the data. In our initial exploration we noticied that there were many null values and values with an 's' which meant that is was purposely surpressed by the NYCDOE so our first priority was to decide what to do with these values. We also needed to change the datatype of the columns and merge five different tables in order to get all of the data into one dataframe. 

### Analysis
- Since we decided on an unsupervised machine learning model to classify the schools, after we recieved the classifications from the model, we needed to decied what they meant so using Excel we explored the data and filtered the dataframe based on the class to see if there were any common trends in the input values. We also created box and whisker charts for each class and each input value to check for the ditribution and for outliers. 

### Technologies, Languaages, Tools and Algorithms
1. PostgreSQL to store the data.
2. Python-JupyterNotebook-Pandas to clean the data.
3. Git to manage the code.
4. JavaScript (Plotly) and HTML to display the charts.
5. Github Pages to store our Website.
6. Sklearn (KMeans) library for the Machine Learning Model.

## Database Management

### Segment 1:

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

### Segment 2:

Now that the data has been added to the database, PS_School_Analysis, we have to clean it, so that it can show the data we want. Some tables were easy to clean/alter and join via SQL, except for the following tables:

- Ethnicity table
- Poverty table
- SWD (student with disabilities)

If we were to use SQL to clean/alter data, we would have duplicate results, making it complex to clean. As an alternative, we decided to do a data clean up via Pandas. Before loading our dataset, we used SQL to create a skeleton of how our table will look once we used a JOIN statement. Later, tables above were first loaded onto our Jupyter notebook and then we indicated which columns we wanted to keep. We then removed all DBN, School_Name, and Cohort_Year duplicates. The results we wanted populated and then saved under “transformed_XXX_table.

Our Ethnicity table was by far a more complexed table to clean and set up through SQL. The only way to get our table into our database was to connect our database with pandas via SQLAlchemy. Once SQLAlchemy was running, we imported our cleaned ethnicities data and created a table in our database (see image in images folder)

    

## Machine Learning Model
We want to determine which school are the better schools. So we decided to use a k-means cluster to tier rank the schools.
Based on the data we had we determines that only a few metrics provided really tell us how well a school is preforming.
![](https://github.com/es2681/student_analysis_project/blob/main/images/All_data_table.PNG)
The key metrics:
- % Grads
- % Total Regents of Cohort
- % Advanced Regents of Cohort
- % Dropout
![](https://github.com/es2681/student_analysis_project/blob/main/images/Inital_input_features.PNG)
The rest of the columns were dropped.
To create our data clusters we need to reduce our key metrics using PCA. 
![](https://github.com/es2681/student_analysis_project/blob/main/images/School_PCA.PNG)
- Check our data loss, fortunately we are only reducing 4 columns of data to 3 so we do not much data is lost. 
![](https://github.com/es2681/student_analysis_project/blob/main/images/Accurcay_score.PNG)
- Accuracy Score: 98.11%
Then we determine how many groups is best by using an Elbow Curve, which determined to be 3.
![](https://github.com/es2681/student_analysis_project/blob/main/images/Elbow_curve.PNG)
Finally we will train our model using the sklearn library (KMeans).
![](https://github.com/es2681/student_analysis_project/blob/main/images/School_analysis_with_class.PNG)
Plot data, colors showing groups.
![](https://github.com/es2681/student_analysis_project/blob/main/images/School_Analysis_KMeans_Scatter.PNG)
- Data Output
Based on the key metrics we determined that group 0 are the best schools, group 1 are average, and group 2 are the bad schools.
The it seems that the KMeans model determined the best schools have a high % Advanced Regents of Cohort, this is supported by a school cohort in group 1 (the average schools) with a near perfect graduation rate, but a low % Advanced Regents of Cohort.
What seems to spearate group 1 (average schools), and group 2 (bad schools) is a combination of drop out rate and low % Advanced Regents of Cohort. There are a few schools in group 1 with a low graduation rate, but has a few students in Advanced Regents, meanwhile majority of the schools in group 2 have no students in Advanced Regents, and if there are a substancial ammount of students in advanced regents the school has a high drop out rate.

## NYC Public School Classification Dashboard 

[Link to Dashboard](https://amairanir.github.io/school_dashboard/)

Image 1
![](https://github.com/AmairaniR/school_dashboard/blob/main/images/dashboard_map.png)
Image 1 shows the portion of the dashboard which includes a map created with leaflet and mapbox where the location of each school is mapped. When a marker is clicked, the name of the school is displayed as well as the compiled the information for the school for all the years data is available. 

Image 2
![](https://github.com/AmairaniR/school_dashboard/blob/main/images/dashboard_average.png)

Image 2 shows the portion of the dashboard which includes an interactive dropdown menu where the user can see information on each school based on the year. They can also see a bar chart which shows the percent grads, percent total reents of cohort, percent advanced regents of cohort, and percent dropout which were the values used in the machine learning model. The user is also presented with four pie charts of demogrpahic information of the students for each school: ethnicities, gendere, economic advantage, and students with disabilities. 

Image 3
![](https://github.com/AmairaniR/school_dashboard/blob/main/images/dashboard_highest.png)

Image 3 shows how the dashboard changes when a different school or year is selected. Not only do the values of the bar chart and pie charts change, but the color of the bar chart changes depending on how it was classified from the unsupervised machine learning model. 
