
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