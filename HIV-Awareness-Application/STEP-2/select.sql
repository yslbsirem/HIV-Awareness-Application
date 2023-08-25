SET FOREIGN_KEY_CHECKS = 0;
SELECT * FROM 306_step2.annual;
SELECT * FROM 306_step2.expend;
SELECT * FROM 306_step2.woman;
SELECT * FROM 306_step2.knowledge;

SELECT * FROM 306_step2.countries;
SELECT * FROM 306_step2.HIV_death;
SELECT * FROM 306_step2.HIV_education;
SELECT * FROM 306_step2.HIV_cases;
SELECT * FROM 306_step2.HIV_funding;

 

INSERT INTO countries (country_name, ISOYEAR )
SELECT country_name, ISOYEAR
FROM annual;



INSERT INTO HIV_education (dyear, total_knowledge_rate, ISOYEAR )
SELECT dyear, total_knowledge_rate, ISOYEAR 
FROM knowledge;

INSERT INTO HIV_death (dyear, death_num, ISOYEAR )
SELECT dyear, death_num, ISOYEAR
FROM annual;
INSERT INTO HIV_funding (dyear, total_funding, ISOYEAR )
SELECT dyear, total_funding, ISOYEAR
FROM expend;
INSERT INTO HIV_cases (dyear,woman_ratio, ISOYEAR )
SELECT dyear,woman_ratio, ISOYEAR 
FROM woman;


SET FOREIGN_KEY_CHECKS = 1;
