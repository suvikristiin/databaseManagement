--procedure 1
--This procedure sets all employees salary to the base level based on their job title
CREATE OR REPLACE PROCEDURE procedure_salary_base_level()
LANGUAGE plpgsql
AS $$
BEGIN
	UPDATE employee e SET e.salary = j.base_salary FROM job_title j WHERE e.j_id = j.j_id;
END;
$$;


--procedure 2
--This procedure adds 3 months to all temporary contracts
CREATE OR REPLACE PROCEDURE procedures_add_months()
LANGUAGE plpgsql
AS $$
BEGIN
	UPDATE employee e SET e.contract_end=e.contract_end + INTERVAL '3 months'
	WHERE e.contract_type='Temporary';
END;
$$;


--procedure 3
--This procedure increases salaries by a percentage based on the given percentage. 
--The user can also specify a salary limit when calling the procedure.
CREATE OR REPLACE PROCEDURE procedures_add_salaries(percentage NUMERIC, salary_limit NUMERIC DEFAULT NULL)
LANGUAGE plpgsql
AS $$
BEGIN
	IF salary_limit IS NULL OR salary_limit = 0 THEN
		UPDATE employee
		SET salary = salary * (1 + percentage / 100.0);
	ELSE
		UPDATE employee
		SET salary = salary * (1 + percentage / 100.0)
		WHERE salary < salary_limit;
	END IF;
END;
$$;



