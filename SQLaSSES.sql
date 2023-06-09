--que1

SELECT orders.order_id,orders.customer_id,orders.order_status,orders.order_date,orders.required_date,orders.shipped_date,orders.store_id,orders.staff_id, customers.customer_name, staffs.staff_name
FROM orders 
JOIN customers  ON orders.customer_id = customers.customer_id
JOIN staffs  ON orders.staff_id = staffs.staff_id;

--que2

CREATE VIEW [Product Sales] AS
SELECT p.product_id, p.product_name, SUM(od.quantity) AS total_quantity, SUM(od.quantity * od.list_price) AS sales_amount
FROM products p, 
JOIN order_items od ON p.product_id = od.product_id;

SELECT * FROM [Product Sales]

--que3

CREATE PROCEDURE customerTotalOrders
  @customerID AS INT
  @totalOrders AS INT

AS 
BEGIN
SELECT @totalOrders =COUNT(*)
FROM orders
WHERE customer_id = @customerID;

END


--QUE4

SELECT c.customer_id, c.customer_name, COUNT(*) AS highest_orders
FROM customers c
JOIN orders od ON c.customer_id = od.customer_id
GROUP BY c.customer_id, c.customer_name
ORDER BY highest_orders DESC
LIMIT 5;


--que5
CREATE VIEW product_sales AS

SELECT p.product_id, p.product_name,p.brand_id,p.category_id,p.model_year p.list_price, SUM(od.quantity) AS total_sales, SUM(od.quantity * p.list_price) AS total_revenue

FROM products p

JOIN order_items od ON p.product_id = od.product_id

GROUP BY p.product_id, p.product_name, p.list_price;

SELECT * FROM product_sales;






