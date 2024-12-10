#!/bin/sh

#cd ~/dse511_project

#Run an Rscript to analyze and create analysis plots for Wildfire data over California and Washington state
#using data downloaded from wikipedia

Rscript cal_wash_wildfires.R

#Run an Rscript to download aggregated data over the US from National Interagency Fire Center and analysis and write tables in files

Rscript us_wildfires_nfic_data_hw6.R

#Read the table written by the Rscript to identify the Top 5 biggest wildfires years in the US
echo
echo Top 5 biggest wildfire years based on suppression costs:
echo Year Suppression cost - US Dollar

#Using tail, head, sed and sort to get the Top 5 biggest wildfire years based on suppression costs 
tail -n +3 downloaded_nfic_data.txt | head -n +39 | sed 's/\$//g' | sed 's/,//g'| sed 's/"//g' | sort -k6 -n | tail -5 | awk '{print $1, $6}'


#Using tail, head and sort to clean up lightning caused and human caused wildfires data tables
tail -n +4 downloaded_lightning_data.txt | head -n +23 | sort -k1  > clean_lightning_data.txt

tail -n +4 downloaded_human_data.txt | head -n +23 | sort -k1  > clean_human_data.txt

echo
echo "Cleaned lightning caused wildfire data written to: clean_lightning_data.txt!"
echo
echo "Cleaned human caused wildfire data written to: clean_human_data.txt!"

Rscript frac_human_induced_fires_hw6.R



