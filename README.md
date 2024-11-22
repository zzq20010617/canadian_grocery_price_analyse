# canadian_grocery_price_analyse

## Overview

This paper analyzes data of bread and milk price in different grocery retailers in Canada from SQL data base. By calculating the mean value of all of the bread and milk price among all of grocery retailers and applying density graph to find the trend of the average price and compare the highest average price of bread and milk.


## File Structure

The repo is structured as:

- **data/**
  - `cleaned_data_bread.csv`: Contains the cleaned data of cleaned bread price among grocery retailers.
  - `cleaned_data_milk.csv': Contains the cleaned data of cleaned milk price among gorcery retailers.

- **other/**:
  - `llm_usage/`: Includes documentation about interactions with large language models (LLMs).
    - `usage.txt`
    
- **paper/**: Contains files used to generate the final paper.
  - `paper.pdf`: The final report in PDF format.
  - `paper.qmd`: The Quarto document used to generate the report.
  - `references.bib`: Bibliography file with references for the paper.

- **scripts/**: Contains sql files and a sketch of graphs and tables we are expecting to obtain.

  
- `.gitignore`: Specifies files to ignore in version control.
- `canadian_grocery_price_analyse.Rproj`: The R project file.
- `README.md`: This file.
  

## Statement on LLM usage

Aspects of the code were written with the assistance of ChatGPT-4o. The entire chat history is saved in other/llm_usage/usage.txt.