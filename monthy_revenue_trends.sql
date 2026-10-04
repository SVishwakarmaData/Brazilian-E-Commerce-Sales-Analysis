WITH MonthlyRevenue AS (      -- creating common trable expression that will act as a temporary table
	SELECT 
		DATE_FORMAT(o.order_purchase_timestamp, '%Y-%m') AS order_month,  -- this line will strip the date format and will only give year and month
        ROUND(SUM(p.payment_value), 2) AS monthly_revenue   -- this line choppes of the decimal number and make it clean and round them up
	FROM olist_orders_dataset o          -- this line join the both table and get the order_id that will get the details from bith table
    JOIN olist_order_payments_dataset p
		ON o.order_id = p.order_id
	WHERE o.order_status <> 'canceled'  -- this will not concedered canceled and will leave it out ( <> 'not equal to')
    GROUP BY DATE_FORMAT(o.order_purchase_timestamp, '%Y-%m')  -- calculate the dataset on separate table fo year and month and group them up 
    )
    SELECT 
		order_month,   -- this line pull the clean order_monthly and monthly_revenue from the above quary line
        monthly_revenue,
        ROUND(SUM(monthly_revenue) OVER (ORDER BY order_month), 2) AS running_total_revenue  -- rount up the revenue and order them up by month order
	FROM MonthlyRevenue
    ORDER BY order_month;  -- order the final table by month.