--Add zip_code column to Geo_location
ALTER TABLE geo_location ADD COLUMN zip_code VARCHAR(50);

--Add a NOT NULL constraint to customer email and project start date
ALTER TABLE customer ALTER COLUMN email SET NOT NULL;
ALTER TABLE project ALTER COLUMN p_start_date SET NOT NULL;

--Update the salary information to be able to add the salary constraint
UPDATE employee
SET salary = 1001
WHERE salary IS NULL OR salary <= 1000;

--Add a check constraint to employee salary and make sure it is more than 1000. 
ALTER TABLE employee 
ADD CONSTRAINT check_salary CHECK (salary > 1000);