/* ------------
Employee Table
---------------
*/
DROP TABLE employee;
CREATE TABLE employee(
    emp_id INT PRIMARY KEY,
    first_name VARCHAR(40),
    last_name VARCHAR(40),
    birth_day DATE,
    sex VARCHAR(1),
    salary INT,
    super_id INT,
    FOREIGN KEY(super_id) REFERENCES employee(emp_id) ON DELETE SET NULL,
    branch_id INT
);
DESCRIBE employee;
/* ------------
Branch Table
---------------
*/
DROP TABLE branch;
CREATE TABLE branch(
    branch_id INT PRIMARY KEY,
    branch_name VARCHAR(40),
    mgr_id INT,
    FOREIGN KEY(mgr_id) REFERENCES employee(emp_id) ON DELETE SET NULL,
    mgr_start_date DATE
   
);
DESCRIBE branch;
-- adding branch_id as a foreign key
ALTER TABLE employee ADD FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE SET NULL
/* ------------
Client Table
---------------
*/
DROP TABLE client;
CREATE TABLE client(
    client_id INT PRIMARY KEY,
    client_name VARCHAR(40),
    branch_id INT,
    FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE SET NULL
);
DESCRIBE client;
/* ------------
Works _With Table
---------------
*/
DROP TABLE works_with;
CREATE TABLE works_with(
    emp_id INT,
    client_id INT,
    total_sales INT,
    FOREIGN KEY(emp_id) REFERENCES employee(emp_id) ON DELETE CASCADE,
    FOREIGN KEY(client_id) REFERENCES client(client_id) ON DELETE CASCADE,
    PRIMARY KEY(emp_id,client_id)
);
DESCRIBE works_with;
/* ------------
Works _With Table
---------------
*/
DROP TABLE branch_supplier;
CREATE TABLE branch_supplier(
    branch_id INT,
    supplier_name VARCHAR(40),
    supply_type varchar(40),
    FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE CASCADE,
    PRIMARY KEY(branch_id,supplier_name)
);
DESCRIBE branch_supplier;

/* Insert Into employee table */

-- Master

INSERT INTO employee VALUES(100,'Ahmed','Kamal','1967-11-17','M',250000,NULL,NULL);
INSERT INTO branch VALUES(1,'Master',100,'2006-02-09');

UPDATE employee
SET branch_id = 1
WHERE emp_id = 100;

INSERT INTO employee VALUES(101,'Mohamed','Tamer','1961-05-11','M',110000,100,1);

-- Main

INSERT INTO employee VALUES(102,'Ali','Hassan','1964-03-15','M',75000,100,NULL);
INSERT INTO branch VALUES(2,'Main',102,'1992-04-06');

UPDATE employee
SET branch_id = 2
WHERE emp_id = 102;

INSERT INTO employee VALUES(103,'Mariam','Taher','1988-07-14','F',63000,102,2);
INSERT INTO employee VALUES(104,'Habiba','Reda','1989-03-10','F',55000,102,2);
INSERT INTO employee VALUES(105,'Kareem','Mohamed','1967-01-17','M',69000,102,2);

-- Origin

INSERT INTO employee VALUES(106,'Tarek','Ali','1922-05-16','M',78000,100,NULL);
INSERT INTO branch VALUES(3,'Origin',106,'1998-02-13');

UPDATE employee
SET branch_id = 3
WHERE emp_id = 106;

INSERT INTO employee VALUES(107,'Hamed','Kamel','1974-08-16','M',65000,106,3);
INSERT INTO employee VALUES(108,'Osama','Mohamed','1984-11-10','M',71000,106,3);


/* Insert Into client table */

INSERT INTO client VALUES(400,'Mohamed Mostafa',2);
INSERT INTO client VALUES(401,'Eslam Taher',2);
INSERT INTO client VALUES(402,'yaser Ahmed',3);
INSERT INTO client VALUES(403,'Baher Ramy',3);
INSERT INTO client VALUES(404,'Ali Hesham',2);
INSERT INTO client VALUES(405,'Osama Elzero',3);
INSERT INTO client VALUES(406,'Eslam Codezilla',2);

/* Insert Into branch supplier table */

INSERT INTO branch_supplier VALUES(2,'Mosh','Programming');
INSERT INTO branch_supplier VALUES(2,'Free Code Camp','Programming');
INSERT INTO branch_supplier VALUES(3,'Nature','Natural sights');
INSERT INTO branch_supplier VALUES(2,'Football','Football Matches');
INSERT INTO branch_supplier VALUES(3,'Mosh','Programming');
INSERT INTO branch_supplier VALUES(3,'Uni-ball','uni Matches');
INSERT INTO branch_supplier VALUES(3,'Football','Football Matches');

/* Insert Into works with table */

INSERT INTO works_with VALUES(105,400,55000);
INSERT INTO works_with VALUES(102,401,267000);
INSERT INTO works_with VALUES(108,402,22500);
INSERT INTO works_with VALUES(107,403,5000);
INSERT INTO works_with VALUES(108,403,12000);
INSERT INTO works_with VALUES(105,404,33000);
INSERT INTO works_with VALUES(107,405,26000);
INSERT INTO works_with VALUES(102,406,15000);
INSERT INTO works_with VALUES(105,406,130000);

-- Get all data from the tables


SELECT * FROM employee;
SELECT * FROM branch;
SELECT * FROM client;
SELECT * FROM branch_supplier;
SELECT * FROM works_with;