Queries for MODULE CHALLENGE #7
--DELIVERABLE 1 
SELECT emp_no, first_name, last_name
INTO new_employees_retirement1
FROM employees;

SELECT emp_no, title, from_date, to_date
INTO new_titles_retirement1
FROM titles;

SELECT * FROM new_employees_retirement1;

SELECT * FROM new_titles_retirement1;

--JOINING EMPLOYEES TBLS WITH TITLES-----------

SELECT e.birth_date,e.emp_no, e.first_name, e.last_name,t.title, t.from_date, t.to_date
FROM employees as e
JOIN titles AS t ON 
e.emp_no = t.emp_no
ORDER BY e.emp_no
;
--CREATE NEW TABLE- 'joined emp_titles' JOINING EMPLOYEES AND TITLES -WORKING-------------
SELECT e.birth_date,e.emp_no, e.first_name, e.last_name,t.title, t.from_date, t.to_date
INTO joined_emp_titles
FROM employees as e
JOIN titles AS t ON 
e.emp_no = t.emp_no
ORDER BY e.emp_no;

select *
FROM joined_emp_titles;

--FILTERING JOINED TABLE BY DATE OF BIRTH
SELECT birth_date,emp_no,first_name,last_name,title,from_date,to_date
FROM joined_emp_titles 
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31'
;
----- FINAL TABLE-----

--DELIVERABLE 1 FINAL TABLE joined retirement_titles
SELECT emp_no,first_name,last_name,title,from_date,to_date
INTO joined_retirement_titles
FROM joined_emp_titles
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY emp_no ASC;

SELECT *
FROM joined_retirement_titles;


--STEP 8 Deliverable 1 --------------


SELECT DISTINCT ON (emp_no) emp_no, first_name, last_name, title, from_date, to_date  
FROM joined_retirement_titles
ORDER BY emp_no,from_date DESC;

--MOST RECENT RETIREMENT_TITLES step 9 - 11

SELECT DISTINCT ON (emp_no) emp_no, first_name, last_name, title, from_date, to_date 
FROM joined_retirement_titles
WHERE to_date = '9999-01-01'
ORDER BY emp_no,from_date DESC;

---- FINAL TABLE "UNIQUE TITLES TABLE"

SELECT DISTINCT ON (emp_no) emp_no, first_name, last_name, title 
INTO Unique_Titles
FROM joined_retirement_titles
WHERE to_date = '9999-01-01'
ORDER BY emp_no,from_date DESC;

SELECT *
FROM Unique_Titles;

----STEP 16 DELIVERABLE 1
-- QUERY TO GET THE RETIRING BY TITLE
SELECT title, count (emp_no) 
FROM Unique_Titles
GROUP BY title
ORDER BY count (emp_no) DESC;

--CREATING TABLE OF RETIRING TITLES TABLE step 20
SELECT title, count (emp_no) 
INTO Retiring_Titles
FROM Unique_Titles
GROUP BY title
ORDER BY count (emp_no) DESC;

SELECT *
FROM Retiring_Titles;

______________________

-- DELIVERABLE 2

--STEPS 1-3
SELECT emp_no, first_name, last_name, birth_date
FROM employees;

select * 
FROM employees;

select * 
FROM dept_emp;

SELECT *
FROM employees as e
JOIN dept_emp as d
ON e.emp_no=d.emp_no;

--JOINING EMPLOYEES AND DEPT_EMP TABLES
SELECT e.emp_no, e.first_name, e.last_name, e.birth_date, d.from_date, d.to_date 
FROM employees as e
JOIN dept_emp as d
ON e.emp_no=d.emp_no;

--SAMPLE
SELECT DISTINCT ON (f.title ) f.title, r.rental_date
FROM rental AS r
JOIN inventory as i
ON (i.inventory_id = r.inventory_id)
JOIN film as f
ON (f.film_id = i.film_id)
ORDER BY f.title, r.rental_date DESC;

--STEP 4-7 
--JOINING EMPLOYEES/ DEPT_EMP TABLES with TITLE

SELECT DISTINCT ON (e.emp_no) e.emp_no, e.first_name, e.last_name, e.birth_date, d.from_date, d.to_date, t.title 
FROM employees as e
JOIN dept_emp as d
ON (e.emp_no=d.emp_no)
JOIN titles as t
ON (t.emp_no=e.emp_no);

--CREATING QUERY FOR  NEW TABLE DELIVERABLE 2 STEP 5
SELECT DISTINCT ON (e.emp_no) e.emp_no, e.first_name, e.last_name, e.birth_date, d.from_date, d.to_date, t.title 
FROM employees as e
JOIN dept_emp as d
ON (e.emp_no=d.emp_no)
JOIN titles as t
ON (t.emp_no=e.emp_no)
WHERE (d.to_date = '9999-01-01' AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31'))
ORDER BY e.emp_no ASC;

--CREATING FINAL TABLE FOR Deliverable 2
SELECT DISTINCT ON (e.emp_no) e.emp_no, e.first_name, e.last_name, e.birth_date, d.from_date, d.to_date, t.title
INTO mentorship_eligibility
FROM employees as e
JOIN dept_emp as d
ON (e.emp_no=d.emp_no)
JOIN titles as t
ON (t.emp_no=e.emp_no)
WHERE (d.to_date = '9999-01-01' AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31'))
ORDER BY e.emp_no ASC;

SELECT *
FROM mentorship_eligibility;



