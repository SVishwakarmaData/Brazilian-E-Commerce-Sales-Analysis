-- Average Deliver time by state
SELECT 
	c.customer_state AS state,    
    ROUND(AVG(DATEDIFF(o.order_delivered_customer_date, o.order_purchase_timestamp)), 1) AS avg_delivery_days  -- calculate how many date it took to delivery the item
FROM olist_orders_dataset o 
JOIN olist_customers_dataset c
	ON o.customer_id = c.customer_id
WHERE o.order_status = 'delivered'  -- tell to look only for delivered and not for canceled
	AND o.order_delivered_customer_date IS NOT NULL
GROUP BY c.customer_state
ORDER BY avg_delivery_days ASC;