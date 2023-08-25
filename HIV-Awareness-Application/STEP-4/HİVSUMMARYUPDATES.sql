CREATE OR REPLACE VIEW hiv_summary AS 
SELECT c.ISOYEAR, 
       COALESCE(hed.total_knowledge_rate, null) AS total_knowledge_rate,
       COALESCE(hd.death_num, null) AS death_num,
       COALESCE(hf.total_funding, null) AS total_funding,
       COALESCE(hc.woman_ratio, null) AS woman_ratio,
       CONCAT(LEFT(c.ISOYEAR, LENGTH(c.ISOYEAR) - 4)) AS isocodes,
	   CONCAT( RIGHT(c.ISOYEAR, 4)) AS years

FROM countries c 
LEFT JOIN HIV_education hed ON c.ISOYEAR = hed.ISOYEAR 
LEFT JOIN HIV_death hd ON c.ISOYEAR = hd.ISOYEAR 
LEFT JOIN HIV_funding hf ON c.ISOYEAR = hf.ISOYEAR 
LEFT JOIN HIV_cases hc ON c.ISOYEAR = hc.ISOYEAR 
ORDER BY c.ISOYEAR;
