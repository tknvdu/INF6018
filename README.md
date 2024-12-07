# INF6018
Project for INF6018

## Gender Equality, Education, and Economic Development - A Global Network Analysis

### Introduction 
This project aims to analyze the relationships between gender equality, education, and economic opportunities/development across countries in Europe, Asia, Middle East, North Africa and North America. The study will focus on 61 countries, examining a specific gender equality metric and their correlation with economic development as well as education.
The gender statistic data used is from the year 2022. The nodes are countries in which the gender statistics for Educational Attainment, Labor For Participation, (Un-)Employment Rates is available in the year 2022. The edges connect countries between their similiarity in the chosen gender equality metric. Additionally, data on each country is used to showing the economic development as well as the educational attainment after the threshold at least completed lower-secondary. 

The questions asked are: 

1. Which groups of countries are similiar in their gender equality?
2. Which countries are ?
3. how length of basic education and size of emigration may be related?

### Research Questions
1. How does gender equality in education and economic opportunities correlate with each other across different countries?
2. Are there clusters of countries with similar gender equality profiles, and how do these clusters relate to overall economic development?

### Methodology

#### Data Collection and Preprocessing
* Source: World Bank Gender Data Portal
* Time range: 2019-2023
* Preprocessing steps to handle messy data and ensure proper formatting

#### Network Structure
* Nodes: 61 Countries
* Links: Similarity in gender equality metrics

#### Node Attributes
* Female to male ratio of labor force participation
* Female to male ratio of secondary education enrollment
* Female to male ratio of tertiary education enrollment
* Gender wage gap
* Percentage of women in managerial positions
* Female to male ratio of unemployment rates
* GDP per capita
* Gender Inequality Index

### Similarity Calculation
* Develop a composite similarity metric using multiple attributes, not just the Gender Inequality Index
* Incorporate time-based analysis to capture trends over the 2019-2023 period
* Explore different weighting schemes for attributes to assess their impact on similarity calculations

### Correlation Analysis
* Develop metrics to estimate the relationship between gender equality in education and economic opportunities for each country
* Compare countries based on these relationships
* Utilize statistical methods to quantify correlations

### Clustering Analysis
* Apply clustering algorithms to identify groups of countries with similar gender equality profiles
* Analyze the relationship between these clusters and overall economic development

### Breaking Down the Analysis
For RQ1, we'll:
Estimate the relationship between gender equality in education and economic opportunities for each country individually
Develop composite metrics for education equality and economic opportunity equality
Use statistical methods (e.g., Pearson correlation, regression analysis) to quantify the relationship between these composite metrics
Compare countries based on the strength and direction of these relationships

### Meaningful Metrics
To create meaningful metrics, we'll use female-to-male ratios for most indicators to capture relative gender differences

When $a \ne 0$, there are two solutions to $(ax^2 + bx + c = 0)$ and they are
$$ x = {-b \pm \sqrt{b^2-4ac} \over 2a} $$

**Gender Parity Index (GPI) for Education**

```math
\left( \sum_{k=1}^n a_k b_k \right)^2 \leq \left( \sum_{k=1}^n a_k^2 \right) \left( \sum_{k=1}^n b_k^2 \right)
```
**Gender Parity Index (GPI) for Education**

```math
$$GPI_{secondary} = {Female Secondary Attainment / Male Secondary Attainment}$$
$$GPI_{postsec} = {Female Postsecondary Attainment / Male Postsecondary Attainment}$$
$$GPI_{bachelor} = {Female Bachelor's Attainment / Male Bachelor's Attainment}$$
```

Interpretation
* GPI = 1: Perfect gender parity
* GPI < 1: Disparity in favor of males
* GPI > 1: Disparity in favor of females
To check for gender equality, we use these thresholds:
* 0.97 ≤ GPI ≤ 1.03: Gender parity achieved
* GPI < 0.97: Disparity favoring males
* GPI > 1.03: Disparity favoring females

https://www.ceicdata.com/en/thailand/education-statistics/th-educational-attainment-at-least-completed-postsecondary-population-25-years-female--cumulative
https://www.ceicdata.com/en/thailand/education-statistics/th-educational-attainment-at-least-completed-postsecondary-population-25-years-male--cumulative
https://www.ceicdata.com/en/uzbekistan/education-statistics/uz-educational-attainment-at-least-completed-postsecondary-population-25-years--cumulative-female
https://www.ceicdata.com/en/uzbekistan/education-statistics/uz-educational-attainment-at-least-completed-postsecondary-population-25-years--cumulative-male
