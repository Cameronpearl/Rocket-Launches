# Rocket-Launches
A simple analysis of rocket launch data   
data collected from [here](https://www.kaggle.com/datasets/sefercanapaydn/mission-launches)   
A link to the dashboard can be found [here](https://public.tableau.com/app/profile/cameron.pearl2830/viz/RocketLaunchData/Dashboard1)

## Questions I wanted answered
* How has the average price of launches changed over time  
* What is the success rate of all launches
* Has the frequency of rocket launches changed over time?
* Which launch locations have been used the most?


## Process
I checked for duplicates and filled blank data with N/A in Excel then uplaoded it to SQL Server   
I wrote the attached script to clean some small things, mainly changing the date column to a date data type and checking for typos   
Then I uploaded the data to Tableau where I answered the analysis questions

![Viz 1](https://github.com/Cameronpearl/Rocket-Launches/blob/main/Sheet%201.png)
![Viz 2](https://github.com/Cameronpearl/Rocket-Launches/blob/main/Sheet%202.png)
![Viz 3](https://github.com/Cameronpearl/Rocket-Launches/blob/main/Sheet%203.png)
![Viz 4](https://github.com/Cameronpearl/Rocket-Launches/blob/main/Sheet%204.png)
