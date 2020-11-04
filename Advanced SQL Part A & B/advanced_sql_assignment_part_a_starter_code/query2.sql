-- write your queries to insert data here

--Insert data in the tables
--Insert the following into the client table:
--First Name  Last Name   Email
--Sara Smith    smiths@hello.com
--Miguel    Cabrera     mc@hello.com
--Bo    Chan'g  bochang@hello.com

INSERT INTO client (first_name, last_name, email) VALUES ('Sara','Smith','smiths@hello.com');
INSERT INTO client (first_name, last_name, email) VALUES ('Miguel','Cabrera','mc@hello.com');
INSERT INTO client (first_name, last_name, email) VALUES ('Bo','Chan''g','bochang@hello.com');

--Insert the following into the employee table:
--First name    Last name   Start Date  Email

INSERT INTO employee (first_name, last_name, start_date, email) VALUES ('Ananya','Jaiswal','2008-04-10','ajaiswal@hello.com');
INSERT INTO employee (first_name, last_name, start_date, email) VALUES ('Michael','Fern','2015-07-19','michaelf@hello.com');
INSERT INTO employee (first_name, last_name, start_date, email) VALUES ('Abdul','Rehman','2018-02-27','rehman@hello.com');

--Insert the following project instances into the project table (you should use a subquery to set up foreign key references and not hard-coded numbers):
---- cid - reference to Sara Smith
-- title - Diamond
-- notes - Should be done by Jan 2019

INSERT INTO project (cid,title,comments) VALUES (
    (SELECT id FROM client WHERE first_name='Sara' AND last_name='Smith'),
    'Diamond',
    'Should be done by Jan 2019'
);

-- cid - reference to Bo Chan'g
-- title - Chan'g
-- notes - Ongoing maintenance

INSERT INTO project (cid,title,comments) VALUES (
    (SELECT id FROM client WHERE first_name='Bo' AND last_name='Chan''g'),
    'Chan''g',
    'Ongoing maintenance'
);

-- cid - reference to reference to Miguel Cabrera
-- title - The Robinson Project
-- notes - Null

INSERT INTO project (cid,title) VALUES (
    (SELECT id FROM client WHERE first_name='Miguel' AND last_name='Cabrera'),
    'The Robinson Project'
);

--Insert the following into the works_on table. Again, your queries here should not have hard-coded integers for foreign keys.

-- employee: Ananya Jaiswal
-- project: Chan'g
-- due_date: 11/19/2020

INSERT INTO works_on (eid, pid, due_date) VALUES (
    (SELECT id FROM employee WHERE first_name = 'Ananya' AND last_name = 'Jaiswal'), (SELECT id FROM project WHERE title = 'Chan''g'),'2020-11-19'),
    ((SELECT id FROM employee WHERE first_name ='Michael' AND last_name ='Fern'), (SELECT id FROM project WHERE title='The Robinson Project'), '2020-12-05'),
    ((SELECT id FROM employee WHERE first_name ='Abdul' AND last_name ='Rehman'), (SELECT id FROM project WHERE title='Diamond'),'2021-01-01');

-- employee: Michael Fern
-- project: The Robinson Project
-- start_date: 12/05/2020
    

-- employee: Abdul Rehman
-- project: Diamond
-- start_date: 1/1/2021


-- Leave the queries below untouched. These are to test your submission correctly.
select * from project;
select * from client;
select * from employee;
select * from works_on;
