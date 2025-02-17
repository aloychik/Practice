/* task 1: find out salaries of ML Engineers in 2023, add sort by increase*/
select
	salary_in_usd AS salary
	, year
	, job_title
from salaries
where
	year = 2023
	and job_title = 'ML Engineer'
order by salary_in_usd ASC
Limit 10;

/* task 2: Find the country (comp_location) where is the lowest salary for Data Scientist in 2023*/
select
	comp_location AS country
	, salary_in_usd
	, year
	, job_title
	from salaries
where
	year = 2023
	AND job_title = 'Data Scientist'
order by salary_in_usd ASC
limit 1;

/* Task 3: find top 5 salaries among remote specialist*/
select
	remote_ration
	, salary_in_usd
	, year
	from salaries
where 
	remote_ration = 100
order by salary_in_usd DESC
limit 5;

/* Task 4: Find unique values from the columns*/
select distinct remote_ration
from salaries;

/* Task 5: Find the number of unique values from the colums*/
select count (distinct comp_location)
from salaries;

/* Task 6: Find the MIX, MAX and AVG values for salaries in 2023*/
select
	MIN(salary_in_usd) AS Min_salary_in_USD
	, MAX(salary_in_usd) AS Max_salary_in_USD
	, round(AVG(salary_in_usd)) AS AVG_salary_in_USD
	from salaries
where year=2023

/* Task 7: Find top 5 the highest salaries in 2023 for ML Engineer. Salaries should be converted in hryvnias*/
select 
	year
	, job_title
	, salary_in_usd
	, (salary_in_usd * 41) AS salary_in_uah
	from salaries
where year = 2023 AND job_title = 'ML Engineer'
order by salary_in_usd DESC
Limit 5;

/*Task 8: output unique column values remote_ ration, data format must be fractional with two decimal places*/
select distinct round((remote_ration/100.0), 2) as remote_frac
from salaries;

/* Task 9: Output data and add column 'exp_level_full' with full name of the job levels in the column. Entry(EN), Middle(MI),Seior(SE), etc.*/
select *
	, case 
		when exp_level = 'EN' then 'Entry_level'
		when exp_level = 'MI' then 'Middle_level'
		when exp_level = 'SE' then 'Senior_level'
		else 'Executive_level' end 	as exp_level_full
from salaries
limit 10;