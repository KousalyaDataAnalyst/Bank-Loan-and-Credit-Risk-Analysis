Bank Loan & Credit Risk Analysis Project

CREATE DATABASE bank_loan_analysis;
USE bank_loan_analysis;

CREATE TABLE loan_applications (
    loan_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    age INT,
    gender VARCHAR(10),
    employment_type VARCHAR(20),
    annual_income INT,
    credit_score INT,
    loan_amount INT,
    loan_status VARCHAR(10)
);

INSERT INTO loan_applications VALUES
(1, 'Ravi', 32, 'Male', 'Salaried', 600000, 750, 300000, 'Approved'),
(2, 'Anita', 29, 'Female', 'Self-Employed', 450000, 680, 250000, 'Approved'),
(3, 'Suresh', 41, 'Male', 'Salaried', 350000, 620, 400000, 'Rejected'),
(4, 'Meena', 26, 'Female', 'Salaried', 280000, 590, 200000, 'Rejected'),
(5, 'Arun', 38, 'Male', 'Self-Employed', 900000, 810, 500000, 'Approved'),
(6, 'Kavya', 34, 'Female', 'Salaried', 500000, 700, 350000, 'Approved'),
(7, 'Rahul', 28, 'Male', 'Salaried', 420000, 670, 250000, 'Approved'),
(8, 'Sneha', 31, 'Female', 'Salaried', 550000, 720, 300000, 'Approved'),
(9, 'Vikram', 45, 'Male', 'Self-Employed', 800000, 760, 450000, 'Approved'),
(10, 'Pooja', 27, 'Female', 'Salaried', 260000, 580, 200000, 'Rejected');

--View data
SELECT * FROM loan_applications;

-- Loan approval summary
SELECT loan_status, COUNT(*) AS total
FROM loan_applications
GROUP BY loan_status;

-- Credit risk classification
SELECT customer_name, credit_score,
CASE
    WHEN credit_score >= 750 THEN 'Low Risk'
    WHEN credit_score BETWEEN 650 AND 749 THEN 'Medium Risk'
    ELSE 'High Risk'
END AS risk_category
FROM loan_applications;

-- Income band analysis
SELECT
CASE
    WHEN annual_income < 300000 THEN 'Low Income'
    WHEN annual_income BETWEEN 300000 AND 600000 THEN 'Middle Income'
    ELSE 'High Income'
END AS income_band,
COUNT(*) AS customers
FROM loan_applications
GROUP BY income_band;

-- Above average loan amount
SELECT customer_name, loan_amount
FROM loan_applications
WHERE loan_amount >
(SELECT AVG(loan_amount) FROM loan_applications);
