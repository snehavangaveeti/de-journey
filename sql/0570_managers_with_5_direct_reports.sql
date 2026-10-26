-- LeetCode 570: Managers with at Least 5 Direct Reports
-- Pattern: self-join + GROUP BY + HAVING
-- Why: managerId points to another row in the same table. mgr.id = emp.managerId
--      gives one line per (manager, report); group per manager and count the lines.
-- Watch out: group by id AND name, not just name (two managers can share a name).
--      The column that points (managerId) belongs on the employee side.

SELECT mgr.name
FROM Employee mgr
JOIN Employee emp
    ON mgr.id = emp.managerId
GROUP BY mgr.id, mgr.name
HAVING COUNT(*) >= 5;