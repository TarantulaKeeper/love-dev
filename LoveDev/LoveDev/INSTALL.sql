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

CREATE TABLE tbUserGuid
(
UserGuidID INT PRIMARY KEY IDENTITY(1,1),
UserID INT FOREIGN KEY REFERENCES tbUser(UserID),
Guid varchar(50)
)

-- TABLE FOR QUESTION CATEGORIES

CREATE TABLE tbQuestionCategory(
QuestionCategoryID INT PRIMARY KEY IDENTITY (1,1),
QuestionCategoryName VARCHAR(50)
)

INSERT INTO tbQuestionCategory(QuestionCategoryName) VALUES ('Politics'), ('Personality Type'), ('Music'), 
('Athletics'), ('Hobbies'), ('Intellectual'), ('Technologies')

-- TABLE FOR USER VALUES TO CATEGORY QUESTIONS

CREATE TABLE tbUserValues(
UserValueID INT PRIMARY KEY IDENTITY (1,1),
UserID INT FOREIGN KEY REFERENCES tbUser(UserID),
QuestionCategoryID INT FOREIGN KEY REFERENCES tbQuestionCategory(QuestionCategoryID),
UserCategoryValue INT
)

-- TABLE FOR QUESTIONS

CREATE TABLE tbQuestionsForQuiz(
QuestionID INT PRIMARY KEY IDENTITY(1,1),
QuestionCategoryID  INT FOREIGN KEY REFERENCES tbQuestionCategory(QuestionCategoryID),
QuestionString VARCHAR(250)
)
INSERT INTO tbQuestionsForQuiz(QuestionCategoryID, QuestionString) VALUES 
--[POLITICS SECTION]

--[PERSONALITY SECTION]
(2, 'Are you a talkative person?'), (2, 'Do you attend parties?'),
(2, 'Do you enjoy being with people opposed to being alone?'),
(2, 'Do you find it easy to introduce yourself for the first time?'),
(2, 'Do you tend to respond to messages quickly?'),
(2, 'Do you initiate conversations?'), (2, 'Do you enjoy being the center of attention?'), 
(2, 'Are you cool headed?'), (2, 'Is it easy for you to relate to others emotions?'),
(2, 'Are you an outgoing person?'),

--[MUSIC SECTION]
(3, 'Do you listen to music?'), (3, 'Do you listen to music on a daily basis?'),
(3, 'Do you purchase music?'), (3,'Do you attend concerts?'),
 (3, 'Can you play an instrument?'), (3,'Do you feel that music plays an important role in your day?'),
 (3, 'Do you follow music news?'), (3, 'Do you feel music helps you concentrate?'),
 (3, 'How often do you find yourself singing in the shower?'),
 (3, 'How often does music inspire you to take new heights?'),
 (3, 'How important is Music to your matchmaking results?'),
 --[ATHLETICS SECTION]

 --[HOBBIES SECTION]

 --[INTELLECTUAL SECTION]

 --[TECHNOLOGIES SECTION]
 (7, 'Do you enjoy playing with technology?'), (7, 'Do you write code?'),
 (7, 'Does your family come to you for technology help?'), (7, 'Do you play video games?'),
 (7, 'Do you feel technology plays a vital role in your daily activites?'),
 (7, 'Is technology ESSENTIAL to your life? (Not including job)'),
 (7, 'How often do you find yourself immersed in techonology?'),
 (7, 'Do you follow new Technology releases?'),
 (7, 'How often do you find yourself on social media?'),
 (7, 'How important is Technology to you in terms of Match Making?')

 go
--</Tables>
--<Procedures>

CREATE PROC spVerifyUser
(
@Guid varchar(50)
)
AS BEGIN
	IF EXISTS (SELECT UserGuidID FROM tbUserGuid WHERE Guid = @Guid)
	BEGIN
	DECLARE @UserID int = (SELECT UserID FROM tbUserGuid WHERE Guid = @Guid)
		DELETE FROM tbUserGuid
			   WHERE UserID = @UserID
		UPDATE tbUser SET
			IsActive = 1
		WHERE UserID = @UserID
		SELECT '1'
	END
	ELSE
	BEGIN
		SELECT '0'
	END
END
GO

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
	IF EXISTS (SELECT UserId from tbUser where Email = @Email and Password = @Password)
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
@IsActive  BIT =0, --Is not Active by default
@IsAdmin   BIT =0, --Is not Admin by default
@UserPhoto VARCHAR(250) ='Images/NoPhoto.jpg', --Sets photo to default photo if one is not provided
@GenderID  INT,
@SexualOrientation INT,
@Guid VARCHAR(50)
)
AS BEGIN
	INSERT INTO tbUser (FirstName,LastName,Password,Age,City,Country,Email,IsActive,IsAdmin,UserPhoto,GenderID,SexualOrientationID) VALUES
					   (@FirstName,@LastName,@Password,@Age,@City,@Country,@Email,@IsActive,@IsAdmin,@UserPhoto,@GenderID,@SexualOrientation)
	INSERT INTO tbUserGuid (UserID, Guid) VALUES
						(SCOPE_IDENTITY(),@Guid)
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
select * from tbUserGuid