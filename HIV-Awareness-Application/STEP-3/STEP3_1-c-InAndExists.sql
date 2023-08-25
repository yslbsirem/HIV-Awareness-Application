SELECT F.ISOYEAR, F.total_funding, D.death_num
FROM highFunding F, lowDeath D
WHERE F.ISOYEAR = D.ISOYEAR
  AND F.ISOYEAR IN (
    SELECT ISOYEAR
    FROM lowDeath
  );


SELECT F.ISOYEAR, F.total_funding, D.death_num
FROM highFunding F, lowDeath D
WHERE F.ISOYEAR = D.ISOYEAR
  AND EXISTS (
    SELECT S.ISOYEAR
    FROM lowDeath S
    WHERE ISOYEAR = F.ISOYEAR
  ); 