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

CREATE TABLE tbUser(
UserID INT PRIMARY KEY IDENTITY (1,1),
FirstName VARCHAR(50) NOT NULL,
LastName VARCHAR(50) NOT NULL,
Password VARCHAR(50) NOT NULL,
Age INT NOT NULL,
City VARCHAR(50) NOT NULL,
Country VARCHAR(50) NOT NULL,
Email VARCHAR(50) NOT NULL,
IsActive BIT NOT NULL,
IsAdmin BIT NOT NULL,
UserPhoto VARCHAR(250) NOT NULL,
GenderID INT FOREIGN KEY REFERENCES tbGender(GenderID) NOT NULL,
SexualOrientationID INT FOREIGN KEY REFERENCES tbSexualOrientation(SexualOrientationID) NOT NULL
)

INSERT INTO tbUser(FirstName, LastName, Password, Age, City, Country, Email, IsActive, IsAdmin, UserPhoto, GenderID, SexualOrientationID)
	VALUES 
		('Niko', 'Pastulovic', '1234', 20, 'Winnipeg', 'Canada', 'niko.pastulovic@robertsoncollege.net', 1, 1, 'Images/NoPhoto.jpg', 1, 8),
		('T.J.', 'Petrowski', '1234', 24, 'Warren', 'Canada', 't.j.petrowski@robertsoncollege.net', 1, 1, 'Images/NoPhoto.jpg', 1, 4),
		('Chris', 'Jeffrey', '1234', 21, 'Winnipeg', 'Canada', 'chris.jeffrey@robertsoncollege.net', 1, 1, 'Images/NoPhoto.jpg', 5, 5),
		('Joseph', 'Maglalang', '1234', 30, 'Winnipeg', 'Canada', 'joseph.maglalang@robertsoncollege.net', 1, 1, 'Images/NoPhoto.jpg', 6, 1)

-- TABLE FOR QUESTION CATEGORIES

CREATE TABLE tbQuestionCategory(
QuestionCategoryID INT PRIMARY KEY IDENTITY (1,1),
QuestionCategoryName VARCHAR(50)
)

INSERT INTO tbQuestionCategory(QuestionCategoryName) VALUES ('Politics'), ('Personality Type'), ('Music'), 
('Athletics'), ('Hobbies'), ('Intellectual')

-- TABLE FOR USER VALUES TO CATEGORY QUESTIONS

CREATE TABLE tbUserValues(
UserValueID INT PRIMARY KEY IDENTITY (1,1),
UserID INT FOREIGN KEY REFERENCES tbUser(UserID),
QuestionCategoryID INT FOREIGN KEY REFERENCES tbQuestionCategory(QuestionCategoryID),
UserCategoryValue INT
)


go
--</Tables>
--<Procedures>

CREATE PROC spGetUserByID
(
@userID INT
)
AS BEGIN
	SELECT UserID, FirstName, LastName, Age, City, Country, Email, IsActive, IsAdmin, UserPhoto, GenderID, SexualOrientationID
	FROM   tbUser
	WHERE  UserID= @userID
END
GO

CREATE PROC spLogin
(
@Email VARCHAR(50),
@Password VARCHAR(50)
)
AS BEGIN
	IF EXISTS (SELECT UserId from tbUser where Email = @Email)
	BEGIN
		select UserID, FirstName, LastName, Age, City, Country, Email, IsActive, IsAdmin, UserPhoto, GenderID, SexualOrientationID
		from   tbUser
		where  Email = @Email
		and    Password = @Password
	END
END
GO

CREATE PROC spUsernameCheck
(
@Email VARCHAR(50)
)
AS BEGIN
	IF EXISTS (SELECT Email FROM tbUser WHERE Email = @Email)
	BEGIN
		SELECT 0
	END
	ELSE
	BEGIN
		SELECT 1
	END
END
GO

CREATE PROC spRegisterUser
(
@FirstName VARCHAR(50),
@LastName  VARCHAR(50),
@Password  VARCHAR(50),
@Age       INT,
@City	   VARCHAR(50),
@Country   VARCHAR(50),
@Email	   VARCHAR(50),
@IsActive  BIT =1, --Is Active by default
@IsAdmin   BIT =0, --Is not Admin by default
@UserPhoto VARCHAR(250) ='Images/NoPhoto.jpg', --Sets photo to default photo if one is not provided
@GenderID  INT,
@SexualOrientation INT
)
AS BEGIN
	INSERT INTO tbUser (FirstName,LastName,Password,Age,City,Country,Email,IsActive,IsAdmin,UserPhoto,GenderID,SexualOrientationID) VALUES
					   (@FirstName,@LastName,@Password,@Age,@City,@Country,@Email,@IsActive,@IsAdmin,@UserPhoto,@GenderID,@SexualOrientation)
END
GO

CREATE PROC spGetGenders
AS BEGIN
	SELECT * FROM tbGender
END
GO

CREATE PROC spGetSexualOrientations
AS BEGIN
	SELECT * FROM tbSexualOrientation
END
GO

select * from tbUser
--Testing Procs
exec spGetUserByID 3
exec spLogin'chris.jeffrey@robertsoncollege.net',1234
exec spUsernameCheck 'chris.jeffrey@robertsoncollege.net'