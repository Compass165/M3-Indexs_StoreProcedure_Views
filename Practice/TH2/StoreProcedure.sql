USE classicmodels;

DELIMITER //
CREATE	PROCEDURE	findAllCustomers()
	BEGIN
		SELECT	*
		FROM	Customers;
	END //
DELIMITER ;
    
CALL	findAllCustomers();

DROP	PROCEDURE	findAllCustomers;

DELIMITER //
create	procedure	findAllCustomers()
	begin
		select	*
		from	customers
		where	customerNumber = 175;
    end //
delimiter ;

call	findAllCustomers();