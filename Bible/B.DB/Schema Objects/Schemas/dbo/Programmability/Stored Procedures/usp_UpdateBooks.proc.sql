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