##Read data
NEI <- readRDS("NEI_data/summarySCC_PM25.rds")

##Subset by Baltimore or Los Angeles and ON-ROAD
NEI <- NEI[(NEI$fips=="24510" | NEI$fips=="06037") & (NEI$type=="ON-ROAD"),]

## Aggregate total emissions by year
AggComboTotals <- aggregate(Emissions ~ year + fips, NEI, sum)

##Change data to name
AggComboTotals$fips[AggComboTotals$fips == "24510"] <- "Baltimore"
AggComboTotals$fips[AggComboTotals$fips == "06037"] <- "Los Angeles"

##Plot data
library(ggplot2)

png(filename = "plot6.png",width=600,height=600)

gg <- ggplot(AggComboTotals, aes(x=factor(year), y=Emissions, fill=fips)) +
     geom_bar(aes(fill=year),stat="identity") + 
     facet_grid(scales="free", space="free", .~fips) +
     ylab("Total PM2.5 Emissions") + 
     xlab("Year") +
     ggtitle("PM2.5 Emissions from On-Raod in Baltimore and Los Angeles")

print(gg)

##End
dev.off()