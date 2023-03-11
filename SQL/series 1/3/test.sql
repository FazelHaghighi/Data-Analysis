CREATE TABLE orders(
	id int PRIMARY KEY,
    customer_id int,
    FOREIGN KEY (customer_id) REFERENCES customers(id),
    status enum('wait_payment', 'canceled', 'warehouse', 'sent'),
    created_at date
);    

CREATE TABLE customers(
	id int PRIMARY KEY,
    name VARCHAR(20),
    is_blocked bool
);

INSERT INTO customers ( id, name, is_blocked )
   VALUES
   ( 1, "mammad", 1),
   ( 2, "reza", 0),
   ( 3, "ali", 1),
   ( 4, "ahmad", 0),
   ( 5, "mahdi", 1);
   

INSERT INTO orders ( id, customer_id, status, created_at )
   VALUES
   ( 1, 1, "wait_payment", '2022-07-03'),
   ( 2, 2, "canceled", '2022-11-06'),
   ( 3, 3, "sent", '2021-05-24'),
   ( 4, 4, "warehouse", '2021-08-15'),
   ( 5, 5, "warehouse", '2021-09-16');
   

SELECT * from orders;

SELECT * from customers;

select id order_id from orders
where status =  'warehouse'
order by id desc;

select id customer_id, name customer_name  from customers
where id not in 
(
  select customer_id from orders
)
order by name asc;

-- select sum(status) cancellation_rate, created_at date from orders 
-- where status != "canceled" 
-- / sum(status) * 100
-- group by customers(is_blocked)

INSERT INTO customers ( id, name, is_blocked )
   VALUES
   ( 6, "taghi", 0),
   ( 7, "naghi", 0);

   

INSERT INTO orders ( id, customer_id, status, created_at )
   VALUES
   ( 6, 6, "canceled", '2022-07-03'),
   ( 7, 7, "canceled", '2022-11-06'),
   ( 8, 7, "wait_payment", '2022-11-06');
   
SELECT * from orders;

SELECT * from customers;
    
    


