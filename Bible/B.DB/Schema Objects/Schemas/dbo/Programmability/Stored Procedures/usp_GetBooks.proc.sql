
-- =============================================
-- Author:		Matthew David Elgert
-- Create date: 11/15/2011
-- Alter date:  11/27/2011
-- Description:	
-- EXEC [dbo].[usp_GetBooks]
-- =============================================
CREATE PROCEDURE [dbo].[usp_GetBooks]
AS
  BEGIN
      SET NOCOUNT ON;

      SELECT [BookID]
             ,[Book]
             ,[Book] AS DisplayName
             ,[FriendlyBookURL]
      FROM   [Bible].[dbo].[Books] (NOLOCK)
  END