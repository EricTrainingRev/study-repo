-- join statements allow you to take data from different tables and return them in your
-- result set together

-- regular
select * from invoice where invoice_id = 3;

-- to do a join you follow this format
-- select what you want
-- join the necessary table/s
-- determine what you are joining on (what data to match)
-- filter with a where if necessary

select * from invoice 
join invoice_line 
on  invoice.invoice_id = invoice_line.invoice_id
where invoice.invoice_id = 3;

select c.customer_id, c.first_name, c.last_name, e.employee_id, e.first_name, e.last_name 
from customer c
join employee e
on c.support_rep_id = e.employee_id;

-- you can link data from tables without a direct relationship if you chain your joins
select i.*, e.employee_id, e.first_name, e.last_name  from invoice i
join customer c on i.customer_id = c.customer_id 
join employee e on c.support_rep_id = e.employee_id;

select a2.name as artist_name, a.album_id, a.title as album_title, t.track_id, 
t.name as track_name, g.name as genre_name , mt.name as media_type_name from album a
join track t on a.album_id = t.album_id
join genre g on t.genre_id = g.genre_id
join media_type mt on mt.media_type_id = t.media_type_id 
join artist a2 on a2.artist_id = a.artist_id 
order by  a.album_id asc 

-- we want a query to return the album with the most amount of songs in it
-- select album and songs from album and track tables
-- where album has the most songs in it

select a.album_id, a.title, count(t.track_id) as number_of_tracks
from album a
join track t on a.album_id = t.album_id 
group by a.album_id, a.title 
order by number_of_tracks desc

-- list playists and the albums associated with them
select distinct on (album_title) p.name as playlist_name, a.title as album_title 
from playlist p 
join playlist_track pt on p.playlist_id = pt.playlist_id 
join track t on t.track_id = pt.track_id 
join album a on a.album_id = t.album_id
order by album_title asc

-- sub queries are used inside of another query to provide data to the initial query
-- we can use this sub query to get the id of the artist if we don't have that info
-- initially: select artist_id from artist where name = 'AC/DC'

select * from album
where artist_id  = (select artist_id from artist where name = 'AC/DC' )