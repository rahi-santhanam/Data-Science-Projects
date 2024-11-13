-- use the created database --
USE mysql_project;

-- see the created tables --
SHOW TABLES;

-- 1. Retrieve all patients who are older than 30 years. --
SELECT * FROM Patients WHERE Age > 30;

-- 2. Find all female patients from the Patients table. --
SELECT * FROM Patients WHERE Gender = 'Female';

-- 3. Retrieve the names of all doctors who specialize in "Cardiology." --
SELECT Doc_Name FROM Doctors WHERE Specialty  = 'Cardiology';

-- 4. Retrieve the list of patients whose contact number ends with '4'. --
SELECT * FROM Patients WHERE Contact_no LIKE '%4';

-- 5. Find all appointments where the Apt_Date is after '2024-09-29.' --
SELECT * FROM Appointments WHERE DATE(Apt_Date) > '2024-09-29';

-- 6. Write a query to retrieve all patients whose email address contains 'example.com.' --
SELECT * FROM Patients WHERE Email LIKE '%example.com%';

-- 7. Retrieve all patients and sort them by their Patient_Name in ascending order. --
SELECT * FROM Patients ORDER BY Patient_Name ASC;

-- 8. Write a query to find all doctors and sort them by their Specialty in descending order. --
SELECT * FROM Doctors ORDER BY Specialty DESC;

-- 9. Write a query to retrieve all patients whose email address starts with 'ian.' --
SELECT * FROM Patients WHERE Email LIKE 'ian%';