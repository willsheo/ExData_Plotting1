## Exploratory Data Analysis
## Course Project #1
## Plot #3

plot3 <- function()
{
  ## Load the Data
  library(sqldf)
  selectedData = read.csv.sql("Data/household_power_consumption.txt", header = TRUE, sep = ";", 
                              sql = "select * from file where Date = '1/2/2007' OR Date = '2/2/2007'")
  
  ## Plot #3 : Plot Multiple Variables
  ## Change date/time variables to make a plottable value x
  selectedData$Date <- as.Date(selectedData$Date, "%d/%m/%Y")  
  x <- paste(selectedData$Date, selectedData$Time)
  x = strptime(x, "%Y-%m-%d %H:%M:%S")

  ## reset par, in case it is set differently
  par(mfrow = c(1, 1), mar = c(5, 4, 2, 2), cex.axis = 0.75, cex.lab = 0.75)  
  ## Create three lines on a line chart, sub_metering_1/2/3 with diff colors
  with(selectedData, plot(x, selectedData$Sub_metering_1, col = "black", type = "l", xlab = "", ylab = "Energy sub metering"))
  with(selectedData, lines(x, selectedData$Sub_metering_2, col = "red", type = "l"))
  with(selectedData, lines(x, selectedData$Sub_metering_3, col = "blue", type = "l"))
  ## Adjust the legend so that the size of the box is smaller
  legend("topright", cex = 0.65, lty = 1, col = c("black", "red", "blue"), 
         legend = c("sub_metering_1", "sub_metering_2", "sub_metering_3"))
  dev.copy(png, file = "plot3.png")
  dev.off()
}
plot3()