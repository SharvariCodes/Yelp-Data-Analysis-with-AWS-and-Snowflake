# Yelp-Data-Analysis-with-AWS-and-Snowflake
This project analyzes Yelp data using AWS S3, Snowflake, and Python. It involves splitting large JSON files, storing data in Snowflake, and performing sentiment analysis with Python UDFs. SQL queries extract insights on businesses, user behavior, and review trends. Future improvements include visualizations and automated ingestion. 🚀


# 📊 Yelp Data Analysis with AWS & Snowflake

## 📝 Overview
This project analyzes Yelp business and review data using AWS S3, Snowflake, and sentiment analysis techniques. The dataset consists of large JSON files containing Yelp reviews and business information. We preprocess, store, and analyze the data to extract insights using SQL queries.

## 🔍 Steps Involved

### 1️⃣ Data Acquisition
- 📥 Downloaded two large JSON files from the official Yelp dataset:
  - `yelp_academic_dataset_review.json` (5GB+)
  - `yelp_academic_dataset_business.json`

### 2️⃣ Splitting Large JSON Files
- 🔄 Since the `Reviews` JSON file was too large, it was split into 10 smaller files for easier processing.
- 🛠️ The process involved reading the original JSON file, counting the total lines, and distributing them evenly across multiple smaller files.

### 3️⃣ Uploading Data to AWS S3
- ☁️ Uploaded the split review files and business file to an AWS S3 bucket.
- 🏗️ Gained hands-on experience navigating AWS services and managing S3 storage.

### 4️⃣ Loading Data into Snowflake
- ❄️ Used Snowflake's `COPY INTO` command to load the JSON data from S3 into Snowflake tables.
- 🗄️ Created tables:
  - `yelp_reviews` to store review data
  - `yelp_businesses` to store business data

### 5️⃣ Converting JSON Data to Tabular Format
- 📑 Extracted relevant fields from JSON and created structured tables:
  - `tbl_yelp_reviews` with columns such as `business_id`, `review_date`, `user_id`, `review_stars`, `review_text`, and `sentiments`.
  - `tbl_yelp_businesses` with columns like `business_id`, `name`, `city`, `state`, `review_count`, `stars`, and `categories`.

### 6️⃣ Sentiment Analysis
- 🧠 Implemented a user-defined function (UDF) in Snowflake using Python (`TextBlob`) to analyze review sentiment.
- 📊 Categorized reviews into `Positive`, `Neutral`, or `Negative` based on sentiment polarity.

### 7️⃣ Data Analysis & Insights
Performed SQL queries to extract insights:

#### 🏢 Business Analysis
- 📊 Counted the number of businesses per category.
- ⭐ Identified the most popular business categories based on review count.
- 🏆 Determined the top 5 most-reviewed businesses in each city.

#### 👥 User Behavior Analysis
- 🏅 Found the top users who reviewed the most businesses in the `Restaurants` category.
- 📝 Listed the top 10 users who wrote the most reviews.

#### 📅 Review Trends
- 📈 Identified the month with the highest number of reviews.
- 🕵️‍♂️ Found the most recent reviews for each business.

#### 💬 Sentiment Insights
- ⭐ Calculated the percentage of 5-star reviews for each business.
- 🏅 Listed the top 10 businesses with the highest number of positive sentiment reviews.

## 🛠️ Tools & Technologies Used
- **AWS S3** ☁️: Cloud storage for hosting JSON files.
- **Snowflake** ❄️: Cloud data warehouse for storing and querying data.
- **Python (TextBlob)** 🐍: Sentiment analysis.
- **SQL** 🗄️: Data transformation and analysis.

## 🎓 Key Learnings
- 🔄 Handling large datasets efficiently by splitting and uploading to cloud storage.
- 📥 Loading and processing JSON data in Snowflake.
- 🧠 Performing sentiment analysis using Python UDFs in Snowflake.
- 🏆 Writing advanced SQL queries to derive business insights.

## 🚀 Future Improvements
- 📊 Implementing a visualization dashboard (e.g., Tableau or Power BI) for better insight representation.
- 🤖 Automating data ingestion using AWS Lambda.
- 🧠 Expanding sentiment analysis with more advanced NLP models.

## ✅ Conclusion
This project demonstrates a complete data pipeline from acquiring raw JSON data to performing insightful analysis using cloud technologies. It highlights the power of AWS and Snowflake in handling large datasets efficiently.

