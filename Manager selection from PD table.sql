INSERT INTO `<UACMS>`.`Manager` (Experience, PID) 
SELECT 
    FLOOR(RAND() * 20) + 1 as Experience,
    PD.PID
FROM `<UACMS>`.`Personal_Details` PD
WHERE PD.Club_ID BETWEEN 16 AND 25
LIMIT 50;
