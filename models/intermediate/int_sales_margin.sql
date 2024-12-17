WITH pccost AS (
    SELECT 
        raw_sales.orders_id, 
        raw_sales.date_date, 
        raw_sales.product_id, 
        raw_sales.revenue, 
        raw_sales.quantity,
        (raw_sales.quantity * raw_product.purchase_price) AS purchase_cost
    FROM {{ ref("stg_raw__sales") }} AS raw_sales
    JOIN {{ ref("stg_raw__product") }} AS raw_product
    ON raw_sales.product_id = raw_product.products_id
)
SELECT *,
       ROUND((revenue - purchase_cost),2) AS margin
FROM pccost