﻿
-- =============================================
-- Author:		Matthew David Elgert
-- Create date: 11/15/2011
-- Alter date:  11/20/2011
-- Description:	
-- EXEC dbo.usp_GetChapters @FriendlyBookURL='Genesis', @BibleTypeID=1
-- =============================================
CREATE PROCEDURE [dbo].[usp_GetChapters] @FriendlyBookURL NVARCHAR(100),
                                        @BibleTypeID     INT = 1
AS
  BEGIN
      SET NOCOUNT ON;

      DECLARE @BibleName NVARCHAR(100)

      EXEC dbo.usp_GetBibleName
        @BibleTypeID = @BibleTypeID,
        @BibleName = @BibleName OUTPUT
        
        --American Standard Version Bible
        IF @BibleTypeID = 1
        BEGIN
            SELECT DISTINCT B.[Book]
                            ,B.[Chapter]
                            ,B.[Book] + ' Chapter ' + CONVERT(NVARCHAR(5), [Chapter]) AS DisplayName
                            ,B.[FriendlyChapterURL]
                            ,BB.[FriendlyBookURL]
                            ,@BibleName                                               AS BibleName
            FROM   [Bible].[dbo].[VersesASV] (NOLOCK) B
                   INNER JOIN [Bible].[dbo].[Books] (NOLOCK) BB
                     ON B.[Book] = BB.[Book]
            WHERE  BB.[FriendlyBookURL] = @FriendlyBookURL
            ORDER  BY [Chapter]
        END
        --American Standard Version Bible
        
        --Bible In Basic English
        IF @BibleTypeID = 2
        BEGIN
            SELECT DISTINCT B.[Book]
                            ,B.[Chapter]
                            ,B.[Book] + ' Chapter ' + CONVERT(NVARCHAR(5), [Chapter]) AS DisplayName
                            ,B.[FriendlyChapterURL]
                            ,BB.[FriendlyBookURL]
                            ,@BibleName                                               AS BibleName
            FROM   [Bible].[dbo].[VersesBasicEnglish] (NOLOCK) B
                   INNER JOIN [Bible].[dbo].[Books] (NOLOCK) BB
                     ON B.[Book] = BB.[Book]
            WHERE  BB.[FriendlyBookURL] = @FriendlyBookURL
            ORDER  BY [Chapter]
        END
        --Bible In Basic English
        
        --Darby Bible
        IF @BibleTypeID = 3
        BEGIN
            SELECT DISTINCT B.[Book]
                            ,B.[Chapter]
                            ,B.[Book] + ' Chapter ' + CONVERT(NVARCHAR(5), [Chapter]) AS DisplayName
                            ,B.[FriendlyChapterURL]
                            ,BB.[FriendlyBookURL]
                            ,@BibleName                                               AS BibleName
            FROM   [Bible].[dbo].[VersesDarby] (NOLOCK) B
                   INNER JOIN [Bible].[dbo].[Books] (NOLOCK) BB
                     ON B.[Book] = BB.[Book]
            WHERE  BB.[FriendlyBookURL] = @FriendlyBookURL
            ORDER  BY [Chapter]
        END
        --Darby Bible
        
        --King James Version
        IF @BibleTypeID = 4
        BEGIN
            SELECT DISTINCT B.[Book]
                            ,B.[Chapter]
                            ,B.[Book] + ' Chapter ' + CONVERT(NVARCHAR(5), [Chapter]) AS DisplayName
                            ,B.[FriendlyChapterURL]
                            ,BB.[FriendlyBookURL]
                            ,@BibleName                                               AS BibleName
            FROM   [Bible].[dbo].[VersesKJV] (NOLOCK) B
                   INNER JOIN [Bible].[dbo].[Books] (NOLOCK) BB
                     ON B.[Book] = BB.[Book]
            WHERE  BB.[FriendlyBookURL] = @FriendlyBookURL
            ORDER  BY [Chapter]
        END
        --King James Version
        
        --World English Bible
        IF @BibleTypeID = 5
        BEGIN
            SELECT DISTINCT B.[Book]
                            ,B.[Chapter]
                            ,B.[Book] + ' Chapter ' + CONVERT(NVARCHAR(5), [Chapter]) AS DisplayName
                            ,B.[FriendlyChapterURL]
                            ,BB.[FriendlyBookURL]
                            ,@BibleName                                               AS BibleName
            FROM   [Bible].[dbo].[VersesWEB] (NOLOCK) B
                   INNER JOIN [Bible].[dbo].[Books] (NOLOCK) BB
                     ON B.[Book] = BB.[Book]
            WHERE  BB.[FriendlyBookURL] = @FriendlyBookURL
            ORDER  BY [Chapter]
        END 
        --World English Bible
      
        --Webster Bible
        IF @BibleTypeID = 6
        BEGIN
            SELECT DISTINCT B.[Book]
                            ,B.[Chapter]
                            ,B.[Book] + ' Chapter ' + CONVERT(NVARCHAR(5), [Chapter]) AS DisplayName
                            ,B.[FriendlyChapterURL]
                            ,BB.[FriendlyBookURL]
                            ,@BibleName                                               AS BibleName
            FROM   [Bible].[dbo].[VersesWebster] (NOLOCK) B
                   INNER JOIN [Bible].[dbo].[Books] (NOLOCK) BB
                     ON B.[Book] = BB.[Book]
            WHERE  BB.[FriendlyBookURL] = @FriendlyBookURL
            ORDER  BY [Chapter]
        END
        --Webster Bible
        
        --Youngs Literal Translation
        IF @BibleTypeID = 7
        BEGIN
            SELECT DISTINCT B.[Book]
                            ,B.[Chapter]
                            ,B.[Book] + ' Chapter ' + CONVERT(NVARCHAR(5), [Chapter]) AS DisplayName
                            ,B.[FriendlyChapterURL]
                            ,BB.[FriendlyBookURL]
                            ,@BibleName                                               AS BibleName
            FROM   [Bible].[dbo].[VersesYLT] (NOLOCK) B
                   INNER JOIN [Bible].[dbo].[Books] (NOLOCK) BB
                     ON B.[Book] = BB.[Book]
            WHERE  BB.[FriendlyBookURL] = @FriendlyBookURL
            ORDER  BY [Chapter]
        END
        --Youngs Literal Translation
        
  END