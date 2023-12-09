-- Drop the existing stored procedure if it exists
DROP PROCEDURE IF EXISTS GeneratePlayerReport;

-- Create the updated stored procedure
DELIMITER //

CREATE PROCEDURE GeneratePlayerReport(IN MinBudget INT, IN MaxBudget INT)
BEGIN
    -- Debugging: Print input parameters
    SELECT MinBudget AS 'MinBudget', MaxBudget AS 'MaxBudget';

    WITH PlayerContracts AS (
        SELECT
            PD.Club_ID,
            PL.Player_ID,
            PL.Defence,
            PL.Shooting,
            PL.Pace,
            PL.Position,
            PL.Rating,
            PL.Physical,
            PL.Market_Value,
            PD.Fname AS Player_First_Name,
            PD.Lname AS Player_Last_Name,
            PD.Role,
            PD.Salary,
            PD.S_date,
            PD.E_date
        FROM `<UACMS>`.`Player` PL
        JOIN `<UACMS>`.`Personal_Details` PD ON PL.PID = PD.PID
    )

    -- Debugging: Print intermediate results
    SELECT * FROM PlayerContracts;

    -- Debugging: Print date range conditions
    SELECT CURRENT_DATE AS 'Current_Date', DATE_ADD(CURRENT_DATE, INTERVAL 1 YEAR) AS 'One_Year_Later';

    -- Debugging: Print players with contract end dates within the next year
    SELECT
        PC.Club_ID,
        PC.Player_ID,
        PC.Player_First_Name,
        PC.Player_Last_Name,
        PC.E_date
    FROM PlayerContracts PC
    WHERE PC.E_date BETWEEN CURRENT_DATE AND DATE_ADD(CURRENT_DATE, INTERVAL 1 YEAR);

    -- Debugging: Print players within the specified market value range
    SELECT
        PC.Club_ID,
        PC.Player_ID,
        PC.Player_First_Name,
        PC.Player_Last_Name,
        PC.Market_Value
    FROM PlayerContracts PC
    WHERE PC.Market_Value BETWEEN MinBudget AND MaxBudget;

    -- Final query: Select players meeting all conditions
    SELECT
        PC.Club_ID,
        PC.Player_ID,
        PC.Player_First_Name,
        PC.Player_Last_Name,
        PC.Defence,
        PC.Shooting,
        PC.Pace,
        PC.Position,
        PC.Rating,
        PC.Physical,
        PC.Market_Value,
        PC.Role,
        PC.Salary,
        PC.S_date,
        PC.E_date
    FROM PlayerContracts PC
    WHERE PC.E_date BETWEEN CURRENT_DATE AND DATE_ADD(CURRENT_DATE, INTERVAL 1 YEAR)
        AND PC.Market_Value BETWEEN MinBudget AND MaxBudget;
END //

DELIMITER ;
