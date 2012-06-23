
-- =============================================
-- Author:		Matthew David Elgert
-- Create date: 11/20/2011
-- Alter date:  11/27/2011
-- Description:	Get bible name
-- EXEC dbo.usp_GetBibleName
-- =============================================
CREATE PROCEDURE [dbo].[usp_GetBibleName] @BibleTypeID INT = 1,
                                         @BibleName   NVARCHAR(100) OUTPUT
AS
  BEGIN
      SET NOCOUNT ON;

      SELECT @BibleName = [BibleName]
      FROM   [Bible].[dbo].[BibleType] (NOLOCK)
      WHERE  [RecID] = @BibleTypeID
  END