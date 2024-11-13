-- create database --
CREATE DATABASE mysql_project;

-- see the created database --
SHOW DATABASES;

-- use the created database --
USE mysql_project;

-- create Patients table --
CREATE TABLE Patients (
    PatientID INT AUTO_INCREMENT PRIMARY KEY,
    Patient_Name VARCHAR(255) NOT NULL, 
    Age INT CHECK (Age > 0), 
    Gender VARCHAR(10) NOT NULL CHECK (Gender IN ('Male', 'Female','Other')),
    Contact_no VARCHAR(255) NOT NULL,
    Email VARCHAR(255) UNIQUE NOT NULL 
);

INSERT INTO Patients (Patient_Name, Age, Gender, Contact_no, Email) VALUES
('John Doe', 30, 'Male', '555-1234', 'john.doe@example.com'),
('Jane Smith', 25, 'Female', '555-5678', 'jane.smith@example.com'),
('Alice Johnson', 40, 'Female', '555-8765', 'alice.johnson@example.com'),
('Bob Brown', 55, 'Male', '555-4321', 'bob.brown@example.com'),
('Charlie Davis', 28, 'Male', '555-6789', 'charlie.davis@example.com'),
('Diana Green', 35, 'Female', '555-3456', 'diana.green@example.com'),
('Ethan White', 50, 'Male', '555-9876', 'ethan.white@example.com'),
('Fiona Black', 22, 'Female', '555-6543', 'fiona.black@example.com'),
('George King', 45, 'Male', '555-3210', 'george.king@example.com'),
('Hannah Lee', 60, 'Female', '555-7890', 'hannah.lee@example.com'),
('Ian Wilson', 32, 'Male', '555-1235', 'ian.wilson@example.com'),
('Jasmine Martinez', 27, 'Female', '555-6780', 'jasmine.martinez@example.com'),
('Kyle Scott', 38, 'Male', '555-5432', 'kyle.scott@example.com'),
('Laura Adams', 29, 'Female', '555-7654', 'laura.adams@example.com'),
('Michael Harris', 42, 'Male', '555-8764', 'michael.harris@example.com');

SELECT * FROM Patients;

-- create Doctors table --
CREATE TABLE Doctors (
    Doc_Id INT PRIMARY KEY,
    Doc_Name VARCHAR(255) NOT NULL,
    Specialty VARCHAR(100) NOT NULL
);

INSERT INTO Doctors (Doc_Id, Doc_Name, Specialty) VALUES
(1, 'Dr. Sarah Thompson', 'Cardiology'),
(2, 'Dr. James Miller', 'Neurology'),
(3, 'Dr. Emma Wilson', 'Orthopedics'),
(4, 'Dr. Michael Brown', 'Pediatrics'),
(5, 'Dr. Olivia Johnson', 'Dermatology'),
(6, 'Dr. William Davis', 'Gastroenterology'),
(7, 'Dr. Ava Martinez', 'Endocrinology'),
(8, 'Dr. Daniel Lee', 'Oncology'),
(9, 'Dr. Sophia Clark', 'Ophthalmology'),
(10, 'Dr. Alexander Walker', 'Radiology');

SELECT * FROM Doctors;

-- create Appointments table --
CREATE TABLE Appointments (
    Apt_Id INT PRIMARY KEY,
    PatientID INT NOT NULL,
    Doc_Id INT NOT NULL,
    Apt_Date DATETIME NOT NULL,
    Apt_status VARCHAR(100), 
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (Doc_Id) REFERENCES Doctors(Doc_Id)
);

