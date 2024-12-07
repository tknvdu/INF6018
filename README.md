# INF6018 Project - Gender Equality, Education, and Economic Development - A Global Network Analysis

## Introduction 
This project aims to analyze the relationships between gender equality, education, and economic opportunities/development across countries in Europe, Asia, Middle East, North Africa and North America. The study will focus on 61 countries, examining a specific gender equality metric and their correlation with economic development as well as education.
The gender statistic data used is from the year 2022. The nodes are countries in which the gender statistics for Educational Attainment, Labor For Participation, (Un-)Employment Rates is available in the year 2022. The edges connect countries between their similiarity in the chosen gender equality metric. Additionally, data on each country is used to showing the economic development as well as the educational attainment after the threshold at least completed lower-secondary. 

**Research Questions:**

1. Which groups of countries are similiar in their gender equality?
2. Which countries offer gender equality in their economic opportunities, which more and which less?
3. How do these clusters relate to overall economic development and does education play a role?

## Methodology

### Node Attributes
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

### Economic Opportunities Gender Equality Index (EOGEI)
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

### Gender Parity Index (GPI) for Education

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

```
# Write edges
fout.write("*Edges\n")
for i in range(len(df_columns)):
    for j in range(i + 1, len(df_columns)):
        country1 = df_columns.index[i]
        country2 = df_columns.index[j]
        eogei1 = df_columns.iloc[i]
        eogei2 = df_columns.iloc[j]
        
        # Calculate the absolute difference
        diff = abs(eogei1 - eogei2)
        
        # Define the maximum allowed difference for connection
        max_diff = 7 # This can be adjusted based on your needs
        
        if diff <= max_diff:
            # Calculate weight: inverse of the difference, normalized
            weight = 1 - (diff / max_diff) 
            fout.write(f"{nodes_dict[country1]} {nodes_dict[country2]} {weight:.4f}\n")
```

Benefits of This Approach
* Density Representation: Countries with very similar EOGEI values will have edge weights closer to 1, representing a denser connection.
* Continuous Scale: Instead of discrete categories, this approach provides a continuous scale of relationships between countries.
* Flexibility: By adjusting the max_diff value, you can control how liberally countries are connected while maintaining the principle that closer EOGEI values result in stronger connections.
* Interpretability: The weight directly represents how similar two countries are in terms of their EOGEI values. A weight of 0.9, for example, indicates a very strong similarity, while a weight of 0.1 suggests the countries are at the edge of being considered connected at all.

This weighting system better reflects the idea that countries with similar EOGEI values should be more densely connected in the network, providing a more intuitive and meaningful representation of the relationships between countries based on their gender equality in economic opportunities.

Implications for Analysis
Identifying Leaders and Laggards: Countries above 107 can be easily identified as leaders in gender equality, while those below 93 are lagging behind.
Transition Analysis: Countries near the thresholds (close to 93 or 107) may be of particular interest, as they represent transitional states in gender equality progress.
Regional Comparisons: The network structure allows for easy identification of regions or groups of countries with similar gender equality levels.
Policy Implications: Policymakers can use this network to identify countries with similar EOGEI values for potential collaboration or benchmarking in gender equality initiatives.

## Results

#### Network Parameters of Node Centrality
Excerpt from RStudio Console
```
> top_nodes_degree
  Bulgaria Luxembourg  Australia    Denmark      Malta 
        30         30         28         28         28 
> top_nodes_betw
               Czechia Bosnia and Herzegovina               Slovenia                  India 
              344.3333               277.0000               220.3780               196.0000 
               Croatia 
              188.7989 
> top_nodes_clo
           Lao PDR            Moldova West Bank and Gaza            Bahrain Iran, Islamic Rep. 
         3.2226877          3.2226877          0.7789375          0.5393161          0.4395604 
> top_nodes_eigen
       Sweden       Hungary United States       Ireland      Bulgaria 
    1.0000000     0.9999475     0.9956765     0.9919266     0.9908859 
```

### Degree Centrality
The top countries by degree centrality are:
* Bulgaria
* Luxembourg
* Australia
* Denmark
* Malta
These countries have the highest number of connections (edges) to other countries in the network, indicating that they have similar gender equality metrics to many other nations. This suggests that these countries may represent "average" or "typical" cases in terms of gender equality measures across the studied regions.

### Betweenness Centrality
The top countries by betweenness centrality are:
* Czechia
* Bosnia and Herzegovina
* Slovenia
* India
* Croatia
These countries act as important bridges or connectors in the network. They likely represent transitional states between different clusters of countries with varying levels of gender equality. Their position suggests they may play crucial roles in understanding how gender equality metrics transition between different groups of countries.

### Closeness Centrality
The top countries by closeness centrality are:
* Lao PDR
* Moldova
* West Bank and Gaza
* Bahrain
* Iran, Islamic Rep.
These countries are, on average, closest to all other countries in the network in terms of their gender equality metrics. This suggests that they may represent either "median" or "extreme" cases in the study, potentially offering insights into the typical gender equality situations in their diverse regions.

### Eigenvector Centrality
The top countries by eigenvector centrality are:
* Sweden
* Hungary
* United States
* Ireland
* Bulgaria
These countries are not only well-connected themselves but are also connected to other highly connected countries. This suggests that they are central to clusters of nations with similar gender equality profiles, potentially representing leaders or exemplars within their respective regions or development categories.

**Interpretation and Implications**
* The appearance of countries from various regions (Europe, Asia, Middle East, North America) across different centrality measures highlights the complex and diverse nature of gender equality issues globally.
* Some unexpected countries appear as central in different measures (e.g., Lao PDR in closeness centrality), which may indicate unique or transitional positions in gender equality metrics for further investigation.
* Countries with high betweenness centrality (like Czechia and Bosnia and Herzegovina) might be particularly interesting for policymakers as they could represent transitional states in gender equality progress.
* The presence of both highly developed (e.g., United States, Sweden) and developing countries (e.g., India, Lao PDR) in various centrality measures suggests that the relationship between economic development and gender equality is quite complex and not necessarily linear.
* Countries like Sweden and the United States, with high eigenvector centrality, might be seen as regional or global leaders in gender equality metrics, potentially offering best practices for others to follow.

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
