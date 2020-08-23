
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sai Kishan Thukkaram
-- Create date: August 21st, 2020
-- Description:	posting user information
-- =============================================
ALTER PROCEDURE usr.usp_PostUserDetails
	@userDetails	usr.UserDetails READONLY,
	@ReturnStatus	INT OUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @userName		NVARCHAR(200)
	DECLARE @userEmail		NVARCHAR(200)
	DECLARE	@userRole		VARCHAR(20)

	DECLARE @queName		NVARCHAR(50)
	DECLARE @queEmail		NVARCHAR(50)
	DECLARE @queRole		NVARCHAR(50)


	SET @queName = 'QUE_NAME'
	SET @queEmail = 'QUE_EMAIL'
	SET @queRole = 'QUE_PROFESSION'
	SET @ReturnStatus = 0

	SELECT @userName = answer 
	FROM @userDetails
	WHERE questionKey = @queName

	SELECT @userEmail = answer
	FROM @userDetails
	WHERE questionKey = @queEmail

	SELECT @userRole = answer
	FROM @userDetails
	WHERE questionKey = @queRole
	
	BEGIN TRANSACTION

		INSERT INTO usr.UserInfo
		(
			userName,
			userMail,
			userRole
		)
		VALUES
		(
			@userName,
			@userEmail,
			@userRole
		)

	COMMIT TRANSACTION

	RETURN @ReturnStatus

END
GO
