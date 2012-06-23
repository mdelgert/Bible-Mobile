CREATE FULLTEXT INDEX ON [dbo].[VersesBasicEnglish]
    ([VerseText] LANGUAGE 1033)
    KEY INDEX [PK_RecID_VerseBasicEnglish]
    ON [FT_VerseBasicEnglish];

