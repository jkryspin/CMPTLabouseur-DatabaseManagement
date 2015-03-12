--Question 1
select city
from agents inner join orders
on agents.aid = orders.aid
where cid = 'c006'

--Question 2
select pid
from orders inner join customers
on orders.cid = customers.cid
where customers.city = 'Kyoto'
order by pid ASC

--Question 3
select name
from customers
where not exists (select cid
                  from orders
                  where orders.cid = customers.cid)
                  
--Question 4
select name
from customers full outer join orders
on customers.cid = orders.cid
where orders.ordno is NULL

--Question 5
select distinct customers.name, agents.name
from customers inner join agents
on customers.city = agents.city
inner join orders
on customers.cid = orders.cid 
and agents.aid = orders. aid

--Question 6
select customers.name, agents.name, customers.city
from customers inner join agents
on customers.city = agents.city 

--Question 7
select distinct customers.name, customers.city
from customers 
where city in (select city 
               from (
               (select products.city, count(products.city)
                from products
                group by products.city
                limit 1))
                as Q)