INSERT INTO Appointments (Apt_Id, PatientID, Doc_Id, Apt_Date, Apt_status) VALUES
(1, 1, 1, '2024-09-20 09:00:00', 'Scheduled'),
(2, 2, 2, '2024-09-21 10:30:00', 'Completed'),
(3, 3, 3, '2024-09-22 14:00:00', 'Scheduled'),
(4, 4, 4, '2024-09-23 11:00:00', 'Canceled'),
(5, 5, 5, '2024-09-24 13:00:00', 'Scheduled'),
(6, 6, 6, '2024-09-25 15:00:00', 'Completed'),
(7, 7, 7, '2024-09-26 16:30:00', 'Scheduled'),
(8, 8, 8, '2024-09-27 09:30:00', 'Canceled'),
(9, 9, 9, '2024-09-28 10:00:00', 'Scheduled'),
(10, 10, 10, '2024-09-29 11:30:00', 'Completed'),
(11, 1, 2, '2024-10-01 12:00:00', 'Scheduled'),
(12, 2, 3, '2024-10-02 13:30:00', 'Canceled'),
(13, 3, 4, '2024-10-03 15:00:00', 'Completed'),
(14, 4, 5, '2024-10-04 16:30:00', 'Scheduled'),
(15, 5, 6, '2024-10-05 17:00:00', 'Completed');

SELECT * FROM Appointments;

-- create Departments table -- 
CREATE TABLE Departments (
    Dept_Id INT PRIMARY KEY,
    Dept_Name VARCHAR(255) NOT NULL,
    Dept_Floor VARCHAR(255) NOT NULL,
    Head_Doc_Id INT, 
    FOREIGN KEY (Head_Doc_Id) REFERENCES Doctors(Doc_Id) 
);

INSERT INTO Departments (Dept_Id, Dept_Name, Dept_Floor) VALUES
(1, 'Emergency', 'Floor 1'),
(2, 'Pediatrics', 'Floor 1'),
(3, 'Orthopedics', 'Floor 2'),
(4, 'Dermatology', 'Floor 2'),
(5, 'Cardiology', 'Floor 3'),
(6, 'Neurology', 'Floor 3'),
(7, 'Gastroenterology', 'Floor 4'),
(8, 'Endocrinology', 'Floor 4'),
(9, 'Oncology', 'Floor 5'),
(10, 'Radiology', 'Floor 5');

SELECT * FROM Departments;

-- create Billing table -- 
CREATE TABLE Billing (
    Bill_Id INT AUTO_INCREMENT PRIMARY KEY,
    PatientID INT NOT NULL,
    Bill_Date DATETIME NOT NULL,
    Total_Amt DECIMAL(10, 2) NOT NULL,
    Pay_Status VARCHAR(50) NOT NULL CHECK (Pay_Status IN ('Paid', 'Pending', 'Overdue')),
    Pay_Method VARCHAR(50) CHECK (Pay_Method IN ('Cash', 'Credit Card', 'Insurance', 'Bank Transfer')),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID) 
);

INSERT INTO Billing (PatientID, Bill_Date, Total_Amt, Pay_Status, Pay_Method)
VALUES (1, '2024-10-01 10:00:00', 1200.00, 'Paid', 'Cash'),
       (2, '2024-10-01 12:30:00', 2500.50, 'Pending', 'Credit Card'),
       (3, '2024-10-02 09:15:00', 1800.75, 'Overdue', 'Bank Transfer'),
       (4, '2024-10-02 14:00:00', 3000.00, 'Paid', 'Insurance'),
       (5, '2024-10-03 11:45:00', 450.00, 'Pending', 'Cash'),
       (6, '2024-10-03 16:30:00', 2200.00, 'Paid', 'Credit Card'),
       (7, '2024-10-04 08:20:00', 500.00, 'Overdue', 'Insurance'),
       (8, '2024-10-04 15:10:00', 750.00, 'Paid', 'Cash'),
       (9, '2024-10-05 13:25:00', 950.50, 'Pending', 'Bank Transfer'),
       (10, '2024-10-05 17:45:00', 4000.00, 'Paid', 'Credit Card'),
       (11, '2024-10-06 09:05:00', 2300.75, 'Overdue', 'Cash'),
       (12, '2024-10-06 12:00:00', 1050.25, 'Pending', 'Insurance'),
       (13, '2024-10-07 14:35:00', 3400.50, 'Paid', 'Bank Transfer'),
       (14, '2024-10-07 18:50:00', 5000.00, 'Overdue', 'Credit Card'),
       (15, '2024-10-08 10:10:00', 1750.00, 'Pending', 'Cash');

