use ecomerce

alter table ecommerce
modify signup_date date

alter table ecommerce
modify last_purchase_date date

alter table ecommerce
modify order_date date

describe ecommerce

select * from ecommerce

select customer_id, round(sum(unit_price*quantity), 2) Revenue
from ecommerce
group by customer_id
order by Revenue desc

select count(distinct customer_id) from ecommerce

select count(distinct order_id) from ecommerce

select customer_id, order_date
from ecommerce 
where order_date>= date_sub(curdate(), interval 10 month) and year(order_date) = 2025
group by customer_id, order_date
order by order_date desc


select year(order_date) Year, 
		round(sum(quantity*unit_price), 2) Revenue, 
        round(sum(quantity*unit_price)*100/(select sum(quantity*unit_price) from ecommerce), 2) Contribution
from ecommerce
group by 1
order by 1 desc

select gender, 
		round(sum(quantity*unit_price), 2) Revenue, 
        round(sum(quantity*unit_price)*100/(select sum(quantity*unit_price) from ecommerce), 2) Contribution
from ecommerce
group by gender

select category, 
		round(sum(quantity*unit_price), 2) Revenue, 
        round(sum(quantity*unit_price)*100/(select sum(quantity*unit_price) from ecommerce), 2) Contribution
from ecommerce
group by category
order by 2 desc

select gender, count(gender) Numbers, round(count(gender)*100/(select count(*) from ecommerce), 2) pct_active
from ecommerce
where subscription_status = 'active'
group by gender

select subscription_status, count(subscription_status) Numbers, 
		round(sum(quantity*unit_price), 2) Revenue, 
        round(sum(quantity*unit_price)*100/(select sum(quantity*unit_price) from ecommerce), 2) pct_Revenue
from ecommerce
group by
		subscription_status

select country, 
		round(sum(quantity*unit_price), 2) Revenue, 
        round(sum(quantity*unit_price)*100/(select sum(quantity*unit_price) from ecommerce), 2) country_pct
from ecommerce
group by country
order by 2 desc

select country, 
        sum(case when gender = 'Male' then 1 else 0 end) Males,
        sum(case when gender = 'Female' then 1 else 0 end) Females,
        sum(case when gender = 'Other' then 1 else 0 end) Others,
        sum(case when subscription_status = 'active' then 1 else 0 end) Active,
        round(sum(case when subscription_status = 'active' then 1 else 0 end)*100/(select count(*) from ecommerce), 2) Active_pct,
        sum(case when subscription_status = 'cancelled' then 1 else 0 end) Cancelled,
        round(sum(case when subscription_status = 'cancelled' then 1 else 0 end)*100/(select count(*) from ecommerce), 2) Cancelled_pct,
        sum(case when subscription_status = 'paused' then 1 else 0 end) Paused,
        round(sum(case when subscription_status = 'paused' then 1 else 0 end)*100/(select count(*) from ecommerce), 2) Paused_pct,
        round(sum(quantity*unit_price), 2) Revenue,
        round(sum(quantity*unit_price)*100/(select sum(quantity*unit_price) from ecommerce), 2) Revenue_pct
from ecommerce
group by country
order by 11 desc

select country,
		count(country) customers,
		sum(case when gender = 'Male' and subscription_status = 'active' then 1 else 0 end) Active_males,
        sum(case when gender = 'Male' and subscription_status = 'cancelled' then 1 else 0 end) Cancelled_by_males,
        sum(case when gender = 'Male' and subscription_status = 'paused' then 1 else 0 end) Paused_by_males,
        sum(case when gender = 'Female' and subscription_status = 'active' then 1 else 0 end) Active_females,
        sum(case when gender = 'Female' and subscription_status = 'cancelled' then 1 else 0 end) Cancelled_by_females,
        sum(case when gender = 'Female' and subscription_status = 'paused' then 1 else 0 end) Paused_by_females,
        sum(case when gender = 'Other' and subscription_status = 'active' then 1 else 0 end) Active_others,
        sum(case when gender = 'Other' and subscription_status = 'cancelled' then 1 else 0 end) Cancelled_by_others,
        sum(case when gender = 'Other' and subscription_status = 'paused' then 1 else 0 end) Paused_by_others
from ecommerce
group by country

select country,
		sum(cancellations_count) Cancelled_orders,
        round(sum(Cancellations_count)*100/(select sum(Cancellations_count) from ecommerce), 2) Cancellation_pct
from ecommerce
group by 1
order by 2 desc

select country,
		category,
        sum(Cancellations_count) Cancelled_orders,
        sum(sum(Cancellations_count)) over (partition by country) as Country_cancellations
from ecommerce
group by 1,2
order by 1, 3 desc

select year(order_date) Year, 
		round(sum(quantity*unit_price), 2) Revenue
from ecommerce
group by 1
order by 1

select country,
		sum(case when year(order_date) = 2020 then Cancellations_count else 0 end) '2020',
        sum(case when year(order_date) = 2021 then Cancellations_count else 0 end) '2021',
        sum(case when year(order_date) = 2022 then Cancellations_count else 0 end) '2022',
        sum(case when year(order_date) = 2023 then Cancellations_count else 0 end) '2023',
        sum(case when year(order_date) = 2024 then Cancellations_count else 0 end) '2024',
        sum(case when year(order_date) = 2025 then Cancellations_count else 0 end) '2025',
        sum(Cancellations_count) Total_cancellations
from ecommerce
group by 1
order by Total_cancellations desc

select min(age) Minimum_Age, max(age) Maximum_Age
from ecommerce

select country,
		sum(case when subscription_status = 'active' then Cancellations_count else 0 end) Active,
        sum(case when subscription_status = 'cancelled' then Cancellations_count else 0 end) Cancelled,
        sum(case when subscription_status = 'paused' then Cancellations_count else 0 end) Paused,
        sum(Cancellations_count) Total_cancellations
from ecommerce
group by country
order by Total_cancellations desc

select country,
		sum(case when gender = 'Male' then Cancellations_count else 0 end) Male_cancellations,
        sum(case when gender = 'Female' then Cancellations_count else 0 end) Female_cancellations,
        sum(case when gender = 'Other' then Cancellations_count else 0 end) Others_cancellations,
        sum(Cancellations_count) Total_cancelled_orders
from ecommerce
group by country
order by Total_cancelled_orders desc

select
		case 
        when age between 18 and 30 then 'Young'
        when age between 31 and 48 then 'MiddleAged'
        else 'Senior'
end as Age_Segmentation,
round(sum(unit_price*quantity), 2) Revenue,
round(sum(unit_price*quantity)*100/(select sum(unit_price*quantity) from ecommerce), 2) pct_contriburtion
from ecommerce 
group by Age_Segmentation
order by 3 desc

select country,
		sum(case when year(order_date) = 2020 then purchase_frequency else 0 end) '2020',
        sum(case when year(order_date) = 2021 then purchase_frequency else 0 end) '2021',
        sum(case when year(order_date) = 2022 then purchase_frequency else 0 end) '2022',
        sum(case when year(order_date) = 2023 then purchase_frequency else 0 end) '2023',
        sum(case when year(order_date) = 2024 then purchase_frequency else 0 end) '2024',
        sum(case when year(order_date) = 2025 then purchase_frequency else 0 end) '2025',
        sum(purchase_frequency) Total_purchase_frequency
from ecommerce
group by country
order by Total_purchase_frequency desc
