CREATE TABLE ratings_and_books (
	isbn TEXT, 
	book_title TEXT,
	book_author TEXT, 
	year_of_publication INT,
	publisher TEXT,
    user_id INT,
    book_rating INT 
);

CREATE TABLE cleaned_ratings_and_books (
	isbn TEXT, 
	book_title TEXT,
	book_author TEXT, 
	year_of_publication INT,
	publisher TEXT,
    user_id INT,
    book_rating INT 
);

CREATE TABLE exp_ratings (
	isbn TEXT, 
	book_title TEXT,
	book_author TEXT, 
	year_of_publication INT,
	publisher TEXT,
    user_id INT,
    book_rating INT 
);

CREATE TABLE imp_ratings (
	isbn TEXT, 
	book_title TEXT,
	book_author TEXT, 
	year_of_publication INT,
	publisher TEXT,
    user_id INT,
    book_rating INT 
);

CREATE TABLE ratings_count (
    isbn TEXT,
    book_title TEXT,
    implicit_count INT,
    explicit_count INT,
    total_count INT,
    rating_avg NUMERIC
);


COPY ratings_and_books FROM '/ratings_and_books.csv' WITH DELIMITER ',' HEADER CSV;
COPY cleaned_ratings_and_books FROM '/cleaned_ratings_and_books.csv' WITH DELIMITER ',' HEADER CSV;
COPY exp_ratings FROM '/exp_ratings.csv' WITH DELIMITER ',' HEADER CSV;
COPY imp_ratings FROM '/imp_ratings.csv' WITH DELIMITER ',' HEADER CSV;
COPY ratings_count FROM '/ratings_count.csv' WITH DELIMITER ',' HEADER CSV;