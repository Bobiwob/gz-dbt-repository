with
    pccost as (
        select
            raw_sales.orders_id,
            raw_sales.date_date,
            raw_sales.product_id,
            raw_sales.revenue,
            raw_sales.quantity,
            ROUND((raw_sales.quantity * raw_product.purchase_price),2) as purchase_cost
        from {{ ref("stg_raw__sales") }} as raw_sales
        join
            {{ ref("stg_raw__product") }} as raw_product
            on raw_sales.product_id = raw_product.products_id
    )
select *, round((revenue - purchase_cost), 2) as margin
from pccost
