USE [iPPiChatbot]
GO

/****** Object:  StoredProcedure [meta].[usp_GetMetaData]    Script Date: 21-08-2020 11:35:34 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Sai Kishan Thukkaram
-- Create date: 08-11-2020
-- Description:	To get all the metadata specific to each conversation window
-- =============================================
CREATE PROCEDURE [meta].[usp_GetMetaData] 
	@ConversationType	NVARCHAR(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @NotDeleted INT
	DECLARE @CourtesiesType VARCHAR(50)

	SET @CourtesiesType = 'COURTESIES'
	SET @NotDeleted = 0

	CREATE TABLE #MetaDataTemp
	(
		conversationKey		NVARCHAR(200),
		questionID			INT,
		questionType		NVARCHAR(200),
		questionKey			NVARCHAR(200),
		questionValue		NVARCHAR(200),
		answerID			INT,
		answerType			NVARCHAR(200),
		answerKey			NVARCHAR(200),
		answerValue			NVARCHAR(4000)
	)

	INSERT INTO #MetaDataTemp
    SELECT 
		CW.conversationKey,
		QU.questionID,
		QU.questionType,
		QU.questionKey,
		QU.questionValue,
		AN.answerID,
		AN.answerType,
		AN.answerKey,
		AN.answerValue
	FROM meta.ConversationWindow CW
	LEFT JOIN meta.Question QU
	ON CW.conversationID = QU.conversationID
	LEFT JOIN meta.Answer AN
	ON QU.questionID = AN.questionID
	WHERE CW.conversationKey = @ConversationType AND CW.isDeleted = @NotDeleted
		AND QU.isDeleted = @NotDeleted AND AN.isDeleted = @NotDeleted

	SELECT * FROM #MetaDataTemp
END
GO


