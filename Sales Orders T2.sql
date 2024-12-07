CREATE DATABASE Sales;
USE Sales;
CREATE TABLE Orders (
    Order_Id INT PRIMARY KEY,
    Customer_name VARCHAR(100) NOT NULL,
    Product_Category VARCHAR(50) NOT NULL,
    Ordered_item VARCHAR(100) NOT NULL,
    Contact_No VARCHAR(15) UNIQUE NOT NULL
);
Select * From Orders;
ALTER TABLE Orders
Add order_qty int;
Select * From Orders;
Alter Table Orders
Rename To Sales_orders;
Select * From Sales_orders;
INSERT INTO sales_orders (Order_Id, Customer_name, Product_Category, Ordered_item, Contact_No, order_qty) VALUES
(1, 'John Doe', 'Electronics', 'Laptop', '1234567890', 1),
(2, 'Jane Smith', 'Books', 'Data Science Book', '0987654321', 2),
(3, 'Alice Johnson', 'Clothing', 'T-Shirt', '1122334455', 3),
(4, 'Bob Brown', 'Electronics', 'Smartphone', '2233445566', 1),
(5, 'Charlie Davis', 'Furniture', 'Chair', '3344556677', 4),
(6, 'Daisy Evans', 'Books', 'Machine Learning Book', '4455667788', 2),
(7, 'Eve Foster', 'Clothing', 'Jeans', '5566778899', 1),
(8, 'Frank Green', 'Furniture', 'Table', '6677889900', 1),
(9, 'Grace Hall', 'Electronics', 'Headphones', '7788990011', 3),
(10, 'Hank Ives', 'Books', 'Python Programming Book', '8899001122', 2);
Select * From Sales_orders;
SELECT customer_name, Ordered_item
FROM sales_orders;
UPDATE sales_orders
SET Ordered_item = 'Gaming Laptop'
WHERE Order_Id = 1;
Select * From Sales_orders;
Drop table Sales_orders;
