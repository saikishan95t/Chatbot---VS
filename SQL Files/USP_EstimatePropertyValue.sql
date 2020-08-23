SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sai Kishan Thukkaram
-- Create date: August 22, 2020
-- Description:	To post and get estimated value for property
-- =============================================
CREATE PROCEDURE usr.usp_EstimatePropertyValue
	@propertyDetails	usr.UserDetails READONLY,
	@EstimatedValue		INT OUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @propLocation		NVARCHAR(200)
	DECLARE @propType			NVARCHAR(200)
	DECLARE	@propBeds			NVARCHAR(20)
	DECLARE @propSize			INT
	DECLARE @landSize			INT


	DECLARE @queLocation		NVARCHAR(50)
	DECLARE @queType			NVARCHAR(50)
	DECLARE @queBeds			NVARCHAR(50)
	DECLARE @queSize			NVARCHAR(50)
	DECLARE	@queLandSize		NVARCHAR(50)


	SET @queLocation = 'QUE_LOCATION'
	SET @queType = 'QUE_PROP_TYPE'
	SET @queBeds = 'QUE_BEDS'
	SET @queSize = 'QUE_SIZE'
	SET @queLandSize = 'QUE_LAND_SITE'

	SELECT @EstimatedValue = RAND() * 1000000

	SELECT @propLocation = answer 
	FROM @propertyDetails
	WHERE questionKey = @queLocation

	SELECT @propType = answer
	FROM @propertyDetails
	WHERE questionKey = @queType

	SELECT @propBeds = answer
	FROM @propertyDetails
	WHERE questionKey = @queBeds

	SELECT @propSize = answer
	FROM @propertyDetails
	WHERE questionKey = @queSize

	SELECT @landSize = answer
	FROM @propertyDetails
	WHERE questionKey = @queLandSize
	
	BEGIN TRANSACTION

		INSERT INTO usr.PropertyValuation
		(
			propLocation,
			propType,
			propBeds,
			propSize,
			landSize,
			estimatedValue
		)
		VALUES
		(
			@propLocation,
			@propType,
			@propBeds,
			@propSize,
			@landSize,
			@EstimatedValue
		)

	COMMIT TRANSACTION

	RETURN @EstimatedValue
END
GO