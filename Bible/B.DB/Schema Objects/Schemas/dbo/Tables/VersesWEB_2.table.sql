CREATE TABLE [dbo].[VersesWEB] (
    [RecID]              INT           IDENTITY (1, 1) NOT NULL,
    [BookID]             INT           NOT NULL,
    [Book]               VARCHAR (100) NOT NULL,
    [Chapter]            INT           NOT NULL,
    [Verse]              INT           NOT NULL,
    [VerseText]          TEXT          NOT NULL,
    [FriendlyChapterURL] VARCHAR (500) NOT NULL,
    [FriendlyVerseURL]   VARCHAR (500) NOT NULL
);

