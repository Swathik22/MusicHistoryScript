-- 1. Query all of the entries in the `genre` table
select * from genre;
-- 2. Query all the entries in the `artist` table and order by the artist's name. HINT: use the ORDER BY keywords
select * from artist order by artistname;
-- 3. Write a `SELECT` query that lists all the songs in the `song` table and include the artist name
select * from song join artist on artistid=artist.id;
-- 4. Write a `SELECT` query that lists all the artists that have a Pop album
select artistname,b.title from artist art join album b on art.id=b.artistid
-- 5. Write a `SELECT` query that lists all the artists that have a Jazz or Rock album
--------select artistname from artist join album on id=artistid where album.title=
-- 6. Write a `SELECT` statement that lists the albums with no songs
select * from album left join song on song.albumid=album.id where song.albumid is null;
-- 7. Using the `INSERT` statement, add one of your favorite artists to the `artist` table.
INSERT INTO Artist (ArtistName, YearEstablished) VALUES ('Chiranjeevi', 1980);
-- 8. Using the `INSERT` statement, add one, or more, albums by your artist to the `album` table.
INSERT INTO Album (Title, ReleaseDate, AlbumLength, Label, ArtistId, GenreId) VALUES ('Vishwambhara', '01/01/2025', 3123, 'v', 28, 14);
-- 9. Using the `INSERT` statement, add some songs that are on that album to the `song` table.
INSERT INTO Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId) VALUES ('Vishwam', 45, '12/03/2024', 14, 28, 23);
-- 10. Write a `SELECT` query that provides the song titles, album title, and artist name for all of the data you just entered in. Use the [`LEFT JOIN`](https://www.tutorialspoint.com/sql/sql-using-joins.htm) keyword sequence to connect the tables, and the `WHERE` keyword to filter the results to the album and artist you added.
select s.Title,b.Title,a.artistname from song s left join album b on s.albumId=b.id left join artist as a on a.id=b.artistid 
where a.artistname='Chiranjeevi' and b.Title='Vishwambhara';
--  > **NOTE:** Direction of join matters. Try the following statements and see the difference in results.
--
--    ```sql
--SELECT a.title, s.title FROM album a LEFT JOIN song s ON s.albumid = a.id;
--  SELECT a.title, s.title FROM song s LEFT JOIN album a ON s.albumid = a.id;
    ```

-- 11. Write a `SELECT` statement to display how many songs exist for each album. You'll need to use the `COUNT()` function and the `GROUP BY` keyword sequence.
select albumid,count(title) from song group by albumid;
-- 12. Write a `SELECT` statement to display how many songs exist for each artist. You'll need to use the `COUNT()` function and the `GROUP BY` keyword sequence.
select artistId,count(title) from song group by artistId;
-- 13. Write a `SELECT` statement to display how many songs exist for each genre. You'll need to use the `COUNT()` function and the `GROUP BY` keyword sequence.
select GenreId,count(title) from song group by genreId;
-- 14. Write a `SELECT` query that lists the artists that have put out records on more than one record label. Hint: When using `GROUP BY` instead of using a `WHERE` clause, use the [`HAVING`](https://www.tutorialspoint.com/sql/sql-having-clause.htm) keyword
select a.artistname,count(b.title) from artist a left join album b on a.id=b.artistid group by a.artistname having count(b.title)>1;
-- 15. Using `MAX()` function, write a select statement to find the album with the longest duration. The result should display the album title and the duration.
select albumlength as duration,Title from album where albumlength=(select max(albumlength) from album);
-- 16. Using `MAX()` function, write a select statement to find the song with the longest duration. The result should display the song title and the duration.
select songlength as duration,Title from song where songlength=(select max(songlength) from song);
-- 17. Modify the previous query to also display the title of the album.
select songlength as duration,song.Title,a.Title from song left join album a on song.albumid=a.id where songlength=(select max(songlength) from song);