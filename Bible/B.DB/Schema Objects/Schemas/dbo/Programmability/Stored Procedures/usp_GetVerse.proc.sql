
-- =============================================
-- Author:		Matthew David Elgert
-- Create date: 11/15/2011
-- Alter date:  11/27/2011
-- Description:	
-- EXEC [dbo].[usp_GetVerse] @FriendlyVerseURL='American+Standard+Version+Bible+Genesis+Chapter+1+Verse+1', @BibleTypeID=1
-- =============================================
CREATE PROCEDURE [dbo].[usp_GetVerse] @FriendlyVerseURL NVARCHAR(100),
                                     @BibleTypeID      INT = 1
AS
  BEGIN
      SET NOCOUNT ON;

      DECLARE @BibleName NVARCHAR(100)
      DECLARE @BibleNameOrder NVARCHAR(100)
      DECLARE @BookID INT
      DECLARE @Chapter INT
      DECLARE @Verse INT
      DECLARE @Results TABLE (
        [RecID]              INT,
        [BookID]             INT,
        [Book]               VARCHAR(100),
        [Chapter]            INT,
        [Verse]              INT,
        [VerseText]          TEXT,
        [FriendlyChapterURL] VARCHAR(500),
        [FriendlyVerseURL]   VARCHAR(500),
        [BibleName]          NVARCHAR(100))

      SELECT @BibleNameOrder = [BibleName]
      FROM   [Bible].[dbo].[BibleType]
      WHERE  [RecID] = @BibleTypeID
      
      SET @Verse = NULL 
      
      IF @Verse IS NULL	
        BEGIN
            SELECT @BookID = [BookID]
                   ,@Chapter = [Chapter]
                   ,@Verse = [Verse]
            FROM   [Bible].[dbo].[VersesASV] (NOLOCK)
            WHERE  [FriendlyVerseURL] = @FriendlyVerseURL
        END

      IF @Verse IS NULL	
        BEGIN
            SELECT @BookID = [BookID]
                   ,@Chapter = [Chapter]
                   ,@Verse = [Verse]
            FROM   [Bible].[dbo].[VersesBasicEnglish] (NOLOCK)
            WHERE  [FriendlyVerseURL] = @FriendlyVerseURL
        END

      IF @Verse IS NULL	
        BEGIN
            SELECT @BookID = [BookID]
                   ,@Chapter = [Chapter]
                   ,@Verse = [Verse]
            FROM   [Bible].[dbo].[VersesDarby] (NOLOCK)
            WHERE  [FriendlyVerseURL] = @FriendlyVerseURL
        END

      IF @Verse IS NULL	
        BEGIN
            SELECT @BookID = [BookID]
                   ,@Chapter = [Chapter]
                   ,@Verse = [Verse]
            FROM   [Bible].[dbo].[VersesKJV] (NOLOCK)
            WHERE  [FriendlyVerseURL] = @FriendlyVerseURL
        END

      IF @Verse IS NULL	
        BEGIN
            SELECT @BookID = [BookID]
                   ,@Chapter = [Chapter]
                   ,@Verse = [Verse]
            FROM   [Bible].[dbo].[VersesWEB] (NOLOCK)
            WHERE  [FriendlyVerseURL] = @FriendlyVerseURL
        END

      IF @Verse IS NULL	
        BEGIN
            SELECT @BookID = [BookID]
                   ,@Chapter = [Chapter]
                   ,@Verse = [Verse]
            FROM   [Bible].[dbo].[VersesWebster] (NOLOCK)
            WHERE  [FriendlyVerseURL] = @FriendlyVerseURL
        END

      IF @Verse IS NULL	
        BEGIN
            SELECT @BookID = [BookID]
                   ,@Chapter = [Chapter]
                   ,@Verse = [Verse]
            FROM   [Bible].[dbo].[VersesYLT] (NOLOCK)
            WHERE  [FriendlyVerseURL] = @FriendlyVerseURL
        END

      --American Standard Version Bible
      SET @BibleTypeID = 1

      EXEC dbo.usp_GetBibleName
        @BibleTypeID = @BibleTypeID,
        @BibleName = @BibleName OUTPUT

      INSERT @Results
             ([RecID],
              [BookID],
              [Book],
              [Chapter],
              [Verse],
              [VerseText],
              [FriendlyChapterURL],
              [FriendlyVerseURL],
              [BibleName])
      SELECT [RecID]
             ,[BookID]
             ,[Book]
             ,[Chapter]
             ,[Verse]
             --,CONVERT(NVARCHAR(MAX), [VerseText]) + ' - ' + @BibleName AS [VerseText]
             ,[VerseText]
             ,[FriendlyChapterURL]
             ,[FriendlyVerseURL]
             ,@BibleName AS BibleTypeName
      FROM   [Bible].[dbo].[VersesASV] (NOLOCK)
      WHERE  BookID = @BookID
             AND Chapter = @Chapter
             AND Verse = @Verse
      --American Standard Version Bible
      
      --Bible In Basic English
      SET @BibleTypeID = 2

      EXEC dbo.usp_GetBibleName
        @BibleTypeID = @BibleTypeID,
        @BibleName = @BibleName OUTPUT

      INSERT @Results
             ([RecID],
              [BookID],
              [Book],
              [Chapter],
              [Verse],
              [VerseText],
              [FriendlyChapterURL],
              [FriendlyVerseURL],
              [BibleName])
      SELECT [RecID]
             ,[BookID]
             ,[Book]
             ,[Chapter]
             ,[Verse]
             --,CONVERT(NVARCHAR(MAX), [VerseText]) + ' - ' + @BibleName AS [VerseText]
             ,[VerseText]
             ,[FriendlyChapterURL]
             ,[FriendlyVerseURL]
             ,@BibleName AS BibleTypeName
      FROM   [Bible].[dbo].[VersesBasicEnglish] (NOLOCK)
      WHERE  BookID = @BookID
             AND Chapter = @Chapter
             AND Verse = @Verse
      --Bible In Basic English
      
      --Darby Bible
      SET @BibleTypeID = 3

      EXEC dbo.usp_GetBibleName
        @BibleTypeID = @BibleTypeID,
        @BibleName = @BibleName OUTPUT

      INSERT @Results
             ([RecID],
              [BookID],
              [Book],
              [Chapter],
              [Verse],
              [VerseText],
              [FriendlyChapterURL],
              [FriendlyVerseURL],
              [BibleName])
      SELECT [RecID]
             ,[BookID]
             ,[Book]
             ,[Chapter]
             ,[Verse]
             --,CONVERT(NVARCHAR(MAX), [VerseText]) + ' - ' + @BibleName AS [VerseText]
             ,[VerseText]
             ,[FriendlyChapterURL]
             ,[FriendlyVerseURL]
             ,@BibleName AS BibleTypeName
      FROM   [Bible].[dbo].[VersesDarby] (NOLOCK)
      WHERE  BookID = @BookID
             AND Chapter = @Chapter
             AND Verse = @Verse
      --Darby Bible
      
      --King James Version
      SET @BibleTypeID = 4

      EXEC dbo.usp_GetBibleName
        @BibleTypeID = @BibleTypeID,
        @BibleName = @BibleName OUTPUT

      INSERT @Results
             ([RecID],
              [BookID],
              [Book],
              [Chapter],
              [Verse],
              [VerseText],
              [FriendlyChapterURL],
              [FriendlyVerseURL],
              [BibleName])
      SELECT [RecID]
             ,[BookID]
             ,[Book]
             ,[Chapter]
             ,[Verse]
             --,CONVERT(NVARCHAR(MAX), [VerseText]) + ' - ' + @BibleName AS [VerseText]
             ,[VerseText]
             ,[FriendlyChapterURL]
             ,[FriendlyVerseURL]
             ,@BibleName AS BibleTypeName
      FROM   [Bible].[dbo].[VersesKJV] (NOLOCK)
      WHERE  BookID = @BookID
             AND Chapter = @Chapter
             AND Verse = @Verse
      --King James Version
      
      --World English Bible
      SET @BibleTypeID = 5

      EXEC dbo.usp_GetBibleName
        @BibleTypeID = @BibleTypeID,
        @BibleName = @BibleName OUTPUT

      INSERT @Results
             ([RecID],
              [BookID],
              [Book],
              [Chapter],
              [Verse],
              [VerseText],
              [FriendlyChapterURL],
              [FriendlyVerseURL],
              [BibleName])
      SELECT [RecID]
             ,[BookID]
             ,[Book]
             ,[Chapter]
             ,[Verse]
             --,CONVERT(NVARCHAR(MAX), [VerseText]) + ' - ' + @BibleName AS [VerseText]
             ,[VerseText]
             ,[FriendlyChapterURL]
             ,[FriendlyVerseURL]
             ,@BibleName AS BibleTypeName
      FROM   [Bible].[dbo].[VersesWEB] (NOLOCK)
      WHERE  BookID = @BookID
             AND Chapter = @Chapter
             AND Verse = @Verse
      --World English Bible
      
      --Webster Bible
      SET @BibleTypeID = 6

      EXEC dbo.usp_GetBibleName
        @BibleTypeID = @BibleTypeID,
        @BibleName = @BibleName OUTPUT

      INSERT @Results
             ([RecID],
              [BookID],
              [Book],
              [Chapter],
              [Verse],
              [VerseText],
              [FriendlyChapterURL],
              [FriendlyVerseURL],
              [BibleName])
      SELECT [RecID]
             ,[BookID]
             ,[Book]
             ,[Chapter]
             ,[Verse]
             --,CONVERT(NVARCHAR(MAX), [VerseText]) + ' - ' + @BibleName AS [VerseText]
             ,[VerseText]
             ,[FriendlyChapterURL]
             ,[FriendlyVerseURL]
             ,@BibleName AS BibleTypeName
      FROM   [Bible].[dbo].[VersesWebster] (NOLOCK)
      WHERE  BookID = @BookID
             AND Chapter = @Chapter
             AND Verse = @Verse
      --Webster Bible
      
      --Youngs Literal Translation
      SET @BibleTypeID = 7

      EXEC dbo.usp_GetBibleName
        @BibleTypeID = @BibleTypeID,
        @BibleName = @BibleName OUTPUT

      INSERT @Results
             ([RecID],
              [BookID],
              [Book],
              [Chapter],
              [Verse],
              [VerseText],
              [FriendlyChapterURL],
              [FriendlyVerseURL],
              [BibleName])
      SELECT [RecID]
             ,[BookID]
             ,[Book]
             ,[Chapter]
             ,[Verse]
             --,CONVERT(NVARCHAR(MAX), [VerseText]) + ' - ' + @BibleName AS [VerseText]
             ,[VerseText]
             ,[FriendlyChapterURL]
             ,[FriendlyVerseURL]
             ,@BibleName AS BibleTypeName
      FROM   [Bible].[dbo].[VersesYLT] (NOLOCK)
      WHERE  BookID = @BookID
             AND Chapter = @Chapter
             AND Verse = @Verse
      --Youngs Literal Translation
      
      SELECT *
      FROM   @Results
      WHERE  BibleName = @BibleNameOrder
      UNION ALL
      SELECT *
      FROM   @Results
      WHERE  BibleName != @BibleNameOrder
      
  END