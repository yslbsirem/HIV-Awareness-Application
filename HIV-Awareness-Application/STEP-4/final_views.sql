CREATE VIEW TopFunding AS
SELECT ft.ISOYEAR, ft.total_funding, dn.death_num
FROM funding_top ft
JOIN  HIV_death dn ON ft.ISOYEAR = dn.ISOYEAR;

CREATE VIEW AverageFunding AS
SELECT fa.ISOYEAR, fa.total_funding, dn.death_num
FROM funding_average fa
JOIN  HIV_death dn ON fa.ISOYEAR = dn.ISOYEAR;


