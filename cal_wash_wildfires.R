# Project_DSE511_Hw6

library(rvest)

# Downloading California Wildfires data from wikipedia
url <- "https://en.wikipedia.org/wiki/List_of_California_wildfires"
file <- read_html(url)
tables <- html_nodes(file, "table")

# Extracting table containing data on California's number of wildfires and area burnt
cal_data = html_table(tables[1])
print(cal_data[[1]])

#Summarizing data of California wildfires number and area burnt
cal_year = as.integer(cal_data[[1]][["Year"]])
print(cal_year)

# Replacing commas in integer number in the table and converting string to integer
cal_fires = as.integer(gsub(",","", cal_data[[1]][["Fires"]]))
print(cal_fires)
summary(cal_fires)

cal_acres = as.integer(gsub(",","", cal_data[[1]][["Acres"]]))
print(cal_acres)
summary(cal_acres)

# Plotting histogram of number of fires and area burnt
pdf("test1.pdf")
hist(cal_fires,xlab = 'Number of Fires', ylab = 'Frequency', main = "Histogram of Number of Wildfires in California Each Year")
hist(cal_acres,xlab = 'Burnt Acres', ylab = 'Frequency', main = "Histogram of Wildfire Burnt Area in California Each Year")

# Plotting time series of number of fires and area burnt
plot(cal_year, cal_fires, type='l', xlab = 'Year', ylab = 'Number of Fires', main = "Time Series of Number of Annual California Wildfires")
plot(cal_year, cal_acres, type='l', xlab = 'Year', ylab = 'Burned Area (Acres)', main = "Time Series of Annual California Wildfire Burnt Area")

# Plotting scatter plot of number of fires against area burnt
plot(cal_fires, cal_acres, xlab = 'Number of Fires', ylab = 'Acres', main = "Scatter Plot: Number of Fires vs. Area Burned ")


# Downloading Washington Wildfires data from wikipedia

url <- "https://en.wikipedia.org/wiki/List_of_Washington_wildfires"
file <- read_html(url)
tables <- html_nodes(file, "table")

# Extracting table containing data on Washington's number of wildfires and area burnt
wash_data = html_table(tables[[8]])
wash_data

#Summarizing data of Washington wildfires number and area burnt
wash_year = as.integer(gsub(",","", wash_data[[1]]))
print(wash_year)


wash_fires = as.integer(gsub(",","", wash_data[["TotalFires"]]))
print(wash_fires)
summary(wash_fires)

wash_acres = as.integer(gsub(",","", wash_data[["Total Area Burned"]]))
print(wash_acres)
summary(wash_acres)

# Plotting histogram of number of fires and area burnt
hist(wash_fires, xlab = 'Number of Fires', ylab = 'Frequency', main = "Histogram of Number of Wildfires in Washington Each Year")
hist(wash_acres, xlab = 'Burnt Acres', ylab = 'Frequency', main = "Histogram of Wildfire Burnt Area in Washington Each Year")


# Plotting time series of number of fires and area burnt
plot(wash_year, wash_fires, type='l', xlab = 'Year', ylab = 'Number of Fires', main = "Time Series of Number of Annual Washington Wildfires")
plot(wash_year, wash_acres, type='l', xlab = 'Year', ylab = 'Burned Area (Acres)', main = "Time Series of Annual Washington Wildfire Burnt Area")

# Plotting scatter plot of number of fires against area burnt
plot(wash_fires, wash_acres, xlab = 'Number of Fires', ylab = 'Acres', main = "Scatter Plot: Number of Fires vs.Area Burned ")



