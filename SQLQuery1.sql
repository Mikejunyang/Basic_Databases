CREATE DATABASE FINAL PROJECT
GO

USE FINAL PROJECT

CREATE TABLE employees(
	emp_id INTEGER NOT NULL CHECK (emp_id > 0),
	emp_nom VARCHAR(50) NOT NULL,
	dept_id INTEGER,
	date_dept DATE,
	PRIMARY KEY(emp_id),
	FOREIGN KEY(dept_id) REFERENCES department(dept_id));

CREATE TABLE department(
	dept_id INTEGER NOT NULL CHECK (dept_id > 0),
	dept_nom VARCHAR(30) NOT NULL,
	mgr_id INTEGER NOT NULL,
	PRIMARY KEY(dept_id),
	FOREIGN KEY(mgr_id) REFERENCES employees(emp_id));

CREATE TABLE project(
	proj_id INTEGER NOT NULL CHECK (proj_id > 0),
	proj_nom VARCHAR(30) NOT NULL,
	proj_mgr INTEGER NOT NULL CHECK (proj_mgr > 0),
	PRIMARY KEY(proj_id));

CREATE TABLE enrolment project(
	proj_id INTEGER,
	date_proj DATE,
	emp_id INTEGER,
	PRIMARY KEY(date_proj),
	FOREIGN KEY(emp_id) REFERENCES employees(emp_id),
	FOREIGN KEY(proj_id) REFERENCES project(proj_id));

INSERT INTO employees (emp_id, emp_nom, dept_id)
VALUES	(1, 'Brown' , 10),
		(2, 'Smith' , 10),
		(3, 'Laliberte', 10);

INSERT INTO department (dept_id, dept_nom, mgr_id)
VALUES	(10, 'Chemistry' , 1),
		(11, 'Physics' , 2),
		(12, 'Biology', 3);

INSERT INTO project (proj_id, proj_nom, proj_mgr)
VALUES	(100, 'C#' , 1),
		(101, 'Web' , 2),
		(102, 'Database', 3);

INSERT INTO enrolment project (proj_id, date_proj, emp_id)
VALUES	(100, '25/07/2023' , 1),
		(101, '25/07/2023' , 2),
		(102, '23/07/2023', 3);