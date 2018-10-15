-- ***********************
-- Name: Woohyuk Kim
-- ID: 121968176
-- Date: 09/27/2018
-- Purpose: Lab 4 DBS301
-- ***********************

-- Q1 - Display the difference between the Average 
--     pay and Lowest pay in the company
-- Solution:
    SELECT TO_CHAR(ROUND(AVG(salary) - MIN(salary), 2), '$99999.90') AS "Real Amount"
        FROM employees;

-- Q2 - Display the department number and Highest, 
--      Lowest and Average pay per each department
-- Solution:
    SELECT department_id, TO_CHAR(MAX(salary), '$99999.90') AS "High", 
            TO_CHAR(MIN(salary), '$99999.90') AS "Low", 
            TO_CHAR(ROUND(AVG(salary), 2), '$99999.90') AS "Avg"
        FROM employees
        GROUP BY department_id
        ORDER BY AVG(salary) DESC;

-- Q3 - Display how many people work the same job in the same department 
-- Solution:
    SELECT department_id AS "Dept#", COUNT(job_id) AS "Job and How Many"
        FROM employees
        GROUP BY Job_id, department_id
        HAVING COUNT(job_id) > 1
        ORDER BY COUNT(job_id) DESC;
        
-- Q4 - For each job title display the job title and total amount paid each month for this 
--      type of the job
-- Solution:
    SELECT job_id, TO_CHAR(SUM(salary), '$999,999.99')
        FROM employees
        GROUP BY job_id
        HAVING job_id != 'AD_PRES' AND job_id != 'AD_VP' AND SUM(salary) > 12000
        ORDER BY SUM(salary) DESC;

-- Q5 -	For each manager number display how many persons he / she supervises
-- Solution:
    SELECT manager_id, COUNT(manager_id)
        FROM employees
        GROUP BY manager_id
        HAVING manager_id != 100 AND manager_id != 101 AND manager_id != 102
            AND COUNT(manager_id) > 2
        ORDER BY COUNT(manager_id) DESC;
        
-- Q6 - For each department show the latest and earliest hire date
-- Solution:
    SELECT department_id, MAX(hire_date), MIN(hire_date)
        FROM employees
        GROUP BY department_id
        HAVING department_id != 10 AND department_id != 20
            AND MIN(hire_date) < TO_DATE('01-JAN-2000')
        ORDER BY MAX(hire_date) DESC;

-- End of File -- 