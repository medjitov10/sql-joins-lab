#!/bin/sh

# TODO: Create database and initialize database table structure
psql -c 'CREATE DATABASE company;';
psql -d company -c "
CREATE TABLE employees (
    ssn VARCHAR(30) PRIMARY KEY NOT NULL,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    year_of_birth int,
    city VARCHAR(30),
    UNIQUE(ssn)
);
CREATE TABLE jobs (
    id SERIAL PRIMARY KEY NOT NULL,
    emp_ssn VARCHAR(30),
    company VARCHAR(30),
    salary VARCHAR(30),
    experience int,
    emp_id SERIAL NOT NULL,
    FOREIGN KEY (emp_ssn) REFERENCES employees(ssn)
);
COPY employees(ssn,first_name,last_name,year_of_birth,city) FROM '/Users/osmanmedzhytov/Desktop/cognizant/sql-joins-lab/starter-code/employees.csv' DELIMITER ',' CSV HEADER;
COPY jobs(emp_ssn,company,salary,experience) FROM '/Users/osmanmedzhytov/Desktop/cognizant/sql-joins-lab/starter-code/jobs.csv' DELIMITER ',' CSV HEADER;
"
