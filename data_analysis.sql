--10 questions for analyzing data closely

--1. Find number of businesses in each category
with cte as (
select business_id, trim(A.value) as category
from tbl_yelp_businesses,
lateral split_to_table(categories, ',') A
)
select category, count(*) as no_of_business
from cte
group by category
order by 2 desc

--2. Find the top 10 users who have reviewed the most businesses in the 'Restaurants' category
-- ilike is for case insensitive search
select r.user_id, count(distinct r.business_id) 
from tbl_yelp_reviews r
inner join 
tbl_yelp_businesses b on r.business_id = b.business_id
where b.categories ilike '%restaurant%'
group by 1
order by 2 desc
limit 10

--3. Find the most popular categories of businesses (based on number of reviews)
with cte as (
select business_id, trim(A.value) as category
from tbl_yelp_businesses,
lateral split_to_table(categories, ',') A
)
select b.category, count(*) as no_of_reviews
from cte b
inner join tbl_yelp_reviews r
on r.business_id = b.business_id
group by 1
order by 2 desc

--4. Find top 3 most recent reviews for each business
with cte as (
select r.*, b.name,
row_number() over(partition by r.business_id order by review_date desc) as rn
from tbl_yelp_reviews r
inner join tbl_yelp_businesses b on r.business_id = b.business_id
)
select * from cte 
where rn <= 3

--5. Find the month with highest number of reviews
select month(review_date) as review_month, count(*) as no_of_reviews
from tbl_yelp_reviews
group by 1
order by 2 desc

--6. Find the percentage of 5-star reviews for each business
with cte as (
select b.business_id, b.name, count(*) as total_reviews,
sum(case when r.review_stars=5 then 1 else 0 end) as five_star_reviews,
from tbl_yelp_reviews r
inner join tbl_yelp_businesses b on r.business_id = b.business_id
group by 1, 2
)
select *,
round((five_star_reviews/total_reviews)*100,2) as percent_five_star
from cte

--7. Find the top 5 most reviewed businesses in each city
with cte as (
select r.business_id, b.name, b.city, count(*) as no_of_reviews,
from tbl_yelp_reviews r 
inner join tbl_yelp_businesses b on r.business_id = b.business_id
group by r.business_id, b.name, b.city
)
select *
from cte
qualify row_number() over(partition by city order by no_of_reviews desc) <= 5

--8. Find the average rating of businesses that have at least 100 reviews
select r.business_id, b.name, count(*) as no_of_reviews, round(avg(review_stars),2) as avg_rating
from tbl_yelp_reviews r 
inner join tbl_yelp_businesses b on r.business_id = b.business_id
group by r.business_id, b.name
having count(*) >= 100

--9. List the top 10 users who have written the most reviews along with the businesses they reviewed.
select r.user_id, count(*) as no_of_reviews
from tbl_yelp_reviews r 
inner join tbl_yelp_businesses b on r.business_id = b.business_id
group by r.user_id
order by count(*) desc
limit 10

--10. Find top 10 businesses with the highest positive sentiment reviews.
select r.business_id, b.name, count(*) as no_of_reviews
from tbl_yelp_reviews r
inner join tbl_yelp_businesses b on  r.business_id = b.business_id
where sentiments = 'Positive'
group by r.business_id, b.name
order by count(*) desc
limit 10