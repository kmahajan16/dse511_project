# dse511_project
Project on analysis of wildfire data downloaded from Wikipedia and National Interagency Fire Center (NFIC)

This project downloads data from Wikipedia and National Interagency Fire Center (NFIC) and conducts the following analysis:
1. Histogram of wildfires over California and Washington state (data from Wikipedia)
2. Summary statistics of the above.
3. Time series of number of wildfires and area burnt for the two regions
4. Scatterplot of number of wildfires vs. area burnt for the two regions
5. Time series of number of fires and suppression costs to suppress wildfires aggregated over the entire US (data from NFIC)
6. Scatter plot of number of fires against suppression costs as well as area burnt against suppression costs
7. List of Top 5 wildfires based on suppression costs.
8. Time series of human caused fraction of Northern and Southern wildfires.


Running the project:
1. Run the bash script: ./dse511_project_bash_script.sh

Output:
3 pdf files with plots
Summary statistics from R scripts
List of Top 5 wildfire years in the US based on suppression costs 

The script will run 3 R scripts. The first R script will generate analysis for California and Washington state fires. The second script will download data from NFIC and generate some analysis for aggregated US wildfires. It will also write the downloaded data to .txt files. The bash script will then read one of these files to list the top 5 wildfire years in the US based on total costs to suppress the fires using sed and sort. The bash scripts will also be used to clean up two downloaded tables from NFIC. These cleaned up tables will then be used by the third R script to compute the fraction of human caused wildfires over the US and plot the timeseries.  

