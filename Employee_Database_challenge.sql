--SQL CHALLENGE
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~--
--DELIVERABLE 1: 

--Steps 1 to 7: Find the # of retiring employees by title 
-- (contains duplicates) and place data into retirement_titles 
-- (133,776 with dupes).
SELECT e.emp_no,
	e.first_name, 
	e.last_name, 
	ti.title, 
	ti.from_date, 
	ti.to_date	
INTO retirement_titles
FROM employees as e
INNER JOIN titles as ti
ON (e.emp_no = ti.emp_no)
	WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;
	
-- Steps 8 to 15: Find the # of retiring employees by title (no dupes)
-- and place data into unique_titles 
-- (72,458 without dupes and reflecting current employees only).
SELECT DISTINCT ON (rt.emp_no) 
	rt.emp_no,
	rt.first_name,
	rt.last_name,
	rt.title
INTO unique_titles
FROM retirement_titles as rt
WHERE to_date = '9999-01-01'
ORDER BY rt.emp_no, rt.to_date DESC;

SELECT SUM (count)
FROM retiring_titles;


-- Steps 16 to 22: Find the # of employees by their most recent job title 
-- who are about to retire and place data into retiring_titles 
-- (total 7 titles).
SELECT COUNT(ut.title), ut.title
INTO retiring_titles
FROM unique_titles as ut
GROUP BY ut.title
ORDER BY count DESC;


--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~--
--DELIVERABLE 2: 

--Steps 1 to 11: Find the # of employees eligible for the mentorship program
-- and place data into mentorship_eligibility (1,549).
SELECT DISTINCT ON (e.emp_no)
	e.emp_no,
	e.first_name, 
	e.last_name, 
	e.birth_date,
	de.from_date,
	de.to_date,
	ti.title
INTO mentorship_eligibilty
FROM employees as e
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
INNER JOIN titles as ti
ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (de.to_date = '9999-01-01')
ORDER BY e.emp_no, ti.from_date DESC;

SELECT COUNT (emp_no)
FROM mentorship_eligibilty;


--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~--
--DELIVERABLE 3:

--1A- Join department onto unique_titles (72,458 individuals): 
SELECT DISTINCT ON (ut.emp_no) 
	ut.emp_no,
	ut.first_name,
	ut.last_name,
	ut.title,
	d.dept_name
INTO unique_titles_plus_department_added
FROM unique_titles as ut
INNER JOIN dept_emp as de
ON (ut.emp_no = de.emp_no)
INNER JOIN departments as d
ON (d.dept_no = de.dept_no)
ORDER BY ut.emp_no;


-- 1B - Control Sheets/Position Chart by title and department (72,458):
SELECT ut.dept_name, ut.title, COUNT(ut.title) 
INTO prospective_backfill_positions_by_dept
FROM (SELECT title, dept_name from unique_titles_plus_department_added) as ut
GROUP BY ut.dept_name, ut.title
ORDER BY ut.dept_name DESC;

SELECT * FROM prospective_backfill_positions_by_dept


-- 2A - Technical Staff as Mentors- (39,894):
SELECT ut.dept_name, ut.title, COUNT(ut.title) 
INTO prospective_technical_mentors
FROM (SELECT title, dept_name from unique_titles_plus_department_added) as ut
WHERE ut.title IN ('Senior Engineer', 'Engineer', 'Technique Leader', 'Assistant Engineer')
GROUP BY ut.dept_name, ut.title
ORDER BY ut.dept_name DESC;

Select * from prospective_technical_mentors


-- 2B - What if mentorship is broadened beyond 1965 
-- to include people born 1963 to 1965?
-- (38,401 total w/ 20,907 in Senior Engineer, Engineer, Asst. Engineer, and Technique Leader)

SELECT DISTINCT ON (e.emp_no)
	e.emp_no,
	e.first_name, 
	e.last_name, 
	e.birth_date,
	de.from_date,
	de.to_date,
	ti.title
INTO prospective_mentees_expanded_eligibility
FROM employees as e
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
INNER JOIN titles as ti
ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1963-01-01' AND '1965-12-31')
AND (de.to_date = '9999-01-01')
ORDER BY e.emp_no, ti.from_date DESC;

SELECT COUNT (emp_no)
FROM prospective_mentees_expanded_eligibility;