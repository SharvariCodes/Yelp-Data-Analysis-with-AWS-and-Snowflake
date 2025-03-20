create or replace table yelp_businesses (business_text variant)

copy into yelp_businesses
from 's3://sharvarigoesaws/yelpproject/yelp_academic_dataset_business.json'
CREDENTIALS = (
    AWS_KEY_ID = 'Enter your AWS key here'
    AWS_SECRET_KEY = 'Enter your secret key here'
)
FILE_FORMAT = (TYPE = JSON);

select * from yelp_businesses limit 10

create or replace table tbl_yelp_businesses as
select business_text:business_id::string as business_id,
business_text:name::string as name,
business_text:city::string as city,
business_text:state::string as state,
business_text:review_count::string as review_count,
business_text:stars::number as stars,
business_text:categories::string as categories
from yelp_businesses 

select * from tbl_yelp_businesses limit 10