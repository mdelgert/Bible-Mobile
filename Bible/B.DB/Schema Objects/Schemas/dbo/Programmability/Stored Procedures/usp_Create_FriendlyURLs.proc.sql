/*  
 *  Copyright © 2012 Matthew David Elgert - mdelgert@yahoo.com
 *
 *  This program is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU Lesser General Public License as published by
 *  the Free Software Foundation; either version 2.1 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU Lesser General Public License for more details.
 *
 *  You should have received a copy of the GNU Lesser General Public License
 *  along with this program; if not, write to the Free Software
 *  Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA 
 * 
 *  Project URL: http://biblemobile.codeplex.com/                              
 *  
*/
-- =============================================
-- Author:		Matthew Elgert
-- Create date: 11/15/2011
-- Alter date:  11/27/2011
-- Description:	
-- EXEC [dbo].[usp_Create_FriendlyURLs] 
-- =============================================
CREATE PROCEDURE [dbo].[usp_Create_FriendlyURLs]
AS
  BEGIN
      SET NOCOUNT ON;

      DECLARE @Counter INT
      DECLARE @Count INT
      DECLARE @BookID INT
      DECLARE @Book VARCHAR(100)
      DECLARE @Chapter INT
      DECLARE @Verse INT

      --American Standard Version Bible BEGIN--
      SELECT @Count = COUNT(*)
      FROM   [Bible].[dbo].[VersesASV] (NOLOCK)

      SET @Counter = 1

      WHILE @Counter <= @Count
        BEGIN
            SELECT @BookID = [BookID]
                   ,@Chapter = [Chapter]
                   ,@Verse = [Verse]
            FROM   [Bible].[dbo].[VersesASV](NOLOCK)
            WHERE  [RecID] = @Counter

            SELECT @Book = [Book]
            FROM   [Bible].[dbo].[Books] (NOLOCK)
            WHERE  [BookID] = @BookID

            UPDATE [Bible].[dbo].[VersesASV]
            SET    [FriendlyVerseURL] = 'American+Standard+Version+Bible+' + REPLACE(@Book, ' ', '+') + '+Chapter+' + CONVERT(VARCHAR(10), @Chapter) + '+Verse+' + CONVERT(VARCHAR(10), @Verse)
            WHERE  [RecID] = @Counter

            UPDATE [Bible].[dbo].[VersesASV]
            SET    [FriendlyChapterURL] = 'American+Standard+Version+Bible+' + REPLACE(@Book, ' ', '+') + '+Chapter+' + CONVERT(VARCHAR(10), @Chapter)
            WHERE  [RecID] = @Counter

            SET @Counter = @Counter + 1
        END
      --American Standard Version Bible END--
      
      --Bible In Basic English BEGIN--
      SELECT @Count = COUNT(*)
      FROM   [Bible].[dbo].[VersesBasicEnglish] (NOLOCK)

      SET @Counter = 1

      WHILE @Counter <= @Count
        BEGIN
            SELECT @BookID = [BookID]
                   ,@Chapter = [Chapter]
                   ,@Verse = [Verse]
            FROM   [Bible].[dbo].[VersesBasicEnglish](NOLOCK)
            WHERE  [RecID] = @Counter

            SELECT @Book = [Book]
            FROM   [Bible].[dbo].[Books] (NOLOCK)
            WHERE  [BookID] = @BookID

            UPDATE [Bible].[dbo].[VersesBasicEnglish]
            SET    [FriendlyVerseURL] = 'Bible+In+Basic+English+' + REPLACE(@Book, ' ', '+') + '+Chapter+' + CONVERT(VARCHAR(10), @Chapter) + '+Verse+' + CONVERT(VARCHAR(10), @Verse)
            WHERE  [RecID] = @Counter

            UPDATE [Bible].[dbo].[VersesBasicEnglish]
            SET    [FriendlyChapterURL] = 'Bible+In+Basic+English+' + REPLACE(@Book, ' ', '+') + '+Chapter+' + CONVERT(VARCHAR(10), @Chapter)
            WHERE  [RecID] = @Counter

            SET @Counter = @Counter + 1
        END
      --Bible In Basic English END--
      
      --Darby Bible BEGIN--
      SELECT @Count = COUNT(*)
      FROM   [Bible].[dbo].[VersesDarby] (NOLOCK)

      SET @Counter = 1

      WHILE @Counter <= @Count
        BEGIN
            SELECT @BookID = [BookID]
                   ,@Chapter = [Chapter]
                   ,@Verse = [Verse]
            FROM   [Bible].[dbo].[VersesDarby](NOLOCK)
            WHERE  [RecID] = @Counter

            SELECT @Book = [Book]
            FROM   [Bible].[dbo].[Books] (NOLOCK)
            WHERE  [BookID] = @BookID

            UPDATE [Bible].[dbo].[VersesDarby]
            SET    [FriendlyVerseURL] = 'Darby+Bible+' + REPLACE(@Book, ' ', '+') + '+Chapter+' + CONVERT(VARCHAR(10), @Chapter) + '+Verse+' + CONVERT(VARCHAR(10), @Verse)
            WHERE  [RecID] = @Counter

            UPDATE [Bible].[dbo].[VersesDarby]
            SET    [FriendlyChapterURL] = 'Darby+Bible+' + REPLACE(@Book, ' ', '+') + '+Chapter+' + CONVERT(VARCHAR(10), @Chapter)
            WHERE  [RecID] = @Counter

            SET @Counter = @Counter + 1
        END
      --Darby Bible END--
      
      --King James Version BEGIN--
      SELECT @Count = COUNT(*)
      FROM   [Bible].[dbo].[VersesKJV] (NOLOCK)

      SET @Counter = 1

      WHILE @Counter <= @Count
        BEGIN
            SELECT @BookID = [BookID]
                   ,@Chapter = [Chapter]
                   ,@Verse = [Verse]
            FROM   [Bible].[dbo].[VersesKJV](NOLOCK)
            WHERE  [RecID] = @Counter

            SELECT @Book = [Book]
            FROM   [Bible].[dbo].[Books] (NOLOCK)
            WHERE  [BookID] = @BookID

            UPDATE [Bible].[dbo].[VersesKJV]
            SET    [FriendlyVerseURL] = 'King+James+Version+' + REPLACE(@Book, ' ', '+') + '+Chapter+' + CONVERT(VARCHAR(10), @Chapter) + '+Verse+' + CONVERT(VARCHAR(10), @Verse)
            WHERE  [RecID] = @Counter

            UPDATE [Bible].[dbo].[VersesKJV]
            SET    [FriendlyChapterURL] = 'King+James+Version+' + REPLACE(@Book, ' ', '+') + '+Chapter+' + CONVERT(VARCHAR(10), @Chapter)
            WHERE  [RecID] = @Counter

            SET @Counter = @Counter + 1
        END
      --King James Version END--
      
      --World English Bible BEGIN--
      SELECT @Count = COUNT(*)
      FROM   [Bible].[dbo].[VersesWEB] (NOLOCK)

      SET @Counter = 1

      WHILE @Counter <= @Count
        BEGIN
            SELECT @BookID = [BookID]
                   ,@Chapter = [Chapter]
                   ,@Verse = [Verse]
            FROM   [Bible].[dbo].[VersesWEB](NOLOCK)
            WHERE  [RecID] = @Counter

            SELECT @Book = [Book]
            FROM   [Bible].[dbo].[Books] (NOLOCK)
            WHERE  [BookID] = @BookID

            UPDATE [Bible].[dbo].[VersesWEB]
            SET    [FriendlyVerseURL] = 'World+English+Bible+' + REPLACE(@Book, ' ', '+') + '+Chapter+' + CONVERT(VARCHAR(10), @Chapter) + '+Verse+' + CONVERT(VARCHAR(10), @Verse)
            WHERE  [RecID] = @Counter

            UPDATE [Bible].[dbo].[VersesWEB]
            SET    [FriendlyChapterURL] = 'World+English+Bible+' + REPLACE(@Book, ' ', '+') + '+Chapter+' + CONVERT(VARCHAR(10), @Chapter)
            WHERE  [RecID] = @Counter

            SET @Counter = @Counter + 1
        END
      --World English Bible END--
      
      --Webster Bible BEGIN--
      SELECT @Count = COUNT(*)
      FROM   [Bible].[dbo].[VersesWebster] (NOLOCK)

      SET @Counter = 1

      WHILE @Counter <= @Count
        BEGIN
            SELECT @BookID = [BookID]
                   ,@Chapter = [Chapter]
                   ,@Verse = [Verse]
            FROM   [Bible].[dbo].[VersesWebster](NOLOCK)
            WHERE  [RecID] = @Counter

            SELECT @Book = [Book]
            FROM   [Bible].[dbo].[Books] (NOLOCK)
            WHERE  [BookID] = @BookID

            UPDATE [Bible].[dbo].[VersesWebster]
            SET    [FriendlyVerseURL] = 'Webster+Bible+' + REPLACE(@Book, ' ', '+') + '+Chapter+' + CONVERT(VARCHAR(10), @Chapter) + '+Verse+' + CONVERT(VARCHAR(10), @Verse)
            WHERE  [RecID] = @Counter

            UPDATE [Bible].[dbo].[VersesWebster]
            SET    [FriendlyChapterURL] = 'Webster+Bible+' + REPLACE(@Book, ' ', '+') + '+Chapter+' + CONVERT(VARCHAR(10), @Chapter)
            WHERE  [RecID] = @Counter

            SET @Counter = @Counter + 1
        END
      --Webster Bible END--
      
      --Youngs Literal Translation BEGIN--
      SELECT @Count = COUNT(*)
      FROM   [Bible].[dbo].[VersesYLT] (NOLOCK)

      SET @Counter = 1

      WHILE @Counter <= @Count
        BEGIN
            SELECT @BookID = [BookID]
                   ,@Chapter = [Chapter]
                   ,@Verse = [Verse]
            FROM   [Bible].[dbo].[VersesYLT](NOLOCK)
            WHERE  [RecID] = @Counter

            SELECT @Book = [Book]
            FROM   [Bible].[dbo].[Books] (NOLOCK)
            WHERE  [BookID] = @BookID

            UPDATE [Bible].[dbo].[VersesYLT]
            SET    [FriendlyVerseURL] = 'Youngs+Literal+Translation+' + REPLACE(@Book, ' ', '+') + '+Chapter+' + CONVERT(VARCHAR(10), @Chapter) + '+Verse+' + CONVERT(VARCHAR(10), @Verse)
            WHERE  [RecID] = @Counter

            UPDATE [Bible].[dbo].[VersesYLT]
            SET    [FriendlyChapterURL] = 'Youngs+Literal+Translation+' + REPLACE(@Book, ' ', '+') + '+Chapter+' + CONVERT(VARCHAR(10), @Chapter)
            WHERE  [RecID] = @Counter

            SET @Counter = @Counter + 1
        END
  --Youngs Literal Translation END--
  
  END