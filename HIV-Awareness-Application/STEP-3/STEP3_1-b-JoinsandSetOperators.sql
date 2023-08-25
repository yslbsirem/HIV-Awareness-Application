SELECT F.ISOYEAR, L.ISOYEAR, L.death_num, F.total_funding
FROM HIV_death L, HIV_funding F
WHERE F.total_funding > 1844490 AND F.ISOYEAR NOT IN( L.death_num >12000 ) AND (F.ISOYEAR=L.ISOYEAR);

SELECT F.ISOYEAR, L.ISOYEAR, L.death_num, F.total_funding
FROM HIV_death L, HIV_funding F
WHERE F.total_funding > 1844490 AND F.ISOYEAR NOT IN( L.death_num <12000 ) AND (F.ISOYEAR=L.ISOYEAR);


/* OUTER JOIN VERSION
*/
SELECT D.death_num, F.total_funding
FROM HIV_death D LEFT OUTER JOIN HIV_funding F
ON F.ISOYEAR = D.ISOYEAR WHERE F.total_funding > 1844490 AND D.death_num >12000;

SELECT D.death_num, F.total_funding
FROM HIV_death D LEFT OUTER JOIN HIV_funding F
ON F.ISOYEAR = D.ISOYEAR WHERE F.total_funding > 1844490 AND D.death_num <12000;
