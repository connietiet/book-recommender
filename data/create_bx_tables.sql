CREATE TABLE book_ratings (
	user_id INT, 
	isbn TEXT,
	book_rating INT 
);

CREATE TABLE books (
	isbn TEXT, 
	book_title TEXT,
	book_author TEXT, 
	year_of_publication INT,
	publisher TEXT,
	image_url_s TEXT,
	image_url_m TEXT, 
	image_url_l TEXT

);

CREATE TABLE users (
	user_id INT,
	location TEXT, 
	age NUMERIC
);

COPY book_ratings FROM '/BX-Book-Ratings.csv' WITH DELIMITER ';' HEADER CSV;
COPY books FROM '/BX-Books.csv' WITH DELIMITER ';' HEADER CSV;
COPY users FROM '/BX-Users.csv' WITH DELIMITER ';' HEADER CSV;
