-- Section1
    select customers.salesRepEmployeeNumber as employeeNumber, 
	concat(employees.firstName, " ", employees.lastName) as Name,
	count(employeeNumber) as CustomersCount
	from customers
	inner join employees
	on customers.salesRepEmployeeNumber = employees.employeeNumber
	group by employeeNumber
	order by CustomersCount desc;
-- Section2
    select orders.customerNumber as customerNumber
	from orders
	inner join orderdetails
	on orders.orderNumber = orderdetails.orderNumber
	group by customerNumber
	order by sum(orderdetails.quantityOrdered * orderdetails.priceEach) desc
	limit 5;
-- Section3
    select productline, productName, (quantityInStock * (MSRP - buyPrice)) as value, RANK() OVER (PARTITION BY productLine ORDER BY quantityInStock * (MSRP - buyPrice) DESC) AS value_rank
	from products;