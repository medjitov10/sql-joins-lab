#!/bin/sh

echo '# TODO: Write queries to display:'


echo '# Employees working at macys'
psql -d company -c "
  select CONCAT(first_name, ' ', last_name) as full_name from employees e
  join jobs j on e.ssn = j.emp_ssn
  where j.company like 'Macy%'
  ;"
echo '# Companies in Boston'
psql -d company -c "
  select company from employees e
  join jobs j on e.ssn = j.emp_ssn
  where e.city = 'Boston'
  ;"
echo '# Employee with the highest salary'
psql -d company -c "
  select CONCAT(first_name, ' ', last_name) as full_name from jobs
  join employees e on jobs.emp_ssn = e.ssn
  group by e.ssn, jobs.id
  having salary = (
  select max(j.salary) from employees e
  join jobs j on e.ssn = j.emp_ssn
  );"
