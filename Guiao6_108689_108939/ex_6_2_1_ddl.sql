CREATE SCHEMA Company;
GO
CREATE DATABASE Company;


CREATE TABLE Company.DEPARTMENT(
    Dname VARCHAR(30) NOT NULL,
    Dnumber INT NOT NULL,
    Mgr_ssn INT NULL,
    Mgr_start_date DATE NULL,

    PRIMARY KEY (Dnumber),
)

CREATE TABLE Company.EMPLOYEE(
    Fname VARCHAR(30) NOT NULL,
    Minit VARCHAR(30) NOT NULL,
    Lname VARCHAR(30) NOT NULL,
    Ssn INT NOT NULL,
    Bdate DATE NOT NULL,
    Address VARCHAR(30) NOT NULL,
    Sex CHAR(1) NOT NULL,
    Salary INT NOT NULL,
    Super_ssn INT,
    Dno INT NOT NULL,
    
    PRIMARY KEY (Ssn),
    FOREIGN KEY (Super_ssn) REFERENCES Company.EMPLOYEE(Ssn),
    FOREIGN KEY (Dno) REFERENCES Company.DEPARTMENT(Dnumber),
)

CREATE TABLE Company.DEPT_LOCATIONS(
    Dnumber INT NOT NULL,
    Dlocation VARCHAR(30) NOT NULL,

    PRIMARY KEY (Dnumber, Dlocation),
    FOREIGN KEY (Dnumber) REFERENCES Company.DEPARTMENT(Dnumber),
)

CREATE TABLE Company.PROJECT(
    Pname VARCHAR(30) NOT NULL,
    Pnumber INT NOT NULL,
    Plocation VARCHAR(30) NOT NULL,
    Dnum INT NOT NULL,

    PRIMARY KEY (Pnumber),
    FOREIGN KEY (Dnum) REFERENCES Company.DEPARTMENT(Dnumber),
)

CREATE TABLE Company.WORKS_ON(
    Essn INT NOT NULL,
    Pno INT NOT NULL,
    Hours INT NOT NULL,

    PRIMARY KEY (Essn, Pno),
    FOREIGN KEY (Essn) REFERENCES Company.EMPLOYEE(Ssn),
    FOREIGN KEY (Pno) REFERENCES Company.PROJECT(Pnumber),
)

CREATE TABLE Company.DEPENDENT(
    Essn INT NOT NULL,
    Dependent_name VARCHAR(30) NOT NULL,
    Sex CHAR(1) NOT NULL,
    Bdate DATE NOT NULL,
    Relationship VARCHAR(30) NOT NULL,

    PRIMARY KEY(Essn, Dependent_name),
    FOREIGN KEY(Essn) REFERENCES Company.EMPLOYEE(Ssn),
)