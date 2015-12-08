USE MASTER;
GO
DROP DATABASE dbLoveDev;
GO
CREATE DATABASE dbLoveDev;
GO
USE dbLoveDev;

-- TABLE FOR GENDERS

CREATE TABLE tbGender(
GenderID INT PRIMARY KEY IDENTITY (1,1),
GenderName VARCHAR(50)
)

INSERT INTO tbGender(GenderName) VALUES ('Man'), ('Woman'), ('BiGender'), ('GenderQueer'), ('Non-Binary'),
	('Two Spirit'), ('Transgender'), ('Transsexual')

-- TABLE FOR SEXUAL ORIENTATION 

CREATE TABLE tbSexualOrientation(
SexualOrientationID INT PRIMARY KEY IDENTITY (1,1),
SexualOrientationName VARCHAR(50)
)

INSERT INTO tbSexualOrientation(SexualOrientationName) VALUES ('Straight'), ('Gay'), ('Lesbian'), ('Asexual'),
	('Pansexual'), ('Bisexual'), ('Sapiosexual'), ('Heteroflexible'), ('Homoflexible')

-- TABLE FOR USERS

CREATE TABLE tbUsers(
UserID INT PRIMARY KEY IDENTITY (1,1),
FirstName VARCHAR(50),
LastName VARCHAR(50),
Age INT,
City VARCHAR(100),
Country VARCHAR(50),
Email VARCHAR(50),
IsActive BIT,
IsAdmin BIT,
UserPhoto VARCHAR(250),
GenderID INT FOREIGN KEY REFERENCES tbGender(GenderID),
SexualOrientationID INT FOREIGN KEY REFERENCES tbSexualOrientation(SexualOrientationID)
)

INSERT INTO tbUsers(FirstName, LastName, Age, City, Country, Email, IsActive, IsAdmin, UserPhoto, GenderID, SexualOrientationID)
	VALUES 
		('Niko', 'Pastulovic', 20, 'Winnipeg', 'Canada', 'niko.pastulovic@robertsoncollege.net', 1, 1, 'NEED A PHOTO', 1, 8),
		('T.J.', 'Petrowski', 24, 'Warren', 'Canada', 't.j.petrowski@robertsoncollege.net', 1, 1, 'NEED A PHOTO', 1, 4),
		('Chris', 'Jeffrey', 21, 'Winnipeg', 'Canada', 'chris.jeffrey@robertsoncollege.net', 1, 1, 'NEED A PHOTO', 5, 5),
		('Joseph', 'Maglalang', 30, 'Winnipeg', 'Canada', 'joseph.maglalang@robertsoncollege.net', 1, 1, 'NEED A PHOTO', 6, 1)

