-- Section1
   select products.productCode, products.productName, products.productLine 
	from products
	left join orderdetails
	on products.productCode = orderdetails.productCode
	where orderdetails.productCode is null;
-- Section2
-- Section3