-- ***********************
-- Name: Woohyuk Kim
-- ID: 121968176
-- Date: 10/05/2018
-- Purpose: Lab 5 DBS301
-- ***********************

-- Part A --
-- Q1 - Display the department name, city, street address and postal 
--      code for departments
-- Solution:
    SELECT department_name, city, street_address, postal_code
        FROM departments d, employees e, locations l
        WHERE d.department_id = e.department_id AND d.location_id = l.location_id
        ORDER BY city, department_name;

-- Q2 - Display full name of employees, their hire date, salary, department name and city
-- Solution:
    SELECT last_name || ',' || first_name AS "Full Name", hire_date,
            TO_CHAR(salary, '$999,999.99'), department_name, city
        FROM employees e, departments d, locations l
        WHERE (e.department_id = d.department_id AND d.location_id = l.location_id) AND
            (department_name LIKE 'A%' OR department_name LIKE 'S%')
        ORDER BY department_name, "Full Name";

-- Q3 - Display the full name of the manager of each department in given states/provinces 
--      along with the department name, city, postal code and province name
-- Solution:
    SELECT first_name || '' || last_name AS "Manager", department_name,
            city, postal_code, state_province
        FROM employees e, departments d, locations l
        WHERE (e.manager_id = d.manager_id AND d.location_id = l.location_id)
            AND (UPPER(state_province) IN ('ONTARIO', 'CALIFORNIA', 'WASHINGTON'))
        ORDER BY city, department_name;
    
-- Q4 - Display employeeÅfs last name and employee number along with their managerÅfs last name 
--      and manager number
-- Solution:
    SELECT e.last_name AS "Employee", e.employee_id AS "EMP#", m.last_name
            AS "Manager", e.manager_id AS "Mgr#"
        FROM employees e, employees m
        WHERE e.manager_id = m.employee_id;

-- Part B --
-- Q5 - Display the department name, city, street address, postal code and country name 
--      for all Departments
-- Solution:
    SELECT department_name, city, street_address, postal_code, country_name
        FROM departments JOIN locations USING(location_id) JOIN countries
            USING(country_id)
        ORDER BY department_name DESC; 

-- Q6 - Display full name of the employees, their hire date and salary together with
--      their department name
-- Solution:
    SELECT first_name || '/' || last_name AS "Full Name", hire_date,
            TO_CHAR(salary, '$999,999.99'), department_name
        FROM employees e LEFT OUTER JOIN departments d ON(e.department_id = d.department_id)
        WHERE department_name LIKE 'A%' OR department_name LIKE 'S%'
        ORDER BY department_name, last_name;

-- Q7 - Display full name of the manager of each department in given provinces plus department name, 
--      city, postal code and province name
-- Solution:
    SELECT last_name || ',' || first_name AS "Manager", department_name,
            city, postal_code, state_province
        FROM employees e LEFT OUTER JOIN departments d ON(e.manager_id = d.manager_id)
            LEFT OUTER JOIN locations l ON(l.location_id = d.location_id)
        WHERE UPPER(state_province) IN ('ONTARIO', 'CALIFORNIA', 'WASHINGTON')
        ORDER BY city, department_name;

-- Q8 - Display the department name and Highest, Lowest and Average pay per each department
-- Solution:
    SELECT department_name, TO_CHAR(MAX(salary), '$999,999.99') AS "High", 
            TO_CHAR(MIN(salary), '$999,999.99') AS "Low",
            TO_CHAR(ROUND(AVG(salary)), '$999,999.99') AS "Avg"
        FROM departments d LEFT OUTER JOIN employees e ON(d.department_id = e.department_id) 
        GROUP BY department_name
        ORDER BY "Avg" DESC;

-- Q9 - Display the employee last name and employee number along with their managerÅfs last name 
--      and manager number
-- Solution:
    SELECT e.last_name AS "Employee", e.employee_id AS "EMP#", m.last_name
            AS "Manager", e.manager_id AS "Mgr#"
        FROM employees e FULL OUTER JOIN employees m ON(e.manager_id = m.employee_id);

-- End of File --


