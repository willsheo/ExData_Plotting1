## Exploratory Data Analysis
## Course Project #1
## Plot #4

plot4 <- function()
{
  ## Load the Data
  library(sqldf)
  selectedData = read.csv.sql("Data/household_power_consumption.txt", header = TRUE, sep = ";", 
                              sql = "select * from file where Date = '1/2/2007' OR Date = '2/2/2007'")
  
  ## Plot #4 : Make Multiple Base Plots
  ## Change date/time variables to make a plottable value x
  selectedData$Date <- as.Date(selectedData$Date, "%d/%m/%Y")  
  x <- paste(selectedData$Date, selectedData$Time)
  x = strptime(x, "%Y-%m-%d %H:%M:%S")

  ## Set mfrow as such to make 2-by-2 plots
  par(mfrow = c(2, 2), oma = c(0, 0, 0, 0), cex.axis = 0.75, cex.lab = 0.75)
  with(selectedData, {
    ## 1, topleft plot
    plot(x, selectedData$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
    ## 2, topright plot, wiht the x label
    plot(x, selectedData$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
    ## 3, bottomleft plot - the same as plot3 except for the legend without a borderline
    with(selectedData, plot(x, selectedData$Sub_metering_1, col = "black", type = "l", xlab = "", ylab = "Energy sub metering"))
    with(selectedData, lines(x, selectedData$Sub_metering_2, col = "red", type = "l"))
    with(selectedData, lines(x, selectedData$Sub_metering_3, col = "blue", type = "l"))
    legend("topright", cex = 0.65, bty = "n", xjust = 0, lty = 1, col = c("black", "red", "blue"), 
           legend = c("sub_metering_1", "sub_metering_2", "sub_metering_3"))
    ## 4, bottomright plot, with the x label
    plot(x, selectedData$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
  })
  dev.copy(png, file = "plot4.png")
  dev.off()  
  
}
plot4()