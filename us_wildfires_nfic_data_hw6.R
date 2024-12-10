# Project_DSE511_Hw6

library(rvest)

# Downloading National Interagency Fire Center (NIFC) data for US
# including numnber of fires, area burnt and total suppression costs from 1985-2023
# Also, downloading data for number of lightning caused and human caused wildfires
# to compute fraction of human caused wildfires
# Also, writing downloaded files to be used by bash scripts

url_nfic <- "https://www.nifc.gov/fire-information/statistics/suppression-costs"
file_nfic <- read_html(url_nfic)
tables <- html_nodes(file_nfic, "table")

# Extracting data table
nfic_data = html_table(tables[[1]])
print("Widlfire data over the US from National Interagency Fire Center (NIFC):")
print(nfic_data)

# Extracting data from table and removing commas from numbers to convert to integer
nfic_year = as.integer(gsub(",","", nfic_data[[1]]))
print("Years:")
print(nfic_year)

nfic_fires = as.integer(gsub(",","", nfic_data[[2]]))
print("Number of fires each year in the US: ")
print(nfic_fires)

nfic_acres = as.integer(gsub(",","", nfic_data[[3]]))
print("Burnt area each year in the US: ")
print(nfic_acres)

# Removing the $ sign from the total suppression costs data to convert to numeric values 
temp = gsub(",","", nfic_data[[6]])
nfic_total = as.numeric(gsub("\\$","", temp))
print("Total suppression costs of wildfires over the US: ")
print(nfic_total)

# Plotting time series of US total number of wildfires, area burnt and total suppression costs
pdf('US_Wildfires_NFIC.pdf')
plot(nfic_year, nfic_acres, type='l', xlab = 'Year', ylab = 'Burned Area (Acres)',main = "Times Series of Number of Us Wildfires")
plot(nfic_year, nfic_total, type='l', xlab = 'Year', ylab = 'Total Amoount',main = "Years vs. Total Suppression Cost")
plot(nfic_acres, nfic_total, xlab = 'Acres', ylab = 'Total Amoount',main = "Acres vs. Total Suppression Cost")
plot(nfic_fires, nfic_total, xlab = 'Fires', ylab = 'Total Amoount',main = "Fires vs. Total Suppression Cost")

print('')
print('Plotting time series data of US total number of wildfires, area burnt and total suppression costs to US_Wildfires_NFIC.pdf')

#Writing downloaded table to a text file to be used by Bash to compute Top 5 Wildfires by cost
print('')
print('Writing downloaded data to .txt files: downloaded_nfic_data.txt!')
write.table(nfic_data, 'downloaded_nfic_data.txt', row.names = FALSE)


# Downloading lightning caused and human caused wildfire data
url <- "https://www.nifc.gov/fire-information/statistics/lightning-caused"
file <- read_html(url)
tables <- html_nodes(file, "table")

lightning_data = html_table(tables[1])
print('')
print('Lightning caused wildfires data table: ')
print(lightning_data)

url <- "https://www.nifc.gov/fire-information/statistics/human-caused"
file <- read_html(url)
tables <- html_nodes(file, "table")

human_data = html_table(tables[1])
print('Human caused wildfires data table: ')
print(human_data)

# Writing downloaded tables to be used by bash scripts
print('')
print('Writing downloaded lightning caused wildfire data to .txt file: downloaded_lightning_data.txt!')
write.table(lightning_data, 'downloaded_lightning_data.txt', row.names = FALSE)

print('')
print('Writing downloaded human caused wildfire data to .txt file: downloaded_human_data.txt!')
write.table(human_data, 'downloaded_human_data.txt', row.names = FALSE)