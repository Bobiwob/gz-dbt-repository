 {{ config(materialized=table) }}
select
    date_date,
    count(distinct orders_id) as nb_transactions,
    round(sum(revenue), 2) as total_revenue,
    round(sum(revenue) / count(distinct orders_id), 2) as average_basket,
    round(sum(margin), 2) as margin,
    round(sum(operational_margin), 2) as operational_margin,
    round(sum(purchase_cost), 2) as total_purchase_cost,
    round(sum(quantity), 2) as total_quantity,
    round(sum(shipping_fee), 2) as total_shipping_fees,
    round(sum(logcost), 2) as total_log_cost
from {{ ref("int_orders_operational") }}
group by date_date
order by date_date desc
