# Data-Science & Machine Learning(scikit, coreML) to iOS Application
Project inspired from ['Dongguk Uni X Naver Boostcourse'](https://www.boostcourse.org/study-dongguk-1)<br>
Prediction of test score with [dataset](https://www.kaggle.com/kwadwoofosu/predict-test-scores-of-students)

### Application
<p float="left"><img src = "https://user-images.githubusercontent.com/76769919/131087546-73f9f008-08c2-49d3-9ca3-83577fa627ed.png" width="30%" height="30%"><img src = "https://user-images.githubusercontent.com/76769919/131087549-b5c5b9ca-23d1-406a-b7cf-e4bbdab9a8d9.png" width="30%" height="30%"></p>

### Data Analysis
<p float="left"><img src="https://user-images.githubusercontent.com/76769919/131090057-e5190bf8-18a3-41f8-9477-0b8f276cdebd.png" width=70%><img src = "https://user-images.githubusercontent.com/76769919/131090206-dbfb4da3-3a98-430d-aa9e-4f0a068725ff.png" width=50%><img src ="https://user-images.githubusercontent.com/76769919/131090420-7ec57819-7d57-489b-9609-5788368c3db1.png" width=50%></p>


<br>

Working on a application that can predict student's score tests(posttest) by 
  * <b>School</b>
  * <b>School Setting</b>: Urban / Rural / Suburban
  * <b>School Type</b>: Public / Non-public
  * <b>Classroom</b>
  * <b>Teaching Method </b>: Standard / Experimental
  * <b>Number of Students</b>
  * <b>Gender</b>: Male / Female
  * <b>Lunch</b>: Qualified / Not qualified

<br>

## This repository contains
  * .csv file of the dataset file
  * .keynote of the project(mostly about the data analysis)
  * .ipynb file from Google Colab & Jupyter Notebook
  * .xcodeproj file of the application
<br>

## Beta Version Explanation

👌🏻 Okay and DONE:
  * Data Analysis of the dataset
  * used Linear Regression(scikit) to predict posttest scores without pretest in train data. ➡️ 95% score
  * Prototype of the application(UI)
  * conversion of model to CoreML(.mlmodel)

❌ NOT OKAY and need UPDATES:
  * The .ipynb files need to be organized(it may be hard to figure out the purpose of the code. :( This is my bad!!)
  * The model(scores.mlmodel) show wrong output if the combination of input datas are not from trained data => how should I fix?
  * The model inputs are extremely difficult to get their data as the DataFrame went through One-Hot-Encoding
<br>


## Track Update
beta 0.1 version
<br>

## Feedbacks & Contacts
📮 nyn2265@gmail.com <br>
⭐️ issue or discussion
<br>
