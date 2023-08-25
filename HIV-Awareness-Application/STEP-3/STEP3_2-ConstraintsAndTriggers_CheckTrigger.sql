SELECT MIN(death_num), MAX(death_num) FROM hiv_death;

ALTER TABLE HIV_death
ADD CONSTRAINT dtc
CHECK(death_num >= 0 AND
      death_num <= 1844490);
      
-- Create a "before insert" trigger
DELIMITER $$
CREATE TRIGGER trg_HIV_death_before_insert
BEFORE INSERT ON HIV_death
FOR EACH ROW
BEGIN
    IF NEW.death_num < 0 THEN
        SET NEW.death_num = 0;
    ELSEIF NEW.death_num > 1844490 THEN
        SET NEW.death_num = 1844490;
    END IF;
END$$
DELIMITER ;

-- Create a "before update" trigger
DELIMITER $$
CREATE TRIGGER trg_HIV_death_before_update
BEFORE UPDATE ON HIV_death
FOR EACH ROW
BEGIN
    IF NEW.death_num < 0 THEN
        SET NEW.death_num = 0;
    ELSEIF NEW.death_num > 1844490 THEN
        SET NEW.death_num = 1844490;
    END IF;
END$$
DELIMITER ;