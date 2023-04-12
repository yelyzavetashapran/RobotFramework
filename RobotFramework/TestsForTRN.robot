*** Settings ***
Documentation
Library           DatabaseLibrary

Suite Setup  Connect To Database Using Custom Params    pymssql    host=${DBHost}, user=${DBUser}, password=${DBPass}, database=${DBName}
Suite Teardown  disconnect from database

*** Variables ***
${DBHost}       'EPUAKYIW04F3\\SQLEXPRESS01'
${DBUser}       'loginForTest'
${DBPass}       'passwordfortest'
${DBName}       'TRN'


*** Test Cases ***
1. [job_title] Check duplicates
    [Tags]  jobs
    row count is 0   SELECT * FROM (SELECT [job_title],[min_salary],[max_salary],ROW_NUMBER() OVER(partition by [job_title] order by [min_salary], [max_salary] asc) as row_num FROM [hr].[jobs]) tmp_tbl WHERE row_num > 1


2. [job_title] Check average of min_salary, max_salary
    [Tags]  jobs
    ${output} =     Query   SELECT 'ALL' job_titles, AVG([min_salary]) avg_min, AVG([max_salary]) avg_max FROM [hr].[jobs]
	Log  ${output}
    Should Be True  ${output}[0][1] < ${output}[0][2]


3. [employees] Check count of employees
    [Tags]  employees
     row count is equal to x    SELECT distinct employee_id from [hr].[employees];  40

4. [employees] Check if data stored in required format
    [Tags]  employees
    row count is 0    SELECT * FROM [hr].[employees] WHERE email NOT LIKE '%@%.org' OR phone_number NOT LIKE '%.%.%' OR hire_date NOT LIKE '____-__-__'

5. [locations] Check if require columns consist new null value
    [Tags]  locations
     row count is equal to x     SELECT * FROM [hr].locations WHERE street_address IS NULL OR postal_code IS NULL OR city is null OR state_province IS NULL OR country_id IS NULL;  1

6. [locations] Check if data from required countries
    [Tags]  locations
     row count is 0      SELECT * FROM [hr].locations WHERE country_id NOT IN ('US', 'CA', 'UK', 'DE')


