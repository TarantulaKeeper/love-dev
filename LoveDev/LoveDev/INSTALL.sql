﻿USE MASTER;
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
INSERT INTO tbUserValues(UserID, QuestionCategoryID, UserCategoryValue) VALUES (1,1,20),(1,2,25),(1,3,30),(1,4,22),(1,5,11),(1,6,20),(1,7,20),
																			   (3,1,20),(3,2,25),(3,3,30),(3,4,22),(3,5,11),(3,6,20),(3,7,20)

CREATE TABLE tbMatches
(
MatchID INT PRIMARY KEY IDENTITY(1,1),
UserID INT FOREIGN KEY REFERENCES tbUser(UserID),
OtherUserID INT FOREIGN KEY REFERENCES tbUser(UserID)
)
--INSERT INTO tbMatches (UserID, OtherUserID) VALUES (1,3)

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

 -- TABLE FOR MESSAGES

 CREATE TABLE tbMessages(
 MessageID INT PRIMARY KEY IDENTITY(1,1),
 FromUserID INT,
 ToUserID INT,
 Message VARCHAR(MAX),
 DateSent DATE DEFAULT GETDATE(),
 MessageRead BIT
 )

 GO

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
	SELECT * 
	FROM tbGender
END
GO

CREATE PROC spGetSexualOrientations
AS BEGIN
	SELECT * 
	FROM tbSexualOrientation
END
GO

CREATE PROC spGetUserGeneralInterests
(@UserID int)
AS BEGIN
	SELECT tbUserValues.UserCategoryValue as [generalInterests]
	FROM tbUserValues 
	WHERE tbUserValues.UserID = @UserID 
END
GO

CREATE PROC spGetUserSexualityAndGender
(@UserID int)
AS BEGIN
	SELECT tbUser.GenderID, tbUser.SexualOrientationID
	FROM   tbUser 
	WHERE  tbUser.UserID = @UserID
END
GO
CREATE PROC spGetUserPersonalityValue
(@UserID int)
AS BEGIN 
	SELECT tbUserValues.UserCategoryValue 
	FROM   tbUserValues
	WHERE  tbUserValues.UserID = @UserID
	AND    tbUserValues.QuestionCategoryID = 2
END
GO

CREATE PROC spGetAllUsersForMatch
(@UserID int)
AS BEGIN 
	SELECT * 
	FROM tbUser
	WHERE tbUser.UserID != @UserID
END
GO

CREATE PROC spSaveMatch
(
@UserID INT,
@OtherUserID INT
)
AS BEGIN
	INSERT INTO tbMatches (UserID, OtherUserID) VALUES (@UserID, @OtherUserID)
	INSERT INTO tbMatches (UserID, OtherUserID) VALUES (@OtherUserID, @UserID)
END
GO

CREATE PROC spGetAllUsersForMatching
(
@UserID INT
)
AS BEGIN
	SELECT UserID 
	FROM   tbUser
	WHERE  UserID != @UserID
END
GO

CREATE PROC spGetUserIDMatches
(
@UserID int
)
AS BEGIN
	SELECT * 
	FROM  tbMatches
	WHERE UserID = @UserID
END
GO

-- PROCEDURE FOR SENDING A MESSAGE

CREATE PROCEDURE spSendMessage(
@FromUserID INT,
@ToUserID INT,
@Message VARCHAR(MAX)
)

AS BEGIN
	INSERT INTO tbMessages(FromUserID, ToUserID, Message) VALUES (@FromUserID, @ToUserID, @Message)
	SELECT 'Success'
END
GO

-- PROCEDURE TO CHECK FOR NEW, UNREAD MAIL

CREATE PROCEDURE spCheckMail(
@UserID INT
)

AS BEGIN
	IF EXISTS (SELECT * FROM tbMessages WHERE ToUserID = @UserID AND MessageRead = 0)
		BEGIN
			SELECT 'Unread Mail'
		END
	ELSE
		BEGIN
			SELECT 'No Mail'
		END
END
GO

-- PROCEDURE TO GET USERS FOR INBOX

CREATE PROCEDURE spGetUsersForInbox(
@UserID INT
)

AS BEGIN
	SELECT UserID, FirstName FROM tbUser
		JOIN tbMessages ON tbUser.UserID = tbMessages.FromUserID
END
GO

-- PROCEDURE FOR GETTING MESSAGES

CREATE PROCEDURE spGetMessages(
@FromUserID INT,
@ToUserID INT
)

AS BEGIN
	SELECT * FROM tbMessages WHERE (FromUserID = @FromUserID AND ToUserID = @ToUserID) OR
	 (ToUserID = @FromUserID AND FromUserID = @ToUserID) ORDER BY DateSent DESC
END
GO

exec spGetUserGeneralInterests 1
exec spGetUserPersonalityValue 1

select * from tbUser
--Testing Procs
exec spGetUserByID 3
exec spLogin'chris.jeffrey@robertsoncollege.net',1234
exec spUsernameCheck 'chris.jeffrey@robertsoncollege.net'
select * from tbUserGuid