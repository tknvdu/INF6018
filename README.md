# INF6018 - Gender Equality, Education, and Economic Development - A Global Network Analysis

## Introduction 
This project aims to analyze the relationships between gender equality, education, and economic opportunities/development across countries in Europe, Asia, Middle East, North Africa and North America. The study will focus on 61 countries, examining a specific gender equality metric and their correlation with economic development as well as education.
The gender statistic data used is from the year 2022. The nodes are countries in which the gender statistics for Educational Attainment, Labor For Participation, (Un-)Employment Rates is available in the year 2022. The edges connect countries between their similiarity in the chosen gender equality metric. Additionally, data on each country is used to showing the economic development as well as the educational attainment after the threshold at least completed lower-secondary. 

**Research Questions:**

1. Which groups of countries are similiar in their gender equality?
2. Which countries offer gender equality in their economic opportunities, which more and which less?
3. How do these clusters relate to overall economic development and does education play a role?

## Methodology

#### Node Attributes
    'Labor': [
        'Ratio of female to male labor force participation rate (%) (modeled ILO estimate)',
        'Labor force participation rate, female (% of female population ages 15+) (modeled ILO estimate)',
        'Labor force participation rate, male (% of male population ages 15+) (modeled ILO estimate)'
    ],
    'Employment': [
        'Employment to population ratio, 15+, female (%) (modeled ILO estimate)',
        'Employment to population ratio, 15+, male (%) (modeled ILO estimate)',
        'Unemployment, female (% of female labor force) (modeled ILO estimate)',
        'Unemployment, male (% of male labor force) (modeled ILO estimate)' 
    ],
    'Law': [
        'Women Business and the Law Index Score (scale 1-100)',
        'Women, Business and the Law: Pay Indicator Score (scale 1-100)',
        'Women, Business and the Law: Workplace Indicator Score (scale 1-100)',
        'Women, Business and the Law: Mobility Indicator Score (scale 1-100)'
    ],
    'Education': [
        'Educational attainment, at least completed upper secondary, population 25+, female (%) (cumulative)',
        'Educational attainment, at least completed upper secondary, population 25+, male (%) (cumulative)',
        'Educational attainment, at least completed post-secondary, population 25+, female (%) (cumulative)',
        'Educational attainment, at least completed post-secondary, population 25+, male (%) (cumulative)',
        'Educational attainment, at least Bachelor\'s or equivalent, population 25+, female (%) (cumulative)',
        'Educational attainment, at least Bachelor\'s or equivalent, population 25+, male (%) (cumulative)'
    ],
    'Economic': [
        'GDP per capita (constant 2010 US$)',
        'GNI per capita, Atlas method (current US$)',
        'GNI per capita, PPP (current international $)'
    ]
    
### Similarity Calculation
* Develop a composite similarity metric using multiple attributes, which estimates the relationship between gender equality in economic opportunities for each country
* Compare countries based on this metric for the strength of this relationship

To create meaningful metrics, we'll use female-to-male ratios for most indicators to capture relative gender differences:

#### Economic Opportunities Gender Equality Index (EOGEI)
To create a metric for gender equality in economic opportunities using labor force participation and employment indicators, we can create a composite index:

**Gender Parity in Labor Force Participation (GPLFP)**
```math
$$GPLFP = {\text{Female Labor Force Participation Rate} \over \text{Male Labor Force Participation Rate}} * 100$$
```

**Gender Parity in Employment-to-Population Ratio (GPETP)**
```math
$$GPLFP = {\text{Female Employment-to-Population Ratio} \over \text{Male Employment-to-Population Ratio}} * 100$$
```

**Gender Parity in Unemployment Labor Force Rate (GPULF)**
```math
$$GPLFP = {\text{Male Unemployment Rate} \over \text{Female Unemployment Rate}} * 100$$
```

Note: For GPULF, we use male/female to ensure that lower female unemployment results in a higher score.

**Interpretation**
* EOGEI = 100: Perfect gender parity
* EOGEI < 100: Disparity favoring males
* EOGEI > 100: Disparity favoring females
Gender parity is considered achieved if 97 ≤ EOGEI ≤ 103.

This composite metric provides a balanced view of gender equality in economic opportunities by considering participation, employment, and unemployment factors. It allows for a more nuanced understanding of gender disparities in the labor market, as it captures both the willingness to work (labor force participation) and the actual employment outcomes.
Using both labor force participation and employment indicators captures different aspects of economic opportunities:
1. Labor force participation shows the proportion of the working-age population that engages in the labor market, either by working or looking for work.
2. Employment indicators provide information on the actual success in securing employment and the quality of labor market outcomes.

#### Gender Parity Index (GPI) for Education

```math
\left( \sum_{k=1}^n a_k b_k \right)^2 \leq \left( \sum_{k=1}^n a_k^2 \right) \left( \sum_{k=1}^n b_k^2 \right)
```

**Gender Parity Index (GPI) for Education**

```math
$$EAGPI_{secondary} = {\text{Female Secondary Attainment (\%)} \over \text{Male Secondary Attainment (\%)}}$$
$$EAGPI_{postsec} = {\text{Female Postsecondary Attainment (\%)} \over \text{Male Postsecondary Attainment (\%)}}$$
$$EAGPI_{bachelor} = {\text{Female Bachelor's Attainment (\%)} \over \text{Male Bachelor's Attainment (\%)}}$$
```

**Interpretation**
* GPI = 1: Perfect gender parity
* GPI < 1: Disparity in favor of males
* GPI > 1: Disparity in favor of females
To check for gender equality, we use these thresholds:
* 0.97 ≤ GPI ≤ 1.03: Gender parity achieved
* GPI < 0.97: Disparity favoring males
* GPI > 1.03: Disparity favoring females

**Overall Educational Attainment GPI**
To get a more comprehensive view of educational attainment across genders, we calculate an overall Educational Attainment GPI by averaging the three GPIs:

```math
$$EAGPI_{overall} = {{EAGPI_{secondary}} + {EAGPI_{postsec}} + {EAGPI_{bachelor}} \over 2}$$
```

## Results
This is where you summarize the main results of the analysis.

## Conclusions
This is where you present the answers to the the question that you have raised and discuss whether you were able to find the answers that you were looking for.

## References
* Igraph reference.  https://cran.r-project.org/web/packages/igraph/vignettes/igraph.html
* World Bank Databank World Development Indicators: https://databank.worldbank.org/source/gender-statistics
* CEIC Data:
  * https://www.ceicdata.com/en/thailand/education-statistics/th-educational-attainment-at-least-completed-postsecondary-population-25-years-female--cumulative
  * https://www.ceicdata.com/en/thailand/education-statistics/th-educational-attainment-at-least-completed-postsecondary-population-25-years-male--cumulative
  * https://www.ceicdata.com/en/uzbekistan/education-statistics/uz-educational-attainment-at-least-completed-postsecondary-population-25-years--cumulative-female
  * https://www.ceicdata.com/en/uzbekistan/education-statistics/uz-educational-attainment-at-least-completed-postsecondary-population-25-years--cumulative-male
