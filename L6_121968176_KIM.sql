-- ***********************
-- Name: Woohyuk Kim
-- ID: 121968176
-- Date: Oct 11th, 2018
-- Purpose: Lab 6 DBS301
-- ***********************

-- Q1 - Set autocimmit on
-- Solution:
    SET AUTOCOMMIT ON;

-- Q2 - Create an INSERT statement to add myself in employee table
-- Solution:
    INSERT INTO employees VALUES(300, 'Woohyuk', 'Kim', 'WKIM', NULL, '11-OCT-18', 'SA_MAN', NULL, 0.2, 100, 90);

-- Q3 - Create an Update statement to: change the salary of employees
-- Solution:
    UPDATE employees
    SET salary = 2500
    WHERE UPPER(last_name) = 'MATOS' OR UPPER(last_name) = 'WHALEN';
    
-- Q4 - Display the last names of all employees who are in the same department
--      as employee named Abel
-- Solution:
    SELECT last_name
    FROM employees
    WHERE department_id = (SELECT department_id
                            FROM employees
                            WHERE UPPER(last_name) = 'ABEL');

-- Q5 - Display the last name of the lowest paid employee(s)
-- Solution:
    SELECT last_name
    FROM employees
    WHERE salary = (SELECT MIN(salary)
                     FROM employees);

-- Q6 - Display the city that the lowest paid employee(s) are located in
-- Solution:
    SELECT DISTINCT l.city
    FROM locations l, employees e, departments d
    WHERE (e.department_id = d.department_id AND
           d.location_id = l.location_id) AND
           e.salary = (SELECT MIN(salary)
                      FROM employees);
                                                                  
-- Q7 - Display the last name, department_id, and salary of the lowest paid employee(s) in each department
-- Solution:
    SELECT last_name, department_id, TO_CHAR(salary, '$999,999.99')
    FROM employees a
    WHERE salary = (SELECT MIN(salary)
            FROM employees b
            WHERE a.department_id = b.department_id
            GROUP BY b.department_id)
    ORDER BY department_id;
    
-- Q7 - alternative way
--  SELECT last_name, department_id, TO_CHAR(salary, '$999,999.99')
--  FROM (SELECT last_name, department_id, salary, RANK() OVER(Partition by department_id ORDER BY salary ASC) AS rank
--        FROM employees) a
--  WHERE a.RANK = 1
--  ORDER BY department_id;
    
-- Q8 - Display the last name of the lowest paid employee(s) in each city
-- Solution:
    SELECT a.last_name, a.city
    FROM (SELECT e.last_name, e.salary, l.city
          FROM employees e, departments d, locations l
          WHERE e.department_id = d.department_id AND d.location_id = l.location_id) a
    WHERE (a.salary, a.city) IN (SELECT MIN(e.salary), l.city
                                FROM employees e, departments d, locations l
                                WHERE e.department_id = d.department_id AND d.location_id = l.location_id
                                GROUP BY l.city);
    
-- Q9 - Display last name and salary for all employees who earn less than the lowest salary in ANY department
-- Solution:
    SELECT last_name, TO_CHAR(salary, '$999,999.99')
    FROM employees
    WHERE salary < ANY (SELECT MIN(salary)
                        FROM employees
                        GROUP BY department_id)
    ORDER BY salary DESC, last_name;

-- Q10 - Display last name, job title and salary for all employees 
--       whose salary matches any of the salaries from the IT Department
-- Solution:
    SELECT last_name, job_id, TO_CHAR(salary, '$999,999.99')
    FROM employees
    WHERE salary = ANY (SELECT salary
                    FROM employees
                    WHERE department_id = 60)
    ORDER BY salary, last_name;

-- END OF FILE --








                                                                  