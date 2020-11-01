--Deliverable 1
--Number of Retiring Employees By Title
SELECT e.emp_no, 
		e.first_name, 
		e.last_name,
		ti.title,
		ti.from_date,
		ti.to_date
INTO retirement_title
From employees as e
inner join titles as ti
on (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
rt.first_name,
rt.last_name,
rt.title
INTO unique_titles
FROM retirement_title as rt 
ORDER BY rt.emp_no, rt.to_date DESC;


--Count of Retiring Employees by Department
SELECT COUNT(ut.emp_no), ut.title
INTO retiring_titles
FROM unique_titles as ut
GROUP BY ut.title
ORDER BY ut.count desc 



--Deliverable 2
--Employees Eligible for Mentorship Program
SELECT DISTINCT ON (e.emp_no) e.emp_no,
		e.first_name,
		e.last_name,
		e.birth_date,
		de.from_date,
		de.to_date,
		ti.title
INTO mentorship_eligibility
From employees as e
inner join dept_emp as de
on (e.emp_no = de.emp_no)
inner join titles as ti
on (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
	AND (de.to_date = '9999-01-01')
ORDER BY e.emp_no;