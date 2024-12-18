select
    date_date,
    round((sum(operational_margin) - sum(ads_cost)), 2) as ads_margin,
    round(sum(average_basket), 2) as average_basket,
    round(sum(operational_margin), 2) as operational_margin,
    round(sum(ads_cost), 2) as ads_cost,
    round(sum(ads_impressions), 2) as ads_impressions,
    round(sum(ads_clicks), 2) as ads_clicks,
    round(sum(total_quantity), 2) as quantity,
    round(sum(total_revenue), 2) as revenue,
    round(sum(total_purchase_cost), 2) as purchase_cost,
    round(sum(total_shipping_fees), 2) as shipping_fee,
    round(sum(total_log_cost), 2) as logcost,
    round(sum(total_ship_cost), 2) as ship_cost,

from {{ ref("int_campaigns_day") }}
join {{ ref("finance_days") }} using (date_date)
group by (date_date)
order by date_date desc
