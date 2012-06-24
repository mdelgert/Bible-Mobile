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