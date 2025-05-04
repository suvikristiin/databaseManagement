--partition 1
--Partition the employee table into three partitions by contract type (temporary, part-time, full-time)
CREATE TABLE employee_partition ( 
	e_id integer NOT NULL, 
	emp_name character varying(100), 
	email character varying(100), 
	contract_type character varying(50) NOT NULL, 
	contract_start date, 
	contract_end date, 
	salary integer, 
	supervisor integer, 
	d_id integer, 
	j_id integer 
) PARTITION BY LIST (contract_type);

CREATE TABLE employee_parttime PARTITION OF employee_partition FOR VALUES IN ('Part-time');
CREATE TABLE employee_temporary PARTITION OF employee_partition FOR VALUES IN ('Temporary');
CREATE TABLE employee_fulltime PARTITION OF employee_partition FOR VALUES IN ('Full-time');


--partition 2
--Partition the project table into three partitions based on project budget (0-10M, 10-50M, +50M)
CREATE TABLE project_partition (
	p_id integer NOT NULL,
	project_name character varying(100),
	budget numeric,
	commission_percentage numeric,
	p_start_date date,
	p_end_date date,
	c_id integer
) PARTITION BY RANGE (budget);


CREATE TABLE project_budget_low PARTITION OF project_partition FOR VALUES FROM (0) TO (10000000);
CREATE TABLE project_budget_medium PARTITION OF project_partition FOR VALUES FROM (10000001) TO (50000000);
CREATE TABLE project_budget_high PARTITION OF project_partition FOR VALUES FROM (50000001) TO (MAXVALUE);






