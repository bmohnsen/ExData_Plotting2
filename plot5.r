##Read data
NEI <- readRDS("NEI_data/summarySCC_PM25.rds")

##Subset by Baltimore and ON-ROAD
NEI <- NEI[(NEI$fips=="24510") & (NEI$type=="ON-ROAD"),]

## Aggregate total emissions by year
aggTotals <- aggregate(Emissions ~ year, NEI, sum)

##Plot data
library(ggplot2)

png(filename = "plot5.png",width=600,height=600)

gg <- ggplot(aggTotals, aes(x=factor(year), y=Emissions)) +
     geom_bar(stat="identity") +
     xlab("Year") +
     ylab("Total PM2.5 Emissions") +
     ggtitle("PM2.5 emissions from on-road vehicles in Baltimore City")

print(gg)

##End
dev.off()