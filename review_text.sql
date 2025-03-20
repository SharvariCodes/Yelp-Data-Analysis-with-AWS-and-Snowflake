create or replace table yelp_reviews (review_text variant)

copy into yelp_reviews
from 's3://sharvarigoesaws/yelpproject/'
CREDENTIALS = (
    AWS_KEY_ID = 'Enter your AWS key here'
    AWS_SECRET_KEY = 'Enter your secret key here'
)
FILE_FORMAT = (TYPE = JSON);

create or replace table tbl_yelp_reviews as
select review_text:business_id::string as business_id,
review_text:date::date as review_date,
review_text:user_id::string as user_id,
review_text:stars::number as review_stars,
review_text:text::string as review_text,
analyze_sentiment(review_text) as sentiments
from yelp_reviews

select count(*) from tbl_yelp_reviews

select * from tbl_yelp_reviews limit 100
