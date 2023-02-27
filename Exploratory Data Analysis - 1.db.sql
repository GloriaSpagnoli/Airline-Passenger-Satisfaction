SELECT satisfaction, count(id) as 'Number of passengers',
ROUND(count(*) * 100.0 / sum(count(*)) Over(),2) as 'Percentage of passengers'
from passengers
group by satisfaction;

SELECT [customer type],
COUNT([customer type]) as 'Number of passengers',
ROUND(COUNT(*) * 100 / sum(COUNT(*)) Over(),2) as 'Percentage of passengers'
from passengers
GROUP by [customer type];

SELECT satisfaction, [customer type],
count(id) as 'Number of passengers',
ROUND(count(*) * 100.0 / sum(count(*)) Over(),2) AS 'Percentage of passengers'
FROM passengers
GROUP BY [customer type], satisfaction
order by satisfaction desc;

SELECT satisfaction, [type of travel],
count(id) as 'Number of passengers',
ROUND(count(*) * 100.0 / sum(count(*)) Over(),2) AS 'Percentage of passengers'
from passengers
GROUP by [type of travel], satisfaction
order by satisfaction desc;

-- Analysis of returning customers

SELECT count(id) as 'Number of returning passengers'
from passengers
where [Customer Type] = 'Returning';

create table returning_by_gender AS
SELECT gender, count(id) as 'Number of passengers',
ROUND(count(*) * 100.0 / sum(count(*)) Over(),2) as 'Percentage of passengers'
from passengers
where [customer type] = 'Returning'
group by gender;

SELECT * from returning_by_gender;

SELECT sum([number of passengers]) as 'Number of passengers',
ROUND(count(*) * 100.0 / sum(count(*)) Over(),2) as 'Percentage of passengers'
from returning_by_gender;

insert into returning_by_gender('Gender', 'Number of passengers','Percentage of passengers')
values ('All', '106100', '100')

SELECT * from returning_by_gender;

SELECT min(age) as 'Younger passenger', max(age) as 'Older passenger',
ROUND(avg(age),2) as 'Average age of passengers'
from passengers
where [Customer Type] = 'Returning';

SELECT age, count(*) as 'Passengers per age group'
from passengers
where [customer type] = 'Returning'
group by age
order by count(*) desc;

SELECT class, count(ID) as 'Number of passengers',
ROUND(COUNT(*) * 100.0 / sum(count(*)) Over(),2) as 'Percentage of passengers'
from passengers
where [customer type] = 'Returning'
group by class;

SELECT [type of travel], count(id) as 'Number of passengers',
ROUND(COUNT(*) * 100.0 / sum(count(*)) Over(),2) as 'Percentage of passengers'
from passengers
where [customer type] = 'Returning'
GROUP by [type of travel];

SELECT min([flight distance]) as 'Shorter flight distance in miles',
max([flight distance]) as 'Longer flight distance in miles',
ROUND(avg([flight distance]),2) as 'Average flight distance in miles'
from passengers
where [customer type] = 'Returning'

SELECT min([flight distance]) as 'Shortest distance (miles)',
COUNT(*) AS 'Number of passengers'
FROM passengers
WHERE [customer type] = 'Returning'
AND [flight distance] <= (SELECT min([flight distance])
                          FROM passengers WHERE [customer type] = 'Returning');

SELECT max([flight distance]) as 'Longest distance (miles)',
COUNT(*) AS 'Number of passengers'
FROM passengers
WHERE [customer type] = 'Returning'
AND [flight distance] >= (SELECT max([flight distance])
                          FROM passengers WHERE [customer type] = 'Returning');

SELECT [flight distance], COUNT(*) AS 'Number of passengers'
FROM passengers
WHERE [customer type] = 'Returning'
GROUP BY [flight distance]
ORDER BY COUNT(*) DESC
LIMIT 1;

SELECT [flight distance] as 'Average distance (miles) - Median'
FROM passengers
WHERE [customer type] = 'Returning'
ORDER BY [flight distance]
LIMIT 1
OFFSET (SELECT COUNT(*)
        FROM passengers) / 2
        
SELECT count(id) as 'Number of passengers',
[flight distance] as 'Average distance (mils) - Median'
from passengers
WHERE [customer type] = 'Returning'
AND [flight distance] LIKE
(SELECT [flight distance] as 'Average distance - Median'
FROM passengers
WHERE [customer type] = 'Returning'
ORDER BY [flight distance]
LIMIT 1
OFFSET (SELECT COUNT(*)
        FROM passengers) / 2);


-- Calcunate the relationship between flight distance and possible patterns and preferencespassengers

SELECT satisfaction,
count(id) as 'Number of passengers',
round(count(*) * 100.0 / sum(count(*)) over(),2) as 'Percentage of passengers',
round(avg([flight distance]),2) as 'Average distance (miles)'
from passengers
group by satisfaction;

SELECT class,
count(id) as 'Number of passengers',
round(count(*) * 100.0 / sum(count(*)) over(),2) as 'Percentage of passengers',
round(avg([flight distance]),2) as 'Average distance (miles)'
from passengers
GROUP by class;

SELECT [type of travel],
count(id) as 'Number of passengers',
round(count(*) * 100.0 / sum(count(*)) over(),2) as 'Percentage of passengers',
round(avg([flight distance]),2) as 'Average distance (miles)'
from passengers
group by [type of travel];

SELECT [customer type],
count(id) as 'Number of passengers',
round(count(*) * 100.0 / sum(count(*)) over(),2) as 'Percentage of passengers',
round(avg([flight distance]),2) as 'Average distance (miles)'
from passengers
group by [customer type];
