-- LeetCode 577: Employee Bonus
-- Pattern: LEFT JOIN + NULL handling
-- Why: employees with no bonus row must still appear, so Employee goes on the
--      left of a LEFT JOIN.
-- Watch out: NULL < 1000 is unknown, not true, so WHERE drops NULL rows.
--      Keep them explicitly with IS NULL.
--      Don't move the bonus check into ON: employees with big bonuses would
--      then survive with NULL.

SELECT e.name, b.bonus
FROM Employee e
LEFT JOIN Bonus b
    ON e.empId = b.empId
WHERE b.bonus < 1000 OR b.bonus IS NULL;

-- Alternative: treat "no bonus" as 0 before comparing
-- WHERE COALESCE(b.bonus, 0) < 1000;

-- can use COALESCE as well to treat NULL as 0, but the first version is more explicit about the intent.