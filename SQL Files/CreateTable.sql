USE iPPiChatbot
GO

CREATE TABLE meta.ConversationWindow
(
	conversationID		INT IDENTITY(10,1),
	conversationKey		VARCHAR(50),
	isDeleted			BIT DEFAULT 0,
	PRIMARY KEY(conversationID)
)


CREATE TABLE meta.Question
(
	questionID			INT IDENTITY(1000,1),
	conversationID		INT,
	questionType		VARCHAR(20),
	questionKey			VARCHAR(50),
	questionValue		NVARCHAR(200),
	isDeleted			BIT DEFAULT 0,
	PRIMARY KEY (questionID),
	FOREIGN KEY (conversationID) REFERENCES meta.ConversationWindow(conversationID)
)

CREATE TABLE meta.Answer
(
	answerID			INT IDENTITY(1000,1),
	questionID			INT,
	answerType			VARCHAR(50),
	answerKey			VARCHAR(50),
	answerValue			NVARCHAR(200),
	isDeleted			BIT DEFAULT 0,
	PRIMARY KEY (answerID),
	FOREIGN KEY (questionID) REFERENCES meta.Question(questionID)
)

CREATE TABLE usr.UserInfo
(
	userID				INT IDENTITY(1000,1),
	userName			NVARCHAR(200),
	userRole			VARCHAR(100),
	userMail			NVARCHAR(200),
	isRegistered		BIT DEFAULT 0,
	isDeleted			BIT DEFAULT 0,
	CreatedDate			DATETIME DEFAULT GETUTCDATE(),
	PRIMARY KEY (userID)
)

CREATE TABLE usr.MissingData
(
	missingDataID		INT IDENTITY(10000,1),
	propertyID			INT,
	propLocation		NVARCHAR(200),
	propType			NVARCHAR(200),
	propBeds			NVARCHAR(10),
	userID				INT NULL,
	isApproved			BIT DEFAULT 0,
	isDeleted			BIT DEFAULT 0,
	CreatedDate			DATETIME DEFAULT GETUTCDATE(),
	PRIMARY KEY (missingDataID)
)

CREATE TABLE usr.PropertyValuation
(
	propertyValuationID		INT IDENTITY(10000,1),
	propLocation			NVARCHAR(200),
	propType				NVARCHAR(200),
	propBeds				NVARCHAR(10),
	propSize				INT NULL,
	landSize				INT NULL,
	estimatedValue			INT,
	userID					INT NULL,
	isDeleted				BIT DEFAULT 0,
	CreatedDate				DATETIME DEFAULT GETUTCDATE(),
	PRIMARY KEY (propertyValuationID)
)
	


----------------------------Type Tables-------------------------

CREATE TYPE usr.UserDetails AS TABLE  
(  
	questionKey			NVARCHAR(200),
	answerType			VARCHAR(100),
	answer				NVARCHAR(200)
) 






	

