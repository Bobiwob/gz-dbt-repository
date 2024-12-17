SELECT 
orders_id, date_date, revenue, quantity, purchase_cost,
ROUND((quantity*purchase_cost)) as margin
FROM {{ ref("int_sales_margin") }}
GROUP BY orders_id