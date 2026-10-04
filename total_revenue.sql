USE brizal_ecommerce;    -- used to get the dataset because there are other tables.

SELECT 
	t.product_category_name_english AS category,    -- grab english category and rename the column and adds all the individual items and round them up.
    ROUND(SUM(oi.price), 2) AS total_revenue
FROM olist_order_items_dataset oi   -- this is the starting point because this table contian the price of each item sold.
JOIN olist_products_dataset p       -- this table has only product id so used join to connect the 
	ON oi.product_id = p.product_id   -- items from products by matching product_id from bith table.
JOIN product_category_name_translation t  -- this translate the protuguese name to english 
	ON p.product_category_name = t.product_category_name
GROUP BY t.product_category_name_english    -- this calculate the sum separately for each unique category
ORDER BY total_revenue DESC      -- sets the result data from highest to lowest 
LIMIT 10;          -- shows only the top 10 