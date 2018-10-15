-- ***********************
-- Name: Woohyuk Kim
-- ID: 121968176
-- Date: Sept 13th. 2018
-- Purpose: Lab 2 DBS301
-- ***********************

-- Question 1 - Display the employee_id, last name and salary of employees 
--              earning in the range of $9,000 to $11,000
-- Solution:
    SELECT employee_id, last_name, TO_CHAR(salary, '$999,999.99') "SALARY"
        FROM employees
        WHERE salary >= 9000 AND salary <= 11000
        ORDER BY salary DESC, last_name;

-- Question 2 - Modify Q1 to display employees who work as Programmers or 
--              Sales Representatives
-- Solution:
    SELECT employee_id, last_name, TO_CHAR(salary, '$999,999.99') "SALARY"
        FROM employees
        WHERE (job_id = 'IT_PROG' OR job_id = 'SA_REP') AND
                (salary >= 9000 AND salary <= 11000)
        ORDER BY salary DESC, last_name;

-- Question 3 - Display the same job titles as Q2 and people who earn outside 
--              the given salary range from question 1
-- Solution:
    SELECT employee_id, last_name, TO_CHAR(salary, '$999,999.99') "SALARY"
        FROM employees
        WHERE (job_id = 'IT_PROG' OR job_id = 'SA_REP') AND
                (salary <= 9000 OR salary >= 11000)
        ORDER BY salary DESC, last_name;
        
-- Question 4 - Display the last name, job_id and salary of employees hired 
--              before 1998
-- Solution: 
    SELECT last_name, job_id, TO_CHAR(salary, '$999,999.99') "SALARY"
        FROM employees
        WHERE hire_date < TO_DATE('01-JAN-1999')
        ORDER BY hire_date DESC;

-- Question 5 - Displays employees earning more than $10,000 only
--              in addtion to the sorting in Q4
-- Solution:
    SELECT last_name, job_id, TO_CHAR(salary, '$999,999.99') "SALARY"
        FROM employees
        WHERE hire_date < TO_DATE('01-JAN-1999') AND salary > 10000
        ORDER BY job_id, salary DESC;
        
-- Question 6 - Display the job titles and full names of employees 
--              whose first name contains an ‘e’ or ‘E’ anywhere
-- Solution:
    SELECT job_id "Job Title", first_name || ' ' || last_name "Full name"
        FROM employees
        WHERE UPPER(first_name) LIKE '%E%';
        
-- Question 7 - Create a report to display last name, salary, and 
--              commission percent for all employees that earn a commission
-- Solution:
    SELECT last_name, TO_CHAR(salary, '$999,999.99') "SALARY", commission_pct
        FROM employees
        WHERE commission_pct IS NOT NULL;
        
-- Question 8 - Display the result of Q7 in order of descending salaries
-- Solution:
    SELECT last_name, TO_CHAR(salary, '$999,999.99') "SALARY", commission_pct
        FROM employees
        WHERE commission_pct IS NOT NULL
        ORDER BY salary DESC;
        
-- Question 9 - Do the same as Q8, but use a numeric value to do the sorting
    SELECT last_name, TO_CHAR(salary, '$999,999.99') "SALARY", commission_pct
        FROM employees
        WHERE commission_pct IS NOT NULL
        ORDER BY 2 DESC;
    
-- End of File --