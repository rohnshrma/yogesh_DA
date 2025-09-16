-- common table expression
-- sub query factoring

-- use of with clause


-- fetch employees who earn more than average salary of all employees
with average_salary (avg_salary) as 
	(select avg(salary) from employeez)
select * 
from employeez e , average_salary av
where e.salary > av.avg_salary ;



select *
from employeez e 
where e.salary > (select avg(salary) from employeez);