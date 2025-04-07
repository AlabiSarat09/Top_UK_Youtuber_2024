/*

# Data cleaning steps
1. Remove unnecessary columns by only selecting the ones we need
2. Extract the YouTube channel names from the first column
3. Rename the column names

*/


select 
	NOMBRE,
	total_subscribers,
	total_views,
	total_videos
from 
	top_uk_youtube_2024; 

-- CHARINDEX
--select CHARINDEX('@', NOMBRE), NOMBRE FROM top_uk_youtube_2024

-- SUBSTRING

CREATE VIEW view_uk_youtube_2024 as
SELECT 
	CAST(SUBSTRING(NOMBRE, 1, CHARINDEX('@', NOMBRE)-1) AS VARCHAR(100)) as channel_name,
	total_subscribers,
	total_views,
	total_videos
FROM 
	top_uk_youtube_2024



/*
# Data quality tests

1. The data needs to be 100 records of YouTube channels(row count test)
2. The data needs four filled(column count test)
3. The channel name column must be string format and the other columns must be numerical data types(data types test)
4. Each record must be unique in the dataset (duplicate count check)

Row count - 100
Column count - 4

Data types

channel name - varchar
total_subscribers - int
total_views - int
total_videos - int

Duplicate = 0

*/


select * from view_uk_youtube_2024;

-- 1. Row count check

select 
	count(*) as no_of_rows
from 
	view_uk_youtube_2024;

-- 2. Column count check

select 
	 Count(*) as column_count
FROM 
	INFORMATION_SCHEMA.COLUMNS
WHERE 
	TABLE_NAME = 'view_uk_youtube_2024'


-- 3. Data type check

select 
	 COLUMN_NAME,
	 DATA_TYPE
FROM 
	INFORMATION_SCHEMA.COLUMNS
WHERE 
	TABLE_NAME = 'view_uk_youtube_2024'

-- 4. Duplicate count check

select 
	channel_name,
	count(*) as duplicate_count
from 
	view_uk_youtube_2024
group by 
	channel_name
having 
	count(*) > 1;

