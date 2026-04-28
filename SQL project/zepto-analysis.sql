SELECT * FROM zepto.zepto;
-- creating unique ids using auto increament
alter table zepto
add column ID int not null primary key auto_increment first;

-- changing the column name of category
alter table zepto
change column ï»¿Category category VARCHAR(100);


-- checking datatypes
describe zepto;

-- checking top 5 rows
select * from zepto
limit 5;

-- checking nulls
select * from zepto

where category is null
or
name is null
or
mrp is null
or
discountpercent is null
or
availableQuantity is null
or 
discountedSellingPrice is null
or
weightInGms is null
or 
outOfStock is null
or 
quantity is null;

-- different products categories
select count(distinct category)
from zepto.zepto;

-- count of each product category
select category, count(category)
from zepto.zepto
group by category;

-- out of stock and instock
select * from zepto;
select outofstock, count(*) total_count
from zepto.zepto
group by outofstock;

-- Find the top 10 best-value products based on the discount percentage
select distinct name, discountPercent
from zepto.zepto
order by discountPercent desc
limit 10;

-- What are the Products with High MRP but Out of Stock
select distinct(name), mrp
from zepto.zepto
where mrp >= 50000 and outofstock = 'true'
order by mrp desc;

-- Calculate Estimated Revenue for each category
select category,
sum(discountedSellingPrice*quantity) REVENUE from zepto
group by category
order by revenue desc;

-- Find all products where MRP is greater than ₹500 and discount is less than 10%
select distinct name
from zepto.zepto
where mrp > 500 and discountPercent < 10
;

-- Identify the top 5 categories offering the highest average discount percentage
select category, avg(discountpercent) as average_discount_percentage
from zepto.zepto 
group by category
order by average_discount_percentage desc
;

-- Find the price per gram for products above 100g and sort by best value
select distinct name, round(discountedSellingPrice/weightInGms) as wt_per_gram
from zepto.zepto 
where weightingms > 100
order by wt_per_gram;

-- Group the products into categories like Low, Medium, Bulk
select *,
case
when weightInGms > 0 and weightInGms < 200 then 'LOW'
when weightInGms >= 200 and weightInGms <= 800 then 'MEDIUM'
else 'HIGH'
end as STATUS
from zepto.zepto 
;

-- What is the Total Inventory Weight Per Category 
select category, sum(weightInGms) as total_weight
from zepto.zepto 
group by category
order by total_weight desc;















