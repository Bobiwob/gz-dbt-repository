SELECT *,
ROUND((margin+shipping_fee)-logcost-ship_cost) as operational_margin
FROM {{ ref("int_sales_margin") }}