CREATE DATABASE IF NOT EXISTS `<UACMS>`;
USE `<UACMS>`;

CREATE TABLE IF NOT EXISTS Personal_Details (
    PID INT PRIMARY KEY,
    Sex CHAR(1),
    Fname VARCHAR(255),
    Lname VARCHAR(255),
    DOB DATE,
    Nationality VARCHAR(255),
    Club_ID INT,
    S_date DATE,
    E_date DATE,
    Role VARCHAR(255),
    Salary DECIMAL(10, 2)
);

CREATE TABLE IF NOT EXISTS Player (
    Player_ID INT PRIMARY KEY,
    Defence INT,
    Shooting INT,
    Pace INT,
    Position VARCHAR(255),
    Rating INT,
    Physical DECIMAL(5, 2),
    Market_Value DECIMAL(12, 2),
    PID INT,
    Health_Stat VARCHAR(255)
);
CREATE TABLE IF NOT EXISTS Manager (
    Manager_ID INT PRIMARY KEY,
    Experience INT,
    PID INT
);

CREATE TABLE IF NOT EXISTS Club (
    Club_ID INT PRIMARY KEY,
    Name VARCHAR(255),
    Country VARCHAR(255),
    Division VARCHAR(255)
);
CREATE TABLE IF NOT EXISTS Injury (
    Injury_ID INT PRIMARY KEY,
    Player_ID INT,
    Injury_Date DATE,
    Injury_Description VARCHAR(255)
);
ALTER TABLE Personal_Details
ADD FOREIGN KEY (Club_ID)
REFERENCES Club(Club_ID);

ALTER TABLE Player
ADD FOREIGN KEY (PID)
REFERENCES Personal_Details(PID);

ALTER TABLE Manager
ADD FOREIGN KEY (PID)
REFERENCES Personal_Details(PID);

ALTER TABLE Injury
ADD FOREIGN KEY (Player_ID)
REFERENCES Player(Player_ID);

