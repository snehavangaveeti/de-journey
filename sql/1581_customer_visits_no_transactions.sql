-- LeetCode 1581: Customer Who Visited but Did Not Make Any Transactions
-- Pattern: anti-join (LEFT JOIN ... WHERE right side IS NULL)
-- Why: LEFT JOIN keeps every visit; visits with no transaction get NULLs on the
--      Transactions side. Filtering for NULL leaves only those visits, then
--      count them per customer.

SELECT v.customer_id, COUNT(*) AS count_no_trans
FROM Visits v
LEFT JOIN Transactions t
    ON v.visit_id = t.visit_id
WHERE t.transaction_id IS NULL
GROUP BY v.customer_id;