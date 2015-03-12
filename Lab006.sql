--Question 1
select distinct customers.name, customers.city
from customers
where city in (
               select city
               from (
                    (select products.city, count(products.city)
                     from products
                     group by products.city 
                     order by count DESC
                     limit 1))
                     as Q)

--Question 2
select products.name
from products
where priceUSD < (select avg(products.priceUSD)from products)
order by products.name ASC


--Question 3
select name, pid, dollars
from orders inner join customers
on orders.cid = customers.cid
order by dollars DESC

--Question 4
select customers.name, coalesce(sum(orders.qty), 0)
from orders inner join products
on orders.pid = products.pid
full outer join customers
on customers.cid = orders.cid
group by customers.name
order by customers.name DESC

--Question 5
select customers.name, products.name, agents.name
from customers inner join orders
on customers.cid = orders.cid
inner join agents
on orders.aid = agents.aid
inner join products
on orders.pid = products.pid
where agents.city = 'Tokyo'

--Question 6
select orders.ordno, orders.qty * products.priceUSD * (1 - customers.discount/100) as "check", orders.dollars as "dollars"
from orders, products, customers
where (orders.pid = products.pid) and (orders.cid = customers.cid) and (orders.qty * products.priceUSD * (1 - customers.discount/100)!=orders.dollars)

--Question 7
/* A left outer join retains all the data on the left side or the first column before the outer join statement and will
match up with anything on the right. But if I used a right join and there was no data on the right then it would be excluded
and data would be missing. A full join goes both ways and fills any missing data with nulls.

For example if I did a left outer join with orders and customers, weyland would not be there, but if I did a right join it would be.
*/
select *
from orders left outer join customers
on orders.cid = customers.cid

select *
from orders right outer join customers
on orders.cid = customers.cid
