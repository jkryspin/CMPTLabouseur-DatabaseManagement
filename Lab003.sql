--Question 1
select ordno, dollars
from orders

--Question 2
select name, city
from agents
where name = 'Smith'

--Question 3
select pid, name, priceUSD
from products
where quantity > 200000

--Question 4
select name, city
from customers
where city = 'Dallas'

--Question 5
select name
from agents
where (city != 'New York' and city != 'Tokyo')

--Question 6
select *
from products
where (city != 'Dallas' and city != 'Duluth')and (priceUSD >=1)

--Question 7
select *
from orders
where (mon = 'jan' or mon = 'may')

--Question 8
select *
from orders
where (mon = 'feb') and (dollars>500)

--Question 9
select *
from orders
where cid = 'c005'