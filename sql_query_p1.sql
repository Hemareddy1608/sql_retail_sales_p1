--CREATE DATABASE sql_project_p2;

--CREATE TABLE
DROP TABLE IF EXISTS retail_sales;
CREATE TABLE retail_sales
	(
	transactions_id	INT PRIMARY KEY,
	sale_date	DATE,
	sale_time  TIME, 
	customer_id	 INT,
	gender         VARCHAR(15),
	age	           INT,
	category       VARCHAR(15),
	quantiy       INT,
	price_per_unit	FLOAT,
	cogs	      FLOAT,
	total_sale      FLOAT
    );


Select * from retail_sales;
limit 10;



Select * from retail_sales
where
	  transactions_id IS NULL
	  OR
      sale_date IS NULL
      OR
      sale_time IS NULL
      OR 
      gender IS NULL
      OR 
      category IS NULL
      OR 
      quantiy IS NULL
      OR
      cogs IS NULL
      OR
      total_sale IS NULL;

delete from retail_sales
where
	  transactions_id IS NULL
	  OR
      sale_date IS NULL
      OR
      sale_time IS NULL
      OR 
      gender IS NULL
      OR 
      category IS NULL
      OR 
      quantiy IS NULL
      OR
      cogs IS NULL
      OR
      total_sale IS NULL;


Select count(*) from retail_sales


--data exploration
--- sales
Select count(*) as total_sale from retail_sales
-- customers
SELECT COUNT ( distinct Customer_id)  as total_sale from retail_sales
category
SELECT COUNT ( distinct Category)  as total_sale from retail_sales


select distinct category from retail_sales


select *
from retail_sales
where sale_date='2022-11-05';



select *
from retail_sales
where category='Clothing'
	and
	to_char(sale_date,'yyyy-mm') ='2022-11'
    and
    Quantiy=4

Select category,
  sum(total_sale) as net_sale
from retail_sales
group  by 1



select 
	Round(Avg(age) ,2)as avg_age
	from retail_sales
where category='Beauty'



select * 
     from retail_sales
where total_sale > 1000




select 
      category,
       gender,
      Count(*) as total_trans
from retail_sales
group by category,gender
order by 1


select 
	Extract(year from sale_date) as year,
	Extract(month from sale_date) as month,
	avg(total_sale) as avg_sale
	rank()over(partition by extract(year from sale_date) order by Avg(total_sale)desc)as rank
	from retail_sales
group by 1, 2  
order by  1,3 desc



select 
     customer_id,
      Sum(total_sale) as total_sale
from retail_sales
group by 1
order by 2 desc 
limit  5

select 
	category,
	count(distinct customer_id) as cnt_unique_cs
from retail_sales
group by category


select *,
    case
         when extract(hour from sale_time)<12 then  'morning'
         when extract(hour from sale_time)between 12 and 17 then  'afternoon'
         else 'evening'
    end as shift
from retail_sales