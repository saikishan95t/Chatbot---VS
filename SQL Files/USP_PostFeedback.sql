USE [iPPiChatbot]
GO
/****** Object:  StoredProcedure [usr].[usp_PostUserQuery]    Script Date: 25-08-2020 23:03:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sai Kishan Thukkaram
-- Create date: August 21st, 2020
-- Description:	posting user feedback
-- =============================================
CREATE PROCEDURE [usr].[usp_PostFeedback]
	@feedback		usr.UserDetails READONLY,
	@ReturnStatus	INT OUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @rating			NVARCHAR(200)
	DECLARE @comments		NVARCHAR(200)
	DECLARE @queRating		NVARCHAR(50)
	DECLARE @queComments	NVARCHAR(50)

	SET @queRating = 'QUE_FEEDBACK'
	SET @queComments = 'QUE_COMMENTS'
	SET @ReturnStatus = 0

	SELECT @rating = answer 
	FROM @feedback
	WHERE questionKey = @queRating

	SELECT @comments = answer
	FROM @feedback
	WHERE questionKey = @queComments
	
	BEGIN TRANSACTION

		INSERT INTO usr.UserFeedback
		(
			userRating,
			userComments
		)
		VALUES
		(
			@rating,
			@comments
		)

	COMMIT TRANSACTION

	RETURN @ReturnStatus

END
