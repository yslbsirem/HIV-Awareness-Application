CREATE VIEW funding_top AS
SELECT *
FROM (
    SELECT *
    FROM highfunding
    WHERE total_funding > 0
    ORDER BY total_funding DESC
    LIMIT 5
) AS top_highfunding;

CREATE VIEW funding_average AS
SELECT *
FROM (
    SELECT *
    FROM lowfunding
    WHERE total_funding > 0
    ORDER BY total_funding DESC
    LIMIT 5
) AS bottom_lowfunding;






