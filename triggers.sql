
--Trigger 1
-- The trigger checks if the skill already exists in the database before adding a new skill
CREATE OR REPLACE FUNCTION triggerFunction_skill_exists()
RETURNS TRIGGER AS $$
BEGIN
IF EXISTS (SELECT * FROM skills WHERE skill = NEW.skill) THEN
RAISE EXCEPTION 'Skill already exists';
END IF;
RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER skill_exists
BEFORE INSERT ON skills
FOR EACH ROW
EXECUTE FUNCTION triggerFunction_skill_exists();


--Trigger 2
--The trigger check the customer country and select three employees from that country to start working with the project
CREATE OR REPLACE FUNCTION triggerFunction_project_role()
RETURNS TRIGGER AS $$
DECLARE
c_country varchar(50);
BEGIN

SELECT l.country INTO c_country FROM customer c JOIN geo_location l ON c.l_id = l.l_id WHERE c.c_id = NEW.c_id;

INSERT INTO project_role  (e_id, p_id, prole_start_date)
SELECT e.e_id, NEW.p_id, NEW.p_start_date FROM employee e JOIN department d ON e.d_id=d.d_id
JOIN headquarters h ON d.hid=h.h_id JOIN geo_location gl ON h.l_id=gl.l_id WHERE gl.country = c_country LIMIT 3;
RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER project_role
AFTER INSERT ON project
FOR EACH ROW
EXECUTE FUNCTION triggerFunction_project_role();


--Trigger 3
--Before updating the employment contract type, the trigger the user to ensure that the contract start date is set to the current day
--and the end date is set to either two years from the start date if the contract is fixed-term, or NULL otherwise.
CREATE OR REPLACE FUNCTION triggerFunction_contractType()
RETURNS TRIGGER AS $$
BEGIN
	IF NEW.contract_type = 'Temporary' THEN
		New.contract_type = 'Temporary';
		NEW.contract_start = CURRENT_DATE;
		NEW.contract_end = CURRENT_DATE + INTERVAL '2 years';
	ELSE
		NEW.contract_start = CURRENT_DATE;
		NEW.contract_end = NULL;
	END IF;
RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER contract_type
BEFORE UPDATE OF contract_type ON employee
FOR EACH ROW
EXECUTE FUNCTION triggerFunction_contractType();



