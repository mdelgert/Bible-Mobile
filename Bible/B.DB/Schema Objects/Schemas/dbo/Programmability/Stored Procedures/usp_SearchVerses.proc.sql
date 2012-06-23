
-- =============================================
-- Author:		Matthew David Elgert
-- Create date: 11/20/2011
-- Alter date:  11/28/2011
-- Description:	Search Verses
-- EXEC dbo.usp_SearchVerses @SearchText='lake of fire', @BibleTypeID=1 
-- =============================================
CREATE PROCEDURE [dbo].[usp_SearchVerses] @SearchText  NVARCHAR(2000),
                                         @BibleTypeID INT = 1
AS
  BEGIN
      SET NOCOUNT ON;

      DECLARE @BibleName NVARCHAR(100)

      IF @BibleTypeID = 1
        BEGIN
            EXEC dbo.usp_GetBibleName
              @BibleTypeID = @BibleTypeID,
              @BibleName = @BibleName OUTPUT

            SELECT [RecID]
                   ,[BookID]
                   ,[Book]
                   ,[Chapter]
                   ,[Verse]
                   ,[VerseText]
                   ,[FriendlyChapterURL]
                   ,[FriendlyVerseURL]
                   ,@BibleName AS [BibleName]
            FROM   [Bible].[dbo].[VersesASV] (NOLOCK)
            WHERE  FREETEXT([VerseText], @SearchText)
        END

      IF @BibleTypeID = 2
        BEGIN
            EXEC dbo.usp_GetBibleName
              @BibleTypeID = @BibleTypeID,
              @BibleName = @BibleName OUTPUT

            SELECT [RecID]
                   ,[BookID]
                   ,[Book]
                   ,[Chapter]
                   ,[Verse]
                   ,[VerseText]
                   ,[FriendlyChapterURL]
                   ,[FriendlyVerseURL]
                   ,@BibleName AS [BibleName]
            FROM   [Bible].[dbo].[VersesBasicEnglish] (NOLOCK)
            WHERE  FREETEXT([VerseText], @SearchText)
        END

      IF @BibleTypeID = 3
        BEGIN
            EXEC dbo.usp_GetBibleName
              @BibleTypeID = @BibleTypeID,
              @BibleName = @BibleName OUTPUT

            SELECT [RecID]
                   ,[BookID]
                   ,[Book]
                   ,[Chapter]
                   ,[Verse]
                   ,[VerseText]
                   ,[FriendlyChapterURL]
                   ,[FriendlyVerseURL]
                   ,@BibleName AS [BibleName]
            FROM   [Bible].[dbo].[VersesDarby] (NOLOCK)
            WHERE  FREETEXT([VerseText], @SearchText)
        END

      IF @BibleTypeID = 4
        BEGIN
            EXEC dbo.usp_GetBibleName
              @BibleTypeID = @BibleTypeID,
              @BibleName = @BibleName OUTPUT

            SELECT [RecID]
                   ,[BookID]
                   ,[Book]
                   ,[Chapter]
                   ,[Verse]
                   ,[VerseText]
                   ,[FriendlyChapterURL]
                   ,[FriendlyVerseURL]
                   ,@BibleName AS [BibleName]
            FROM   [Bible].[dbo].[VersesKJV] (NOLOCK)
            WHERE  FREETEXT([VerseText], @SearchText)
        END

      IF @BibleTypeID = 5
        BEGIN
            EXEC dbo.usp_GetBibleName
              @BibleTypeID = @BibleTypeID,
              @BibleName = @BibleName OUTPUT

            SELECT [RecID]
                   ,[BookID]
                   ,[Book]
                   ,[Chapter]
                   ,[Verse]
                   ,[VerseText]
                   ,[FriendlyChapterURL]
                   ,[FriendlyVerseURL]
                   ,@BibleName AS [BibleName]
            FROM   [Bible].[dbo].[VersesWEB] (NOLOCK)
            WHERE  FREETEXT([VerseText], @SearchText)
        END

      IF @BibleTypeID = 6
        BEGIN
            EXEC dbo.usp_GetBibleName
              @BibleTypeID = @BibleTypeID,
              @BibleName = @BibleName OUTPUT

            SELECT [RecID]
                   ,[BookID]
                   ,[Book]
                   ,[Chapter]
                   ,[Verse]
                   ,[VerseText]
                   ,[FriendlyChapterURL]
                   ,[FriendlyVerseURL]
                   ,@BibleName AS [BibleName]
            FROM   [Bible].[dbo].[VersesWebster] (NOLOCK)
            WHERE  FREETEXT([VerseText], @SearchText)
        END

      IF @BibleTypeID = 7
        BEGIN
            EXEC dbo.usp_GetBibleName
              @BibleTypeID = @BibleTypeID,
              @BibleName = @BibleName OUTPUT

            SELECT [RecID]
                   ,[BookID]
                   ,[Book]
                   ,[Chapter]
                   ,[Verse]
                   ,[VerseText]
                   ,[FriendlyChapterURL]
                   ,[FriendlyVerseURL]
                   ,@BibleName AS [BibleName]
            FROM   [Bible].[dbo].[VersesYLT] (NOLOCK)
            WHERE  FREETEXT([VerseText], @SearchText)
        END
        
  END