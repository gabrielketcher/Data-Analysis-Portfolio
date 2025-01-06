-- Songs in key of G
SELECT SongName, SongKey, Notes
FROM SongVersion sv
JOIN Song s ON sv.SongID = s.SongID
WHERE SongKey = 'G'

-- Songs sung by Gabe
SELECT SongName, SongKey, SingerName, VocalGroupType
FROM SongVersion sv
JOIN Song s ON sv.SongID = s.SongID
JOIN VocalGroupSongVersion vs ON sv.SongVersionID = vs.SongVersionID
JOIN VocalGroup v ON vs.VocalGroupID = v.VocalGroupID
JOIN SingerVocalGroup svg ON v.VocalGroupID = svg.VocalGroupID
JOIN Singer ON svg.SingerID = Singer.SingerID
WHERE SingerName = 'Gabe Ketcher'

-- Date and video link for song
SELECT SongName, SongKey, SetlistDate, VideoLink
FROM SongVersion sv
JOIN Song s ON sv.SongID = s.SongID
JOIN SetListSongVersion sls ON sv.SongVersionID = sls.SongVersionID
JOIN Setlist sl ON sls.SetListID = sl.SetListID
WHERE SongName = 'Lord of Hosts (Psalm 46)'

-- Altar songs
SELECT SongName, SongKey, SetlistDate, OrderinSet
FROM SongVersion sv
JOIN Song s ON sv.SongID = s.SongID
JOIN SetListSongVersion sls ON sv.SongVersionID = sls.SongVersionID
JOIN Setlist sl ON sls.SetListID = sl.SetListID
WHERE OrderinSet = 5
ORDER BY SetListDate DESC

-- Christmas songs
SELECT SongName, Notes
FROM SongVersion sv
JOIN Song s ON sv.SongID = s.SongID
WHERE Notes = 'Christmas'
