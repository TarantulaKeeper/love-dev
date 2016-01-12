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
Bio VARCHAR(500) NOT NULL
)

INSERT INTO tbUser(FirstName, LastName, Password, Age, City, Country, Email, IsActive, IsAdmin, UserPhoto, GenderID, Bio)
	VALUES 
		('Nikolai', 'Pastulovic', '1234', 20, 'Winnipeg', 'Canada', 'niko.pastulovic@robertsoncollege.net', 1, 1, 'Images/NoPhoto.jpg', 1,''),
		('T.J.', 'Petrowski', '1234', 24, 'Warren', 'Canada', 't.j.petrowski@robertsoncollege.net', 1, 1, 'Images/NoPhoto.jpg', 1,''),
		('Chris', 'Jeffrey', '1234', 21, 'Winnipeg', 'Canada', 'chris.jeffrey@robertsoncollege.net', 1, 1, 'Images/NoPhoto.jpg', 1,''),
		('Joseph', 'Maglalang', '1234', 30, 'Winnipeg', 'Canada', 'joseph.maglalang@robertsoncollege.net', 1, 1, 'Images/NoPhoto.jpg', 6,'')

-- TABLE FOR SEXUAL ORIENTATION 

CREATE TABLE tbSexualOrientation(
SexualOrientationID INT PRIMARY KEY IDENTITY (1,1),
UserID INT FOREIGN KEY REFERENCES tbUser(UserID),
GenderID INT FOREIGN KEY REFERENCES tbGender(GenderID)
)
INSERT INTO tbSexualOrientation (UserID, GenderID) VALUES (1,1),(1,2),(2,3),(3,1),(3,3),(3,5),(3,4),(4,1),(4,3)

--INSERT INTO tbSexualOrientation(SexualOrientationName) VALUES ('Straight'), ('Gay'), ('Lesbian'), ('Asexual'),
	--('Pansexual'), ('Bisexual'), ('Sapiosexual'), ('Heteroflexible'), ('Homoflexible')

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
INSERT INTO tbMatches (UserID, OtherUserID) VALUES (2,3)
INSERT INTO tbMatches (UserID, OtherUserID) VALUES (3, 1)

-- TABLE FOR QUESTIONS

CREATE TABLE tbQuestionsForQuiz(
QuestionID INT PRIMARY KEY IDENTITY(1,1),
QuestionCategoryID  INT FOREIGN KEY REFERENCES tbQuestionCategory(QuestionCategoryID),
QuestionString VARCHAR(250)
)
INSERT INTO tbQuestionsForQuiz(QuestionCategoryID, QuestionString) VALUES 
--[POLITICS SECTION]
(1, 'Do you enjoy politics?'), (1, 'Do you follow politics?'),
(1, 'Do you actively participate in politics?'), (1, 'Do you vote?'),
(1, 'Do you think Abortion should be legal?'), (1, 'Do you think Euthanasia should be legal?'),
(1, 'Do you think you should be politcally correct at all times?'),
(1, 'Do you support same sex marriage?'), (1, 'Do you feel the bern? #Bernie2016'),
(1, 'How important is Politics to your matchmaking results?'),
--[PERSONALITY SECTION]
(2, 'Are you a talkative person?'), (2, 'Do you attend parties?'),
(2, 'Do you enjoy being with people opposed to being alone?'),
(2, 'Do you find it easy to introduce yourself for the first time?'),
(2, 'Do you initiate conversations?'), (2, 'Do you enjoy being the center of attention?'), 
(2, 'Are you cool headed?'), (2, 'Is it easy for you to relate to others emotions?'),
(2, 'Are you an outgoing person?'), (2, 'How important is Personality to your matchmaking results?'),

--[MUSIC SECTION]
(3, 'Do you listen to music?'), (3, 'Do you listen to music on a daily basis?'),
(3, 'Do you purchase music?'), (3,'Do you attend concerts?'),
 (3, 'Can you play an instrument?'), (3,'Do you feel that music plays an important role in your day?'),
 (3, 'Do you follow music news?'), (3, 'Do you feel music helps you concentrate?'),
 (3, 'How often do you find yourself singing in the shower?'),
 (3, 'How important is Music to your matchmaking results?'),
 --[ATHLETICS SECTION]
 (4, 'Do you enjoy playing sports?'), (4, 'Do you enjoy watching sports?'),
 (4, 'Do you agree with the concept of sports?'), (4, 'How often do you play sports?'),
