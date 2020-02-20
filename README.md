# ETL Project
## Chicago Business - Food Inspection and Yelp Ratings

#### Team: Arthur Chan, Lei Gu, Cindy Wagner and Jun Yang

## Description
For our project, we are

## Extract
#### 1. Chicago Business Licenses and Owners Dataset
Downloaded from Kaggle (https://www.kaggle.com/chicago/chicago-business-licenses-and-owners). Avaiable as two csv files (business-licenses.csv and business-owners.csv)

#### 2. Chicago Food Inspection Data
Downlaoded from Kaggle (https://www.kaggle.com/chicago/chicago-food-inspections). Avaiable as csv file.

#### 3. Yelp Ratings Dataset
Yelp ratings data were queried using gfairchild yelpai's (https://github.com/gfairchild/yelpapi) implementation of Yelp Fusion API. Two API endpoints were needed to query the Yelp ratings data:
1. Business match: use business name (DBA Name) and address from the Chicago business dataset to find the respective Yelp's business ID in Yelp dataset
2. Business detail: use Yelp's business ID to find Yelp rating and price level 
Data returned as JSON. 

## Transform
#### 1. Chicago Business Licenses and Owners Dataset
- Check for duplicates and missing data
- Remove columns
- Rename columns
- Split data from business-licenses.csv into two tables; one foucses on license, the other on business info.

#### 2. Chicago Food Inspection Data
- Transform Risk field from text (e.g. Risk 3 (Low)) to number (e.g. 3)
- Remove address-related columns
- Rename columns

#### 3. Yelp Ratings Dataset
- For the businesses with matching ones on Yelp, store business id, Yelp rating and price level if available.
- Price level came in as text ($$), transform to number of $ sign

## Load
add diagram here

Consolidating different data resources and migrating it to a production data base.



* **L**oad: the final database, tables/collections, and why this was chosen.