-- create Inventory table -- 
CREATE TABLE Inventory (
    Item_Id INT AUTO_INCREMENT PRIMARY KEY,
    Item_name VARCHAR(100) NOT NULL,
    Quantity INT NOT NULL,
    Reorder_level INT NOT NULL,
    Supplier VARCHAR(100),
    Dept_Id INT,
    Bill_Id INT,
    FOREIGN KEY (Dept_Id) REFERENCES Departments(Dept_Id),
    FOREIGN KEY (Bill_Id) REFERENCES Billing(Bill_Id)
);

INSERT INTO Inventory (Item_name, Quantity, Reorder_level, Supplier, Dept_Id, Bill_Id)
VALUES 
    ('Surgical Mask', 500, 100, 'MedSupply Co.', 1, 1),
    ('Antibiotics', 300, 50, 'PharmaCorp', 2, 2),
    ('Orthopedic Braces', 100, 25, 'OrthoEquip Ltd.', 3, 3),
    ('Dermatology Cream', 150, 30, 'DermaCare', 4, 4),
    ('Heart Monitors', 50, 10, 'CardioTech', 5, 5),
    ('Neurology Scans', 70, 20, 'NeuroScan Inc.', 6, 6),
    ('Endoscopy Tools', 40, 10, 'GastroTools', 7, 7),
    ('Insulin Syringes', 200, 50, 'EndoMed', 8, 8),
    ('Chemotherapy Drugs', 120, 30, 'OncoPharma', 9, 9),
    ('X-Ray Films', 100, 20, 'Radiology Supplies Ltd.', 10, 10),
    ('Surgical Gowns', 250, 50, 'MedSupply Co.', 1, 11),
    ('Pediatric Vaccines', 350, 70, 'HealthCare Pharma', 2, 12),
    ('Orthopedic Screws', 80, 20, 'OrthoEquip Ltd.', 3, 13), 
    ('Dermatology Ointment', 170, 40, 'DermaCare', 4, 14),
    ('Cardiac Stents', 30, 5, 'CardioTech', 5, 15);


-- see the created tables --
SHOW TABLES;

      -- ALTER table --
-- Adding new columns in table --
ALTER TABLE Doctors ADD Salary INT;

-- Changing datatype of particular column --
ALTER TABLE Doctors MODIFY Salary DECIMAL(10,2);

-- Updating single value in column --
UPDATE Doctors SET Salary = 150000.00 WHERE Specialty = 'Cardiology';

-- Temporarily disable safe update mode to avoid safe update mode error --
SET SQL_SAFE_UPDATES = 0;      

 -- Turn on safe update mode -- 
 -- SET SQL_SAFE_UPDATES = 1;

-- Updating Head_Doc_Id by using Case Expression --
UPDATE Departments SET
Head_Doc_Id = CASE
WHEN Dept_Id = 1 THEN 1
WHEN Dept_Id = 2 THEN 2
WHEN Dept_Id = 3 THEN 3
WHEN Dept_Id = 4 THEN 4
WHEN Dept_Id = 5 THEN 5
WHEN Dept_Id = 6 THEN 6
WHEN Dept_Id = 7 THEN 7
WHEN Dept_Id = 8 THEN 8
WHEN Dept_Id = 9 THEN 9
WHEN Dept_Id = 10 THEN 10
ELSE Head_Doc_Id
END
WHERE Dept_Id IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10);

           -- STORED PROCEDURE --
-- Creating Stored Procedure for Patients --
DELIMITER //
CREATE PROCEDURE patient_procedure()
BEGIN
    SELECT * FROM Patients;
END //
DELIMITER ;

-- Call stored procedure --
CALL patient_procedure;

-- Creating Stored Procedure for Departments --
DELIMITER //
CREATE PROCEDURE dept_procedure()
BEGIN
    SELECT * FROM Departments;
END //
DELIMITER ;

-- Creating Stored Procedure for Doctors --
DELIMITER //
CREATE PROCEDURE doc_procedure()
BEGIN
    SELECT * FROM Doctors;
END //
DELIMITER ;

-- Creating Stored Procedure for Appointments --
DELIMITER //
CREATE PROCEDURE apt_procedure()
BEGIN
    SELECT * FROM Appointments;
END //
DELIMITER ;

-- Creating Stored Procedure for Billing --
DELIMITER //
CREATE PROCEDURE bill_procedure()
BEGIN
    SELECT * FROM Billing;
