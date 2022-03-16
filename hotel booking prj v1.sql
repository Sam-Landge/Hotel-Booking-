

--Select hotal data of 2018,2019 and 2020 table and union it. Save it as hotals
With hotels AS (
SELECT * FROM dbo.['2018$']
UNION
SELECT * FROM dbo.['2019$']
UNION
SELECT * FROM dbo.['2020$'])

--Sum of weekend night and week night,times it by charge per day.
--Round it  to two decimal place.
--Save this calculation by creating new column Revenue.
--Group by year to see the revenue of each year.

SELECT
arrival_date_year, hotel,
ROUND(SUM((stays_in_weekend_nights+stays_in_week_nights)*adr),2)as Revenue
FROM hotels
GROUP BY arrival_date_year,hotel

--Select hotals table and join it with market_segment and meal cost table.

SELECT* from hotels
left Join[dbo].[market_segment$]
ON hotels.market_segment = market_segment$.market_segment
left join [dbo].[meal_cost$]
ON meal_cost$.meal=hotels.meal

--Rest of the analysis do in Power BI