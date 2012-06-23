CREATE FULLTEXT INDEX ON [dbo].[VersesKJV]
    ([VerseText] LANGUAGE 1033)
    KEY INDEX [PK_RecID_VerseKJV]
    ON [FT_VerseKJV];

