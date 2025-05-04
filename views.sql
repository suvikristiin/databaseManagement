--View 1
--This view lists all employees who have the employee benefits skill.
CREATE OR REPLACE VIEW employees_salary_benefit AS
SELECT e.e_id, e.emp_name, e.email, e.contract_type, e.contract_start, e.contract_end, s.skill, s.salary_benefit_value
FROM employee e
JOIN employee_skills es ON e.e_id = es.e_id
JOIN skills s ON es.s_id = s.s_id
WHERE s.salary_benefit = true
ORDER BY s.salary_benefit_value;

--View 2
--This view lists all employees who have a project
CREATE OR REPLACE VIEW employees_in_projects AS
SELECT e.e_id, e.emp_name, e.email, p.project_name, p.p_start_date, p.p_end_date
FROM employee e
JOIN project_role pr ON e.e_id = pr.e_id
JOIN project p ON pr.p_id = p.p_id
ORDER BY p.p_id;

-- View 3
--This view lists all headquarters and their locations
CREATE OR REPLACE VIEW headquarter_locations AS
SELECT h.h_id, h.hq_name, g.street, g.city, g.country FROM headquarters h
INNER JOIN geo_location g ON g.l_id = h.l_id
ORDER BY g.country;

-- View 4
--This view lists all Finnish customers
CREATE OR REPLACE VIEW customers_from_finland AS
SELECT c.c_id, c.c_name, c.phone, c.email, g.street, g.city, g.country
FROM customer c JOIN geo_location g ON c.l_id = g.l_id
WHERE g.country = 'Finland'
ORDER BY c.c_id;