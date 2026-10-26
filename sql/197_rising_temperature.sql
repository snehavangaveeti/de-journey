-- LeetCode 197: Rising Temperature
-- Pattern: self-join
-- Why: use the same table twice so each day sits on one line next to the
--      day before it; then it's a normal column comparison.
-- Watch out: join on dates, not id = id - 1 (ids may not follow date order).
--      INTERVAL '1 day' is Postgres; MySQL uses INTERVAL 1 DAY or DATEDIFF(a, b) = 1.

SELECT w1.id
FROM Weather w1                -- w1 = today
JOIN Weather w2                -- w2 = yesterday
    ON w1.recordDate = w2.recordDate + INTERVAL '1 day'
WHERE w1.temperature > w2.temperature;