END //
DELIMITER ;

	-- CASE Expression --
-- Updating more values using CASE expression --
UPDATE Doctors
SET Salary = CASE
    WHEN Specialty = 'Neurology' THEN 140000.00
    WHEN Specialty = 'Orthopedics' THEN 130000.00
    WHEN Specialty = 'Pediatrics' THEN 120000.00
    WHEN Specialty = 'Dermatology' THEN 110000.00
    WHEN Specialty = 'Gastroenterology' THEN 145000.00
    WHEN Specialty = 'Endocrinology' THEN 135000.00
    WHEN Specialty = 'Oncology' THEN 155000.00
    WHEN Specialty = 'Ophthalmology' THEN 125000.00
    WHEN Specialty = 'Radiology' THEN 160000.00
    ELSE 100000.00 -- Default salary for any unspecified specialty
END;

-- To see the updated values in table by calling the procedure -- 
CALL doc_procedure;

          -- SELECT Query --
-- Retrieve all patients' names and contact numbers. --
SELECT Patient_Name, Contact_no FROM Patients;

-- Get the names of all departments. --
SELECT Dept_Name FROM Departments;

-- Retrieve all items that need reordering (where quantity is less than reorder level) --
SELECT Item_name, Quantity, Reorder_level FROM Inventory WHERE Quantity < Reorder_level;


          -- NULL --
SELECT Patient_Name, Age, Contact_no FROM Patients WHERE Contact_no IS NULL;

	     -- NOT NULL --
SELECT Patient_Name, Age, Contact_no FROM Patients WHERE Contact_no IS NOT NULL;

          -- WHERE Clause --
--  Find the appointment dates for a specific patient. --
SELECT * FROM Appointments WHERE PatientID = 5;

          -- DISTINCT --
-- Retrieve distinct Appointment dates from the Appointments table --
SELECT DISTINCT Apt_Date FROM Appointments;

          -- LIMIT --
-- Find the doctor with the highest salary --
SELECT * FROM Doctors ORDER BY Salary DESC LIMIT 1;

-- Find the most expensive inventory item based on billing information. --
SELECT inv.Item_name, b.Total_Amt
FROM Inventory inv
JOIN Billing b ON inv.Bill_Id = b.Bill_Id
ORDER BY b.Total_Amt DESC
LIMIT 1;


       -- OR Operator --
-- List doctors who earn less than 100,000 or are in the 'Dermatology' department --
SELECT Doc_Name, Specialty, Salary FROM Doctors WHERE Salary < 100000 OR Specialty = 'Dermatology';

          -- JOINS --
-- List all patients who have an appointment with a specific doctor (e.g., DoctorID = 3). --
SELECT a.PatientID, a.Patient_Name, b.Doc_Id FROM Patients a LEFT JOIN Appointments b ON a.PatientID = b.PatientID WHERE Doc_Id = 3;

-- Find the department and head doctor's name for each department. --
SELECT a.Dept_Name, b.Doc_Name FROM Departments a INNER JOIN Doctors b ON a.Head_Doc_Id = b.Doc_Id;

-- Calculate the total billing amount for each patient and show only patients who have paid in full --
SELECT p.Patient_Name, SUM(b.Total_Amt) AS TotalPaid
FROM Patients p
JOIN Billing b ON p.PatientID = b.PatientID
WHERE b.Pay_Status = 'Paid'
GROUP BY p.PatientID;


          -- BETWEEN Operator --
-- List doctors whose salary is between 130,000 and 180,000 --
SELECT Doc_Name, Specialty, Salary FROM Doctors WHERE Salary BETWEEN 130000 AND 180000;

          -- IN Operator --
-- Retrieve all appointments that are either 'Completed' or 'Canceled' --
SELECT PatientID, Apt_Status FROM Appointments WHERE Apt_Status IN ('Completed' , 'Canceled');

          -- LIKE Operator --
-- Find all doctors whose names start with 'Dr. S' --
SELECT Doc_Name FROM Doctors WHERE Doc_Name LIKE 'Dr. S%';

-- Find all patients whose names contain 'an' as 3rd letter --
SELECT PatientID, Patient_Name FROM Patients WHERE Patient_Name LIKE '__an%';

          -- INDEX --
