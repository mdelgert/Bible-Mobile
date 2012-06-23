
-- =============================================
-- Author:		Matthew Elgert
-- Create date: 11/14/2011
-- Alter date:  11/20/2011
-- Description:	Update unique list of Bible books
-- EXEC [dbo].[usp_UpdateBooks]
-- =============================================
CREATE PROCEDURE [dbo].[usp_UpdateBooks]
AS
  BEGIN
      SET NOCOUNT ON;

      DECLARE @counter INT
      DECLARE @count INT
      DECLARE @Book VARCHAR(50)
      DECLARE @NextBook VARCHAR(50)

      SELECT @count = COUNT(*)
      FROM   [Bible].[dbo].[VersesASV] (NOLOCK)

      SET @NextBook = 'NextBook'
      SET @counter = 1

      WHILE @counter <= @count
        BEGIN
            SELECT @Book = Book
            FROM   [Bible].[dbo].[VersesASV] (NOLOCK)
            WHERE  [RecID] = @counter

            IF @Book != @NextBook
              BEGIN
                  PRINT @Book

                  SELECT @NextBook = Book
                  FROM   [Bible].[dbo].[VersesASV] (NOLOCK)
                  WHERE  [RecID] = @counter

                  INSERT INTO [Bible].[dbo].[Books]
                              ([Book],
                               [FriendlyBookURL])
                  VALUES      (@Book,
                               REPLACE(@Book, ' ', '+'))
              END

            SET @counter = @counter + 1
        END
  END