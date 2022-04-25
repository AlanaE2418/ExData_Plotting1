#set the working directory where you saved the run_analysis.R file
#***    wd<- readline(prompt = "Set as working directory where you saved the plot#.R files: ")
#*D:/Alana/Coursera - Edx/21-25-Data Science Foundations using R Specialization/24. Exploratory Data Analysis/Course Projects

#create a folder for the project, download and unzip files
#***    setwd(wd); rm(wd) 
#***    source("Project _1_ Exploratory Data Analysis.R")
#***    directory()

#Creates the plot 1-4
#***    source("plot1.R", "plot2.R", "plot3.R", "plot4.R")
#***    plot1(); plot2(); plot3(); plot4()


directory<- function(){
    if(!file.exists("EDA_project1")) { 
        dir.create("EDA_project1")}
    library(filesstrings)
    file.move("./Project _1_ Exploratory Data Analysis.R",
              "./EDA_project1", overwrite = TRUE)
    setwd("./EDA_project1")
    file.edit("Project _1_ Exploratory Data Analysis.R")
}