USE [iPPiChatbot]
GO
/****** Object:  StoredProcedure [usr].[usp_PostUserQuery]    Script Date: 24-08-2020 19:04:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sai Kishan Thukkaram
-- Create date: August 21st, 2020
-- Description:	posting user query
-- =============================================
CREATE PROCEDURE [usr].[usp_PostUserQuery]
	@userQuery		usr.UserDetails READONLY,
	@ReturnStatus	INT OUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @otherQuery		NVARCHAR(200)
	DECLARE @queQuery		NVARCHAR(50)

	SET @queQuery = 'AS_GREAT_DAY'
	SET @ReturnStatus = 0

	SELECT @otherQuery = answer 
	FROM @userQuery
	WHERE questionKey = @queQuery
	
	BEGIN TRANSACTION

		INSERT INTO usr.UserQuery
		(
			userQueryValue
		)
		VALUES
		(
			@otherQuery
		)

	COMMIT TRANSACTION

	RETURN @ReturnStatus

END
