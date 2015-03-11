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

--Question 5
select pid
from products
where pid in (select pid 
	      from orders
              where pid not in (select pid
                                from orders
                                where aid = 'a05'))

--Question 6
select name, discount, city
from customers
where cid in (select cid
	      from orders
	      where aid in (select aid
	                    from agents
	                    where city = 'Dallas' or city = 'New York'))

--Question 7
select *
from customers 
where discount in (select discount
                   from customers
                   where city = 'Dallas' or city = 'New York')

--Question 8
/* Check constraints are a device used on a column that decides what it is used for. 
It makes it so that the value for a column can only be of one data type.
This is good because it allows data to be consistent across the rows. 
A good example of check constraints is when a time is inputted it should fit into the gregorian calander.
A bad example would be if you have a firtName column and only allow integers, it wouldn't make sense to format it that way.
*/
     	                    