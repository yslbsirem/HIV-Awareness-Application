SELECT C.ISOYEAR, D.death_num
FROM countries C, HIV_death D
WHERE D.death_num > 12000;

CREATE VIEW highDeath (ISOYEAR, death_num)
AS SELECT D.ISOYEAR, D.death_num
FROM  HIV_death D
WHERE D.death_num > 12000;

SELECT C.ISOYEAR, D.death_num
FROM countries C, HIV_death D
WHERE D.death_num < 12000;

CREATE VIEW lowDeath (ISOYEAR, death_num)
AS SELECT D.ISOYEAR, D.death_num
FROM  HIV_death D
WHERE D.death_num < 12000;

SELECT C.ISOYEAR, C.woman_ratio
FROM  HIV_cases C
WHERE C.woman_ratio > 55;

CREATE VIEW highWomanDeath(ISOYEAR, woman_ratio)
AS SELECT D.ISOYEAR, D.woman_ratio
FROM  HIV_cases D
WHERE D.woman_ratio > 55;

SELECT C.ISOYEAR, C.woman_ratio
FROM  HIV_cases C
WHERE C.woman_ratio < 55;

CREATE VIEW lowWomanDeath(ISOYEAR, woman_ratio)
AS SELECT D.ISOYEAR, D.woman_ratio
FROM  HIV_cases D
WHERE D.woman_ratio < 55;

SELECT E.ISOYEAR, E.total_knowledge_rate
FROM  HIV_education E
WHERE E.total_knowledge_rate < 33;

CREATE VIEW lowEducation (ISOYEAR, total_knowledge_rate)
AS SELECT E.ISOYEAR, E.total_knowledge_rate
FROM  HIV_education E
WHERE E.total_knowledge_rate < 33;

SELECT E.ISOYEAR, E.total_knowledge_rate
FROM  HIV_education E
WHERE E.total_knowledge_rate > 33;

CREATE VIEW highEducation (ISOYEAR, total_knowledge_rate)
AS SELECT E.ISOYEAR, E.total_knowledge_rate
FROM  HIV_education E
WHERE E.total_knowledge_rate > 33;

SELECT F.ISOYEAR, F.total_funding
FROM HIV_funding F
WHERE F.total_funding > 77185666;

CREATE VIEW highFunding (ISOYEAR, total_funding)
AS SELECT F.ISOYEAR, F.total_funding
FROM  HIV_funding F
WHERE F.total_funding > 77185666;

SELECT F.ISOYEAR, F.total_funding
FROM HIV_funding F
WHERE F.total_funding < 77185666;

CREATE VIEW lowFunding (ISOYEAR, total_funding)
AS SELECT F.ISOYEAR, F.total_funding
FROM  HIV_funding F
WHERE F.total_funding < 77185666;
