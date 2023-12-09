CREATE TABLE `<UACMS>`.`Injury` (
    Injury_ID INT AUTO_INCREMENT PRIMARY KEY,
    Type VARCHAR(255) NOT NULL,
    Severity VARCHAR(255) NOT NULL,
    Recovery_Time INT NOT NULL,
    Player_ID INT,
    FOREIGN KEY (Player_ID) REFERENCES `<UACMS>`.`Player`(Player_ID)
);
