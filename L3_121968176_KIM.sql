-- ***********************
-- Name: Woohyuk Kim
-- ID: 121968176
-- Date: Sept 20th, 2018
-- Purpose: Lab 3 DBS301
-- ***********************

-- Q1 - Write a query to display the tomorrow’s date in the given format:
-- Solution:
    SELECT to_char(sysdate + 1, 'Month fmddth "of year" yyyy')"Tomorrow" 
        FROM dual;

-- Q2 - Display last name, first name, salary, and salary increased by 5% 
--      as a whole number.
-- Solution:
    SELECT last_name AS "Last Name", first_name AS "First Name", 
            to_char(salary, '$999,999.99') AS "Salary",
            to_char(TO_NUMBER((salary * 1.05)), '$999,999.99') AS "Good Salary",
            to_char((TO_NUMBER((salary * 1.05)) - salary) * 12, '$999,999.99') AS
            "Annual Pay Increase"
        FROM employees
        WHERE department_id = 20 OR department_id = 50 OR department_id = 60;

-- Q3 - Write a query that displays the employee’s Full Name and Job Title 
--      in the given format:
-- Solution:
    SELECT (last_name || ', ' || first_name || ' is ' || job_id) AS "Person and Job"
        FROM employees
        WHERE UPPER(last_name) LIKE '%S' AND (UPPER(first_name) LIKE 'C%' OR
                UPPER(first_name) LIKE 'K%')
        ORDER BY last_name;
        
-- Q4 - Display the employee’s last name, hire date after calculating the number of YEARS between 
--      TODAY and the date the employee was hired. 
-- Solution:
    SELECT last_name, hire_date, TO_CHAR(ROUND((sysdate - hire_date)/365)) AS 
            "Years Worked"
        FROM employees
        WHERE hire_date < TO_DATE('1-JAN-1992')
        ORDER BY "Years Worked" DESC;

-- Q5 - Displays the city names, country codes and state province names, but only for those cities 
--      that starts with S and has at least 8 characters in their name. 
-- Solution:
    SELECT city, country_id, 
            CASE WHEN state_province IS NULL THEN 'Unknown Province'
            ELSE state_province END AS "Province"
        FROM locations
        WHERE UPPER(city) LIKE 'S%' AND LENGTH(city) >= 8;

-- Q6 - Display each employee’s last name, hire date, and salary review date, which is the first Thursday 
--      after a year of service, but only for those hired after 1997.  
-- Solution:
    SELECT last_name, hire_date, TO_CHAR(NEXT_DAY(ADD_MONTHS(hire_date, 12), 
            'THURSDAY'), 'fmDAY, Month "the" ddspth "of year" yyyy') AS "REVIEW DAY"
        FROM employees
        WHERE hire_date >= TO_DATE('1-JAN-1998')
        ORDER BY "REVIEW DAY";
        
-- End of File --