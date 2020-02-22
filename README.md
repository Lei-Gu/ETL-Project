# ETL Project
## Chicago Business - Food Inspection and Yelp Ratings

#### Team: Arthur Chan, Lei Gu, Cindy Wagner and Jun Yang

## Description
Checking yelp rating before considering which restaurants people should go to is pretty popular nowadays. We are interested in looking at some data from different sources to see if yelp ratings can have any relationship to food inspection results

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
- Remove non-Illinois addresses
- Remove columns
- Rename columns
- Data from business-licenses.csv are re-formated into licenses and business info tables.

#### 2. Chicago Food Inspection Data
- Transform Risk field from text (e.g. Risk 3 (Low)) to number (e.g. 3)
- Remove address-related columns
- Rename columns

#### 3. Yelp Ratings Dataset
- For the businesses with matching ones on Yelp, store business id, Yelp rating and price level if available.
- Price level came in as text ($$), transform to number of $ sign

## Load
All data are loaded to PostgresSQL. Data are organized into 5 tables.
- businessinfo
- licenses
- inspections
- owners

Database stucture also illustrated with diagram below.
![ImageDiagram](https://github.com/Lei-Gu/ETL-Project/blob/master/DBD/snip-1.PNG)