(4, 'Are sports prominent in your daily life?'), (4, 'Do you keep up with sports news?'),
(4, 'Is exercise a daily activity for you?'),  (4, 'Do you often get together with friends to watch sports games?'),
(4, 'How often are you at the gym?'), (4, 'How important is Sports and Athletics to your match making results?'),
 --[HOBBIES/ART SECTION]
 (5, 'Do you enjoy art?'), (5, 'Do you understand art?'), (5, 'Do you paint/draw in your spare time?'), 
 (5, 'Do you consider yourself a creative person?'), (5, 'Do you keep up with Art culture and news?'), 
 (5, 'Do you feel Art is a staple to society?'), (5, 'Do you express yourself with Art?'),
 (5, 'Do you enjoy photography?'), (5, 'Do you shoot photography?'),
 (5, 'How important is Art to your matchmaking results?'),

 --[INTELLECTUAL SECTION]
 (6, 'Do you enjoy learning?'), (6, 'Do you feel as if you are an intellectual individual?'),
 (6, 'Do you keep up with World events?'), (6, 'Do you feel knowledge is more important than wealth?'),
 (6, 'Do you find yourself always looking to learn?'), (6, 'Do you enjoy being challenged intellectually?'),
 (6, 'Do you enjoy reading?'), (6, 'How often do you find yourself lost in a book?'),
 (6, 'Does a night of intellectual stimulation sound better than a night out?'),
 (6, 'How important is intellect to your match making result?'),

 --[TECHNOLOGIES SECTION]
 (7, 'Do you enjoy playing with technology?'), (7, 'Do you write code?'),
 (7, 'Does your family come to you for technology help?'), (7, 'Do you play video games?'),
 (7, 'Do you feel technology plays a vital role in your daily activites?'),
 (7, 'Is technology ESSENTIAL to your life? (Not including job)'),
 (7, 'How often do you find yourself immersed in techonology?'),
 (7, 'Do you follow new Technology releases?'),
 (7, 'How often do you find yourself on social media?'),
 (7, 'How important is Technology to your matchmaking results?')

 go

 -- TABLE FOR MESSAGES

 CREATE TABLE tbMessages(
 MessageID INT PRIMARY KEY IDENTITY(1,1),
 FromUserID INT,
 ToUserID INT,
 Message VARCHAR(MAX),
 DateSent DATE DEFAULT GETDATE()
 )

 GO
 --TABLES FOR REPORTS
CREATE TABLE tbInvalidLogins(
InvalidEmail VARCHAR(50),
InvalidPassword VARCHAR(50),
DateOfAttempt DATETIME,
TimeOfAttempt DATETIME
)
insert into tbInvalidLogins (InvalidEmail, invalidPassword) 
values
 ('TEST','132323'),
 ('ROFLMAO','WRONG'), ('WOWLOTSOFTESTDATA', 'WOW'),
 ('FALLOUT4TODAY', 'WOOOOO')
go




--</Tables>
--<Procedures>
CREATE PROC spGetQuestions
(
@CategoryID int
)
AS BEGIN
	SELECT *
	FROM tbQuestionsForQuiz
	WHERE QuestionCategoryID = @CategoryID
END
GO


CREATE PROC spGetQuestionCategories
AS BEGIN
	SELECT * 
	FROM tbQuestionCategory
END
GO

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
	SELECT UserID, FirstName, LastName, Age, City, Country, Email, tbUser.GenderID, GenderName, IsActive, IsAdmin, UserPhoto, Bio
	FROM   tbUser JOIN tbGender ON tbUser.GenderID = tbGender.GenderID
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
		select UserID, FirstName, LastName, Age, City, Country, Email, GenderID, IsActive, IsAdmin, UserPhoto
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
@GenderID  INT,
@IsActive  BIT =0, --Is not Active by default
@IsAdmin   BIT =0, --Is not Admin by default
@UserPhoto VARCHAR(250) ='Images/NoPhoto.jpg', --Sets photo to default photo if one is not provided
@Bio VARCHAR(250) = NULL,
@Guid VARCHAR(50)
)
AS BEGIN
	INSERT INTO tbUser (FirstName,LastName,Password,Age,City,Country,Email,GenderID,IsActive,IsAdmin,UserPhoto, Bio) VALUES
					   (@FirstName,@LastName,@Password,@Age,@City,@Country,@Email,@GenderID,@IsActive,@IsAdmin,@UserPhoto, ISNULL(@Bio, ''))
	SELECT SCOPE_IDENTITY()
	INSERT INTO tbUserGuid (UserID, Guid) VALUES
						(SCOPE_IDENTITY(),@Guid)
