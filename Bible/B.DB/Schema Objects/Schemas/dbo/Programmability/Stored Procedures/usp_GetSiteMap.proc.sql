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
-- Create date: 11/25/2011
-- Alter date:  11/27/2011
-- Description:	
-- EXEC [dbo].[usp_GetSiteMap] @SiteURL='http://www.sendbible.com'
-- EXEC [dbo].[usp_GetSiteMap] @SiteURL='http://localhost:51592'
-- =============================================
CREATE PROCEDURE [dbo].[usp_GetSiteMap] @SiteURL NVARCHAR(200)
AS
  BEGIN
      SET NOCOUNT ON;

      DECLARE @SiteMap TABLE (
        [Row]        INT IDENTITY(1, 1),
        [loc]        varchar(255),
        [lastmod]    DATETIME,
        [changefreq] VARCHAR(10),
        [priority]   decimal(18, 1))

      INSERT @SiteMap
             ([loc],
              [lastmod],
              [changefreq],
              [priority])
      VALUES (@SiteURL + '/Sitemap.aspx',
              GETDATE(),
              'always',
              '1.0' )

      INSERT @SiteMap
             ([loc],
              [lastmod],
              [changefreq],
              [priority])
      VALUES (@SiteURL + '/Default.aspx',
              GETDATE(),
              'always',
              '1.0' )

      INSERT @SiteMap
             ([loc],
              [lastmod],
              [changefreq],
              [priority])
      SELECT @SiteURL + '/Verse/' + B.FriendlyVerseURL
             ,GETDATE()
             ,'weekly'
             ,'0.5'
      FROM   [Bible].[dbo].[VersesKJV] B (NOLOCK)
      ORDER  BY B.[RecID] ASC

      SELECT *
      FROM   @SiteMap
      ORDER BY [Row] ASC
  END