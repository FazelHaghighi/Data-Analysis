select customers.salesRepEmployeeNumber as employeeNumber, 
concat(employees.firstName, " ", employees.lastName) as name,
count(employeeNumber) as CustomersCount
from customers
inner join employees
on customers.salesRepEmployeeNumber = employees.employeeNumber
group by employeeNumber
order by CustomersCount desc;

select payments.customerNumber as customerNumber, sum(payments.amount) as price
from payments
group by customerNumber
order by price desc
limit 5;

select orders.customerNumber as customerNumber
from orders
inner join orderdetails
on orders.orderNumber = orderdetails.orderNumber
group by customerNumber
order by sum(orderdetails.quantityOrdered * orderdetails.priceEach) desc
limit 5;

select productLine, productName, quantityInStock * (MSRP - buyPrice) as value, RANK() OVER (PARTITION BY productLine ORDER BY quantityInStock * (MSRP - buyPrice) DESC) AS value_rank
from products;
