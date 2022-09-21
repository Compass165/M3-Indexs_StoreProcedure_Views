USE classicmodels;
-- Tạo View
CREATE OR REPLACE VIEW customer_views AS
SELECT	customerNumber, customerName, phone
FROM	customers;

SELECT	*
FROM	customer_views;

-- Cập nhật View
CREATE OR REPLACE VIEW customer_views AS
SELECT	customerNumber, customerName, contactFirstName, contactLastName, phone
FROM	customers
WHERE	city = 'Nantes';

SELECT	*
FROM	customer_views;

-- Xóa View
DROP VIEW	customer_views;