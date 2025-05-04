# databaseManagement
This project was implemented as part of the course CT60A7650 – Database Systems Administration. The goal was to improve and extend an existing PostgreSQL database. Key development steps included creating views, triggers, procedures, and partitions, as well as implementing permissions and database changes.

I used the pgAdmin graphical user interface to implement the project, and the implementation was done using PL/pgSQL commands. The project was implemented using the graphical interface pgAdmin. The implementation was done using SQL and postgreSQL, depending on the feature. All SQL code is organized into files (views.sql, triggers.sql, procedures.sql...) to support clarity and reuse.

- ✅ **4 views**
  - Employee skill benefits
  - Employee participation in projects
  - Headquarters locations
  - Customers in Finland

- ✅ **3 triggers**
  - Preventing duplicate skill entries
  - Automatically assigning employees to new projects based on customer country
  - Setting contract dates when contract type is updated

- ✅ **3 stored procedures**
  - Updating salaries to match base levels
  - Extending temporary contracts
  - Increasing salaries based on given percentage and optional upper limit

- ✅ **2 partitioned tables**
  - employee table partitioned by contract type
  - project table partitioned by budget range

- ✅ **access rights** 
  - admin: full privileges
  - employee: read-only access to all tables
  - trainee: limited read access to specific tables and columns

- ✅ **other changes**:
  - Added new column zip_code to geo_location table
  - Enforced NOT NULL constraints on key fields
  - Added a CHECK constraint on `salary > 1000` and updated data accordingly
  
