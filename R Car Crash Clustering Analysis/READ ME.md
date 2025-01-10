**Introduction**

The case study analyzed factors of car accidents in San Diego in January/February of 2013. Agglomerative clustering analysis was performed to group observations into clusters, allowing observations to be made. Using R (the case study used Analytic Solver in Excel), this project will show whether the case study’s findings were correct, whether a change in the similarity measurement affected the result, and whether a change in the number of clusters affected the result.

**Data Processing**

The data provided needed to be cleaned up by removing insignificant columns, filtering the city and month, as well as changing the weekday variable into a dummy variable for whether the accidents took place on a weekend or not. The variables needed were weekend, crash severity, clear weather, highway, and lighting.

**Software and Analysis**

Using R, agglomerative clustering analysis was performed using the matching coefficients as the distance measure (“binary” method) and average linkage for the clustering method. This resulted in the data being grouped into four clusters, showing averages of how many cases contained the variable in that cluster, and the number of cases for each cluster. The distance was then tested using Gower’s coefficient and the number of clusters was tested using 3 instead of 4.

**Findings**

**_R Results_**

<img width="468" alt="image" src="https://github.com/user-attachments/assets/6f253c1b-be59-4642-8cae-51114e500f8a" />

In the R results, there were similarities such as most accidents being on a weekday, not severe, in clear weather, and during the day. Also, cluster 4 in each table represented highway accidents in fair light and weather. There were also important differences, such as more severe accidents happening on weekends instead of weekdays. There also was a different number of observations, bad weather was the variable in the original case study instead of clear weather, and there was less of a focus on severe accidents in the R results.

Overall, the results do not match the case study’s conclusion that severe accidents seem to happen more often on weekdays, but it does agree that they happen more in fair weather.

**_Gower’s Coefficient_**

<img width="468" alt="image" src="https://github.com/user-attachments/assets/3059d60c-d6b1-442b-aee8-ccad407be4f1" />

Changing the similarity measure to Gower’s coefficient made changes to the results. It showed that more severe accidents happen on the weekdays like the case study did. All cases showed clear weather in new table, cluster sizes were less varied, and there was more focus on lighting conditions.

**_Clusters_**

<img width="468" alt="image" src="https://github.com/user-attachments/assets/0e240d59-9134-48ca-9818-947c96bc524c" />

Changing the number of clusters didn’t make a big difference. Clusters 3 and 4 in table 1 are the exact same as clusters 2 and 3 in table 2. All it did was add the 39 cases in cluster 2 to water down the results of cluster 1 with the zeros.

**Conclusion**

The results in R did not match the results of the case study. While they both reported more severe accidents in fair weather, they disagreed on whether they happened more on weekends or weekdays. Changing the similarity measure to Gower’s coefficient did change the results in several ways. Changing the number of clusters did not change the results almost at all.

**Discussion**

The findings raise some questions: why was the R code result so different from the original case study? The data provided could have been different from what the case study used, or there were missing cases, as there were less observations than there should have been. Because more severe accidents happened in fair weather, is this caused by feeling more comfortable to speed?
