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