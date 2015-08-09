## Exploratory Data Analysis
## Course Project #1
## Plot #1

plot1 <- function()
{
  ## Load the Data
  library(sqldf)
  selectedData = read.csv.sql("Data/household_power_consumption.txt", header = TRUE, sep = ";", 
                              sql = "select * from file where Date = '1/2/2007' OR Date = '2/2/2007'")

  ## Make Plots
  ## Plot #1 : Histogram of Global Active Power with colored bars and changed axis name
  par(mfrow = c(1, 1), cex.axis = 0.75, cex.lab = 0.75, cex.main = 0.90)  ## reset par, in case it is set differently
  ## Create the histogram with red bars and correct labels
  hist(selectedData$Global_active_power, col = "red", 
       main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
  dev.copy(png, file = "plot1.png")
  dev.off()

}
plot1()