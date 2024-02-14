--1 Find all players in the database who played at Vanderbilt University. Create a list showing each player's first and last names as well as the total salary they earned in the major leagues. Sort this list in descending order by the total salary earned. Which Vanderbilt player earned the most money in the majors?
-- Select cp.playerid, pl.namefirst, pl.namelast, sum(s.salary) as totalsalary
-- from collegeplaying as cp
-- inner join people as pl ON cp.playerid = pl.playerid
-- inner join salaries as s on cp.playerid = s.playerid
-- where cp.schoolid = 'vandy'
-- group by 1,2,3
-- ORDER BY totalsalary DESC
--DAvid Price 12183000

-- 2) Using the fielding table, group players into three groups based on their position: label players with position OF as "Outfield", those with position "SS", "1B", "2B", and "3B" as "Infield", and those with position "P" or "C" as "Battery". Determine the number of putouts made by each of these three groups in 2016.
-- SELECT
-- 	CASE 
-- 	   WHEN pos = 'OF' THEN 'Outfield'
-- 	   WHEN pos IN ('SS', '1B', '2B', '3B' ) THEN 'Infield'
-- 		WHEN pos IN ('P', 'C') THEN 'Battery'
-- 	END as pos_group,
-- 	SUM(po) as sum_putouts
-- 	FROM fielding
-- 	WHERE yearid = 2016
-- 	GROUP BY
-- 	CASE 
-- 	   WHEN pos = 'OF' THEN 'Outfield'
-- 	   WHEN pos IN ('SS', '1B', '2B', '3B' ) THEN 'Infield'
-- 		WHEN pos IN ('P', 'C') THEN 'Battery'
-- 	END


-- -- Better solution
-- WITH PositionGroups AS (
--     SELECT
--         pos,
--         CASE 
--             WHEN pos = 'OF' THEN 'Outfield'
--             WHEN pos IN ('SS', '1B', '2B', '3B') THEN 'Infield'
--             WHEN pos IN ('P', 'C') THEN 'Battery'
--         END AS pos_group, po
--     FROM fielding
--     WHERE yearid = 2016
-- )

-- SELECT
--     pos_group,
--     SUM(po) AS sum_putouts
-- FROM PositionGroups
-- GROUP BY pos_group;

-- Find the average number of strikeouts per game by decade since 1920. Round the numbers you report to 2 decimal places. Do the same for home runs per game. Do you see any trends? (Hint: For this question, you might find it helpful to look at the generate_series function (https://www.postgresql.org/docs/9.1/functions-srf.html). If you want to see an example of this in action, check out this DataCamp video: https://campus.datacamp.com/courses/exploratory-data-analysis-in-sql/summarizing-and-aggregating-numeric-data?ex=6)

-- SELECT
--     FLOOR(yearid / 10) * 10 AS decade_start,
--     FLOOR(yearid / 10) * 10 + 9 AS decade_end,
--     ROUND(AVG(hr),2) AS homeruns_per_decade,
-- 	ROUND(AVG(so),2) AS avg_strikeouts_per_decade
-- FROM pitching
-- GROUP BY FLOOR(yearid / 10)
-- ORDER BY decade_start ASC


-- Find the player who had the most success stealing bases in 2016, where success is measured as the percentage of stolen base attempts which are successful. (A stolen base attempt results either in a stolen base or being caught stealing.) Consider only players who attempted at least 20 stolen bases. Report the players' names, number of stolen bases, number of attempts, and stolen base percentage.

SELECT * FROM batting limit 5






