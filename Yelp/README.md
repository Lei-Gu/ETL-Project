# ETL Project
### Query Star Rating and Price Level from Yelp

- gfairchild yelpai's implementation of Yelp Fusion API is used
- There is a 5,000 daily limit imposed by Yelp Fusion API. Each search uses 2 endpoints. Do not attempt to query more tha 2,500 businesses in one day

Workflow
1. Get unique business name, address, city and state data from inspection data
2. Use `Business Query` endpoint to find matching business on Yelp
3. Use `Business Detail` endpoint to obtain star rating and price level
4. Send queried data to `yelp` table in production database