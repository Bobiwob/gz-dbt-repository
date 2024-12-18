select
    DATE_TRUNC(date_date, MONTH) as datemonth,
    round(sum(ads_margin), 1) as ads_margin,
    round(sum(average_basket), 1) as average_basket,
    round(sum(operational_margin), 1) as operational_margin,
    round(sum(ads_cost), 1) as ads_cost,
    round(sum(ads_impressions), 1) as ads_impressions,
    round(sum(ads_clicks), 1) as ads_clicks,
    round(sum(quantity), 1) as quantity,
    round(sum(revenue), 1) as revenue,
    round(sum(purchase_cost), 1) as purchase_cost,
    round(sum(shipping_fee), 1) as shipping_fee,
    round(sum(logcost), 1) as logcost,
    round(sum(ship_cost), 1) as ship_cost,

from {{ ref("finance_campaigns_day") }}
group by datemonth
order by datemonth desc