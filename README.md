# ETL Project
## Chicago Business - Food Inspection and Yelp Ratings

#### Team: Arthur Chan, Lei Gu, Cindy Wagner and Jun Yang (Feb 2020)

## Description
Checking yelp rating before considering which restaurants people should go to is pretty popular nowadays. We are interested in looking at some data from different sources to see if yelp ratings can have any relationship to food inspection results

## Extract
#### 1. Chicago Business Licenses and Owners Dataset
Downloaded from Kaggle (https://www.kaggle.com/chicago/chicago-business-licenses-and-owners). Avaiable as two csv files (business-licenses.csv and business-owners.csv)

#### 2. Chicago Food Inspection Data
Downlaoded from Kaggle (https://www.kaggle.com/chicago/chicago-food-inspections). Avaiable as csv file.

#### 3. Yelp Ratings Dataset
Yelp ratings data were queried using gfairchild yelpai's (https://github.com/gfairchild/yelpapi) implementation of Yelp Fusion API. Two API endpoints were needed to query the Yelp ratings data:
1. Business match: use business name (DBA Name) and address from the Chicago inspection dataset, find matching restaurant in Yelp's dataset, and obtain the respective Yelp's business ID
2. Business detail: use Yelp's business ID to find Yelp rating and price level 
Data returned as JSON. 

## Transform
#### 1. Chicago Business Licenses and Owners Dataset
- Check for duplicates and missing data
- Remove non-Illinois addresses
- Remove and rename columns
- Data from business-licenses.csv are split into licenses and business info tables.

#### 2. Chicago Food Inspection Data
- Transform Risk field from text (e.g. Risk 3 (Low)) to number (e.g. 3)
- Use `Facility Type` to filter out non-restaurants
- Drop duplicate inspections in the same table
- Remove address-related columns, related info already in business license dataset
- Rename columns

#### 3. Yelp Ratings Dataset
- For the businesses with matching ones from Yelp, store business id, Yelp rating and price level if available.
- Price level came in as text ($$), transform to number of $ sign

## Load
All data are loaded to PostgresSQL. Data are organized into 5 tables.
- businessinfo
- licenses
- inspections
- owners
- yelp

Database stucture also illustrated with diagram below.
- `license_id` is the key linking inspections, licenses and yelp table. Each business can have multiple licenses
- `account_number` links licenses and business info. Each business has an account number

![ImageDiagram](https://github.com/Lei-Gu/ETL-Project/blob/master/DBD/snip-1.PNG)

## Join Tables
Examples of SQL queries:
1. Latest inspection by inspection_id

`SELECT  id, license_id,dba_name, aka_name, risk, max(inspection_date), inspection_type, results, violations
FROM inspections
GROUP BY id`

2. Top 10 yelp rating restaurants with inspection results

`SELECT i.license_id, y.cust_rating, y.price_lvl, i.id, i.dba_name, i.risk, 
        i.inspection_type, i.results, i.violations, y.bus_id 
FROM inspections as i
JOIN yelp as y
ON i.license_id=y.license_id
WHERE y.cust_rating IS NOT NULL 
ORDER BY y.cust_rating DESC
LIMIT 10;`
