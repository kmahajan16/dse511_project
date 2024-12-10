# Project_DSE511_Hw6

library(rvest)

# Reading clean tables written by bash scripts
clean_lightning_data = read.table('~/R/clean_lightning_data.txt')
clean_human_data = read.table('~/R/clean_human_data.txt')

# Extracting data columns for Southern California from the tables
lightning_year = as.integer(gsub(",","", clean_lightning_data[[1]]))[2:24]
print('')
print('Years:')
print(lightning_year)

lightning_s_california = as.integer(gsub(",","", clean_lightning_data[[5]]))
human_s_california = as.integer(gsub(",","", clean_human_data[[5]]))

# Computing fraction of human caused wildfires out of total wildfires
frac_s = human_s_california/(human_s_california + lightning_s_california)
print('')
print('Fraction of human caused wildfires each year over Southern California:')
print(frac_s)

# Plotting time series of the human caused fraction
pdf('human_caused_frac_california.pdf')
plot(lightning_year, frac_s, type='l',xlab = 'Year', ylab = 'Fraction', main = 'Fraction of Human Induced Fire in S. California')

# Extracting data columns for Northern California from the tables
lightning_n_california = as.integer(gsub(",","", clean_lightning_data[[4]]))
human_n_california = as.integer(gsub(",","", clean_human_data[[4]]))

# Computing fraction of human caused wildfires out of total wildfires
frac_n = human_n_california/(human_n_california + lightning_n_california)
print('')
print('Fraction of human caused wildfires each year over Northern California:')
print(frac_n)

# Plotting time series of the human caused fraction
plot(lightning_year, frac_n, type='l',xlab = 'Lightning Year', ylab = 'Fraction', main = 'Fraction of Human Induced Fire in N. California')

print('')
print('Plotting time series of human caused wildfires fraction over Southern and Northern Califronia in human_caused_frac_california.pdf')


