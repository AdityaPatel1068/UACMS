-- Generate a report of the highest paid players from each club and country
SELECT
    PD.Club_ID,
    C.Name AS Club_Name,
    PD.Nationality AS Country,
    MAX(PD.Salary) AS Highest_Salary
FROM
    `<UACMS>`.`Player` PL
JOIN
    `<UACMS>`.`Personal_Details` PD ON PL.PID = PD.PID
JOIN
    `<UACMS>`.`Club` C ON PD.Club_ID = C.Club_ID
GROUP BY
    PD.Club_ID,
    C.Name,
    PD.Nationality;
