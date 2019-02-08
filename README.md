# Book Recommender System

## Problem Statement
Recommender systems are an incredibly useful tool, whether that be for end-users or business applications. We developed an item-to-item book recommender system for consumers, film studios and publishing companies. Using the Book-Crossing dataset, we analyzed and used ratings to calculate the cosine similarity between books. Due to the sparsity of the data, our recommendations were inconsistent and had low similarities at times. It will be benefical to collect more ratings data (if possible) or build a hybrid recommender with book metadata moving forward.

## Content
|01. Data Preparation|02. EDA and Cleaning|03. Recommender System|
|---|---|---|
|Users|Combine Books and Ratings|Preprocessing|
|Book Ratings|Clean Data|Modeling|
|Books|Explicit and Implicit Ratings|Conclusions and Recommendations|

## Executive Summary

### Data Source
[Book Crossing Dataset](http://www2.informatik.uni-freiburg.de/~cziegler/BX/) 

### Target Audience
**Consumers**: A common struggle amongst readers is finding the next book to read. The recommender system will allow them to easily explore potential book options based on a previous book they've liked.

**Film Studios**: Books are a common source for movie adaptations, but not all perform well in the box office. One contributing factor is the storyline. By using the recommender system, executives can search for books that have had successful adaptations and find similar books to make into a film. Choosing a book that shares the same, large reading fanbase as an existing movie adaptation will increase the chances of it receiving a positive reception.

**Publishing Companies**: Publishing companies can leverage the recommender system in a similar way. By searching for a successful book and those similar to it, decision-makers can determine commonalities among them. These will be important features to consider and look for when deciding on a publication.  

### Approach
**[1. Data Preparation](http://localhost:8888/lab/tree/dsi%2FProjects%2Fcapstone%2Fcode%2F01_Data_Preparation.ipynb):** <br>The Book-Crossing dataset, collected in a 4-week crawl from August to September 2004 by Cai-Nicolas Ziegler, was used for the book recommendation system. It consists of three csv files: Users, Book Ratings, and Books. Due to the magnitude of the file sizes, the files were loaded onto postgreSQL for storage and easy access. An intial attempt at saving the files led to an encoding error. In this notebook, we will read in the csv files, rename the columns and save out the files again. This will resolve the encoding error and allow us to save the dataset in our postgres database.

SQL file used to create these tables can be found [here](http://localhost:8888/lab/tree/dsi%2FProjects%2Fcapstone%2Fsql_files%2F01_bx_create_tables.sql).

**[2. Exploratory Data Analysis and Cleaning](http://localhost:8888/lab/tree/dsi%2FProjects%2Fcapstone%2Fcode%2F02_EDA_and_Cleaning.ipynb):** <br>Prior to building our recommender system, we cleaned and combined our books and book_ratings tables. The users table was not used as user location and age are not pertinent to our item-to-item recommender. There was a discrepancy between the books in our books table and those in book_ratings. The dataframes were combined and books that were not available in both were removed prior to any cleaning or visualization. Book count, publication years, and ratings count were explored to get a better understanding of our data. Special attention was given to explicit and implicit ratings, given that it is the feature that will be used for our recommender.

New dataframes were created and loaded onto the server. SQL file used to create these tables can be found [here](http://localhost:8888/lab/tree/dsi%2FProjects%2Fcapstone%2Fsql_files%2F02_eda_create_tables.sql).

**[3. Recommender System](http://localhost:8888/lab/tree/dsi%2FProjects%2Fcapstone%2Fcode%2F03_Recommender_System.ipynb):** <br> We built an item-to-item recommender system for our books. With this recommender, users will be able to search for a book they've liked and view the top 5 most similar books. We only used explicit ratings (1-10) and included books that have more than 3 ratings. We then scaled our ratings to remove item-bias and avoid continuously recommending a book due to its popularity. Cosine similarity was used as our metric to determine how closely related our search and recommendations are.

### Limitations
-  **Non-English Books:** There were several books that were not in english, resulting in abnormal characters and symbols appearing in our dataset. This made it difficult to clean the data other than removing HTML code artifacts. Investigating ways for these book titles and authors to render correctly will be beneficial.

-  **High Count of Implicit Ratings:** Over 50% of the dataset comprised of implicit ratings (`0`), indicating an interaction between the reader and book occurred, but no preference was given. Attempts to impute these implicit ratings with the overall mean rating for each book or the overall mean rating given be each user worsened recommendations. We were only able to use explicit ratings for our final recommender system.

-  **Data Sparsity:** We had an incredibly sparse dataframe because only explicit ratings were used. Trying to account for this by scaling ratings by book count and rating average did not alleviate this issue.

-  **Expensive Computation:** We tried to use Singular Value Decomposition for a model-based recommender system, making it easier to scale up in the future. With 100 components, however, only 17.5% of the variance was explained. Due to limited RAM, we were not able to model with more components. 

### Conclusions and Recommendations
The quality of our recommendations varies depending on the book searched. Our search for The Little Mermaid returned books with equal similarity (0.634178). Despite having the same values, it's not readily apparant that they share the same qualities as our search.

The inconsistent returns are largely due to the sparsity of our data. Since implicit ratings and books with 3 or less ratings were removed, our recommender system only consists of 18,263 books with 224,114 ratings.

To improve our recommender, we can:

-  **Collect more data:** Collecting more ratings data will be the most direct and advantageous method to improve our recommendations. This will help address the high count of implicit ratings and data sparsity issues.

-  **Build a hybrid recommender system:** We can build a hybrid recommender system, taking into account both the ratings and book metadata. APIs like Google Books will be beneficial to grab data like page count, genre and book description.