-- Create index --
CREATE INDEX doc_idx ON Doctors (Doc_Id, Doc_Name);

-- Drop index --
-- DROP INDEX doc_idx ON Doctors; 

          -- AGGREGATE Functions --
-- Calculate the average salary of all doctors --
SELECT AVG(Salary) AS Average_Salary FROM Doctors;

-- Get the count of male patients in the hospital. --
SELECT COUNT(*) AS Male_Patients FROM Patients WHERE Gender = 'Male';

-- Find the next available appointment date for a specific patient --
SELECT MIN(a.Apt_Date) AS NextAppointment
FROM Appointments a
WHERE a.PatientID = 1 AND a.Apt_Date > NOW();


          -- GROUP BY, HAVING Clause --
-- Find the average age of patients for each gender and only show the result for genders where the average age is above 35. --
SELECT Gender, COUNT(Gender), AVG(Age) AS Avg_Age 
FROM Patients GROUP BY Gender HAVING AVG(Age) > 35;

          -- SUBQUERIES --
-- Single-row subquery ( = , > ,<)--
-- Identify the second-highest salary in the Doctors table --
SELECT MAX(Salary) AS Sec_Highest_Salary FROM Doctors 
WHERE Salary = (SELECT MAX(Salary) FROM Doctors);

-- Multiple-row subqueries(IN, ANY, ALL) --
-- Find patients who have appointments with Dr. Michael Brown (DoctorID 4) --
SELECT Patient_Name FROM Patients 
WHERE PatientID IN (SELECT PatientID 
FROM Appointments WHERE Doc_Id = 4);

-- Correlated subqueries --
-- Find patients who haven't booked any appointments yet (using a correlated subquery)--
SELECT a.Patient_Name FROM Patients a WHERE EXISTS (SELECT * FROM Departments WHERE a.PatientID = PatientID);

          -- VIEW --
-- Create view for Appointments --
CREATE VIEW aview AS SELECT Apt_Id, PatientId, Apt_Date, Apt_Status FROM Appointments WHERE Apt_Status = 'Scheduled';

-- Updating view --
CREATE OR REPLACE VIEW aview AS SELECT Apt_Id, PatientId, Apt_Date, Apt_Status,Doc_Id FROM Appointments WHERE Apt_Status = 'Scheduled';

-- See the created view --
SELECT * FROM aview;
-- Dropping view --
-- DROP VIEW aview;

          -- DATETIME --
-- Extracting date and time --
SELECT PatientId, DATE(Apt_Date) AS DATE, 
TIME(Apt_Date) AS TIME FROM Appointments;

-- Add hrs/mins in Apt_Date -- 
SELECT Apt_Date + INTERVAL 2 HOUR FROM Appointments;
SELECT Apt_Date + INTERVAL 30 MINUTE FROM Appointments;

          -- Regexp --
-- Find Emails --
SELECT Patient_Name,Email FROM Patients 
WHERE Email REGEXP '^[a-zA-Z0-9._%+-]+@example\\.com$';

-- Find the Patient whose name starts with 'I' --
SELECT Patient_Name FROM Patients WHERE Patient_Name REGEXP '^I';

        -- PRIVILIGES --
-- Create User --
CREATE USER 'Rahini_Santhanam'@'localhost' IDENTIFIED BY 'rahini';

-- Granting specific priviliges --
GRANT SELECT ON  mysql_project.Doctors TO 'Rahini_Santhanam'@'localhost';

-- Pass on priviliges --
GRANT SELECT ON mysql_project.Doctors  TO 'Rahini_Santhanam'@'localhost' WITH GRANT OPTION;

-- Changing the password --
ALTER USER 'Rahini_Santhanam'@'localhost' IDENTIFIED BY 'rahini123';

-- Revoke statement --
REVOKE SELECT ON mysql_project.Doctors FROM 'Rahini_Santhanam'@'localhost';
  
        -- SAVE --
COMMIT;

      -- DROP --
-- Drop Tables --
-- DROP TABLE Departments;
-- DROP TABLE Patients;
-- DROP TABLE Billing;

       -- DELETE --
-- DELETE TABLE Doctors;