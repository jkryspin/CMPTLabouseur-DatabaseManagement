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
