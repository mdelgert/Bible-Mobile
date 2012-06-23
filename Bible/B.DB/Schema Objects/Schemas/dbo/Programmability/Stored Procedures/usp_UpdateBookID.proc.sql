

-- =============================================
-- Author:		Matthew Elgert
-- Create date: 11/15/2011
-- Alter date:  11/20/2011
-- Description:	
-- EXEC [dbo].[usp_UpdateBookID]
-- =============================================

CREATE PROCEDURE [dbo].[usp_UpdateBookID]

AS

  BEGIN

      SET NOCOUNT ON;

      DECLARE @counter INT
      DECLARE @count INT
      DECLARE @BookID INT
      DECLARE @Book VARCHAR(100)

      SELECT @count = COUNT(*)
      FROM   [Bible].[dbo].[VersesYLT] (NOLOCK)

      SET @counter = 1

      WHILE @counter <= @count
      
        BEGIN
        
            SELECT @Book = [Book]
            FROM   [Bible].[dbo].[VersesYLT](NOLOCK)
            WHERE  [RecID] = @counter

            SELECT @BookID = [BookID]
            FROM   [Bible].[dbo].[Books] (NOLOCK)
            WHERE  [Book] = @Book

            UPDATE [Bible].[dbo].[VersesYLT]
            SET    [BookID] = @BookID
            WHERE  [RecID] = @counter

            SET @counter = @counter + 1
            
        END
        
  END