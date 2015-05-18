##Read data
NEI <- readRDS("NEI_data/summarySCC_PM25.rds")

#Add Library
library(ggplot2)

# Aggregate total emissions by year for Baltimore
NEI <- NEI[NEI$fips=="24510",]
aggTotals <- aggregate(Emissions ~ year + type, data=NEI, FUN=sum)

##Plot data
png(filename = "plot3.png", width=800, height=800)

gg <- ggplot(aggTotals, aes(x=factor(year), y=Emissions, fill=type)) +
     geom_bar(stat="identity", position = "dodge") +
     facet_grid(. ~ type) +
     xlab("Year") +
     ylab("Total PM2.5 Emissions") +
     ggtitle("PM2.5 emissions in Baltimore by Source Types")

print(gg)

##End
dev.off()

