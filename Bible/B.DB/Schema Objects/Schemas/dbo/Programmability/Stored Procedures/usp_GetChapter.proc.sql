
-- =============================================
-- Author:		Matthew David Elgert
-- Create date: 11/15/2011
-- Alter date:  11/27/2011
-- Description:	
-- EXEC [dbo].[usp_GetChapter] @FriendlyChapterURL='American+Standard+Version+Bible+Hebrews+Chapter+11', @BibleTypeID=1
-- =============================================
CREATE PROCEDURE [dbo].[usp_GetChapter] @FriendlyChapterURL NVARCHAR(100),
                                       @BibleTypeID        INT = 1
AS
  BEGIN
      SET NOCOUNT ON;

      DECLARE @BibleName NVARCHAR(100)
      DECLARE @FriendlyChapter NVARCHAR(100)

      SET @FriendlyChapter = ''

      IF @FriendlyChapter = ''
        BEGIN
            SELECT TOP 1 @FriendlyChapter = FriendlyChapterURL
            FROM   [Bible].[dbo].[VersesASV] (NOLOCK)
            WHERE  [FriendlyChapterURL] = @FriendlyChapterURL

            IF @FriendlyChapter != ''
              BEGIN
                  SET @BibleTypeID = 1
              END
        END

      IF @FriendlyChapter = ''
        BEGIN
            SELECT TOP 1 @FriendlyChapter = FriendlyChapterURL
            FROM   [Bible].[dbo].[VersesBasicEnglish] (NOLOCK)
            WHERE  [FriendlyChapterURL] = @FriendlyChapterURL

            IF @FriendlyChapter != ''
              BEGIN
                  SET @BibleTypeID = 2
              END
        END

      IF @FriendlyChapter = ''
        BEGIN
            SELECT TOP 1 @FriendlyChapter = FriendlyChapterURL
            FROM   [Bible].[dbo].[VersesDarby] (NOLOCK)
            WHERE  [FriendlyChapterURL] = @FriendlyChapterURL

            IF @FriendlyChapter != ''
              BEGIN
                  SET @BibleTypeID = 3
              END
        END

      IF @FriendlyChapter = ''
        BEGIN
            SELECT TOP 1 @FriendlyChapter = FriendlyChapterURL
            FROM   [Bible].[dbo].[VersesKJV] (NOLOCK)
            WHERE  [FriendlyChapterURL] = @FriendlyChapterURL

            IF @FriendlyChapter != ''
              BEGIN
                  SET @BibleTypeID = 4
              END
        END

      IF @FriendlyChapter = ''
        BEGIN
            SELECT TOP 1 @FriendlyChapter = FriendlyChapterURL
            FROM   [Bible].[dbo].[VersesWEB] (NOLOCK)
            WHERE  [FriendlyChapterURL] = @FriendlyChapterURL

            IF @FriendlyChapter != ''
              BEGIN
                  SET @BibleTypeID = 5
              END
        END

      IF @FriendlyChapter = ''
        BEGIN
            SELECT TOP 1 @FriendlyChapter = FriendlyChapterURL
            FROM   [Bible].[dbo].[VersesWebster] (NOLOCK)
            WHERE  [FriendlyChapterURL] = @FriendlyChapterURL

            IF @FriendlyChapter != ''
              BEGIN
                  SET @BibleTypeID = 6
              END
        END

      IF @FriendlyChapter = ''
        BEGIN
            SELECT TOP 1 @FriendlyChapter = FriendlyChapterURL
            FROM   [Bible].[dbo].[VersesYLT] (NOLOCK)
            WHERE  [FriendlyChapterURL] = @FriendlyChapterURL

            IF @FriendlyChapter != ''
              BEGIN
                  SET @BibleTypeID = 7
              END
        END


      --American Standard Version Bible BEGIN
      EXEC dbo.usp_GetBibleName
        @BibleTypeID = @BibleTypeID,
        @BibleName = @BibleName OUTPUT

      IF @BibleTypeID = 1
        BEGIN
            SELECT [RecID]
                   ,[BookID]
                   ,[Book]
                   ,[Chapter]
                   ,[Verse]
                   ,[VerseText]
                   ,[FriendlyChapterURL]
                   ,[FriendlyVerseURL]
                   ,@BibleName AS BibleName
            FROM   [Bible].[dbo].[VersesASV] (NOLOCK)
            WHERE  [FriendlyChapterURL] = @FriendlyChapterURL
        END
      --American Standard Version Bible END
      
      --Bible In Basic English BEGIN
      EXEC dbo.usp_GetBibleName
        @BibleTypeID = @BibleTypeID,
        @BibleName = @BibleName OUTPUT

      IF @BibleTypeID = 2
        BEGIN
            SELECT [RecID]
                   ,[BookID]
                   ,[Book]
                   ,[Chapter]
                   ,[Verse]
                   ,[VerseText]
                   ,[FriendlyChapterURL]
                   ,[FriendlyVerseURL]
                   ,@BibleName AS BibleName
            FROM   [Bible].[dbo].[VersesBasicEnglish] (NOLOCK)
            WHERE  [FriendlyChapterURL] = @FriendlyChapterURL
        END
      --Bible In Basic English END
      
      --Darby Bible BEGIN
      EXEC dbo.usp_GetBibleName
        @BibleTypeID = @BibleTypeID,
        @BibleName = @BibleName OUTPUT

      IF @BibleTypeID = 3
        BEGIN
            SELECT [RecID]
                   ,[BookID]
                   ,[Book]
                   ,[Chapter]
                   ,[Verse]
                   ,[VerseText]
                   ,[FriendlyChapterURL]
                   ,[FriendlyVerseURL]
                   ,@BibleName AS BibleName
            FROM   [Bible].[dbo].[VersesDarby] (NOLOCK)
            WHERE  [FriendlyChapterURL] = @FriendlyChapterURL
        END
      --Darby Bible END
      
      --King James Version BEGIN
      EXEC dbo.usp_GetBibleName
        @BibleTypeID = @BibleTypeID,
        @BibleName = @BibleName OUTPUT

      IF @BibleTypeID = 4
        BEGIN
            SELECT [RecID]
                   ,[BookID]
                   ,[Book]
                   ,[Chapter]
                   ,[Verse]
                   ,[VerseText]
                   ,[FriendlyChapterURL]
                   ,[FriendlyVerseURL]
                   ,@BibleName AS BibleName
            FROM   [Bible].[dbo].[VersesKJV] (NOLOCK)
            WHERE  [FriendlyChapterURL] = @FriendlyChapterURL
        END
      --King James Version END
      
      --World English Bible BEGIN
      EXEC dbo.usp_GetBibleName
        @BibleTypeID = @BibleTypeID,
        @BibleName = @BibleName OUTPUT

      IF @BibleTypeID = 5
        BEGIN
            SELECT [RecID]
                   ,[BookID]
                   ,[Book]
                   ,[Chapter]
                   ,[Verse]
                   ,[VerseText]
                   ,[FriendlyChapterURL]
                   ,[FriendlyVerseURL]
                   ,@BibleName AS BibleName
            FROM   [Bible].[dbo].[VersesWEB] (NOLOCK)
            WHERE  [FriendlyChapterURL] = @FriendlyChapterURL
        END
      --World English Bible END
      
      --Webster Bible BEGIN
      EXEC dbo.usp_GetBibleName
        @BibleTypeID = @BibleTypeID,
        @BibleName = @BibleName OUTPUT

      IF @BibleTypeID = 6
        BEGIN
            SELECT [RecID]
                   ,[BookID]
                   ,[Book]
                   ,[Chapter]
                   ,[Verse]
                   ,[VerseText]
                   ,[FriendlyChapterURL]
                   ,[FriendlyVerseURL]
                   ,@BibleName AS BibleName
            FROM   [Bible].[dbo].[VersesWebster] (NOLOCK)
            WHERE  [FriendlyChapterURL] = @FriendlyChapterURL
        END
      --Webster Bible END
      
      --Youngs Literal Translation BEGIN
      EXEC dbo.usp_GetBibleName
        @BibleTypeID = @BibleTypeID,
        @BibleName = @BibleName OUTPUT

      IF @BibleTypeID = 7
        BEGIN
            SELECT [RecID]
                   ,[BookID]
                   ,[Book]
                   ,[Chapter]
                   ,[Verse]
                   ,[VerseText]
                   ,[FriendlyChapterURL]
                   ,[FriendlyVerseURL]
                   ,@BibleName AS BibleName
            FROM   [Bible].[dbo].[VersesYLT] (NOLOCK)
            WHERE  [FriendlyChapterURL] = @FriendlyChapterURL
        END
  --Youngs Literal Translation END
  
  END