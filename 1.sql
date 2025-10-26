#SELECT * FROM try.netflix LIMIT 5

#SELECT COUNT(*) FROM try.netflix
 
--movies vs TV shows
SELECT type,COUNT(*)
FROM try.netflix
GROUP BY type;

--common countries
SELECT country,COUNT(*)
from try.netflix
GROUP BY country 
ORDER BY COUNT(*)DESC
LIMIT 10;

--recent release
SELECT title,release_year
FROM try.netflix
ORDER BY release_year DESC
LIMIT 10;

--show with in certain actor
SELECT title,cast
FROM try.netflix
WHERE CAST LIKE'%Prabhu Deva%'

 ALTER TABLE try.netflix
 ADD COLUMN total_views INT,
 ADD COLUMN avg_watch_time INT,
 ADD COLUMN likes INT;

SELECT *
FROM try.netflix
--to drop column
ALTER TABLE try.netflix
DROP COLUMN total_views
-- to update the row values
UPDATE try.netflix
SET avg_watch_time =NULL

INSERT INTO try.netflix(total_views,avg_watch_time,likes)VALUES
(
SELECT *
FROM try.netflix

--to find most shows viwed
SELECT n.title,s.total_views
FROM try.netflix as n
JOIN try.statusnetflix as s ON n.ï»¿show_id = s.show_id
ORDER BY s.total_views DESC
LIMIT 5;

--avg watch time per shows types
SELECT n.type,AVG(avg_watch_time) as avgwatch_pertype
FROM try.netflix as n
JOIN try.statusnetflix as s ON n.ï»¿show_id = s.show_id
GROUP BY n.type

--total view by categorey
SELECT n.listed_in,SUM(s.total_views) as totalview_category
FROM try.netflix as n
JOIN try.statusnetflix as s ON n.ï»¿show_id = s.show_id
GROUP BY n.listed_in
ORDER BY totalview_category DESC;

--top 5 most liked shows
SELECT n.title,n.director,s.likes
FROM try.netflix as n
JOIN try.statusnetflix ON n.ï»¿show_id = s.show_id
ORDER BY s.likes DESC
LIMIT 5;

--count of shows per country with average views
SELECT n.country,COUNT(n.ï»¿show_id) as total_shows, AVG(s.total_views) as avg_views
FROM try.netflix as n
JOIN try.statusnetflix as s ON n.ï»¿show_id = s.show_id
# WHERE total_shows IS NOT NULL
GROUP BY n.country
ORDER BY avg_views DESC;

--return show that recevied aboveavg likes
SELECT n.title,s.likes
FROM try.netflix as n
JOIN try.statusnetflix as s ON n.ï»¿show_id = s.show_id
WHERE s.likes > (SELECT AVG(likes) from try.statusnetflix)
ORDER BY s.likes DESC;

--total shows and avg views by release years
SELECT n.release_year ,COUNT(n.ï»¿show_id) as total_shows, AVG(s.total_views) as avg_views
FROM try.netflix AS n
JOIN try.statusnetflix as s ON n.ï»¿show_id = s.show_id
GROUP BY n.release_year 
ORDER BY n.release_year DESC;

SELECT *
FROM try.netflix
SELECT *
FROM try.statusnetflix