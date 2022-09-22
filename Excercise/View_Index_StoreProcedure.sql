USE l5_view_index_storeproceduce;

-- PHẦN 1
-- Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)
EXPLAIN
SELECT	*
FROM	Products
WHERE	Product_Code = 'SP01';

ALTER	TABLE	Products	
ADD	INDEX		index_prodCod	(Product_Code);

EXPLAIN
SELECT	*
FROM	Products
WHERE	Product_Code ='SP01';

-- Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)
ALTER	TABLE	Products
ADD	INDEX		index_NamePrice	(Product_Name, Product_Price);

-- Sử dụng câu lệnh EXPLAIN để biết được câu lệnh SQL của bạn thực thi như nào
EXPLAIN
SELECT	*
FROM	Products
WHERE	Product_Name ='BVS';

-- So sánh câu truy vấn trước và sau khi tạo index


-- PHẦN 2
-- Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.
CREATE	VIEW	Product_Views	AS
SELECT	Product_Code,
		Product_Name,
        Product_Price,
        Product_Status
FROM	products;

SELECT	*
FROM	Product_Views;

-- Tiến hành sửa đổi view
CREATE	OR	REPLACE	VIEW	Product_Views	AS
SELECT	Product_Code,
		Product_Name,
        Product_Price
FROM	products
WHERE	Product_Price	<	300000;

UPDATE	products
SET		Product_Name	=	'Giấy chùi ass'
WHERE	Product_Code	=	'SP10';

SELECT	*
FROM	Product_Views;

-- Tiến hành xoá view
DROP VIEW Product_Views;


-- PHẦN 3
-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
DELIMITER //
CREATE	PROCEDURE	findAllProducts()
	BEGIN
		SELECT	*
        FROM	Products;
	END //
DELIMITER ;

CALL	findAllProducts();

-- Tạo store procedure thêm một sản phẩm mới
DELIMITER //
CREATE	PROCEDURE	addProducts(
		IN		Product_Code		VARCHAR(50),
				Product_Name		VARCHAR(50),
                Product_Price		INT,
                Product_Amount		INT,
                Product_Description	VARCHAR(255),
                Product_Status		VARCHAR(50)
	)
	BEGIN
		INSERT INTO	products (Product_code, Product_Name, Product_Price, Product_Amount, Product_Description, Product_Status)
        VALUES
				(Product_code, Product_Name, Product_Price, Product_Amount, Product_Description, Product_Status);
	END //
DELIMITER ;

CALL	addProducts('SP12', 'Quạt', 400000, 5, 'Made in ChaiLa', 'Còn HSD');

-- Tạo store procedure sửa thông tin sản phẩm theo id
DELIMITER //
CREATE	PROCEDURE	updateProducts(
		IN		ID					INT,
				Product_Code		VARCHAR(50),
				Product_Name		VARCHAR(50),
                Product_Price		INT,
                Product_Amount		INT,
                Product_Description	VARCHAR(255),
                Product_Status		VARCHAR(50)
	)
    BEGIN
		UPDATE	Products
        SET		Products.Product_code	=	Product_Code,
				Products.Product_Name	=	Product_Name,
				Products.Product_Price	=	Product_Price,
				Products.Product_Amount	=	Product_Amount,
				Products.Product_Description	=	Product_Description,
				Products.Product_Status	=	Product_Status
		WHERE	Products.ID				=	ID;
	END //
DELIMITER ;

SELECT	*
FROM	products;
CALL	updateProducts(12 ,'SP12', 'Điều hòa', 3000000, 2, 'Made in ChaiLa', 'Còn HSD');

-- Tạo store procedure xoá sản phẩm theo id
DELIMITER //
CREATE	PROCEDURE	deleteProductByID(
		IN		ID		INT
	)
	BEGIN
		DELETE	FROM	products
        WHERE			products.ID	= ID;
	END //
DELIMITER ;

CALL	deleteProductByID(12);
SELECT	*
FROM	products;