--Iron_Alloys_Analysis

create database IronAlloysDB

use ironalloysdb

SELECT COUNT(*) AS TotalRows, 
       COUNT(Carbon) AS NonNullCarbonRows,
       COUNT(*) - COUNT(Carbon) AS MissingCarbon
FROM Iron_Alloys_Table;

SELECT Alloy_ID, Iron_Alloy_Name, Carbon, Carbon_Category
FROM Iron_Alloys_Table
WHERE Carbon IS NULL
order by alloy_id;
--leaving some carbon values as null rather than being relacing with arbitrary values

--Basic Dataset Overview
SELECT AVG(Carbon)
FROM Iron_Alloys_table;

select count(*) Total_Alloys from iron_alloys_table

select count(*) as Total_Rows
,count(carbon) as Carbon_Available
,count(chromium) as Chromium_Available
,count(nickel) as Nickel_Available
from iron_Alloys_table

--Top 10 Strongest Alloys
select top 10 iron_alloy_name,uts_psi
from iron_alloys_table
order by uts_psi desc;

select top 10 * from iron_alloys_table

--Top 10 Hardest Alloys
select top 10 iron_alloy_name,hardness_avg
from iron_alloys_table
order by hardness_avg desc;

--Carbon Category vs Hardness
select carbon_category,AVG(hardness_avg) [Average Hardness]
from iron_alloys_table
group by carbon_category;

--Chromium Category vs PREN
select chromium_category,avg(PREN) [Average PREN]
from iron_alloys_table
group by chromium_category
order by avg(PREN) asc;

select top 10 * from iron_alloys_table

--Strong and Hard Alloys
select iron_alloy_name,uts_psi,hardness_avg
from iron_alloys_table
where uts_psi>1000 and hardness_avg>250
order by uts_psi desc;

--Highest Chromium Alloys
select iron_alloy_name,chromium,pren
from iron_alloys_table
order by chromium desc;

--Highest Nickel Alloys
select Iron_alloy_name,nickel
from iron_alloys_table
order by nickel desc;

--Corrosion Resistant Alloys
select top 10 iron_alloy_name,pren
from iron_alloys_table
order by pren desc;

select top 10 * from iron_alloys_table

--Average Properties by Carbon Category
select carbon_category,
avg(uts_psi) as Avg_UTS,
avg(hardness_avg) as Avg_Hardness
from iron_alloys_table
group by carbon_category
order by
    case
        when carbon_category='Low Carbon' then 1
        when carbon_category='Medium Carbon' then 2
        when carbon_category='High Carbon' then 3
    end;

--Good corrosion resistance and high strength
select top 10 iron_alloy_name,uts_psi,hardness_avg,pren
from iron_alloys_table
where pren>20
order by uts_psi desc;