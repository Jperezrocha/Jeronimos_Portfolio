# 1. What is the total sales revenue of each track (name) that we will identify by sales$?
Select Name, round(Sales,0) as Revenue 
From track; 

# 2 Show the tracks (name) of which the sales$ is greater than $170,000 
Select Name, Sales 
From track
Where sales > 170000; 

# 3 What is the longest length of a track? Show the length in minutes
Select max(Milliseconds/60000) as Length_in_Minutes 
From track ; 

#4 Show the title of the albums and the names of their artists.
Select artist.Name, album.Title
From artist 
Inner join album
On artist.Artistid = album.Albumid ;

#5 For each artist, show the number of DIFFERENT genres their albums belong to.
Select distinct(Genre), artist.Name
From album 
Inner join artist 
On artist.Artistid = album.Albumid 
Group by artist.Name ; 

#6 Show the tracks(name) that are from Rock albums.
Select track.Name, album.Genre 
From track 
Inner join album 
on album.Albumid = track.Trackid
Where album.Genre = "Rock"; 

#7 For each album (title), show the average length of the tracks. Show the length in minutes. Sort the results in descending order by length
Select album.Title, avg(Milliseconds/60000) as average_length_in_Minutes 
From track 
Inner join album 
on album.Albumid = track.Trackid
Group by album.title 
Order by avg(track.Milliseconds/60000) desc; 

#8 Show the genres of which the total sales$ is between $10million and $20million.
Select album.Genre, sum(track.sales) as total_sales
from track 
Inner join album 
on album.Albumid = track.Trackid
Group by album.Genre 
Having total_sales between 10000000 and 20000000;  

#9 Show the total price of each album 
Select sum(track.sales) as total_sales, album.Title 
from track 
Inner join album 
on album.Albumid = track.Trackid
Group by album.Title; 

#10 How many tracks are composed by Steve Harris in each album? 
Select album.Title, count(track.Name) as Number_of_Tracks, track.Composer 
From track 
Inner join album 
on album.Albumid = track.albumid
where track.Composer = 'Steve Harris'
Group by album.Title 
; 

#11 Show the tracks(name) and their artists.
Select track.Name as track_Name , artist.Name as Artist_Name 
From track 
inner join artist 
On track.trackid = artist.Artistid 
;

#12 Show the total sales$ for each artist
SELECT artist.Name, SUM(UnitPrice*sales) AS total_sales$
FROM track
INNER JOIN album 
ON track.albumId=album.albumId
INNER JOIN artist
ON album.artistId=artist.artistId
GROUP BY artist.Name;
; 

