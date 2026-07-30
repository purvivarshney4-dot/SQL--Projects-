-- PhonePe Transaction Analysis
-- Data Analytics SQL Project

CREATE DATABASE phonepe_analysis;
USE phonepe_analysis;

CREATE TABLE transactions (
    transaction_id INT PRIMARY KEY,
    transaction_date DATE,
    state VARCHAR(50),
    transaction_type VARCHAR(50),
    amount DECIMAL(10,2),
    status VARCHAR(20)
);

INSERT INTO transactions VALUES
(1, '2025-01-05', 'Uttar Pradesh', 'UPI Payment', 1200.00, 'Success'),
(2, '2025-01-08', 'Delhi', 'Bill Payment', 850.00, 'Success'),
(3, '2025-01-12', 'Maharashtra', 'Money Transfer', 2500.00, 'Success'),
(4, '2025-01-15', 'Karnataka', 'UPI Payment', 650.00, 'Failed'),
(5, '2025-01-18', 'Uttar Pradesh', 'Money Transfer', 1800.00, 'Success'),
(6, '2025-01-21', 'Delhi', 'UPI Payment', 950.00, 'Success'),
(7, '2025-01-24', 'Maharashtra', 'Bill Payment', 1100.00, 'Failed'),
(8, '2025-01-27', 'Karnataka', 'Money Transfer', 3200.00, 'Success'),
(9, '2025-01-29', 'Uttar Pradesh', 'UPI Payment', 750.00, 'Success'),
(10, '2025-01-31', 'Delhi', 'Money Transfer', 2100.00, 'Success');

-- 1. View all transactions
SELECT * FROM transactions;

-- 2. Total transaction amount
SELECT SUM(amount) AS total_transaction_amount
FROM transactions;

-- 3. Total number of transactions
SELECT COUNT(*) AS total_transactions
FROM transactions;

-- 4. Successful transactions
SELECT *
FROM transactions
WHERE status = 'Success';

-- 5. Total amount by state
SELECT state, SUM(amount) AS total_amount
FROM transactions
GROUP BY state
ORDER BY total_amount DESC;

-- 6. Transaction count by type
SELECT transaction_type, COUNT(*) AS transaction_count
FROM transactions
GROUP BY transaction_type
ORDER BY transaction_count DESC;

-- 7. Average transaction amount
SELECT AVG(amount) AS average_transaction_amount
FROM transactions;

-- 8. Highest transaction
SELECT *
FROM transactions
ORDER BY amount DESC
LIMIT 1;

-- 9. Failed transactions
SELECT *
FROM transactions
WHERE status = 'Failed';

-- 10. Success rate
SELECT
    ROUND(
        SUM(CASE WHEN status = 'Success' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*), 2
    ) AS success_rate_percentage
FROM transactions;
