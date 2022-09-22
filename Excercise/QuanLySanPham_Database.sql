USE l5_view_index_storeproceduce;

DROP 	TABLE 	IF 	EXISTS	Products;
CREATE	TABLE	Products
	(
		ID					INT				NOT NULL AUTO_INCREMENT PRIMARY KEY,
        Product_Code		VARCHAR(50),
        Product_Name		VARCHAR(50),
        Product_Price		INT,
        Product_Amount		INT,
        Product_Description	VARCHAR(255),
        Product_Status		VARCHAR(50)
	);
    

INSERT	INTO	Products	(Product_code, Product_Name, Product_Price, Product_Amount, Product_Description, Product_Status)
VALUES
('SP01', 'BVS', 49000, 20, 'Siêu thấm', 'Còn HSD'),
('SP02', 'Bàn chải', 13000, 50, 'Colgate', 'Còn HSD'),
('SP03', 'Kem đánh răng', 40000, 30, 'Colgate', 'Còn HSD'),
('SP04', 'Khăn mặt', 15000, 100, 'Xuất xứ VN', 'Còn HSD'),
('SP05', 'Dầu gội', 50000, 10, 'X-Men', 'Còn HSD'),
('SP06', 'Sữa tắm', 70000, 10, 'X-Men', 'Còn HSD'),
('SP07', 'Chổi', 15000, 25, 'Viettiep', 'Còn HSD'),
('SP08', 'Hót rác', 10000, 25, 'Viettiep', 'Còn HSD'),
('SP09', 'Chổi lau nhà', 45000, 25, 'Viettiep', 'Còn HSD'),
('SP10', 'Giấy vệ sinh', 5000, 100, 'Panda', 'Còn HSD'),
('SP11', 'Quạt', 350000, 5, 'Made in ChaiLa', 'Còn HSD');
    