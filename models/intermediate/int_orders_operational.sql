SELECT orders_id,date_date,
ROUND((margin+shipping_fee-logcost-ship_cost),2) as operational_margin,
quantity,purchase_cost
FROM {{ ref("int_orders_margin") }} AS int_margin
JOIN {{ ref("stg_raw__ship") }} AS raw_ship
USING (orders_id)