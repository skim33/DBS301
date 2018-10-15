-- ***********************
-- Name: Woohyuk Kim
-- ID: 121968176
-- Date: Sept 6th, 2018
-- Purpose: Lab 1 DBS301
-- ***********************

SELECT * FROM employees;

SELECT * FROM departments;

SELECT * FROM job_history;

-- Q1. Which one of these tables appeared to be the widest? or longest? 
-- Solution: employees

-- Q2. If the following SELECT statement does NOT execute successfully,
--     how would you fix it?
-- Solution: 
-- SELECT last_name "LName", job_id "Job Title", 
--        hire_date "Job Start"
--        FROM employees;

-- Q3. There are THREE coding errors in this statement. Can you identify them?
-- Solution:
-- 1. There is no underscore between last and name; should be last_name
-- 2. Emp Comm should be enclosed with ""; should be "Emp Comm"
-- 3. Don't need comma before FROM
-- it should be:
-- SELECT employee_id, last_name, commission_pct "Emp Comm"
--       FROM employees;

-- Q4. What command would show the structure of the LOCATIONS table?
-- Solution: DESCRIBE locations;

-- Q5. Create a query to display the output given.
SELECT location_id "City#", city "City", 
        CASE 
            WHEN state_province IS NULL THEN country_id
            WHEN state_province IS NOT NULL THEN (state_province || ' IN THE ' || country_id)
        END
        "Province with Country Code"
       FROM locations;

-- END OF FILE --