SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sai Kishan Thukkaram
-- Create date: August 22, 2020
-- Description:	To post missing/erroneous data entered by the user
-- =============================================
ALTER PROCEDURE usr.usp_PostMissingData
	@missingData	usr.UserDetails READONLY,
	@ReturnStatus	INT OUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @propLocation		NVARCHAR(200)
	DECLARE @propType			NVARCHAR(200)
	DECLARE	@propBeds			NVARCHAR(20)
	DECLARE @propID				 INT


	DECLARE @queLocation		NVARCHAR(50)
	DECLARE @queType			NVARCHAR(50)
	DECLARE @queBeds			NVARCHAR(50)


	SET @queLocation = 'QUE_LOCATION'
	SET @queType = 'QUE_PROPERTY_TYPE'
	SET @queBeds = 'QUE_BEDS'
	SET @ReturnStatus = 0

	SELECT @propID = RAND() * 10000

	SELECT @propLocation = answer 
	FROM @missingData
	WHERE questionKey = @queLocation

	SELECT @propType = answer
	FROM @missingData
	WHERE questionKey = @queType

	SELECT @propBeds = answer
	FROM @missingData
	WHERE questionKey = @queBeds
	
	BEGIN TRANSACTION

		INSERT INTO usr.MissingData
		(
			propertyID,
			propLocation,
			propType,
			propBeds
		)
		VALUES
		(
			@propID,
			@propLocation,
			@propType,
			@propBeds
		)

	COMMIT TRANSACTION

	RETURN @ReturnStatus
END
GO