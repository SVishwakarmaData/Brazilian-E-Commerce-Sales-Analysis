-- Customer Repect-Purchase Rate

WITH CustomerOrderCounts AS (
	SELECT 
		c.customer_unique_id,
        COUNT(o.order_id) AS total_orders
	FROM olist_orders_dataset o
    JOIN olist_customers_dataset c
		ON o.customer_id = c.customer_id
	GROUP BY c.customer_unique_id
)
SELECT 
	COUNT(*) AS total_customers,
    SUM(CASE WHEN total_orders > 1 THEN 1 ELSE 0 END) AS repeat_customers,
    ROUND((SUM(CASE WHEN total_orders > 1 THEN 1 ELSE 0 END) / COUNT(*)) * 100, 2) AS repeat_purchase_rate_pct
FROM CustomerOrderCounts;