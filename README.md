# INF6018
Project for INF6018

## Gender Equality, Education, and Economic Development - A Global Network Analysis

### Introduction 
This project aims to analyze the relationships between gender equality, education, and economic opportunities across countries in Europe, Central Asia, and North America. The study will focus on 61 countries, examining various gender equality metrics and their correlation with economic development

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
