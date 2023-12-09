-- Identify potential prime players based on Rating with names of player and manager

WITH BestPlayers AS (
    SELECT 
        C.Country,
        MAX(PL.Rating) AS BestRating
    FROM `<UACMS>`.`Player` PL
    JOIN `<UACMS>`.`Personal_Details` PD ON PL.PID = PD.PID
    JOIN `<UACMS>`.`Club` C ON PD.Club_ID = C.Club_ID
    GROUP BY C.Country
)

SELECT
    C.Country,
    PL.Player_ID,
    PD.Fname AS Player_First_Name,
    PD.Lname AS Player_Last_Name,
    PL.Defence,
    PL.Shooting,
    PL.Pace,
    PL.Position,
    PL.Rating,
    PL.Physical,
    PL.Market_Value,
    Mgr.Fname AS Manager_First_Name,
    Mgr.Lname AS Manager_Last_Name,
    PL.PID
FROM `<UACMS>`.`Player` PL
JOIN `<UACMS>`.`Personal_Details` PD ON PL.PID = PD.PID
JOIN `<UACMS>`.`Club` C ON PD.Club_ID = C.Club_ID
JOIN BestPlayers BP ON C.Country = BP.Country
LEFT JOIN `<UACMS>`.`Manager` M ON PD.PID = M.PID
LEFT JOIN `<UACMS>`.`Personal_Details` Mgr ON M.PID = Mgr.PID
WHERE PL.Rating < BP.BestRating
ORDER BY C.Country, PL.Rating DESC
LIMIT 5;
