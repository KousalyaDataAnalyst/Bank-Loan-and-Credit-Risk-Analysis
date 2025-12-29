CREATE TABLE loan_applications (
    loan_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    age INT,
    gender VARCHAR(10),
    employment_type VARCHAR(20),
    annual_income INT,
    credit_score INT,
    loan_amount INT,
    loan_status VARCHAR(10)   -- Approved / Rejected
);

truncate table loan_applications;

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
(10, 'Pooja', 27, 'Female', 'Salaried', 260000, 580, 200000, 'Rejected'),
(11, 'Kiran', 39, 'Male', 'Salaried', 480000, 690, 350000, 'Approved'),
(12, 'Divya', 34, 'Female', 'Self-Employed', 370000, 640, 300000, 'Rejected'),
(13, 'Manoj', 50, 'Male', 'Self-Employed', 950000, 820, 600000, 'Approved'),
(14, 'Asha', 29, 'Female', 'Salaried', 310000, 660, 220000, 'Approved'),
(15, 'Ramesh', 42, 'Male', 'Salaried', 520000, 705, 400000, 'Approved'),
(16, 'Neha', 26, 'Female', 'Salaried', 240000, 570, 180000, 'Rejected'),
(17, 'Sanjay', 36, 'Male', 'Self-Employed', 620000, 710, 380000, 'Approved'),
(18, 'Kavitha', 33, 'Female', 'Salaried', 460000, 695, 320000, 'Approved'),
(19, 'Prakash', 48, 'Male', 'Self-Employed', 720000, 735, 500000, 'Approved'),
(20, 'Anjali', 30, 'Female', 'Salaried', 290000, 610, 210000, 'Rejected'),
(21, 'Deepak', 41, 'Male', 'Salaried', 580000, 750, 420000, 'Approved'),
(22, 'Megha', 35, 'Female', 'Self-Employed', 400000, 665, 300000, 'Rejected'),
(23, 'Nitin', 27, 'Male', 'Salaried', 330000, 680, 260000, 'Approved'),
(24, 'Swathi', 38, 'Female', 'Salaried', 610000, 740, 450000, 'Approved'),
(25, 'Harish', 44, 'Male', 'Self-Employed', 850000, 790, 550000, 'Approved');

SELECT COUNT(*) FROM loan_applications;

SELECT loan_status, COUNT(*) AS count
FROM loan_applications
GROUP BY loan_status;

SELECT loan_status,
AVG(credit_score) AS avg_credit_score
FROM loan_applications
GROUP BY loan_status;

SELECT employment_type,
COUNT(*) AS total_applications,
SUM(CASE WHEN loan_status = 'Approved' THEN 1 ELSE 0 END) AS approved_loans
FROM loan_applications
GROUP BY employment_type;

SELECT
CASE
    WHEN annual_income < 300000 THEN 'Low Income'
    WHEN annual_income BETWEEN 300000 AND 600000 THEN 'Middle Income'
    ELSE 'High Income'
END AS income_band,
COUNT(*) AS total_customers
FROM loan_applications
GROUP BY income_band;

SELECT customer_name, loan_amount
FROM loan_applications
WHERE loan_amount >
(SELECT AVG(loan_amount) FROM loan_applications);

SELECT
ROUND(
(SUM(CASE WHEN loan_status = 'Approved' THEN 1 ELSE 0 END) / COUNT(*)) * 100, 2
) AS approval_rate_percentage
FROM loan_applications;

SELECT credit_score, loan_status
FROM loan_applications
ORDER BY credit_score DESC;

select * from loan_applications;