END
GO

CREATE PROC spAddSexualOrientation
(
@UserID INT,
@GenderID INT
)
AS BEGIN
	INSERT INTO tbSexualOrientation (UserID, GenderID) VALUES (@UserID, @GenderID)
END
GO

CREATE PROC spGetGenders
AS BEGIN
	SELECT * 
	FROM tbGender
END
GO

CREATE PROC spGetSexualPreferences
(
@UserID INT
)
AS BEGIN
	SELECT GenderID
	FROM tbSexualOrientation
	WHERE UserID = @UserID
END
GO

CREATE PROC spGetUserGeneralInterests
(@UserID int)
AS BEGIN
	SELECT UserCategoryValue as [generalInterests]
	FROM tbUserValues
	WHERE UserID = @UserID
END
GO

CREATE PROC spGetUserSexualityAndGender
(
@UserID int
)
AS BEGIN
	SELECT U.GenderID, S.GenderID as 'PreferenceID'
	FROM   tbUser U join
		   tbSexualOrientation S on U.UserID = S.UserID
	WHERE  U.UserID = @UserID
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
	IF EXISTS (SELECT * FROM tbMessages WHERE ToUserID = @UserID)
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
	WHERE UserID != @UserID
	GROUP BY UserID, FirstName
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

-- PROCEDURE FOR GETTING MATCHES BASED ON USER ID

CREATE PROCEDURE spGetMatchesForThisUserID(
@UserID INT
)

AS BEGIN
	
	SELECT tbUser.FirstName, tbUser.UserID, tbUser.UserPhoto, GenderName FROM tbMatches 
		JOIN tbUser ON tbMatches.OtherUserID = tbUser.UserID
		JOIN tbGender ON tbUser.GenderID = tbGender.GenderID	
	WHERE tbMatches.UserID = @UserID
		
END
GO

--REPORTS AND PROCEDURES FOR REPORT CREATION.
CREATE PROC	 spInsertIntoInvalidLogin
(
@InvalidEmail VARCHAR(50),
@InvalidPassword VARCHAR(50)
)
AS BEGIN

INSERT INTO tbInvalidLogins (InvalidEmail, InvalidPassword, DateOfAttempt, TimeOfAttempt)
VALUES (@InvalidEmail, @InvalidPassword, CONVERT(VARCHAR(8),GETDATE(),101), CONVERT(VARCHAR(8),GETDATE(),108))
END
GO

CREATE PROC spGetInvalidUserLogins
AS BEGIN
SELECT * FROM tbInvalidLogins
END
GO

CREATE PROC spGetUsersAndHowMuchTheyveBeenMatched
AS BEGIN
SELECT tbUser.UserID, COUNT(tbMatches.MatchID)
FROM tbMatches
JOIN tbUser ON tbUser.UserID = tbMatches.UserID
GROUP BY tbUser.UserID
END
GO

CREATE PROC spGetNonActiveUsers
AS BEGIN
SELECT tbUser.UserID
FROM tbUser 
WHERE tbUser.IsActive = 0
END
GO

--USER EDITING CONTROLS
CREATE PROC spEditUserData
(@UserID INT,
@FirstName VARCHAR(50),
@LastName VARCHAR(50),
@Age INT,
@City VARCHAR(50),
@Country VARCHAR(50),
@Bio VARCHAR(500)
)
AS BEGIN
	UPDATE tbUser set
		FirstName = @FirstName,
		LastName = @LastName,
		Age = @Age,
		City = @City,
		Country = @Country,
		Bio = @Bio
	WHERE UserID = @UserID
END
GO
CREATE PROC spEditUserProfilePicture(
@UserID INT,
@UserPhoto VARCHAR(250)
)
AS BEGIN
	UPDATE tbUser SET
		UserPhoto = ISNULL(@UserPhoto, UserPhoto)
	WHERE UserID = @UserID
END
GO

--Testing Section--
exec spGetUserGeneralInterests 1
exec spGetUserPersonalityValue 1
select * from tbUser
exec spGetUserByID 3
exec spLogin'chris.jeffrey@robertsoncollege.net',1234
exec spUsernameCheck 'chris.jeffrey@robertsoncollege.net'
select * from tbUserGuid
select * from tbInvalidLogins
select * from tbSexualOrientation
exec spGetMatchesForThisUserID 2
select * from tbUserValues
exec spGetQuestions 2
go
exec spInsertIntoInvalidLogin 'dgnrdnt', 'fgxnrgn'

select * from tbMessages
