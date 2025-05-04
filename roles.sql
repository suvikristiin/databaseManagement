--Create the roles admin, employee and trainee
CREATE ROLE admin;
CREATE ROLE employee;
CREATE ROLE trainee;

--Admin all administrative rights 
ALTER USER admin SUPERUSER;

--Employee rights to read all information but no rights to write
GRANT SELECT ON ALL TABLES IN SCHEMA public TO employee;

--Trainee rights to read project, customer, geo_location and project_role tables
GRANT SELECT ON project, customer, geo_location, project_role TO trainee;

--Trainee rights to read limited access to employee table (employee id, name, email columns)
GRANT SELECT (e_id, emp_name, email) ON employee TO trainee;