SELECT C.woman_ratio, C.ISOYEAR, AVG(E.total_knowledge_rate) AS higherthanavr
FROM HIV_cases C
INNER JOIN HIV_education E ON C.ISOYEAR = E.ISOYEAR
WHERE C.woman_ratio > (SELECT AVG(woman_ratio) FROM HIV_cases)
GROUP BY C.woman_ratio, C.ISOYEAR
HAVING AVG(E.total_knowledge_rate) <(SELECT AVG(total_knowledge_rate) FROM HIV_education);

SELECT c.country_name, COUNT(*) AS yearcount, SUM(f.total_funding) AS totalsum
FROM HIV_funding f
JOIN countries c ON f.ISOYEAR = c.ISOYEAR
GROUP BY c.country_name
HAVING totalsum > AVG(f.total_funding);

SELECT c.country_name, COUNT(*) AS yearcount, SUM(D.death_num) AS totaldeath
,MIN(D.death_num) AS mindeath
,MAX(D.death_num) AS maxdeath
,(MAX(D.death_num) - MIN(D.death_num))/4 AS estimated_std
FROM HIV_death D
JOIN countries c ON D.ISOYEAR = c.ISOYEAR
GROUP BY c.country_name
HAVING totaldeath > AVG(D.death_num);

SELECT  c.country_name, 
       ((MAX(D.death_num) - MIN(D.death_num))/4)AS estimated_std,
       e.total_knowledge_rate 
  FROM HIV_death D
  INNER JOIN countries c
  ON D.ISOYEAR = c.ISOYEAR
  INNER JOIN knowledge e
  ON e.country_name = c.country_name
  GROUP BY c.country_name, e.total_knowledge_rate
  HAVING e.total_knowledge_rate>33;

