USE classicmodels;

SELECT 	*
FROM 	Customers;

SELECT 	* 
FROM 	Customers
WHERE 	CustomerName = 'Land of Toys Inc.';

EXPLAIN
SELECT	*
FROM	Customers
WHERE	CustomerName = 'Land of Toys Inc.';

ALTER TABLE	Customers
ADD INDEX	idx_CustomerName(CustomerName);
EXPLAIN
SELECT	*
FROM	Customers
WHERE	CustomerName = 'Land of Toys Inc.';

ALTER TABLE Customers
ADD INDEX	idx_full_name(ContactFirstName, ContactLastName);
EXPLAIN
SELECT	*
FROM	Customers
WHERE	ContactFirstName = 'Jean' or ContactFirstName ='King';

ALTER TABLE Customers
DROP INDEX	idx_full_name;
