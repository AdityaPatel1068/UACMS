SELECT 
    CONCAT(pd.Fname, ' ', pd.Lname) AS 'Full Name', 
    c.Name AS Club_Name,
    COUNT(*) AS Injury_Count,
    MAX(pd.DOB) AS Date_of_birth
FROM 
    Personal_details pd
INNER JOIN 
    player p ON pd.pid = p.pid
INNER JOIN 
    injury i ON i.Player_id = p.Player_id
INNER JOIN 
    Club c ON c.Club_id = pd.Club_id  
WHERE 
    p.rating > 75 AND i.severity = 'MILD'
GROUP BY 
    pd.Fname, pd.Lname, c.Name
ORDER BY 
    Date_of_birth ASC
LIMIT 12;
