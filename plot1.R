#Reading Data
household_power_consumption <- read.table("household_power_consumption.txt", header = T, 
                   sep = ";", na.strings = "?")

# Data Cleaning for finding true subsets
household_power_consumption$Date<-as.Date(household_power_consumption$Date, format = "%d/%m/%Y")
class(household_power_consumption$Date)
df<-subset(household_power_consumption, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
# Convert dates and times
df$datetime <- strptime(paste(df$Date, df$Time), "%Y-%m-%d %H:%M:%S")

#Plotting required histogram
histo<-hist(df$Global_active_power, col = "Red", main = "Global Active Power",
            xlim = range(0,6), freq = T, xlab = "Global Active Power (Kilowatts)"
)

dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()

