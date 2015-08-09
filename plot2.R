## Exploratory Data Analysis
## Course Project #1
## Plot #2

plot2 <- function()
{
  ## Load the Data
  library(sqldf)
  selectedData = read.csv.sql("Data/household_power_consumption.txt", header = TRUE, sep = ";", 
                              sql = "select * from file where Date = '1/2/2007' OR Date = '2/2/2007'")
  
  ## Plot #2 : Line Graph
  par(mfrow = c(1, 1), cex.axis = 0.75, cex.lab = 0.75, cex.main = 0.90)  ## reset par, in case it is set differently
  ## change the date/time columns to make a plottable value x
  selectedData$Date <- as.Date(selectedData$Date, "%d/%m/%Y")  
  x <- paste(selectedData$Date, selectedData$Time)
  x = strptime(x, "%Y-%m-%d %H:%M:%S")
  
  plot(x, selectedData$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
  dev.copy(png, file = "plot2.png")
  dev.off()
  
}
plot2()