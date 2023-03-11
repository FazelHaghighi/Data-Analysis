select products.productCode, products.productName, products.productLine 
from products
left join orderdetails
on products.productCode = orderdetails.productCode
where orderdetails.productCode is null;

select employees.firstName, employees.lastName, count(*) as totalSalesAmount
from employees
join customers
on employees.employeeNumber = customers.salesRepEmployeeNumber
group by customers.salesRepEmployeeNumber
order by totalSalesAmount desc
limit 5;

select emp.firstName, emp.lastName, q1.totalSalesAmount  
from employees as emp join
(select cost.salesRepEmployeeNumber as SREN, 
sum(ordd.priceEach * quantityOrdered) as totalSalesAmount
from customers as cost 
join orders as ord on ord.customerNumber = cost.customerNumber
join orderdetails as ordd on ordd.orderNumber = ord.orderNumber
group by SREN) as q1 on q1.SREN = emp.employeeNumber
order by totalSalesAmount desc
limit 5;

-- select employees.firstName, employees.lastName, t.totalSalesAmount  
-- from employees 
-- join (select customers.salesRepEmployeeNumber, sum(orderdetails.priceEach * quantityOrdered) as totalSalesAmount
-- 	from customers
-- 	join orders
-- 	on orders.customerNumber = customers.customerNumber
-- 	join orderdetails
-- 	on orders.orderNumber = orders.orderNumber
-- 	group by customers.salesRepEmployeeNumber) as t 
-- on t.customers.salesRepEmployeeNumber = employees.employeeNumber
-- order by totalSalesAmount desc
-- limit 5;