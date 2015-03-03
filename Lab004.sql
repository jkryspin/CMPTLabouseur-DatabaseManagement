--Question 1
select city 
from agents
where aid in (select aid
              from orders
              where cid = 'c006');

--Question 2
select pid
from products
where pid in (select pid 
              from orders
              where cid in (select cid 
			    from customers 
			    where city = 'Kyoto'))
			    order by pid DESC

--Question 3
select cid, name
from customers
where cid not in (select cid
              from orders
              where aid = 'a03')

--Question 4
select cid 
from orders
where pid = 'p01' intersect select cid 
                            from orders
                            where pid = 'p07'

--Question 5 needs work!
select pid
from orders
where 

select cid 
from orders
where cid not in (select cid
                  from orders
                  where aid = 'a05')