-- LeetCode 1661: Average Time of Process per Machine
-- Pattern: self-join with multiple ON conditions + AVG
-- Why: start and end are on different rows; the self-join puts each process's
--      start next to its end, so end - start is a normal subtraction.
--      Each ON condition removes one kind of wrong pair: other machine,
--      other process, start-start / end-end / end-start.
-- Watch out: with GROUP BY, every SELECT column must be grouped or aggregated.
--      Postgres ROUND(x, 3) needs x::numeric.

SELECT s.machine_id,
       ROUND(AVG(e.timestamp - s.timestamp)::numeric, 3) AS processing_time
FROM Activity s
JOIN Activity e
    ON s.machine_id = e.machine_id
   AND s.process_id = e.process_id
   AND s.activity_type = 'start'
   AND e.activity_type = 'end'
GROUP BY s.machine_id;