INSERT INTO `<UACMS>`.`Injury` (Type, Severity, Recovery_Time, Player_ID) 
SELECT 
    CASE 
        WHEN FLOOR(RAND() * 3) = 0 THEN 'Muscle Strain'
        WHEN FLOOR(RAND() * 3) = 1 THEN 'Sprained Ankle'
        ELSE 'Concussion'
    END as Type,
    CASE 
        WHEN FLOOR(RAND() * 3) = 0 THEN 'Mild'
        WHEN FLOOR(RAND() * 3) = 1 THEN 'Moderate'
        ELSE 'Severe'
    END as Severity,
    FLOOR(RAND() * 30) + 1 as Recovery_Time,
    P.Player_ID
FROM `<UACMS>`.`Player` P
JOIN `<UACMS>`.`Personal_Details` PD ON P.PID = PD.PID
WHERE PD.Club_ID BETWEEN 16 AND 25
LIMIT 50;
