INSERT INTO `<UACMS>`.`Player` (Defence, Shooting, Pace, Position, Rating, Physical, Market_Value, PID, Health_Stat) 
SELECT 
    FLOOR(RAND() * 100) + 1 as Defence,
    FLOOR(RAND() * 100) + 1 as Shooting,
    FLOOR(RAND() * 100) + 1 as Pace,
    CASE 
        WHEN FLOOR(RAND() * 2) = 0 THEN 'Forward'
        ELSE 'Midfielder'
    END as Position,
    FLOOR(RAND() * 100) + 1 as Rating,
    FLOOR(RAND() * 100) + 1 as Physical,
    FLOOR(RAND() * 1000000) + 500000 as Market_Value,
    PD.PID,
    FLOOR(RAND() * 100) + 1 as Health_Stat
FROM `<UACMS>`.`Personal_Details` PD
WHERE PD.Club_ID BETWEEN 16 AND 25
LIMIT 150;
