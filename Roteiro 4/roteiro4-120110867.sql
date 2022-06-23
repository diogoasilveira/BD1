--Primeira Questão
SELECT * FROM department;
--Segunda Questão
SELECT * FROM dependent;
--Terceira Questão
SELECT * FROM dept_locations;
--Quarta Questão
SELECT * FROM employee;
--Quinta Questão
SELECT * FROM project;
--Sexta Questão
SELECT * FROM works_on;
--Sétima Questão
SELECT fname, lname FROM employee WHERE sex = 'M';
--Oitava Questão
SELECT fname FROM employee WHERE superssn IS NULL;
--Nona Questão
SELECT e.fname, s.fname FROM employee e ,employee s WHERE e.superssn IS NOT NULL and e.superssn = s.ssn;
--Décima Questão
SELECT e.fname FROM employee e ,employee s WHERE e.superssn = s.ssn and s.fname = 'Franklin';
--Décima Primeira Questão
SELECT d.dname, l.dlocation FROM department d, dept_locations l WHERE d.dnumber = l.dnumber;
--Décima Segunda Questão
SELECT d.dname FROM department d, dept_locations l WHERE d.dnumber = l.dnumber and l.dlocation LIKE 'S%';
--Décima Terceira Questão
SELECT e.fname, e.lname, d.dependent_name FROM employee e, dependent d WHERE e.ssn = d.essn;
--Décima Quarta Questão
SELECT fname || ' '  || minit || ' ' || lname, salary FROM employee WHERE salary > 50000;
--Décima Quinta Questão
SELECT p.pname, d.dname FROM project p, department d WHERE p.dnum = d.dnumber;
--Décima Sexta Questão
SELECT p.pname, e.fname FROM project p, department d, employee e WHERE p.dnum = d.dnumber and d.mgrssn = e.ssn and pnumber > 30;
--Décima Sétima Questão
SELECT p.pname, e.fname FROM project p, department d, employee e WHERE p.dnum = d.dnumber and e.dno = d.dnumber;
--Décima Oitava Questão
SELECT e.fname, d.dependent_name, d.relationship FROM employee e, department z, project p, dependent d WHERE e.ssn = d.essn and e.dno = z.dnumber and z.dnumber = p.dnum
and p.pnumber = 91;