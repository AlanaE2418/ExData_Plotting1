plot3<- function(){
    formated_two_days<-project1_data()
    ESM_weekdays<- formated_two_days %>% 
        select("Date/Time", "Sub_metering_1":"Sub_metering_3")
    
    png(filename = "plot3.png", width = 480, height = 480)
    
    with(formated_two_days, 
         plot(`Date/Time`, Sub_metering_1, type = "n", 
              ylab = "Energy sub metering", xlab = ""))
    with(formated_two_days, 
         points(`Date/Time`, Sub_metering_1, type = "l"))
    with(formated_two_days, 
         points(`Date/Time`, Sub_metering_2, type = "l", col = "red"))
    with(formated_two_days, 
         points(`Date/Time`, Sub_metering_3, type = "l", col = "blue"))
    
    legend("topright", lty = 1, col = c("black", "red", "blue"), 
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_2"))
    dev.off()
}

project1_data<- function(){
    #download and unzip
    if(!file.exists("household_power_consumption.txt")){
        data_project<- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        download.file(data_project, destfile = "./Project1data.zip", 
                      mode = "wb")
        unzip("./Project1data.zip")
    }
    
    #selecting just the 2 days of interest and formatting data
    library(dplyr)
    data<- read.table("./household_power_consumption.txt", 
                      sep = ";", header = TRUE)
    two_days_data<- data %>% 
        filter(Date == "1/2/2007" | Date == "2/2/2007") %>% 
        mutate_at(c(3:8), as.numeric)
    
    #fomatting Date and Time
    two_days_data[,1] <- as.Date(two_days_data$Date, tryFormats = c("%d/%m/%Y"))
    date_time_conv<- strptime(paste(two_days_data$Date, two_days_data$Time), 
                              format = "%Y-%m-%d %H:%M:%S")
    formated_two_days<-bind_cols("Date/Time"=date_time_conv, 
                                 select(two_days_data, 
                                        Global_active_power:Sub_metering_3))
    formated_two_days
}